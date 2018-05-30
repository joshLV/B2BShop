package net.deepdragon.weipu.tools.mail;

import java.util.Random;

public class MailTools {
	public static String getRandString(int length) {
		String charList = "0123456789abcdefghijklmnopqrstuvwxyz";
		String rev = "";
		Random f = new Random();
		for (int i = 0; i < length; i++) {
			rev += charList.charAt(Math.abs(f.nextInt()) % charList.length());
		}
		return rev;
	}
}
