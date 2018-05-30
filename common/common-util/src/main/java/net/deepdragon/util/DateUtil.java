package net.deepdragon.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.apache.commons.lang3.StringUtils;

public class DateUtil {

		private final static SimpleDateFormat sdfYear = new SimpleDateFormat("yyyy");

		private final static SimpleDateFormat sdfDay = new SimpleDateFormat(
				"yyyy-MM-dd");

		private final static SimpleDateFormat sdfDays = new SimpleDateFormat(
				"yyyyMMdd");

		private final static SimpleDateFormat sdfTime = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");

		/**
		 * 获取YYYY格式
		 *
		 * @return
		 */
		public static String getYear() {
			return getTime("yyyy");
		}

		/**
		 * 获取YYYY-MM-DD格式
		 *
		 * @return
		 */
		public static String getDay() {
			return getTime("yyyy-MM-dd");
		}

		/**
		 * 获取YYYYMMDD格式
		 *
		 * @return
		 */
		public static String getDays(){
			return getTime("yyyyMMdd");
		}

		/**
		 * 获取YYYY-MM-DD HH:mm:ss格式
		 *
		 * @return
		 */
		public static String getTime() {
			return getTime("yyyy-MM-dd HH:mm:ss");
		}

	/**
	 * 获取YYYY-MM-DD HH:mm:ss格式
	 *
	 * @return
	 */
		public static String getTime(String dateFormat) {
			SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
			return sdf.format(new Date());
		}

		/**
		 * @Title: compareDate
		 * @Description: TODO(日期比较，如果s>=e 返回true 否则返回false)
		 * @param s
		 * @param e
		 * @return boolean
		 * @throws
		 * @author luguosui
		 */
		public static boolean compareDate(String s, String e) {
			if(fomatDate(s)==null||fomatDate(e)==null){
				return false;
			}
			return fomatDate(s).getTime() >=fomatDate(e).getTime();
		}

		/**
		 * 格式化日期
		 *
		 * @return
		 */
		public static Date fomatDate(String date) {
			DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
			try {
				return fmt.parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
				return null;
			}
		}

