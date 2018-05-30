package net.deepdragon.util;

import java.util.Properties;

import com.google.code.kaptcha.Producer;
import com.google.code.kaptcha.util.Config;

public class KaptchaUtil {

	/**
	 * 生成手机验证码
	 * 
	 * @return
	 */
	public static String genCaptcha() {
		Properties props = new Properties();
		Producer kaptchaProducer = null;
		props.put("kaptcha.textproducer.char.length", "6");
		props.put("kaptcha.textproducer.char.string", "0123456789");

		Config config = new Config(props);
		kaptchaProducer = config.getProducerImpl();

		return kaptchaProducer.createText();
	}

	/**
	 * 生成两位序号
	 * 
	 * @param args
	 */
	public static String genNumber() {
		Properties props = new Properties();
		Producer kaptchaProducer = null;
		props.put("kaptcha.textproducer.char.length", "2");
		props.put("kaptcha.textproducer.char.string", "0123456789");

		Config config = new Config(props);
		kaptchaProducer = config.getProducerImpl();

		return kaptchaProducer.createText();
	}

	public static String createUserName() {
		Properties props = new Properties();
		Producer kaptchaProducer = null;
		props.put("kaptcha.textproducer.char.length", "6");// 5 通过邀请码注册的为6为号码
		props.put("kaptcha.textproducer.char.string", "0123456789");

		Config config = new Config(props);
		kaptchaProducer = config.getProducerImpl();
		String userName = kaptchaProducer.createText();

		System.out.println("-------- createUserName:" + userName);

		return userName;
	}

}
