package net.deepdragon.util;

import org.apache.log4j.Logger;

/**
 *
 * 
 * @author xingshuangyang
 *
 *  log4j 封装表
 * */
public class SunLog {

	public final static int DEBUG=1;
	public final static int INFO=2;
	public final static int WARN=3;
	public final static int ERROR=4;
	
	/**
	 *
	 * */
	public static void log(String key,String message,int type){
		key=key==null?"SLMCM":key;
		message=message==null?"":message;
		Logger log=Logger.getLogger(key);
		if(type==DEBUG)
		    log.debug(message); 
		else if(type==INFO)
		    log.info(message);
		else if(type==WARN)
			log.warn(message);
		else if(type==ERROR)
			log.error(message);
		
	}
   
	/**
	 * debug
	 * */
 	public static void d(String key,String message){
		 SunLog.log(key, message, DEBUG);
	};
	/**
	 * debug
	 * */
 	public static void d(String key,Object message){
 		 message=message==null?"":message;
		 SunLog.log(key, message.toString(), DEBUG);
	};
	/**
	 * INFO
	 * */
 	public static void i(String key,String message){
		 SunLog.log(key, message, INFO);
	};
	/**
	 * INFO
	 * */
 	public static void i(String key,Object message){
		 SunLog.log(key, message.toString(), INFO);
	};
	/**
	 * warn
	 * */
 	public static void w(String key,String message){
		 SunLog.log(key, message, WARN);
	};
	/**
	 * error
	 * */
 	public static void e(String key,String message){
		 SunLog.log(key, message, ERROR);
	};
	/**
	 * debug
	 * */
 	public static void d(Class clazz,String message){
		 SunLog.log(clazz.getName(), message, DEBUG);
	};
	/**
	 * INFO
	 * */
 	public static void i(Class clazz,String message){
		 SunLog.log(clazz.getName(), message, INFO);
	};
	
	/**
	 * warn
	 * */
 	public static void w(Class clazz,String message){
		 SunLog.log(clazz.getName(), message, WARN);
	};
	/**
	 * error
	 * */
 	public static void e(Class clazz,String message){
		 SunLog.log(clazz.getName(), message, ERROR);
	};
	
	
	
	public static void main(String[] args) {
		SunLog.d("www", "ffffffff");
	}
}
