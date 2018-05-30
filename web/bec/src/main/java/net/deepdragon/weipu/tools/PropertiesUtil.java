package net.deepdragon.weipu.tools;


import java.io.*;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/***
 * @author  邢双阳
 * @since 2010年3月22日 13:47:29
 *

 *
 * ***/
public class PropertiesUtil {

    /**
     * 根据key和路径读取value
     */
    public static String getValue(String filePath ,String key) {

        filePath = getFilePath(filePath);

        Properties properties = new Properties();
        try {
            InputStream inputStream = null;
            try{
              inputStream=new BufferedInputStream(new FileInputStream(filePath));
            }catch(FileNotFoundException e){
        		  inputStream=Thread.currentThread().getContextClassLoader().getResourceAsStream(filePath.replaceAll("resources/",""));
            }
            properties.load(inputStream);
            return properties.getProperty(key);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 根据路径读取所有属性放入map
     * @param filePath
     * @return
     */  
    public static Map<String,String> getAll(String filePath) {

        filePath = getFilePath(filePath);

        Map<String,String>  config = new HashMap<String,String> ();  
        Properties properties = new Properties();  
        InputStream inputStream = null;
        try {
        	  try{
              inputStream=new BufferedInputStream(new FileInputStream(filePath));  
        	  }catch(FileNotFoundException e){   
        		  inputStream=Thread.currentThread().getContextClassLoader().getResourceAsStream(filePath.replaceAll("resources/",""));
        	  }                 
            properties.load(inputStream);  
            Enumeration enumeration = properties.propertyNames();  
            while (enumeration.hasMoreElements()) {  
                String key = String.valueOf(enumeration.nextElement());  
                config.put(key, properties.getProperty(key));
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  finally {
            if(inputStream != null){
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return config;  
    }


    /**
     * 更新properties文件的键值对
     * 如果该主键已经存在，更新该主键的值；
     * 如果该主键不存在，则插件一对键值。
     * @param keyname 键名
     * @param keyvalue 键值
     */
    public static void updateProperties(String profilepath,String keyname,String keyvalue,boolean isZN) {

        profilepath = getFilePath(profilepath);

        /*if(isZN){
            keyvalue = StringUtil.string2Unicode(keyvalue);
        }*/

        InputStream inputStream = null;
        try {
            Properties props = new Properties();
            try{
                inputStream=new BufferedInputStream(new FileInputStream(profilepath));
            }catch(FileNotFoundException e){
                inputStream=Thread.currentThread().getContextClassLoader().getResourceAsStream(profilepath.replaceAll("resources/",""));
            }
            props.load(inputStream);
            // 调用 Hashtable 的方法 put，使用 getProperty 方法提供并行性。
            // 强制要求为属性的键和值使用字符串。返回值是 Hashtable 调用 put 的结果。
            OutputStream fos = new FileOutputStream(profilepath);
            props.setProperty(keyname, keyvalue);
            // 以适合使用 load 方法加载到 Properties 表中的格式，
            // 将此 Properties 表中的属性列表（键和元素对）写入输出流
            props.store(fos, "Update '" + keyname + "' value");
            fos.close();
        } catch (IOException e) {
            System.err.println("属性文件更新错误");
        }finally {
            if(inputStream != null){
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }


    /**
     *
     * @param profilepath
     * @return
     */
    private static String getFilePath(String profilepath){
        String filePath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""));//+"../../";	//项目路径
        filePath = filePath.replaceAll("file:/", "");
        filePath = filePath.replaceAll("%20", " ");
        filePath = filePath.trim() + profilepath.trim();
        if(filePath.indexOf(":") != 1){
            filePath = File.separator + filePath;
        }
        return filePath;
    }
}