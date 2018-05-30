package com.weixin.service;

import com.weixin.GetWxOrderno;
import com.weixin.common.Signature;
import com.weixin.common.WXUtil;
import com.weixin.common.XStreamUtil;
import com.weixin.protocol.UnifiedorderReqData;
import com.weixin.protocol.UnifiedorderResData;

/**
 * Created by chris on 2016/3/9.
 */
public class UnifiedorderService implements IService<UnifiedorderReqData, UnifiedorderResData>{


    @Override
    public UnifiedorderResData sendRequest(UnifiedorderReqData unifiedorderReqData) throws Exception {
        WXUtil.log("----------------------------UnifiedorderReqData--------------------------------");
        WXUtil.log(XStreamUtil.objectToXml(unifiedorderReqData, new Class[]{UnifiedorderReqData.class}));
        String sign = Signature.getSign(unifiedorderReqData);
        unifiedorderReqData.buildSign(sign);
        String requestXml = XStreamUtil.objectToXml(unifiedorderReqData, new Class[]{UnifiedorderReqData.class});
        WXUtil.log("----------------------------requestXml--------------------------------");
        WXUtil.log(requestXml);
        String responseXml = GetWxOrderno.sendPost(unifiedorderReqData.getUrl(), requestXml);
        WXUtil.log("----------------------------responseXml--------------------------------");
        WXUtil.log(responseXml);
        UnifiedorderResData resData =(UnifiedorderResData) XStreamUtil.getObjectFromXML(responseXml, UnifiedorderResData.class);

        return resData;
    }
}
