package com.icbc.rtreq;

/**
 * Created by Administrator on 2016/6/16.
 */
public class Custom {

    // 1检验联名标志：取值“1”：客户支付时，网银判断该客户是否与商户联名，是则按上送金额扣帐，否则展现未联名错误；取值“0”：不检验客户是否与商户联名，按上送金额扣帐。
    private String verifyJoinFlag = "0";

    // 2语言版本：默认为中文版 。取值：“EN_US”为英文版；取值：“ZH_CN”或其他为中文版。注意：大小写敏感。
    private String language = "ZH_CN";


    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getVerifyJoinFlag() {
        return verifyJoinFlag;
    }

    public void setVerifyJoinFlag(String verifyJoinFlag) {
        this.verifyJoinFlag = verifyJoinFlag;
    }

}
