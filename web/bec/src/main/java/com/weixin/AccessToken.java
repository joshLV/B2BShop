package com.weixin;

/**
 * Created by chris on 2016/3/9.
 */
public class AccessToken {
    //
    private String errcode;
    private String errmsg;
    //
    private String access_token;
    private String expires_in;
    private String refresh_token;
    private String openid;
    private String scope;
    private String unionid;

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

    public String getAccess_token() {
        return access_token;
    }

    public void setAccess_token(String access_token) {
        this.access_token = access_token;
    }

    public String getExpires_in() {
        return expires_in;
    }

    public void setExpires_in(String expires_in) {
        this.expires_in = expires_in;
    }

    public String getRefresh_token() {
        return refresh_token;
    }

    public void setRefresh_token(String refresh_token) {
        this.refresh_token = refresh_token;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    public String getUnionid() {
        return unionid;
    }

    public void setUnionid(String unionid) {
        this.unionid = unionid;
    }

    public AccessToken buildErrcode(String errcode) {
        this.errcode = errcode;
        return this;
    }

    public AccessToken buildErrmsg(String errmsg) {
        this.errmsg = errmsg;
        return this;
    }

    public AccessToken buildAccess_token(String access_token) {
        this.access_token = access_token;
        return this;
    }

    public AccessToken buildExpires_in(String expires_in) {
        this.expires_in = expires_in;
        return this;
    }

    public AccessToken buildRefresh_token(String refresh_token) {
        this.refresh_token = refresh_token;
        return this;
    }

    public AccessToken buildOpenid(String openid) {
        this.openid = openid;
        return this;
    }

    public AccessToken buildScope(String scope) {
        this.scope = scope;
        return this;
    }

    public AccessToken buildUnionid(String unionid) {
        this.unionid = unionid;
        return this;
    }

    @Override
    public String toString() {
        return "AccessToken [access_token=" + access_token + ", expires_in="
                + expires_in + ", refresh_token=" + refresh_token + ", openid="
                + openid + ", scope=" + scope + ", unionid=" + unionid + "]";
    }
}
