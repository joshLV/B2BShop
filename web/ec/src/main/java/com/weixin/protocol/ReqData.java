package com.weixin.protocol;

/**
 * Created by chris on 2016/3/9.
 */
public abstract class ReqData {
    public abstract String getUrl();

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("ReqData{");
        sb.append('}');
        return sb.toString();
    }
}
