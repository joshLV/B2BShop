package net.deepdragon.weipu.captcha;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.annotation.Resource;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import org.springframework.stereotype.Component;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;

/**
 * 拦截器 - 生成验证码图片
 */
@Component("kaptchaFilter")
public class KaptchaFilter implements Filter{

	@Resource
	private Producer captchaProducer = null;
		
	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
		/*String tempdir = System.getProperty("java.io.tmpdir");
		System.out.println("tempdir:"+tempdir);
		File tempfile = new File(tempdir);
		System.out.println("tempfile:"+tempfile.getAbsolutePath());
		*/
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		response.reset();
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		ServletOutputStream out = response.getOutputStream(); 
		try {
			String capText = captchaProducer.createText(); 
			request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
			BufferedImage bi = captchaProducer.createImage(capText);
			/*ImageIO.write(bi, "jpg", out);*/
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(response.getOutputStream());
			encoder.encode(bi);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			out.close();
		}
	}
	
	@Override
	public void init(FilterConfig fConfig) throws ServletException {}
}
