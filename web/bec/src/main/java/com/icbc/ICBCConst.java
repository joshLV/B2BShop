package com.icbc;

import java.util.Properties;

/**
 * Created by Administrator on 2016/6/16.
 */
public class ICBCConst {

    public static String b2b_groupName;// 集团名称
    public static String b2b_groupNo;// 集团编号
    public static String b2b_account;// 基本账号
    public static String b2b_shopName;// 商城中文名
    public static String b2b_shopCode;// 商城代码
    public static String b2b_crtName;// 证书名称
    public static String b2b_crtPasswd;// 证书密码
    public static String b2b_crtPath ;//证书路径
    public static String b2b_userKeyPath;//证书路径
    public static String b2b_serverUrl;//提交地址
    public static String b2b_domain;//域名



    public static String b2c_groupName;// 集团名称
    public static String b2c_groupNo;// 集团编号
    public static String b2c_account;// 基本账号
    public static String b2c_shopName;// 商城中文名
    public static String b2c_shopCode;// 商城代码
    public static String b2c_crtName;// 证书名称
    public static String b2c_crtPasswd;// 证书密码
    public static String b2c_crtPath ;//证书路径
    public static String b2c_userKeyPath;//证书路径
    public static String b2c_serverUrl;//提交地址
    public static String b2c_domain;//域名


    static {
        // 相关参数定义
        try {
            Properties prop = new Properties();
            prop.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("icbc.ghj.properties"));
            b2b_groupName = prop.getProperty("b2b_groupName");
            b2b_groupNo = prop.getProperty("b2b_groupNo");
            b2b_account = prop.getProperty("b2b_account");
            b2b_shopName = prop.getProperty("b2b_shopName");
            b2b_shopCode = prop.getProperty("b2b_shopCode");
            b2b_crtName = prop.getProperty("b2b_crtName");
            b2b_crtPasswd = prop.getProperty("b2b_crtPasswd");
            b2b_crtPath = prop.getProperty("b2b_crtPath");
            b2b_userKeyPath  = prop.getProperty("b2b_userKeyPath");
            b2b_serverUrl = prop.getProperty("b2b_serverUrl");
            b2b_domain = prop.getProperty("b2b_domain");

            b2c_groupName = prop.getProperty("b2c_groupName");
            b2c_groupNo = prop.getProperty("b2c_groupNo");
            b2c_account = prop.getProperty("b2c_account");
            b2c_shopName = prop.getProperty("b2c_shopName");
            b2c_shopCode = prop.getProperty("b2c_shopCode");
            b2c_crtName = prop.getProperty("b2c_crtName");
            b2c_crtPasswd = prop.getProperty("b2c_crtPasswd");
            b2c_crtPath = prop.getProperty("b2c_crtPath");
            b2c_userKeyPath  = prop.getProperty("b2c_userKeyPath");
            b2c_serverUrl = prop.getProperty("b2c_serverUrl");
            b2c_domain = prop.getProperty("b2c_domain");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
