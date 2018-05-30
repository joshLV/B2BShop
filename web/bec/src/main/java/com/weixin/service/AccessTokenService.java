package com.weixin.service;

import com.weixin.http.HttpConnect;
import com.weixin.http.HttpResponse;
import com.weixin.protocol.AccessTokenReqData;
import com.weixin.protocol.AccessTokenResData;
import net.sf.json.JSONObject;

/**
 * Created by chris on 2016/3/9.
 */
public class AccessTokenService implements IService<AccessTokenReqData, AccessTokenResData> {

    @Override
    public AccessTokenResData sendRequest(AccessTokenReqData accessTokenReqData) throws Exception {
        String URL = accessTokenReqData.getUrl();
        HttpResponse temp = HttpConnect.getInstance().doGetStr(URL);
        if (temp != null) {
            String tempValue = temp.getStringResult();
            JSONObject jsonObj = JSONObject.fromObject(tempValue);
            AccessTokenResData accessTokens = new AccessTokenResData();
            accessTokens.buildErrcode("");
            if (!jsonObj.containsKey("errcode")) {
                AccessTokenResData accessToken = new AccessTokenResData();
                accessToken.buildAccess_token(jsonObj.getString("access_token"))
                        .buildExpires_in(jsonObj.getString("expires_in"))
                        .buildRefresh_token(jsonObj.getString("refresh_token"))
                        .buildOpenid(jsonObj.getString("openid"))
                        .buildScope(jsonObj.getString("scope"));
                return accessToken;
            } else {
                AccessTokenResData accessToken = new AccessTokenResData();
                accessToken.buildErrcode(jsonObj.getString("errcode"))
                        .buildErrmsg(jsonObj.getString("errmsg"));
                return accessToken;
            }
        }else{
            return null;
        }
    }
}
