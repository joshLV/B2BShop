package com.chinaums.pay.api.impl;

import com.chinaums.pay.api.PayException;
import com.chinaums.pay.api.SecurityService;
import com.chinaums.pay.api.UMSPayService;
import com.chinaums.pay.api.entities.NoticeEntity;
import com.chinaums.pay.api.entities.OrderEntity;
import com.chinaums.pay.api.entities.OrderEntityAuthToken;
import com.chinaums.pay.api.entities.QueryEntity;
import com.chinaums.pay.comm.HttpComm;
import com.chinaums.pay.util.StringUtils;
import javax.servlet.http.HttpServletRequest;

public class UMSPayServiceImpl implements UMSPayService {
	
	private SecurityService securityService;
	private HttpComm orderComm;
	private HttpComm queryComm;
	private String orderServiceURL;
	private String queryServiceURL;

	public String getOrderServiceURL() {
		return this.orderServiceURL;
	}

	public void setOrderServiceURL(String orderServiceURL) {
		this.orderServiceURL = orderServiceURL;
		this.orderComm = new HttpComm(orderServiceURL);
	}

	public String getQueryServiceURL() {
		return this.queryServiceURL;
	}

	public void setQueryServiceURL(String queryServiceURL) {
		this.queryServiceURL = queryServiceURL;
		this.queryComm = new HttpComm(queryServiceURL);
	}

	public void setSecurityService(SecurityService ss) {
		this.securityService = ss;
	}

	public OrderEntity createOrder(OrderEntity order) throws PayException {
		order.setMerSign(this.securityService.sign(order.buildSignString()));
		System.out.println("json:" + order.buildSignString());
		String resp;
		try {
			resp = this.orderComm.request(StringUtils.buildHttpParameterString(new String[] { "jsonString", order.convertToJsonString() }));
		} catch (Exception e) {
			e.printStackTrace();
			throw new PayException("99999", "网络错误", e);
		}
		OrderEntity respEntity = new OrderEntity();
		respEntity.parseFromJsonString(resp);

		if (!"00000".equals(respEntity.getRespCode())) {
			throw new PayException(respEntity.getRespCode(), respEntity.getRespMsg());
		}

		boolean verified = this.securityService.verify(respEntity.buildVerifyString(), respEntity.getSignature());

		if (!verified) {
			throw new PayException("88888", "返回报文验签失败");
		}

		return respEntity;
	}

	public OrderEntityAuthToken createOrderAutoToken(OrderEntityAuthToken orderEntityAuthToken) throws PayException {
		orderEntityAuthToken.setMerSign(this.securityService.sign(orderEntityAuthToken.buildSignString()));
		System.out.println("json:" + orderEntityAuthToken.buildSignString());
		String resp;
		try {
			resp = this.orderComm.request(StringUtils.buildHttpParameterString(new String[] { "jsonString", orderEntityAuthToken.convertToJsonString() }));
		} catch (Exception e) {
			e.printStackTrace();
			throw new PayException("99999", "网络错误", e);
		}
		OrderEntityAuthToken respEntity = new OrderEntityAuthToken();
		respEntity.parseFromJsonString(resp);

		if (!"00000".equals(respEntity.getRespCode())) {
			throw new PayException(respEntity.getRespCode(), respEntity.getRespMsg());
		}

		boolean verified = this.securityService.verify(respEntity.buildVerifyString(), respEntity.getSignature());

		if (!verified) {
			throw new PayException("88888", "返回报文验签失败");
		}

		return respEntity;
	}

	public QueryEntity queryOrder(QueryEntity query) throws PayException {
		query.setMerSign(this.securityService.sign(query.buildSignString()));
		String resp;
		try {
			resp = this.queryComm.request(StringUtils.buildHttpParameterString(new String[] { "jsonString", query.convertToJsonString() }));
		} catch (Exception e) {
			e.printStackTrace();
			throw new PayException("99999", "网络错误", e);
		}
		QueryEntity respEntity = new QueryEntity();
		respEntity.parseFromJsonString(resp);

		if (!"00000".equals(respEntity.getRespCode())) {
			throw new PayException(respEntity.getRespCode(), respEntity.getRespMsg());
		}

		boolean verified = this.securityService.verify(respEntity.buildVerifyString(), respEntity.getSignature());

		if (!verified) {
			throw new PayException("88888", "返回报文验签失败");
		}

		return respEntity;
	}

	public NoticeEntity parseNoticeEntity(HttpServletRequest httpRequest) throws PayException {
		NoticeEntity entity = new NoticeEntity();
		entity.parseFromHttpServletRequest(httpRequest);

		boolean verified = this.securityService.verify(entity.buildVerifyString(), entity.getSignature());

		if (!verified) {
			throw new PayException("88888", "通知报文验签失败");
		}

		return entity;
	}

	public String getNoticeRespString(NoticeEntity entity) throws PayException {
		entity.setMerSign(this.securityService.sign(entity.buildSignString()));
		return entity.convertToJsonString();
	}

}