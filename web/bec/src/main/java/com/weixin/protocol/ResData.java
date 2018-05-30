package com.weixin.protocol;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.weixin.common.XStreamCDATA;

/**
 * Created by chris on 2016/3/9.
 */
@XStreamAlias("xml")
public class ResData {
    //
    private String errcode;
    private String errmsg;

    @XStreamCDATA
    private String return_code;
    @XStreamCDATA
    private String return_msg;

    public String getErrcode() {
        return errcode;
    }

    public void setErrcode(String errcode) {
        this.errcode = errcode;
    }

    public String getErrmsg() {
        return errmsg;
    }

    public void setErrmsg(String errmsg) {
        this.errmsg = errmsg;
    }

    public String getReturn_code() {
        return return_code;
    }

    public void setReturn_code(String return_code) {
        this.return_code = return_code;
    }

    public String getReturn_msg() {
        return return_msg;
    }

    public void setReturn_msg(String return_msg) {
        this.return_msg = return_msg;
    }

    public ResData buildErrcode(String errcode) {
        this.errcode = errcode;
        return this;
    }

    public ResData buildErrmsg(String errmsg) {
        this.errmsg = errmsg;
        return this;
    }


    public ResData buildReturn_code(String return_code) {
        this.return_code = return_code;
        return this;
    }

    public ResData buildReturn_msg(String return_msg) {
        this.return_msg = return_msg;
        return this;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("ResData{");
        sb.append("errcode='").append(errcode).append('\'');
        sb.append(", errmsg='").append(errmsg).append('\'');
        sb.append(", return_code='").append(return_code).append('\'');
        sb.append(", return_msg='").append(return_msg).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
