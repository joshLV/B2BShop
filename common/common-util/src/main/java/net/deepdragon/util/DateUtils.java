package net.deepdragon.util;

import org.apache.commons.lang3.StringUtils;
import org.springframework.util.Assert;

import java.text.DateFormat;
import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 时间日期的工具类
 *
 * @author : 张莹
 */
public class DateUtils {

    public static final String DATETIME_FORMAT = "yyyyMMddHHmmss";
    public static final String DATE_FORMAT = "yyyyMMdd";
    public static final String SHOW_DATETIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
    public static final String SHOW_DATE_FORMAT = "yyyy-MM-dd";

    /**
     * 获取当前时间串，格式为：yyyyMMddHHmmss
     *
     * @return
     */
    public static final String getCurrDatetime() {
        return format(new Date(), DATETIME_FORMAT);
    }

    /**
     * 获取当前日期串，格式为yyyyMMdd
     *
     * @return
     */
    public static final String getCurrDate() {
        return format(new Date(), DATE_FORMAT);
    }


    /**
     * @param date      时间
     * @param formatStr 格式化串
     * @return
     */
    public static String format(Date date, String formatStr) {
        SimpleDateFormat sdf = new SimpleDateFormat(formatStr);
        return sdf.format(date);
    }

    /**
     * 对{@code date}字符串，采用<code>0</code>右补齐到{@code length}的长度
     *
     * @param date
     * @param length
     * @return
     */
    public static String pad0(String date, int length) {
        return padChar(date, length, '0');
    }

    /**
     * 对{@code date}字符串，采用<code>9</code>右补齐到{@code length}的长度
     *
     * @param date
     * @param length
     * @return
     */
    public static String pad9(String date, int length) {
        return padChar(date, length, '9');
    }

    private static String padChar(String date, int length, char theChar) {
        if (StringUtils.isEmpty(date)) {
            date = "";
        }
        return StringUtils.rightPad(date, length, theChar);
    }

    /**
     * {@code time1}是否小于{@code time2},即类似于<pre>time1 < time2</pre>。 如果{@code time2}为<code>null</code>，
     * 则视为最小。
     *
     * @param time1 时间字符串，格式为 yyyyMMddHHmmss，不足14位后补0
     * @param time2 时间字符串，格式为 yyyyMMddHHmmss，不足14位后补0
     * @return
     */
    public static boolean lessThan(String time1, String time2) {
        if (StringUtils.isEmpty(time1)) {
            if (StringUtils.isEmpty(time2)) {
                return false;
            } else {
                return true;
            }
        } else {
            return time1.compareTo(time2) < 0;
        }
    }


    /**
     * {@code time1}是否大于{@code time2},即类似于<pre>time1 > time2</pre>。如果{@code time2}为<code>null</code>，
     * 则视为最大。
     *
     * @param time1 时间字符串，格式为 yyyyMMddHHmmss，不足14位后补9
     * @param time2 时间字符串，格式为 yyyyMMddHHmmss，不足14位后补9
     * @return
     */
    public static boolean greaterThan(String time1, String time2) {
        if (StringUtils.isEmpty(time1)) {
            if (StringUtils.isEmpty(time2)) {
                return false;
            } else {
                return true;
            }
        } else {
            return time1.compareTo(time2) > 0;
        }
    }

    /**
     * 将<code>datetime</code>字符串时间转换为毫秒数
     * @param datetime  长度必须大于等于8而小于等于14，格式为 yyyyMMddHHmmss，不足14位后补0
     * @return
     */
    public static long toMilliseconds(String datetime){
        return parseDate(datetime).getTime();
    }

    /**
     * 将格式为{@link #DATETIME_FORMAT}的时间格式解析为Date对象,{@code datetime}的长度必须大于8小于14.
     * @param datetime
     * @return
     */
    public static Date parseDate(String datetime){
        Assert.notNull(datetime);
        Assert.isTrue(datetime.length() >= 4 && datetime.length() <= 14,"长度必须大于等于8而小于等于14");
        DateFormat dateFormat = new SimpleDateFormat(DATETIME_FORMAT);
        try {
            if(datetime.length() < 14){
                dateFormat = new SimpleDateFormat(DATETIME_FORMAT.substring(0, datetime.length()));
            }
            return dateFormat.parse(datetime);
        } catch (ParseException e) {
            throw new IllegalArgumentException("入参datetime："+datetime+"解析异常，请检查格式必须为："+DATETIME_FORMAT);
        }
    }

    /**
     * 将字符串时间解析为对象
     * @param datetime
     * @param format
     * @return
     */
    public static Date parseDate(String datetime,String format){
        Assert.notNull(datetime);
        Assert.notNull(format);
        Assert.isTrue(datetime.length() == format.length(),"值和格式串的长度不一致");
        DateFormat dateFormat = new SimpleDateFormat(format);
        try {
            return dateFormat.parse(datetime);
        } catch (ParseException e) {
            throw new IllegalArgumentException(
                    MessageFormat.format("入参datetime：{1}解析异常，请检查格式必须为：{2}",datetime,format));
        }
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
            java.text.SimpleDateFormat sf = new java.text.SimpleDateFormat(
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
            java.text.SimpleDateFormat sf = new java.text.SimpleDateFormat(DATE_STYLE);
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
            java.text.SimpleDateFormat sf = new java.text.SimpleDateFormat(
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
        long a = getMillis(calSrc);
        long b = getMillis(calDes);
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
}
