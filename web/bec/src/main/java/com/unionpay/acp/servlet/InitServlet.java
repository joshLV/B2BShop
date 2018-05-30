package com.unionpay.acp.servlet;

import com.unionpay.acp.sdk.SDKConfig;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

/**
 * Explain:
 * FileName:
 * Author: TianYu
 * Time: 2015-09-15 10:15
 * Desc:
 * Version: V1.0
 */
public class InitServlet extends HttpServlet{
    @Override
    public void init() throws ServletException {
        SDKConfig.getConfig().loadPropertiesFromSrc();// 从classpath加载acp_sdk.properties文件
        super.init();
    }
}