		/**
		 * 校验日期是否合法
		 *
		 * @return
		 */
		public static boolean isValidDate(String s) {
			DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
			try {
				fmt.parse(s);
				return true;
			} catch (Exception e) {
				// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
				return false;
			}
		}
		public static int getDiffYear(String startTime,String endTime) {
			DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
			try {
				long aa=0;
				int years=(int) (((fmt.parse(endTime).getTime()-fmt.parse(startTime).getTime())/ (1000 * 60 * 60 * 24))/365);
				return years;
			} catch (Exception e) {
				// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
				return 0;
			}
		}
		/**
		 * <li>功能描述：时间相减得到天数
		 * @param beginDateStr
		 * @param endDateStr
		 * @return
		 * long
		 * @author Administrator
		 */
		public static long getDaySub(String beginDateStr,String endDateStr){
			long day=0;
			java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
			try {
			java.util.Date beginDate =  format.parse(beginDateStr);
			java.util.Date endDate = format.parse(endDateStr);
				day = (endDate.getTime()-beginDate.getTime())/(24*60*60*1000);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			return day;
		}

		/**
		 * 得到n天之后的日期
		 * @param days
		 * @return
		 */
		public static String getAfterDayDate(String days) {
			int daysInt = Integer.parseInt(days);

			Calendar canlendar = Calendar.getInstance(); // java.util包
			canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
			Date date = canlendar.getTime();

			SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dateStr = sdfd.format(date);

			return dateStr;
		}

		/**
		 * 得到n天之后是周几
		 * @param days
		 * @return
		 */
		public static String getAfterDayWeek(String days) {
			int daysInt = Integer.parseInt(days);

			Calendar canlendar = Calendar.getInstance(); // java.util包
			canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
			Date date = canlendar.getTime();

			SimpleDateFormat sdf = new SimpleDateFormat("E");
			String dateStr = sdf.format(date);

			return dateStr;
		}

		public static void main(String[] args) {
			System.out.println(getDays());
			System.out.println(getAfterDayWeek("3"));
		}

		// 以毫秒表示的时间
		private static final long DAY_IN_MILLIS = 24 * 3600 * 1000;
		private static final long HOUR_IN_MILLIS = 3600 * 1000;
		private static final long MINUTE_IN_MILLIS = 60 * 1000;
		private static final long SECOND_IN_MILLIS = 1000;

		public static String getFullNowTime(){
			return String.valueOf(System.currentTimeMillis());
		}

		public static String getFullDate(){
			return dateToString(new Date(),"yyyyMMddHHmmssSSS");
		}

		public static  Date formatDateToTime(final Date date, final String style) {
			DateFormat format = new SimpleDateFormat(style);
			return stringToDate(format.format(date), style);
		}

		public static  Date stringToDate(String date, String style) {
			DateFormat format = new SimpleDateFormat(style);
			try {
				return format.parse(date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}

		public static  String dateToString(final Date date, final String style) {
			DateFormat format = new SimpleDateFormat(style);
			return format.format(date);
		}

		public static  Date formatDateToTimeThrowException(final Date date, final String style) throws Exception {
			DateFormat format = new SimpleDateFormat(style);
			return stringToDateThrowException(format.format(date), style);
		}

		public static  Date stringToDateThrowException(String date, String style) throws Exception {
			DateFormat format = new SimpleDateFormat(style);
			return format.parse(date);
		}

		/**
		 * 同一字符类型日期格式
		 * @param date
		 * @return
		 */
		public static String formateDateStr(String date){
			if( StringUtil.isEmpty(date)){
				return "";
			}
			date = date.replace(".", "-");
			date = date.replace("/", "-");
			if( date.length() <= 5){
				date = date + "-1-1";
			}else{
				if ( date.indexOf("-") == date.lastIndexOf("-") ){
					date = date + "-1";
				}else{
					if(date.lastIndexOf("-") == date.length()-1){
						date = date + "1";
					}
				}
			}

			return date;
		}

		/**
		 * 验证是否为日期时间
		 * @param s
		 * @return
		 */
		public static boolean isDateTime(String s) {
			try {
				SimpleDateFormat sf = new SimpleDateFormat(
						DEF_STYLE);
				sf.parse(s);
			} catch (Exception ex) {
				return false;
			}

			return true;
		}

		/**
		 * 验证字符串是否为日期
		 * @param s
		 * @return
		 */
		public static boolean isDate(String s) {
			try {
				if(s.length() > 10)return false;
				SimpleDateFormat sf = new SimpleDateFormat(DATE_STYLE);
				sf.parse(s);
			} catch (Exception ex) {
				return false;
			}

			return true;
		}

		/**
		 * 验证字符串是否为时间
		 * @param s
		 * @return
		 */
		public static boolean isTime(String s) {
			try {
				if(s.length() > 19)return false;
				SimpleDateFormat sf = new SimpleDateFormat(
						DEF_STYLE);
				sf.parse(s);
			} catch (Exception ex) {
				return false;
			}

			return true;
		}

		/**
		 * 判断 date1 与 date2 是否相等
		 * @param date1
		 * @param date2
		 * @param style
		 * @return 相等，返回true； 不相等，返回false
		 */
		public static boolean date1EqDate2(Date date1,Date date2, String style) {
			if( date1 == null  ){
				if(date2==null){
					return true;
				}else{
					return false;
				}
			}
			String d1 = dateToString(date1, style);
			String d2 = dateToString(date2, style);
			if( d1.equals( d2 )){
				return true;
			}else{
				return false;
			}
		}

		public static final String DEF_STYLE = "yyyy-MM-dd HH:mm:ss";
		public static final String DATE_STYLE = "yyyy-MM-dd";


		/**
		 * 对日期进行增减操作
		 * @param date 要操作的日期
		 * @param calendarField Calendar的常量
		 * @param augmenter  增量
		 * @return
		 */
		public static Date dateAddByProp(Date date,int calendarField, int augmenter){
			Calendar ca = Calendar.getInstance();
			ca.setTime(date);
			ca.add(calendarField, augmenter);// 30为增加的天数，可以改变的
			return ca.getTime();
		}

		/**
		 * 获取传入时间的当月最后一天
		 * @param sDate1
		 * @return
		 */
		public static Date getLastDayOfMonth(Date sDate1) {
			Calendar cDay1 = Calendar.getInstance();
			cDay1.setTime(sDate1);
			final int lastDay = cDay1.getActualMaximum(Calendar.DAY_OF_MONTH);
			Date lastDate = cDay1.getTime();
			lastDate.setDate(lastDay);
			return lastDate;
		}


		/**
		 * 计算两个时间之间的差值
		 *
		 * @param flag  计算标志，表示按照年/月/日/时/分/秒等计算
		 * @param calSrc  减数
		 * @param calDes 被减数
		 * @return 两个日期之间的差值
		 */
		@SuppressWarnings("static-access")
		public static int dateDiff(char flag, Calendar calSrc, Calendar calDes) {

			long millisDiff = getMillis(calSrc) - getMillis(calDes);
			if (flag == 'y') {
				return (calSrc.get(calSrc.YEAR) - calDes.get(calDes.YEAR));
			}
			if (flag == 'd') {
				System.out.println((int) (millisDiff / DAY_IN_MILLIS));
				return (int) (millisDiff / DAY_IN_MILLIS);
			}
			if (flag == 'h') {
				return (int) (millisDiff / HOUR_IN_MILLIS);
			}
			if (flag == 'm') {
				return (int) (millisDiff / MINUTE_IN_MILLIS);
			}
			if (flag == 's') {
				return (int) (millisDiff / SECOND_IN_MILLIS);
			}
			return 0;
		}
		/**
		 * 计算两个时间之间的差值
		 *
		 * @param flag  计算标志，表示按照年/月/日/时/分/秒等计算
		 * @param calSrc  减数
		 * @param calDes 被减数
		 * @return 两个日期之间的差值
		 */
		@SuppressWarnings("static-access")
		public static int dateDiff2(char flag, Calendar calSrc, Calendar calDes) {

			long millisDiff = getMillis(calDes) - getMillis(calSrc);
			if (flag == 'y') {
				return (calSrc.get(calSrc.YEAR) - calDes.get(calDes.YEAR));
			}
			if (flag == 'd') {
				System.out.println((int) (millisDiff / DAY_IN_MILLIS));
				return (int) (millisDiff / DAY_IN_MILLIS);
			}
			if (flag == 'h') {
				return (int) (millisDiff / HOUR_IN_MILLIS);
			}
			if (flag == 'm') {
				return (int) (millisDiff / MINUTE_IN_MILLIS);
			}
			if (flag == 's') {
				return (int) (millisDiff / SECOND_IN_MILLIS);
			}
			return 0;
		}

		/**
		 * 获取系统时间的毫秒数
		 *
		 * @return 系统时间的毫秒数
		 */
		public static long getMillis() {
			return new Date().getTime();
		}

		/**
		 * 指定日历的毫秒数
		 *
		 * @param cal  日历
		 * @return 指定日历的毫秒数
		 */
		public static long getMillis(Calendar cal) {
			return cal.getTime().getTime();
		}

		/**
		 * 指定日期的毫秒数
		 *
		 * @param date 日期
		 * @return 指定日期的毫秒数
		 */
		public static long getMillis(Date date) {
			return date.getTime();
		}

		/**
		 * 当前日历，这里用中国时间表示
		 *
		 * @return 以当地时区表示的系统当前日历
		 */
		public static Calendar getCalendar() {
			return Calendar.getInstance();
		}

		/**
		 * 指定毫秒数表示的日历
		 *
		 * @param millis 毫秒数
		 * @return 指定毫秒数表示的日历
		 */
		public static Calendar getCalendar(long millis) {
			Calendar cal = Calendar.getInstance();
			cal.setTime(getDate(millis));
			return cal;
		}


		/**
		 * 指定毫秒数表示的日期
		 *
		 * @param millis 毫秒数
		 * @return 毫秒数表示的日期
		 */
		public static Date getDate(long millis) {
			return new Date(millis);
		}

		/**
		 * 指定毫秒数表示的日历
		 *
		 * @param date 日期
		 * @return 指定毫秒数表示的日历
		 */
		public static Calendar getCalendar(Date date) {
			Calendar cal = Calendar.getInstance();
			cal.setTime(getDate(date.getTime()));
			return cal;
		}



	public static final String Format_Date = "yyyy-MM-dd";
	public static final String Format_Time = "HH:mm:ss";
	public static final String Format_DateTime = "yyyy-MM-dd HH:mm:ss";

	/**
	 * 得到以yyyy-MM-dd格式表示的当前日期字符串
	 */
	public static String getCurrentDate() {
		return new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	}

	/**
	 * 得到以format格式表示的当前日期字符串
	 */
	public static String getCurrentDate(String format) {
		SimpleDateFormat t = new SimpleDateFormat(format);
		return t.format(new Date());
	}

	/**
	 * 得到以HH:mm:ss表示的当前时间字符串
	 */
	public static String getCurrentTime() {
		return new SimpleDateFormat("HH:mm:ss").format(new Date());
	}

	/**
	 * 得到以format格式表示的当前时间字符串
	 */
	public static String getCurrentTime(String format) {
		SimpleDateFormat t = new SimpleDateFormat(format);
		return t.format(new Date());
	}

	/**
	 * 得到以yyyy-MM-dd HH:mm:ss表示的当前时间字符串
	 */
	public static String getCurrentDateTime() {
		String format = "yyyy-MM-dd HH:mm:ss";
		return getCurrentDateTime(format);
	}

	public static int getDayOfWeek() {
		Calendar cal = Calendar.getInstance();
		return cal.get(Calendar.DAY_OF_WEEK);
	}

	public static int getDayOfWeek(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.get(Calendar.DAY_OF_WEEK);
	}

	public static int getDayOfMonth() {
		Calendar cal = Calendar.getInstance();
		return cal.get(Calendar.DAY_OF_MONTH);
	}

	public static int getDayOfMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.get(Calendar.DAY_OF_MONTH);
	}

	// 获取某一个月的天数
	public static int getMaxDayOfMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.getActualMaximum(Calendar.DATE);
	}

	// 获取某月的第一天
	public static String getFirstDayOfMonth(String date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(parse(date));
		cal.set(Calendar.DAY_OF_MONTH, 1);
		return new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	}

	public static int getDayOfYear() {
		Calendar cal = Calendar.getInstance();
		return cal.get(Calendar.DAY_OF_YEAR);
	}

	public static int getDayOfYear(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.get(Calendar.DAY_OF_YEAR);
	}

	public static int getDayOfWeek(String date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(parse(date));
		return cal.get(Calendar.DAY_OF_WEEK);
	}

	public static int getDayOfMonth(String date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(parse(date));
		return cal.get(Calendar.DAY_OF_MONTH);
	}

	public static int getDayOfYear(String date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(parse(date));
		return cal.get(Calendar.DAY_OF_YEAR);
	}

	public static String getCurrentDateTime(String format) {
		SimpleDateFormat t = new SimpleDateFormat(format);
		return t.format(new Date());
	}

	/**
	 * 输出只带日期的字符串
	 */
	public static String toString(Date date) {
		if (date == null) {
			return "";
		}
		return new SimpleDateFormat("yyyy-MM-dd").format(date);
	}

	/**
	 * 输出带有日期和时间的字符串
	 */
	public static String toDateTimeString(Date date) {
		if (date == null) {
			return "";
		}
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
	}

	/**
	 * 按指定的format输出日期字符串
	 */
	public static String toString(Date date, String format) {
		SimpleDateFormat t = new SimpleDateFormat(format);
		return t.format(date);
	}

	/**
	 * 输出只带时间的字符串
	 */
	public static String toTimeString(Date date) {
		if (date == null) {
			return "";
		}
		return new SimpleDateFormat("HH:mm:ss").format(date);
	}

	public static int compare(String date1, String date2) {
		return compare(date1, date2, Format_Date);
	}

	public static int compareTime(String time1, String time2) {
		return compareTime(time1, time2, Format_Time);
	}

	public static int compare(String date1, String date2, String format) {
		Date d1 = parse(date1, format);
		Date d2 = parse(date2, format);
		return d1.compareTo(d2);
	}

	public static int compareTime(String time1, String time2, String format) {
		String[] arr1 = time1.split(":");
		String[] arr2 = time2.split(":");
		if (arr1.length < 2) {
			throw new RuntimeException("错误的时间值:" + time1);
		}
		if (arr2.length < 2) {
			throw new RuntimeException("错误的时间值:" + time2);
		}
		int h1 = Integer.parseInt(arr1[0]);
		int m1 = Integer.parseInt(arr1[1]);
		int h2 = Integer.parseInt(arr2[0]);
		int m2 = Integer.parseInt(arr2[1]);
		int s1 = 0, s2 = 0;
		if (arr1.length == 3) {
			s1 = Integer.parseInt(arr1[2]);
		}
		if (arr2.length == 3) {
			s2 = Integer.parseInt(arr2[2]);
		}
		if (h1 < 0 || h1 > 23 || m1 < 0 || m1 > 59 || s1 < 0 || s1 > 59) {
			throw new RuntimeException("错误的时间值:" + time1);
		}
		if (h2 < 0 || h2 > 23 || m2 < 0 || m2 > 59 || s2 < 0 || s2 > 59) {
			throw new RuntimeException("错误的时间值:" + time2);
		}
		if (h1 != h2) {
			return h1 > h2 ? 1 : -1;
		} else {
			if (m1 == m2) {
				if (s1 == s2) {
					return 0;
				} else {
					return s1 > s2 ? 1 : -1;
				}
			} else {
				return m1 > m2 ? 1 : -1;
			}
		}
	}

	/*public static boolean isTime(String time) {
		String[] arr = time.split(":");
		if (arr.length < 2) {
			return false;
		}
		try {
			int h = Integer.parseInt(arr[0]);
			int m = Integer.parseInt(arr[1]);
			int s = 0;
			if (arr.length == 3) {
				s = Integer.parseInt(arr[2]);
			}
			if (h < 0 || h > 23 || m < 0 || m > 59 || s < 0 || s > 59) {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public static boolean isDate(String date) {
		String[] arr = date.split("-");
		if (arr.length < 3) {
			return false;
		}
		try {
			int y = Integer.parseInt(arr[0]);
			int m = Integer.parseInt(arr[1]);
			int d = Integer.parseInt(arr[2]);
			if (y < 0 || m > 12 || m < 0 || d < 0 || d > 31) {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
		return true;
	}*/

	public static boolean isWeekend(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int t = cal.get(Calendar.DAY_OF_WEEK);
		if (t == Calendar.SATURDAY || t == Calendar.SUNDAY) {
			return true;
		}
		return false;
	}

	public static boolean isWeekend(String str) {
		return isWeekend(parse(str));
	}

	public static Date parse(String str) {
		if (StringUtils.isEmpty(str)) {
			return null;
		}

		try {
			return new SimpleDateFormat("yyyy-MM-dd").parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static Date parse(String str, String format) {
		if (StringUtils.isEmpty(str))
			return null;
		try {
			SimpleDateFormat t = new SimpleDateFormat(format);
			return t.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static Date parseDateTime(String str) {
		if (StringUtils.isEmpty(str)) {
			return null;
		}
		if (str.length() == 10)
			return parse(str);
		try {
			return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static Date parseDateTime(String str, String format) {
		if (StringUtils.isEmpty(str))
			return null;
		try {
			SimpleDateFormat t = new SimpleDateFormat(format);
			return t.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 日期date上加count分钟，count为负表示减
	 */
	public static Date addMinute(Date date, int count) {
		return new Date(date.getTime() + 60000L * count);
	}

	/**
	 * 日期date上加count小时，count为负表示减
	 */
	public static Date addHour(Date date, int count) {
		return new Date(date.getTime() + 3600000L * count);
	}

	/**
	 * 日期date上加count天，count为负表示减
	 */
	public static Date addDay(Date date, int count) {
		return new Date(date.getTime() + 86400000L * count);
	}

	/**
	 * 日期date上加count星期，count为负表示减
	 */
	public static Date addWeek(Date date, int count) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.WEEK_OF_YEAR, count);
		return c.getTime();
	}

	/**
	 * 日期date上加count月，count为负表示减
	 */
	public static Date addMonth(Date date, int count) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.MONTH, count);
		return c.getTime();
	}

	/**
	 * 日期date上加count年，count为负表示减
	 */
	public static Date addYear(Date date, int count) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.YEAR, count);
		return c.getTime();
	}

	public static String toDisplayDateTime(String date) {
		if (StringUtils.isEmpty(date))
			return null;
		try {
			if (isDate(date)) {
				return toDisplayDateTime(parse(date));
			}
			SimpleDateFormat t = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date d = t.parse(date);
			return toDisplayDateTime(d);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "不是标准格式时间!";
	}

	public static String toDisplayDateTime(Date date) {
		long minite = (System.currentTimeMillis() - date.getTime()) / 60000L;
		if (minite < 60L) {
			return toString(date, "MM-dd") + " " + minite + "分钟前";
		}
		if (minite < 1440L) {
			return toString(date, "MM-dd") + " " + (minite / 60L) + "小时前";
		}
		return toString(date, "MM-dd") + " " + (minite / 1440L) + "天前";
	}

	// 获得本周第一天
	public static String getFirstDayOfNowWeek() {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat(DateUtil.Format_Date);
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY); // 获取本周一的日期
		return df.format(cal.getTime());
	}

	// 获取本月第一天
	public static String getFirstDayOfNowMonth() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, 0);
		cal.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
		SimpleDateFormat df = new SimpleDateFormat(DateUtil.Format_Date);
		return df.format(cal.getTime());
	}
}
