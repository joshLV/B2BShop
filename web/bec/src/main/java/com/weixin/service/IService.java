package com.weixin.service;

import com.weixin.protocol.ReqData;
import com.weixin.protocol.ResData;

/**
 * Created by chris on 2016/3/9.
 */
public interface IService<ReqData, ResData> {
    public ResData sendRequest(ReqData reqData) throws Exception;
}
