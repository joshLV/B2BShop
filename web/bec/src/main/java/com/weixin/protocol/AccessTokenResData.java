package com.weixin.protocol;

/**
 * Created by chris on 2016/3/9.
 */
public class AccessTokenResData extends ResData {

    //
    private String access_token;
    private String expires_in;
    private String refresh_token;
    private String openid;
    private String scope;
    private String unionid;



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


    public AccessTokenResData buildAccess_token(String access_token) {
        this.access_token = access_token;
        return this;
    }

    public AccessTokenResData buildExpires_in(String expires_in) {
        this.expires_in = expires_in;
        return this;
    }

    public AccessTokenResData buildRefresh_token(String refresh_token) {
        this.refresh_token = refresh_token;
        return this;
    }

    public AccessTokenResData buildOpenid(String openid) {
        this.openid = openid;
        return this;
    }

    public AccessTokenResData buildScope(String scope) {
        this.scope = scope;
        return this;
    }

    public AccessTokenResData buildUnionid(String unionid) {
        this.unionid = unionid;
        return this;
    }
}
