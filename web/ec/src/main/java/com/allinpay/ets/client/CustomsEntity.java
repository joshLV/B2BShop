package com.allinpay.ets.client;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.thoughtworks.xstream.io.xml.XmlFriendlyNameCoder;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Administrator on 2016/3/21.
 */
@XStreamAlias("GW_CUSTOMS")
public class CustomsEntity {

    private String CUSTOMS_TYPE;
    private String ESHOP_ENT_CODE;
    private String ESHOP_ENT_NAME;
    private String APP_UID;
    private String APP_UNAME;
    private String MEMO;

    public String getCUSTOMS_TYPE() {
        return CUSTOMS_TYPE;
    }

    protected void setCUSTOMS_TYPE(String CUSTOMS_TYPE) {
        this.CUSTOMS_TYPE = CUSTOMS_TYPE;
    }

    public String getESHOP_ENT_CODE() {
        return ESHOP_ENT_CODE;
    }

    public void setESHOP_ENT_CODE(String ESHOP_ENT_CODE) {
        this.ESHOP_ENT_CODE = ESHOP_ENT_CODE;
    }

    public String getESHOP_ENT_NAME() {
        return ESHOP_ENT_NAME;
    }

    public void setESHOP_ENT_NAME(String ESHOP_ENT_NAME) {
        this.ESHOP_ENT_NAME = ESHOP_ENT_NAME;
    }

    public String getAPP_UID() {
        return APP_UID;
    }

    public void setAPP_UID(String APP_UID) {
        this.APP_UID = APP_UID;
    }

    public String getAPP_UNAME() {
        return APP_UNAME;
    }

    public void setAPP_UNAME(String APP_UNAME) {
        this.APP_UNAME = APP_UNAME;
    }

    public String getMEMO() {
        return MEMO;
    }

    public void setMEMO(String MEMO) {
        this.MEMO = MEMO;
    }

    public String toXml() {
        XStream xStream = new XStream(new DomDriver("UTF-8", new XmlFriendlyNameCoder("-_", "_")));
        xStream.autodetectAnnotations(true);
        Pattern p = Pattern.compile("\\s{2,}|\t|\r|\n");
        Matcher m = p.matcher(xStream.toXML(this));
        return m.replaceAll("");
    }
}
