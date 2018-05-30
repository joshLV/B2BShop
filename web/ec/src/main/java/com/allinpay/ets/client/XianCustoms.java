package com.allinpay.ets.client;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * Created by Administrator on 2016/3/21.
 */
@XStreamAlias("GW_CUSTOMS")
public class XianCustoms extends CustomsEntity {

    public XianCustoms() {
        this.setCUSTOMS_TYPE("HG005");
    }
}
