package com.chinaums.pay.api;

import com.chinaums.pay.api.entities.NoticeEntity;
import com.chinaums.pay.api.entities.OrderEntity;
import com.chinaums.pay.api.entities.OrderEntityAuthToken;
import com.chinaums.pay.api.entities.QueryEntity;
import javax.servlet.http.HttpServletRequest;

public abstract interface UMSPayService {
	public abstract OrderEntity createOrder(OrderEntity paramOrderEntity) throws PayException;

	public abstract OrderEntityAuthToken createOrderAutoToken(OrderEntityAuthToken paramOrderEntityAuthToken) throws PayException;

	public abstract QueryEntity queryOrder(QueryEntity paramQueryEntity) throws PayException;

	public abstract NoticeEntity parseNoticeEntity(HttpServletRequest paramHttpServletRequest) throws PayException;

	public abstract String getNoticeRespString(NoticeEntity paramNoticeEntity) throws PayException;
}