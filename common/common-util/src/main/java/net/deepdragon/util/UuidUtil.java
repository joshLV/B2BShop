package net.deepdragon.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

public class UuidUtil {
	private static int seq = 1000;
	private static final int ROTATION = 9999;

	public static String get32UUID() {

		return get20ID();
	}
	static DateFormat  format = new SimpleDateFormat("yyMMddHHmmssSSS");
	public synchronized static String get20ID() {
		if(seq>ROTATION)seq=1000;
        return format.format(new Date())+(seq++);
	}
	



	/**
	 * 产生一个随机数
	 * 经测试该方法没产生一千万随机码无重复
	 * @return 产生的随机数
	 */
	public static String createa20code(int len){
		 StringBuffer result=new StringBuffer();
		String[] codestr={"1","2","3","4","5","6","7","8","9","0","A","B","C","D","E","F","G","H","I","G","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",};
		//16位长度
		int length=len; //16位长度

		Random rd = new Random();
		int pos=0;
		for(int i=0;i<length;i++){
			pos = rd.nextInt(36);
			result.append(codestr[pos]);
		}

		return result.toString();
	}

	public static void main(String[] args) {
		System.out.println(DateUtil.dateToString(new Date(),"yyMMddHHmmssSSS"));
		for(int i=0; i < 100000; i++) {
			String s = get20ID();

		}
		System.out.println(DateUtil.dateToString(new Date(),"yyMMddHHmmssSSS"));
	}

}

