package net.deepdragon.weipu.tools.db;

import net.deepdragon.util.DateUtil;
import net.deepdragon.util.DateUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Tools {
	
	/**
	 * 随机生成六位数验证码 
	 * @return
	 */
	public static int getRandomNum(){
		 Random r = new Random();
		 return r.nextInt(900000)+100000;//(Math.random()*(999999-100000)+100000)
	}
	
	/**
	 * 检测字符串是否不为空(null,"","null")
	 * @param s
	 * @return 不为空则返回true，否则返回false
	 */
	public static boolean notEmpty(String s){
		return s!=null && !"".equals(s) && !"null".equals(s);
	}
	
	/**
	 * 检测字符串是否为空(null,"","null")
	 * @param s
	 * @return 为空则返回true，不否则返回false
	 */
	public static boolean isEmpty(String s){
		return s==null || "".equals(s) || "null".equals(s);
	}
	
	/**
	 * 字符串转换为字符串数组
	 * @param str 字符串
	 * @param splitRegex 分隔符
	 * @return
	 */
	public static String[] str2StrArray(String str,String splitRegex){
		if(isEmpty(str)){
			return null;
		}
		return str.split(splitRegex);
	}
	
	/**
	 * 用默认的分隔符(,)将字符串转换为字符串数组
	 * @param str	字符串
	 * @return
	 */
	public static String[] str2StrArray(String str){
		return str2StrArray(str,",\\s*");
	}
	
	/**
	 * 按照yyyy-MM-dd HH:mm:ss的格式，日期转字符串
	 * @param date
	 * @return yyyy-MM-dd HH:mm:ss
	 */
	public static String date2Str(Date date){
		return date2Str(date,"yyyy-MM-dd HH:mm:ss");
	}
	
	/**
	 * 按照yyyy-MM-dd HH:mm:ss的格式，字符串转日期
	 * @param date
	 * @return
	 */
	public static Date str2Date(String date){
		if(notEmpty(date)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				return sdf.parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return new Date();
		}else{
			return null;
		}
	}
	
	/**
	 * 按照参数format的格式，日期转字符串
	 * @param date
	 * @param format
	 * @return
	 */
	public static String date2Str(Date date,String format){
		if(date!=null){
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			return sdf.format(date);
		}else{
			return "";
		}
	}
	
	/**
	 * 把时间根据时、分、秒转换为时间段
	 * @param StrDate
	 */
	public static String getTimes(String StrDate){
		String resultTimes = "";
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    Date now;

	    try {
	    	now = new Date();
	    	Date date=df.parse(StrDate);
	    	long times = now.getTime()-date.getTime();
	    	long day  =  times/(24*60*60*1000);
	    	long hour = (times/(60*60*1000)-day*24);
	    	long min  = ((times/(60*1000))-day*24*60-hour*60);
	    	long sec  = (times/1000-day*24*60*60-hour*60*60-min*60);
	        
	    	StringBuffer sb = new StringBuffer();
	    	//sb.append("发表于：");
	    	if(hour>0 ){
	    		sb.append(hour+"小时前");
	    	} else if(min>0){
	    		sb.append(min+"分钟前");
	    	} else{
	    		sb.append(sec+"秒前");
	    	}
	    		
	    	resultTimes = sb.toString();
	    } catch (ParseException e) {
	    	e.printStackTrace();
	    }
	    
	    return resultTimes;
	}
	
	/**
	 * 写txt里的单行内容
	 * @param content  写入的内容
	 */
	public static void writeFile(String fileP,String content){
		String filePath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))+"../../";	//项目路径
		filePath = (filePath.trim() + fileP.trim()).substring(6).trim();
		if(filePath.indexOf(":") != 1){
			filePath = File.separator + filePath;
		}
		try {
	        OutputStreamWriter write = new OutputStreamWriter(new FileOutputStream(filePath),"utf-8");      
	        BufferedWriter writer=new BufferedWriter(write);          
	        writer.write(content);      
	        writer.close(); 

	        
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	  * 验证邮箱
	  * @param email
	  * @return
	  */
	 public static boolean checkEmail(String email){
	  boolean flag = false;
	  try{
	    String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
	    Pattern regex = Pattern.compile(check);
	    Matcher matcher = regex.matcher(email);
	    flag = matcher.matches();
	   }catch(Exception e){
	    flag = false;
	   }
	  return flag;
	 }
	
	 /**
	  * 验证手机号码
	  * @return
	  */
	 public static boolean checkMobileNumber(String mobileNumber){
	  boolean flag = false;
	  try{
	    Pattern regex = Pattern.compile("^(((13[0-9])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8})|(0\\d{2}-\\d{8})|(0\\d{3}-\\d{7})$");
	    Matcher matcher = regex.matcher(mobileNumber);
	    flag = matcher.matches();
	   }catch(Exception e){
	    flag = false;
	   }
	  return flag;
	 }
	 
	/**
	 * 检测KEY是否正确
	 * @param paraname  传入参数
	 * @param FKEY		接收的 KEY
	 * @return 为空则返回true，不否则返回false
	 */
	public static boolean checkKey(String paraname, String FKEY){
		paraname = (null == paraname)? "":paraname;
		return MD5.md5(paraname+ DateUtil.getDays()+",dd,").equals(FKEY);
	}
	 
	/**
	 * 读取txt里的单行内容
	 */
	public static String readTxtFile(String fileP) {
		try {
			
			String filePath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))+"../../";	//项目路径
			filePath = filePath.replaceAll("file:/", "");
			filePath = filePath.replaceAll("%20", " ");
			filePath = filePath.trim() + fileP.trim();
			if(filePath.indexOf(":") != 1){
				filePath = File.separator + filePath;
			}
			String encoding = "utf-8";
			File file = new File(filePath);
			if (file.isFile() && file.exists()) { 		// 判断文件是否存在
				InputStreamReader read = new InputStreamReader(
				new FileInputStream(file), encoding);	// 考虑到编码格式
				BufferedReader bufferedReader = new BufferedReader(read);
				String lineTxt = null;
				while ((lineTxt = bufferedReader.readLine()) != null) {
					return lineTxt;
				}
				read.close();
			}else{
				System.out.println("找不到指定的文件,查看此路径是否正确:"+filePath);
			}
		} catch (Exception e) {
			System.out.println("读取文件内容出错");
		}
		return "";
	}

	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		if(ip.indexOf("0:0:0:0:0:0")!=-1)
			ip="127.0.0.1";
		return ip;
	}

	public static String parseXiaoshu(double d, int weishu, boolean half_up) {
		BigDecimal bd = new BigDecimal(d);
		if (half_up)
			return bd.setScale(weishu, 4).toString();
		else
			return bd.setScale(weishu).toString();
	}

	public static String parseBaifenbi(double d, int weishu) {
		NumberFormat format = NumberFormat.getPercentInstance();
		format.setMinimumFractionDigits(weishu);
		return format.format(d);
	}

	public static int parseInt(String s) {
		if (s == null)
			return 0;
		try {
			return Integer.parseInt(s.trim());
		} catch (Exception e) {
			return 0;
		}
	}

	public static boolean parseBoolean(String s) {
		if (s == null)
			return false;
		return s.toLowerCase().trim().equals("true") || s.trim().equals("1");
	}

	public static double parseDouble(Object s) {
		if (s == null)
			return 0.0D;
		try {
			return Double.parseDouble(((String) s).trim());
		} catch (Exception e) {
			return 0.0D;
		}
	}

	public static long parseLong(String s) {
		if (isNullStr(s))
			s = "0";
		return Long.parseLong(s);
	}

	public static double parseDouble(int i) {
		return parseDouble(String.valueOf(i));
	}

	public static double parseDouble(long i) {
		return parseDouble(String.valueOf(i));
	}

	public static String doubleToStr(double f) {
		return String.valueOf(parseDouble(Math.round(f * 100D)) / 100D);
	}

	public static int parseInt(Object s) {
		return parseInt(s, 0);
	}

	public static int parseInt(Object s, int def) {
		try {
			if (s == null || "".equals(s))
				return def;
		} catch (Exception e) {
			return def;
		}
		return Integer.parseInt(((String) s).trim());
	}

	public static float parseFloat(Object s) {
		try {
			if (s == null || s.equals(""))
				return Float.parseFloat("0");
		} catch (Exception e) {
			return Float.parseFloat("0");
		}
		return Float.parseFloat(((String) s).trim());
	}

	public static String toString(Object s) {
		if (s == null)
			return "";
		try {
			return String.valueOf(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public static String[] split(String source, char sign[]) {
		String ret[] = new String[0];
		if (source == null || source.equals(""))
			return ret;
		Vector ar = new Vector();
		int start = 0;
		for (int i = 0; i < source.length(); i++) {
			for (int j = 0; j < sign.length; j++) {
				if (sign[j] != source.charAt(i))
					continue;
				if (start != i) {
					String s = source.substring(start, i);
					ar.add(s);
				}
				start = i + 1;
				break;
			}

		}
		if (start < source.length())
			ar.add(source.substring(start, source.length()));
		ret = new String[ar.size()];
		for (int i = 0; i < ar.size(); i++)
			ret[i] = (String) ar.elementAt(i);

		return ret;
	}

	public static String[] split(String source, String sign) {
		return split(source, sign.toCharArray());
	}

	public static String[] split(String source, String sign, boolean flag) {
		String ret[] = new String[0];
		if (source == null || source.equals(""))
			return ret;
		Vector ar = new Vector();
		String st = source;
		do {
			int ipos = st.indexOf(sign);
			if (ipos < 0) {
				ar.addElement(st.substring(0));
				break;
			}
			ar.addElement(st.substring(0, ipos));
			st = st.substring(ipos + sign.length());
		} while (true);
		ret = new String[ar.size()];
		for (int i = 0; i < ar.size(); i++)
			ret[i] = (String) ar.elementAt(i);

		return ret;
	}

	public static String unsplit(String source[], String sign) {
		String ret = "";
		if (source == null)
			return ret;
		for (int i = 0; i < source.length; i++)
			if (i == 0)
				ret = source[i];
			else
				ret = (new StringBuffer(String.valueOf(ret))).append(sign)
						.append(source[i]).toString();

		return ret;
	}

	public static String arrayToStr(String source[]) {
		return unsplit(source, ",");
	}

	public static boolean isNumeric(String s) {
		try {
			Integer.parseInt(s);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public static String readFile(String curfile) {
		File f = new File(curfile);
		try {
			if (!f.exists())
				throw new Exception();
			InputStreamReader read = new InputStreamReader(new FileInputStream(
					f), "GBK");
			BufferedReader is = new BufferedReader(read);
			String filecontent = "";
			for (String str = is.readLine(); str != null;) {
				filecontent = (new StringBuffer(String.valueOf(filecontent)))
						.append(str).toString();
				str = is.readLine();
				if (str != null)
					filecontent = (new StringBuffer(String.valueOf(filecontent)))
							.append("\n").toString();
			}

			is.close();
			read.close();
			return filecontent;
		} catch (Exception e) {
			System.err.println((new StringBuffer(
					"\u4E0D\u80FD\u8BFB\u5C5E\u6027\u6587\u4EF6: "))
					.append(curfile).append(" \n").append(e.getMessage())
					.toString());
		}
		return "";
	}

	public static boolean fileExists(String filename) {
		File f = new File(filename);
		return f.isFile() && f.exists();
	}

	public static boolean folderExists(String pathname) {
		File f = new File(pathname);
		return f.isDirectory() && f.exists();
	}

	public static boolean deleteFile(String filename) {
		File f = new File(filename);
		return f.isFile() && f.delete();
	}

	public static boolean moveFile(String sfilename, String dfilename) {
		File fs = new File(sfilename);
		File fd = new File(dfilename);
		return fs.renameTo(fd);
	}

	public static boolean copyFilePath(String source, String desc) {
		try {
			File old_file_path = new File(source);
			if (old_file_path.exists() && old_file_path.isDirectory()) {
				String file_list[] = old_file_path.list();
				for (int i = 0; i < file_list.length; i++)
					copyFile(
							(new StringBuffer(String.valueOf(source)))
									.append("/").append(file_list[i])
									.toString(),
							(new StringBuffer(String.valueOf(desc)))
									.append("/").append(file_list[i])
									.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}

	public static boolean copyFile(String source, String desc) {
		try {
			File fl = new File(source);
			int length = (int) fl.length();
			FileInputStream is = new FileInputStream(source);
			FileOutputStream os = new FileOutputStream(desc);
			byte b[] = new byte[length];
			is.read(b);
			os.write(b);
			is.close();
			os.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public static int getFileSize(String filename) {
		try {
			File fl = new File(filename);
			int length = (int) fl.length();
			return length;
		} catch (Exception e) {
			return 0;
		}
	}

	public static long getFileSize(String filename, String flag) {
		try {
			File fl = new File(filename);
			long length = fl.length();
			return length;
		} catch (Exception e) {
			return 0L;
		}
	}

	public static String getFileName(String filePathName) {
		int pos = 0;
		pos = filePathName.lastIndexOf('/');
		if (pos != -1)
			return filePathName.substring(pos + 1, filePathName.length());
		pos = filePathName.lastIndexOf('\\');
		if (pos != -1)
			return filePathName.substring(pos + 1, filePathName.length());
		else
			return filePathName;
	}

	/**
	 * �õ��ļ���չ��
	 *
	 * @param filePathName
	 * @return
	 */
	public static String getFileExt(String filePathName) {
		int pos = 0;
		pos = filePathName.lastIndexOf('.');
		if (pos != -1)
			return filePathName.substring(pos + 1, filePathName.length());
		else
			return "";
	}

	public static boolean inStr(String source, String desc) {
		return source.indexOf(desc) >= 0;
	}

	public static int celling(int a, int b) {
		try {
			int c = a / b;
			if (a != b * c)
				c++;
			return c;
		} catch (Exception e) {
			return 0;
		}
	}

	public static int mod(int a, int b) {
		try {
			return a % b;
		} catch (Exception e) {
			return a;
		}
	}

	public static String urlEncode(String source) throws Exception {
		if (source == null)
			source = "";
		return URLEncoder.encode(source.trim(), "UTF-8");
	}

	public static String urlDecode(String source) throws Exception {
		if (source == null)
			source = "";
		return URLDecoder.decode(source.trim(), "UTF-8");
	}

	public static String toHtmlStr(String s) {
		if (s == null)
			return "";
		else
			return replace(
					replace(replace(
									replace(replace(replace(s, '&', "&amp;"), ' ',
											"&nbsp;"), '"', "&quot;"), '<', "&lt;"),
							'>', "&gt;"), '\n', "<br>");
	}

	public static String toHtmlMemo(String s) {
		if (s == null)
			return "";
		else
			return replace(
					replace(replace(
							replace(replace(s, '&', "&amp;"), ' ', "&nbsp;"),
							'"', "&quot;"), '<', "&lt;"), '>', "&gt;");
	}

	public static String toHtmlStr(Object ob) {
		String s = (String) ob;
		if (s == null)
			return "";
		else
			return toHtmlStr(s);
	}

	public static String toHtmlNull(Object ob) {
		String s = (String) ob;
		if (s == null || s.trim().equals(""))
			return "&nbsp;";
		else
			return s;
	}

	public static String toHtmlScript(String s) {
		if (s == null) {
			return "";
		} else {
			s = replace(s, "</script>", "&lt;/script&gt;");
			s = replace(s, "</SCRIPT>", "&lt;/SCRIPT&gt;");
			s = replace(s, "<script", "&lt;script");
			s = replace(s, "<SCRIPT", "&lt;SCRIPT");
			s = replace(s, "\n", "<br>");
			return s;
		}
	}

	public static String nullToStr(String s) {
		if (s == null || s.equals("undefined") || s.trim().length() < 0)
			return "";
		else
			return s.trim();
	}

	public static String nullToStr(Object s) {
		if (s == null)
			return "";
		else
			return nullToStr(s.toString());

	}

	public static String replaceAll(String str) {
		str = replace(str, "%0A", "");
		str = replace(str, "%0D", "");
		str = replace(str, "'", "\\'");
		str = replace(str, "\"", "\\\"");
		str = replace(str, "\\r\\n", "");
		str = replace(str, "\\n", "");
		str = replace(str, "/script", "\\/script");
		str = replace(str, "/SCRIPT", "\\/SCRIPT");
		return str;
	}

	public static String hiddenHTML(String text) {
		text = replace(text, "'", "\\'");
		text = replace(text, "/script", "\\/script");
		text = replace(text, "/SCRIPT", "\\/SCRIPT");
		text = replace(text, "\r\n", "\\r\\n");
		text = replace(text, "\n", "\\n");
		return text;
	}

	public static String replace(String source, char str1, String str2) {
		return replace(source, String.valueOf(str1), str2);
	}

	public static String replace(String source, String str1, String str2) {
		if (source == null)
			return "";
		String desc = "";
		int posstart = 0;
		int posend = source.indexOf(str1, 0);
		int len;
		for (len = source.length(); posend >= 0 && posstart < len; posend = source
				.indexOf(str1, posstart)) {
			desc = (new StringBuffer(String.valueOf(desc)))
					.append(source.substring(posstart, posend)).append(str2)
					.toString();
			posstart = posend + str1.length();
		}

		if (posstart < len)
			desc = (new StringBuffer(String.valueOf(desc))).append(
					source.substring(posstart, len)).toString();
		return desc;
	}

	public static String toSqlStr(String source) {
		if (source == null)
			return "";
		else
			return replace(source, '\'', "''");
	}

	public static String toSqlStr(String source, int flag) {
		source = toSqlStr(source);
		source = (new StringBuffer("'")).append(source).append("'").toString();
		if (flag == 0)
			return (new StringBuffer(",")).append(source).toString();
		else
			return source;
	}

	public static boolean isNullStr(String s) {
		return s == null || s.trim().length() <= 0;
	}

	public static boolean isNullStr(String s[]) {
		return s == null || s.length <= 0;
	}

	public static String strLike(String fieldValue, String field) {
		if (isNullStr(fieldValue))
			return " ";
		else
			return (new StringBuffer(" and ")).append(field).append(" like '%")
					.append(toSqlStr(fieldValue.trim())).append("%' ")
					.toString();
	}

	public static String strOrLike(String fieldValue, String field) {
		if (isNullStr(fieldValue))
			return " ";
		else
			return (new StringBuffer(" or ")).append(field).append(" like '%")
					.append(toSqlStr(fieldValue.trim())).append("%' or '")
					.append(toSqlStr(fieldValue.trim())).append("' like '%'+")
					.append(field).append("+'%' ").toString();
	}

	public static String strLen(String s, int len) {
		if (isNullStr(s))
			s = "";
		for (int i = 0; i < len - s.length(); i++)
			s = (new StringBuffer("0")).append(s).toString();

		return s;
	}

	public static String strLen2(String s, int len) {
		if (isNullStr(s))
			s = "";
		for (int i = 0; i < len - s.length(); i++)
			s = (new StringBuffer(String.valueOf(s))).append("0").toString();

		return s;
	}

	public static String getInputParam(String query_type[]) {
		String s = "";
		if (query_type != null) {
			for (int i = 0; i < query_type.length; i++)
				s = (new StringBuffer(String.valueOf(s)))
						.append("<input type='hidden' name='query_type' value='")
						.append(query_type[i]).append("'>").toString();

		}
		return s;
	}

	public static int getDifference_Days(Calendar c1, Calendar c2) {
		long a = c1.getTimeInMillis() - c2.getTimeInMillis();
		a /= 0x5265c00L;
		return (new Long(a)).intValue();
	}

	public static int getDifference_Days2(Calendar c1, Calendar c2) {
		if (c1.get(1) == c2.get(1))
			return c1.get(6) - c2.get(6);
		else
			return c1.get(6) - (c2.get(1) - c1.get(1)) * 365 - c2.get(6);
	}

	public static int getDifference_Hours(Calendar c1, Calendar c2) {
		long a = c1.getTimeInMillis() - c2.getTimeInMillis();
		a /= 0x36ee80L;
		return (new Long(a)).intValue();
	}

	public static int getDifference_Minutes(Calendar c1, Calendar c2) {
		long a = c1.getTimeInMillis() - c2.getTimeInMillis();
		a /= 60000L;
		return (new Long(a)).intValue();
	}

	public static long getDifference_Seconds(Calendar c1, Calendar c2) {
		return (c1.getTimeInMillis() - c2.getTimeInMillis()) / 1000L;
	}

	public static long getDifference_Seconds(String c1, String c2) {
		return getDifference_Seconds(getCal(c1), getCal(c2));
	}

	public static String getTimeStr(long sec) {
		if (sec < 1L)
			return "";
		String str = "";
		long day = sec / 0x15180L;
		if (day > 0L)
			str = (new StringBuffer(String.valueOf(str))).append(day)
					.append("\u5929").toString();
		long hour = (sec - day * 24L * 60L * 60L) / 3600L;
		if (hour > 0L)
			str = (new StringBuffer(String.valueOf(str))).append(hour)
					.append("\u5C0F\u65F6").toString();
		long minute = (sec - day * 24L * 60L * 60L - hour * 60L * 60L) / 60L;
		if (minute > 0L)
			str = (new StringBuffer(String.valueOf(str))).append(minute)
					.append("\u5206\u949F").toString();
		long second = sec - day * 24L * 60L * 60L - hour * 60L * 60L - minute
				* 60L;
		if (second > 0L)
			str = (new StringBuffer(String.valueOf(str))).append(second)
					.append("\u79D2").toString();
		return str;
	}

	public static int getDifference_Minutes(String c1, String c2) {
		return getDifference_Minutes(getCal(c1), getCal(c2));
	}

	public static String getInputField(String inputfield, String inputvalue) {
		if (inputvalue != null)
			return (new StringBuffer("<input type='hidden' name='"))
					.append(inputfield).append("'").append(" value='")
					.append(inputvalue).append("'>").toString();
		else
			return (new StringBuffer("<input type='hidden' name='"))
					.append(inputfield).append("'>").toString();
	}

	public static int getFieldCount(String fields) {
		if (fields.trim() == "")
			return 0;
		int i = 0;
		int count = 0;
		for (; fields.indexOf(",", i) != -1; i = fields.indexOf(",", i) + 1)
			count++;

		return count;
	}

	public static long getTime(Object time) {
		return getCal(toString(time)).getTime().getTime();
	}

	public static String getYear(Calendar cal) {
		return String.valueOf(cal.get(1));
	}

	public static String getMonth(Calendar cal) {
		return strLen(String.valueOf(cal.get(2) + 1), 2);
	}

	public static String getDay(Calendar cal) {
		return strLen(String.valueOf(cal.get(5)), 2);
	}

	public static String getHour(Calendar cal) {
		return strLen(String.valueOf(cal.get(11)), 2);
	}

	public static String getMinute(Calendar cal) {
		return strLen(String.valueOf(cal.get(12)), 2);
	}

	public static String getSecond(Calendar cal) {
		return strLen(String.valueOf(cal.get(13)), 2);
	}

	public static String getDateStr(Calendar cal) {
		return (new StringBuffer(String.valueOf(getYear(cal)))).append("/")
				.append(getMonth(cal)).append("/").append(getDay(cal))
				.toString();
	}

	public static String getDateStr1(Calendar cal) {
		return (new StringBuffer(String.valueOf(getYear(cal)))).append("-")
				.append(getMonth(cal)).append("-").append(getDay(cal))
				.toString();
	}

	public static String getDateStr1(String cal) {
		return getDateStr1(getCal(cal));
	}

	public static String getDateStr(String date) {
		return getDateStr(getCal(date));
	}

	public static String getTimeStr(Calendar cal) {
		return (new StringBuffer(String.valueOf(getHour(cal)))).append(":")
				.append(getMinute(cal)).append(":").append(getSecond(cal))
				.toString();
	}

	public static String getTimeStr(String date) {
		return getTimeStr(getCal(date));
	}

	public static String getDate(Calendar cal) {
		return (new StringBuffer(String.valueOf(getDateStr(cal)))).append(" ")
				.append(getTimeStr(cal)).toString();
	}

	public static String getDate(Date dat) {
		if (dat == null) {
			return "";
		} else {
			Calendar cal = Calendar.getInstance();
			cal.setTime(dat);
			return (new StringBuffer(String.valueOf(getDateStr(cal))))
					.append(" ").append(getTimeStr(cal)).toString();
		}
	}

	public static int getYear(String s) {
		try {
			return Integer.parseInt(s.substring(0, 4));
		} catch (Exception e) {
			return 1970;
		}
	}

	public static int getMonth(String s) {
		try {
			return Integer.parseInt(s.substring(5, 7));
		} catch (Exception e) {
			return 1;
		}
	}

	public static int getDay(String s) {
		try {
			return Integer.parseInt(s.substring(8, 10));
		} catch (Exception e) {
			return 1;
		}
	}

	public static int getHour(String s) {
		try {
			return Integer.parseInt(s.substring(11, 13));
		} catch (Exception e) {
			return 0;
		}
	}

	public static int getMinute(String s) {
		try {
			return Integer.parseInt(s.substring(14, 16));
		} catch (Exception e) {
			return 0;
		}
	}

	public static int getSecond(String s) {
		try {
			return Integer.parseInt(s.substring(17, 19));
		} catch (Exception e) {
			return 0;
		}
	}

	public static Calendar getCal(String s) {
		Calendar cal = Calendar.getInstance();
		cal.set(getYear(s), getMonth(s) - 1, getDay(s), getHour(s),
				getMinute(s), getSecond(s));
		return cal;
	}

	public static Calendar getCal2(String s) {
		Calendar cal = Calendar.getInstance();
		cal.set(parseInt(s.substring(0, 4)), parseInt(s.substring(4, 6)) - 1,
				parseInt(s.substring(6, 8)));
		return cal;
	}

	public static java.sql.Date getSqlDate(String s) {
		return java.sql.Date.valueOf(s);
	}

	public static java.sql.Date getSqlDate() {
		return java.sql.Date.valueOf(getNowDate());
	}

	public static String getNowStr() {
		Calendar now = Calendar.getInstance();
		String str = (new StringBuffer(String.valueOf(getDateStr(now))))
				.append(getTimeStr(now)).toString();
		str = replace(str, "/", "");
		str = replace(str, ":", "");
		return str;
	}

	public static String getNow() {
		Calendar now = Calendar.getInstance();
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getNowDate() {
		Calendar now = Calendar.getInstance();
		return getDateStr(now);
	}

	public static String getNowDate_() {
		Calendar now = Calendar.getInstance();
		return getDateStr1(now);
	}

	public static String getNowTime() {
		Calendar now = Calendar.getInstance();
		return getTimeStr(now);
	}

	public static String getNextHour() {
		Calendar now = Calendar.getInstance();
		now.set(11, now.get(11) + 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getNextHour(String date) {
		Calendar now = getCal(date);
		now.set(11, now.get(11) + 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getBeforeHour() {
		Calendar now = Calendar.getInstance();
		now.set(11, now.get(11) - 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getBeforeHour(String date) {
		Calendar now = getCal(date);
		now.set(11, now.get(11) - 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getNextDay() {
		Calendar now = Calendar.getInstance();
		now.set(5, now.get(5) + 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getNextDay(String date) {
		Calendar now = getCal(date);
		now.set(5, now.get(5) + 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getBeforeDay() {
		Calendar now = Calendar.getInstance();
		now.set(5, now.get(5) - 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getBeforeDay(String date) {
		Calendar now = getCal(date);
		now.set(5, now.get(5) - 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getThisWeek() {
		Calendar now = Calendar.getInstance();
		now.set(5, (now.get(5) - now.get(7)) + 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getThisWeekend() {
		Calendar now = Calendar.getInstance();
		now.set(5, (now.get(5) - now.get(7)) + 8);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getThisMonth() {
		Calendar now = Calendar.getInstance();
		now.set(5, 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getThisQuarter() {
		Calendar now = Calendar.getInstance();
		now.set(2, 0);
		now.set(5, 1);
		return getDateStr(now);
	}

	public static String getThisMonth(String date) {
		Calendar now = getCal(date);
		now.set(5, 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static Calendar getThisMonth(Calendar date) {
		date.set(5, 1);
		return date;
	}

	public static String getThisMonthEnd(String date) {
		Calendar now = getCal(date);
		now.set(2, now.get(2) + 1);
		now.set(5, 0);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static Calendar getThisMonthEnd(Calendar date) {
		date.set(2, date.get(2) + 1);
		date.set(5, 0);
		return date;
	}

	public static String getThisWeek(String date) {
		Calendar now = getCal(date);
		now.set(5, (now.get(5) - now.get(7)) + 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getNextWeek() {
		Calendar now = Calendar.getInstance();
		now.set(5, (now.get(5) - now.get(7)) + 1 + 7);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getNextWeek(String date) {
		Calendar now = getCal(date);
		now.set(5, (now.get(5) - now.get(7)) + 1 + 7);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getNextMonth() {
		Calendar now = Calendar.getInstance();
		now.set(2, now.get(2) + 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getNextMonth(String date) {
		Calendar now = getCal(date);
		now.set(2, now.get(2) + 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getBeforeMonth() {
		Calendar now = Calendar.getInstance();
		now.set(2, now.get(2) - 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getBeforeMonth(String date) {
		Calendar now = getCal(date);
		now.set(2, now.get(2) - 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getNextYear() {
		Calendar now = Calendar.getInstance();
		now.set(1, now.get(1) + 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getNextYear(String date) {
		Calendar now = getCal(date);
		now.set(1, now.get(1) + 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getBeforeYear() {
		Calendar now = Calendar.getInstance();
		now.set(1, now.get(1) - 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getBeforeYear(String date) {
		Calendar now = getCal(date);
		now.set(1, now.get(1) - 1);
		return (new StringBuffer(String.valueOf(getDateStr(now)))).append(" ")
				.append(getTimeStr(now)).toString();
	}

	public static String getBeforeDay(int day) {
		Calendar now = Calendar.getInstance();
		now.set(5, now.get(5) - day);
		return getDate(now);
	}

	public static String native2Unicode(String s) {
		if (s == null || s.length() == 0)
			return null;
		byte buffer[] = new byte[s.length()];
		for (int i = 0; i < s.length(); i++)
			buffer[i] = (byte) s.charAt(i);

		return new String(buffer);
	}

	public static String unicode2Native(String s) {
		if (s == null || s.length() == 0)
			return null;
		char buffer[] = new char[s.length() * 2];
		int j = 0;
		for (int i = 0; i < s.length(); i++)
			if (s.charAt(i) >= '\u0100') {
				char c = s.charAt(i);
				byte buf[] = (new StringBuffer()).append(c).toString()
						.getBytes();
				buffer[j++] = (char) buf[0];
				buffer[j++] = (char) buf[1];
			} else {
				buffer[j++] = s.charAt(i);
			}

		return new String(buffer, 0, j);
	}

	public static String getChnDate(String computerDate) {
		String out = (new StringBuffer(String.valueOf(String
				.valueOf(getYear(computerDate))))).append("\u5E74")
				.append(String.valueOf(getMonth(computerDate)))
				.append("\u6708").append(String.valueOf(getDay(computerDate)))
				.append("\u65E5").toString();
		return out;
	}

	public static boolean hasElement(String arr1[], String arr2[]) {
		if ((arr1 == null || arr1.length == 0)
				&& (arr2 == null || arr2.length == 0))
			return true;
		for (int i = 0; i < arr1.length; i++) {
			for (int j = 0; j < arr2.length; j++)
				if (arr1[i].equals(arr2[j]))
					return true;

		}

		return false;
	}

	public static boolean hasElement(int arr1[], int arr2[]) {
		if ((arr1 == null || arr1.length == 0)
				&& (arr2 == null || arr2.length == 0))
			return true;
		for (int i = 0; i < arr1.length; i++) {
			for (int j = 0; j < arr2.length; j++)
				if (arr1[i] == arr2[j])
					return true;

		}

		return false;
	}

	public static boolean hasElement(String str, String arr[]) {
		if ((str == null || str.length() == 0)
				&& (arr == null || arr.length == 0))
			return true;
		for (int i = 0; i < arr.length; i++)
			if (str.equals(arr[i]))
				return true;

		return false;
	}

	public static int getRandom(int num) {
		return (new Random()).nextInt(num);
	}

	public static String getRandomColor() {
		char chars[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a',
				'b', 'c', 'd', 'e', 'f' };
		String str = "";
		for (int i = 0; i < 6; i++)
			str = (new StringBuffer(String.valueOf(str))).append(
					chars[getRandom(16)]).toString();

		return str;
	}

	public static String getUnicode(String temp, String sp, String sp2) {
		try {
			char arChar[] = temp.toCharArray();
			int iValue = 0;
			StringBuffer str = new StringBuffer();
			for (int i = 0; i < arChar.length; i++) {
				iValue = temp.charAt(i);
				if (iValue <= 256)
					str.append((new StringBuffer(String.valueOf(sp)))
							.append("\\u00")
							.append(Integer.toHexString(iValue)).append(sp2)
							.toString());
				else
					str.append((new StringBuffer(String.valueOf(sp)))
							.append("\\u").append(Integer.toHexString(iValue))
							.append(sp2).toString());
			}

			return str.toString();
		} catch (Exception e) {
			return "";
		}
	}

	/**
	 * ȥ���������ظ���ֵ
	 */
	public static String[] delRepeatValue(String[] str) {
		Vector vec = new Vector();
		String t = "";
		if (str == null || str.length <= 1)
			return str;
		for (int i = 0; i < str.length; i++) {
			if (i == 0) {
				vec.addElement(str[i]);
			}
			if (i != 0) {
				t = str[i];
				str[i] = "";
				if (!hasElement(t, str)) {
					vec.addElement(t);
				}
			}
		}
		String[] tem = new String[vec.size()];
		for (int i = 0; i < vec.size(); i++) {
			tem[i] = (String) vec.elementAt(i);
		}
		return tem;
	}

	/**
	 * �õ�������С�����ı�ʾ
	 *
	 * @param cap
	 *            ��byteΪ��λ
	 * @return
	 */
	public static String getCapacityCn(double cap) {
		String capcn = "";
		double tem = cap;
		capcn = cap + "B";
		if (tem > 1024) {
			NumberFormat format = DecimalFormat.getInstance();
			format.setMaximumFractionDigits(2);
			capcn = format.format(tem / 1024) + "KB";
			if (tem > 1024 * 1024)
				capcn = format.format(tem / (1024 * 1024)) + "MB";
			if (tem > 1024 * 1024 * 1024)
				capcn = format.format(tem / (1024 * 1024 * 1024)) + "GB";
		}
		return capcn;
	}

	public static String getCapacityCn(String cap) {

		return getCapacityCn(parseDouble(cap));
	}

	public static boolean isInclude(String source, String value, String sign) {
		if (source == null || value == null || source.equals("")
				|| value.equals(""))
			return false;
		source = sign + source.trim() + sign;
		value = sign + value.trim() + sign;
		if (source.indexOf(value) != -1)
			return true;
		else
			return false;
	}

	public static boolean isInclude(String source, String value) {
		return isInclude(source, value, ",");
	}

	public static String getShorStr(String str, int len, String rep) {
		if (Tools.isNullStr(str))
			return "";
		if (str.length() > len)
			return str.substring(0, len) + rep;
		else
			return str;
	}

	public static String getTimeToCN(long time) {
		if (time < 1) {
			return "0";
		} else {
			long between = time / 1000;// ����1000��Ϊ��ת������
			long day = between / (24 * 3600);
			long hour = between % (24 * 3600) / 3600;
			long minute = between % 3600 / 60;
			long second = between % 60;
			StringBuffer sb = new StringBuffer();
			if (day > 0)
				sb.append(day + "��");
			if (hour > 0)
				sb.append(hour + "Сʱ");
			if (minute > 0)
				sb.append(minute + "��");
			if (second > 0)
				sb.append(second + "��");
			return sb.toString();
		}
	}

	public List<String> getBadDataReason() {
		List<String> list = new ArrayList<String>();

		list.add("A0");
		list.add("A1");
		list.add("A2");
		list.add("A3");
		list.add("B0");
		list.add("B1");
		list.add("B2");
		list.add("C0");
		list.add("C1");
		list.add("S0");
		return list;
	}

	public static String getTimeToCN(String time) {
		return getTimeToCN(parseLong(time));
	}

	/**
	 * 小数位四舍五入
	 * @param oldDouble 要四舍五入的数据
	 * @param pointNumber 小数位数,小于0时默认为2
	 * @return
	 */
	public static Double doubleRound(Double oldDouble, int pointNumber){
		if( oldDouble == null ){
			return 0D;
		}
		if( pointNumber < 0){
			pointNumber = 2;
		}
		NumberFormat numberFormat = NumberFormat.getInstance();
		numberFormat.setMaximumFractionDigits(pointNumber);
		String newDoubleStr = numberFormat.format(oldDouble);
		return Tools.parseDouble(newDoubleStr.replace(",", ""));
	}


	/**将vector转化为string【】*/
	public static String[] listToStrs(List vt)
	{
		String re[]=new String[vt.size()];
		for(int i=0;i<vt.size();i++)
		{
			re[i]=vt.get(i)+"";
		}
		return re;
	}
	/**
	 * 判断List里面是否含有给定的key，如果存在返回true，否则返回false
	 * */
	public static boolean hasElement(String key,List<String> list){
		key=Tools.nullToStr(key);
		for(String s:list){
			if(s.toLowerCase().trim().equals(key.toLowerCase()))
				return true;
		}
		return false;
	}
	public static void main(String[] args) {
		System.out.println(getRandomNum());
	}
	
}
