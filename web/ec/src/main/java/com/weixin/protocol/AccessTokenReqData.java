package com.weixin.protocol;

import com.weixin.common.Configure;

/**
 * Created by chris on 2016/3/9.
 */
public class AccessTokenReqData extends ReqData{
    private String appId;
    private String secret;
    private String code;

    public String getUrl() {
        String url = Configure.WX_OAUTH2_ACCESS_TOKEN_URL;
        url = url.replace("{APPID}", this.appId).replace("{SECRET}", this.secret).replace("{CODE}", this.code);
        return url;
    }


    public AccessTokenReqData buildAppId(String appId) {
        this.appId = appId;
        return this;
    }

    public AccessTokenReqData buildSecret(String secret) {
        this.secret = secret;
        return this;
    }

    public AccessTokenReqData buildCode(String code) {
        this.code = code;
        return this;
    }
}