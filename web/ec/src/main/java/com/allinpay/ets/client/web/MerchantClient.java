package com.allinpay.ets.client.web;

import com.allinpay.ets.client.PaymentResult;
import com.allinpay.ets.client.RequestOrder;
import com.allinpay.ets.client.TrxException;

public class MerchantClient extends AbstractMerchantClient {
	public String sign(RequestOrder requestOrder) throws TrxException {
		return generateSignMsg(requestOrder);
	}

	public boolean verify(PaymentResult paymentResult) throws TrxException {
		return verifySignMsg(paymentResult);
	}
}
