package net.deepdragon.util;


import java.text.NumberFormat;

public class LuhnUtils {

	/**
	 * 根据卡号获取校验位
	 * 
	 * @param cardNumber
	 * @return
	 */
	public static int getCheckNumber(String cardNumber) {
		int totalNumber = 0;
		for (int i = cardNumber.length() - 1; i >= 0; i -= 2) {
			int tmpNumber = calculate(Integer.parseInt(String
					.valueOf(cardNumber.charAt(i))) * 2);
			if (i == 0) {
				totalNumber += tmpNumber;
			} else {
				totalNumber += tmpNumber
						+ Integer.parseInt(String.valueOf(cardNumber
								.charAt(i - 1)));
			}

		}
		if (totalNumber >= 0 && totalNumber < 9) {
			return (10 - totalNumber);
		} else {
			String str = String.valueOf(totalNumber);
			if (Integer.parseInt(String.valueOf(str.charAt(str.length() - 1))) == 0) {
				return 0;
			} else {
				return (10 - Integer.parseInt(String.valueOf(str.charAt(str
						.length() - 1))));
			}
		}

	}

	/**
	 * 计算数字各位和
	 * 
	 * @param number
	 * @return
	 */
	protected static int calculate(int number) {
		String str = String.valueOf(number);
		int total = 0;
		for (int i = 0; i < str.length(); i++) {
			total += Integer.valueOf(Integer.parseInt(String.valueOf(str
					.charAt(i))));
		}
		return total;
	}

	public static boolean luhnTest(String number) {
		int s1 = 0, s2 = 0;
		String reverse = new StringBuffer(number).reverse().toString();
		for (int i = 0; i < reverse.length(); i++) {
			int digit = Character.digit(reverse.charAt(i), 10);
			if (i % 2 == 0) {
				s1 += digit;
			} else {
				s2 += 2 * digit;
				if (digit >= 5) {
					s2 -= 9;
				}
			}
		}
		return (s1 + s2) % 10 == 0;
	}

	public static void main(String[] args) {
//		System.out.println(luhnTest("2081180200100128012"));
		
		//System.out.println(luhnTest("1234566"));
//		long start=System.currentTimeMillis();
//		for(int i=0;i<10;i++){
//			
			String src="208118020010012803";
			String result=src+getCheckNumber(src);
//			System.out.println(result);
//			System.out.println(result+","+luhnTest(result));
//			
//		}
//		
//		System.out.println(System.currentTimeMillis()-start);
			
//			System.out.println(CryptUtils.Encrypt("", Constant.PASSWD_TRANSPORT_KEY));
        //得到一个NumberFormat的实例
        NumberFormat nf = NumberFormat.getInstance();
        //设置是否使用分组
        nf.setGroupingUsed(false);
        //设置最大整数位数
        nf.setMaximumIntegerDigits(10);
        //设置最小整数位数
        nf.setMinimumIntegerDigits(10);
        String ss="00006011";
        System.out.println(nf.format(Long.parseLong(ss)+5000));
        int t = 1;
 //      for(int i=0;i<1000;i++){
            //输出测试语句
 //          System.out.println("20811802"+nf.format(Long.parseLong(ss)+i)+getCheckNumber("20811802"+nf.format(Long.parseLong(ss)+i)));
  //      }

    }

}
