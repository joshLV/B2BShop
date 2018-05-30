package net.deepdragon.erp.yunji.api;

import com.allinpay.ets.client.StringUtil;
import net.deepdragon.erp.yunji.unit.ApiAddress;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.deepdragon.erp.yunji.entity.BusinessPartnersEntity;
import net.deepdragon.erp.yunji.entity.BusinessPartnersRequest;
import net.deepdragon.erp.yunji.entity.ERPWareHouseListQueryRequest;
import net.deepdragon.erp.yunji.entity.EcmLoginRequest;
import net.deepdragon.erp.yunji.entity.SalesDeliverEntity;
import net.deepdragon.erp.yunji.entity.SalesDeliverRequest;
import net.deepdragon.erp.yunji.entity.SalesReturnEntity;
import net.deepdragon.erp.yunji.entity.SalesReturnRequest;
import net.deepdragon.erp.yunji.entity.WareHouseListQueryRequest;
import net.deepdragon.erp.yunji.unit.ApiUtil;

import com.alibaba.fastjson.JSON;

public class YunJiErpApiUtil {
	
	protected final static Logger logger = LoggerFactory.getLogger(YunJiErpApiUtil.class);

	/**
	 * ERP锁定或者解锁库存
	 */
	public static void erpWareHouseList(String eshopFlag, String productCode, int stock, int state) {
		testERPLogin();
		ERPWareHouseListQueryRequest request = new ERPWareHouseListQueryRequest();
		request.setEshopFlag(eshopFlag);
		request.setProductCode(productCode);
		request.setStock(stock);
		request.setState(state);
		String jsonReqContent = JSON.toJSONString(request);
		String result = ApiUtil.sendPostAPI(ApiAddress.CWareHouseListQueryRequest, jsonReqContent);
		logger.info("ERP锁定或者解锁库存 ERPWareHouseListQueryRequest ====> " + result);
	}

	/**
	 * 库存查询
	 */
	public static String erpWareHouseListQuery(String shopCode, String productCode) {
		testERPLogin();
		WareHouseListQueryRequest request = new WareHouseListQueryRequest();
		request.setShopCode(shopCode);
		request.setProductCode(productCode);
		String jsonReqContent = JSON.toJSONString(request);
		String result = ApiUtil.sendPutAPI(ApiAddress.WareHouseListQueryRequest, jsonReqContent);
		logger.info("库存查询 WareHouseListQueryRequest ====> " + result);
		return result;
	}

	/**
	 * 销售单的新增
	 */

	public static String erpSalesDeliverRequest(SalesDeliverEntity salesDeliverEntity) {
		SalesDeliverRequest salesDeliverRequest = new SalesDeliverRequest();
		testERPLogin();
		salesDeliverRequest.setSalesDeliverEntity(salesDeliverEntity);
		String jsonReqContent = JSON.toJSONString(salesDeliverRequest);
		logger.info(jsonReqContent);
		String result = ApiUtil.sendPostAPI(ApiAddress.SalesDeliverRequest, jsonReqContent);
		logger.info("销售单的新增 SalesDeliverRequest ====> " + result);
		return result;
	}

	/**
	 * 订单的退货
	 */

	public static String erpSalesReturnRequest(SalesReturnEntity salesReturnEntity) {
		SalesReturnRequest salesReturnRequest = new SalesReturnRequest();
		testERPLogin();
		salesReturnRequest.setSalesReturnEntity(salesReturnEntity);
		String jsonReqContent = JSON.toJSONString(salesReturnRequest);
		String result = ApiUtil.sendPostAPI(ApiAddress.SalesReturnRequest, jsonReqContent);
		logger.info("订单的退货 SalesReturnRequest ====> " + result);
		return result;
	}

	/**
	 * 网上店铺客户信息新增
	 * 
	 * @param code
	 *            客户编码
	 * @param name
	 *            客户名称
	 * @param address
	 *            地址 (可为空)
	 */
	public static String businessPartners(String code, String name, String address) {
		testERPLogin();
		BusinessPartnersRequest request = new BusinessPartnersRequest();
		BusinessPartnersEntity partnersEntity = new BusinessPartnersEntity();
		partnersEntity.setCode(code);
		partnersEntity.setName(name);
		partnersEntity.setAddress(address);
		request.setPartnersEntity(partnersEntity);
		String jsonReqContent = JSON.toJSONString(request);
		String result = ApiUtil.sendPostAPI(ApiAddress.BusinessPartnersRequest, jsonReqContent);
		logger.info("注册 businessPartners ====> " + result);
		return result;
	}

	/**
	 * 登陆
	 */
	private static void testERPLogin() {
		EcmLoginRequest loginRequest = new EcmLoginRequest();
		String flag = net.deepdragon.util.StringUtil.encode("咸阳秦楚国际汽配城");
		loginRequest.setEnterpriseFlag(flag);
		loginRequest.setLoginName("suqh");
		loginRequest.setPassWord("admin123");
		loginRequest.seteShopFlag("");
		String jsonReqContent = JSON.toJSONString(loginRequest);
		String result = ApiUtil.sendPutAPI(ApiAddress.LoginInRequest, jsonReqContent);
		logger.info("登陆 LoginInRequest ====> " + result);
	}


  // 登陆测试
	public static void main(String s[]){
		EcmLoginRequest loginRequest = new EcmLoginRequest();
		loginRequest.setEnterpriseFlag("atongmu");
		loginRequest.setLoginName("wang");
		loginRequest.setPassWord("wang123");
		loginRequest.seteShopFlag("");
		String jsonReqContent = JSON.toJSONString(loginRequest);

		String result = ApiUtil.sendPutAPI("http://127.0.0.1:8080/web-api/ecm/login", jsonReqContent);
		logger.info("登陆 LoginInRequest ====> " + result);
	}

}
