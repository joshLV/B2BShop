/*
 * Copyright (c) 2014.
 * All Rights Reversed by WanXiang Corp.
 */

package net.deepdragon.erp.yunji.entity;


/**
 * Created with IntelliJ IDEA.
 * User: qingaotao
 * Date: 14-6-24
 * Time: 下午4:46
 * To change this template use File | Settings | File Templates.
 */
public class EcmLoginRequest   {
    public String eShopFlag;// eShopFlag
    public String enterpriseFlag;// 企业Flag
    public String loginName;// 用户登录名称
    public String passWord;// 用户密码

    public String geteShopFlag() {
        return eShopFlag;
    }

    public void seteShopFlag(String eShopFlag) {
        this.eShopFlag = eShopFlag;
    }

    public String getEnterpriseFlag() {
        return enterpriseFlag;
    }

    public void setEnterpriseFlag(String enterpriseFlag) {
        this.enterpriseFlag = enterpriseFlag;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }
}
