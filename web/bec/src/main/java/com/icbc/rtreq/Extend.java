package com.icbc.rtreq;

/**
 * Created by Administrator on 2016/6/16.
 */
public class Extend {

    // 2工银e支付注册标志：工银e支付注册标志，标识客户在支付该笔订单时，是否使用订单指定的下述信息注册工银e支付。 0-否，1-是
    private String e_isMerFlag = "";
    // 2客户姓名
    private String e_Name = "";
    // 2客户手机号：如果工银e支付注册标志e_isMerFlag上送1，则此字段必输
    private String e_TelNum = "";
    // 2客户证件类型：0:身份证     1:护照 2:军官证     3:士兵证     4:回乡证（港澳台往来通行证）     5:临时身份证     6:户口本     7:其他       9:警官证     12:外国人永久居住证       21:边民证
    private String e_CredType = "";
    // 2客户证件号
    private String e_CredNum = "";

    public String getE_CredNum() {
        return e_CredNum;
    }

    public void setE_CredNum(String e_CredNum) {
        this.e_CredNum = e_CredNum;
    }

    public String getE_CredType() {
        return e_CredType;
    }

    public void setE_CredType(String e_CredType) {
        this.e_CredType = e_CredType;
    }

    public String getE_isMerFlag() {
        return e_isMerFlag;
    }

    public void setE_isMerFlag(String e_isMerFlag) {
        this.e_isMerFlag = e_isMerFlag;
    }

    public String getE_Name() {
        return e_Name;
    }

    public void setE_Name(String e_Name) {
        this.e_Name = e_Name;
    }

    public String getE_TelNum() {
        return e_TelNum;
    }

    public void setE_TelNum(String e_TelNum) {
        this.e_TelNum = e_TelNum;
    }

}
