package net.deepdragon.weipu.controller.mall;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.tools.MatrixToImageWriter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.Hashtable;

/**
 * 二维码的生成需要借助MatrixToImageWriter类，该类是由Google提供的
 *  页面增加标签<img src="${base}/code/qr_code.img?code_url=Google I Love You！" style="width:300px;height:300px;"/>
 * Created by Administrator on 2015/11/17.
 */
@Controller(Global.APP_SIGN + Global.MALL + "GetQRCodeController")
@RequestMapping("/code")
public class GetQRCodeController {
    /**
     * 生成二维码图片并直接以流的形式输出到页面
     * @param code_url
     * @param response
     */
    @RequestMapping("/qr_code.img")
    @ResponseBody
    public void getQRCode(String code_url,HttpServletResponse response) throws Exception {
        //String text = "NiuYueYue I Love You！"; // 二维码内容
        int width = 300; // 二维码图片宽度
        int height = 300; // 二维码图片高度
        String format = "gif";// 二维码的图片格式
        Hashtable<EncodeHintType, String> hints = new Hashtable<EncodeHintType, String>();
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");   // 内容所使用字符集编码
        MultiFormatWriter m=new MultiFormatWriter();
        BitMatrix bitMatrix =m.encode(code_url, BarcodeFormat.QR_CODE, width, height, hints);
        MatrixToImageWriter.writeToStream(bitMatrix, format, response.getOutputStream());
    }
}
