package net.deepdragon.erp.yunji.api;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import net.deepdragon.erp.yunji.unit.ApiAddress;
import net.deepdragon.erp.yunji.entity.BrandRequest;
import net.deepdragon.erp.yunji.entity.BusinessPartnersEntity;
import net.deepdragon.erp.yunji.entity.BusinessPartnersRequest;
import net.deepdragon.erp.yunji.entity.ERPWareHouseListQueryRequest;
import net.deepdragon.erp.yunji.entity.EcmLoginRequest;
import net.deepdragon.erp.yunji.entity.EnterPriseEshopRequest;
import net.deepdragon.erp.yunji.entity.PackingUnitRequest;
import net.deepdragon.erp.yunji.entity.SalesDeliverEntity;
import net.deepdragon.erp.yunji.entity.SalesDeliverItemEntity;
import net.deepdragon.erp.yunji.entity.SalesDeliverRequest;
import net.deepdragon.erp.yunji.entity.SalesReturnEntity;
import net.deepdragon.erp.yunji.entity.SalesReturnItemEntity;
import net.deepdragon.erp.yunji.entity.SalesReturnRequest;
import net.deepdragon.erp.yunji.entity.WareHouseListQueryRequest;
import net.deepdragon.erp.yunji.unit.ApiUtil;

import com.alibaba.fastjson.JSON;

/**
 * API测试类
 * 
 * @author ZGT
 * 
 */
public class YunJiErpApiTest {
	public static void main(String[] args) {
		// testERPLogin();// 登陆 (已成功)
		// testEnterPriseEshopRequest();
		// testPackingUnit();
		// testBrand();
		// testBusinessPartnersRequest();
		// testWareHouseListQueryRequest();// 库存 (已成功)
		// testERPWareHouseListQueryRequest();
		// testSalesDeliverRequest();// 新增销售单(已成功)
		// testERPWareHouseListQueryRequest();// 锁库存(成功)
		// testWareHouseListQueryRequest();// 库存 (已成功)
		// testRERPWareHouseListQueryRequest();// 解锁库存(成功)
		// testWareHouseListQueryRequest();// 库存 (已成功)
		// testSalesReturnRequest();
//		erpSalesReturnRequest();
		erpSalesDeliverRequest();
	}

	/**
	 * 单位信息查询
	 */
	public static void testPackingUnit() {

		PackingUnitRequest packingUnitRequest = new PackingUnitRequest();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date date = sdf.parse("2014-06-16 12:10:12");
			packingUnitRequest.setLastModifiedTime(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String jsonReqContent = JSON.toJSONString(packingUnitRequest);
		String result = ApiUtil.sendPostAPI(ApiAddress.PackingUnitRequest, jsonReqContent);
		System.out.println("单位信息查询 PackingUnitRequest ====> " + result);
	}

	/**
	 * 登陆
	 */
	private static void testERPLogin() {
		EcmLoginRequest loginRequest = new EcmLoginRequest();
		loginRequest.setEnterpriseFlag("atongmu");
		loginRequest.setLoginName("wang");
		loginRequest.setPassWord("wang123");
		loginRequest.seteShopFlag("");
		String jsonReqContent = JSON.toJSONString(loginRequest);
		String result = ApiUtil.sendPutAPI(ApiAddress.LoginInRequest, jsonReqContent);
		System.out.println("登陆 LoginInRequest ====> " + result);
	}

	/**
	 * 品牌信息
	 */
	private static void testBrand() {
		BrandRequest loginRequest = new BrandRequest();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date date = sdf.parse("2014-06-16 12:10:12");
			loginRequest.setLastModifiedTime(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String jsonReqContent = JSON.toJSONString(loginRequest);
		String result = ApiUtil.sendPostAPI(ApiAddress.BrandRequest, jsonReqContent);
		System.out.println("品牌信息 BrandRequest ====> " + result);
	}

	/**
	 * 客户信息新增
	 */
	private static void testBusinessPartnersRequest() {
		BusinessPartnersRequest request = new BusinessPartnersRequest();
		BusinessPartnersEntity partnersEntity = new BusinessPartnersEntity();
		partnersEntity.setCode("08");
		partnersEntity.setName("李四");
		partnersEntity.setAddress("郑州");
		request.setPartnersEntity(partnersEntity);
		String jsonReqContent = JSON.toJSONString(request);
		String result = ApiUtil.sendPostAPI(ApiAddress.BusinessPartnersRequest, jsonReqContent);
		System.out.println("客户信息新增 BusinessPartnersRequest ====> " + result);
	}

	/**
	 * 网店状态调整
	 */
	private static void testEnterPriseEshopRequest() {
		EnterPriseEshopRequest request = new EnterPriseEshopRequest();
		request.setEnterpriseFlag("yunjitest");
		request.setEshopFlag("heectest");
		request.setState("W");
		String jsonReqContent = JSON.toJSONString(request);
		String result = ApiUtil.sendPutAPI(ApiAddress.EnterPriseEshopRequest, jsonReqContent);
		System.out.println("网店状态调整 EnterPriseEshopRequest ====> " + result);
	}

	/**
	 * 库存查询
	 */
	private static void testWareHouseListQueryRequest() {
		WareHouseListQueryRequest request = new WareHouseListQueryRequest();
		request.setProductCode("0028");
		request.setShopCode("0GM0306NNS");
		String jsonReqContent = JSON.toJSONString(request);
		String result = ApiUtil.sendPutAPI(ApiAddress.WareHouseListQueryRequest, jsonReqContent);
		System.out.println("库存查询 WareHouseListQueryRequest ====> " + result);
	}

	/**
	 * ERP锁定库存
	 */
	private static void testERPWareHouseListQueryRequest() {
		ERPWareHouseListQueryRequest request = new ERPWareHouseListQueryRequest();
		request.setEnterpriseFlag("yunjitest");
		request.setProductCode("0028");
		request.setStock(5);
		request.setState(0);
		String jsonReqContent = JSON.toJSONString(request);
		String result = ApiUtil.sendPostAPI(ApiAddress.CWareHouseListQueryRequest, jsonReqContent);
		System.out.println("ERP锁定或者解锁库存 ERPWareHouseListQueryRequest ====> " + result);
	}

	/**
	 * ERP解锁库存
	 */
	private static void testRERPWareHouseListQueryRequest() {
		ERPWareHouseListQueryRequest request = new ERPWareHouseListQueryRequest();
		request.setEnterpriseFlag("yunjitest");
		request.setProductCode("0028");
		request.setStock(1);
		request.setState(1);
		String jsonReqContent = JSON.toJSONString(request);
		String result = ApiUtil.sendPostAPI(ApiAddress.CWareHouseListQueryRequest, jsonReqContent);
		System.out.println("ERP锁定或者解锁库存 ERPWareHouseListQueryRequest ====> " + result);
	}

	/**
	 * 销售单的新增
	 */

	private static void testSalesDeliverRequest() {
		SalesDeliverRequest salesDeliverRequest = new SalesDeliverRequest();
		// 销售单信息
		SalesDeliverEntity salesDeliverEntity = new SalesDeliverEntity();
		Set<SalesDeliverItemEntity> salesDeliverItems = new HashSet<SalesDeliverItemEntity>();
		salesDeliverEntity.setVoucherCode("140728017");
		salesDeliverEntity.setSumMoney(100.00f);
		salesDeliverEntity.setIsSettled(1);
		salesDeliverEntity.setSettleMoney(100.00f);
		salesDeliverEntity.setApproveStatus(false);
		salesDeliverEntity.setRemarks("销售单API(写)测试数据");
		salesDeliverEntity.setDescription("API测试数据");
		salesDeliverEntity.setPaymentAmount(100);
		salesDeliverEntity.setCustomerCode("04");
		salesDeliverEntity.setEnterCode("00001");
		salesDeliverEntity.setCreateEmpCode("e85c4947-f057-11e3-9804-4437e623a9bb");
		salesDeliverEntity.setPaymentType("在线支付");

		SalesDeliverItemEntity itemEntity = new SalesDeliverItemEntity();
		itemEntity.setProductCode("0009");
		itemEntity.setPackingUnitItemName("件");
		itemEntity.setVoucherCode("140728017");
		itemEntity.setCount(5);
		itemEntity.setGiftCount(0);
		itemEntity.setIncludeTaxPrice(100.00f);
		itemEntity.setExcludeTaxPrice(100.00f);
		itemEntity.setRemarks("API测试数据");
		itemEntity.setCostPrice(100);
		itemEntity.setTaxCostPrice(100);

		salesDeliverItems.add(itemEntity);
		salesDeliverEntity.setSalesDeliverItems(salesDeliverItems);
		salesDeliverRequest.setSalesDeliverEntity(salesDeliverEntity);
		String jsonReqContent = JSON.toJSONString(salesDeliverRequest);
		System.out.println(jsonReqContent);
		String result = ApiUtil.sendPostAPI(ApiAddress.SalesDeliverRequest, jsonReqContent);
		System.out.println("销售单的新增 SalesDeliverRequest ====> " + result);
	}

	/**
	 * 订单的退货
	 */

	private static void testSalesReturnRequest() {
		SalesReturnRequest salesReturnRequest = new SalesReturnRequest();
		SalesReturnEntity request = new SalesReturnEntity();
		request.setVoucherCode("140728017");
		request.setCustomerCode("04");
		request.setPaymentType("在线支付");
		request.setEnterCode("00001");
		request.setSettlePayAmount(0);
		request.setCreateEmpCode("e85c4947-f057-11e3-9804-4437e623a9bb");
		request.setBuzEmpCode("e85c4947-f057-11e3-9804-4437e623a9bb");
		Set<SalesReturnItemEntity> sales = new HashSet();
		SalesReturnItemEntity entity = new SalesReturnItemEntity();
		entity.setVoucherCode("140728017");
		entity.setProductCode("0009");
		entity.setPackingUnitItemName("件");
		sales.add(entity);
		request.setSalesReturnItems(sales);
		salesReturnRequest.setSalesReturnEntity(request);
		String jsonReqContent = JSON.toJSONString(salesReturnRequest);
		String result = ApiUtil.sendPostAPI(ApiAddress.SalesReturnRequest, jsonReqContent);
		System.out.println("订单的退货 SalesReturnRequest ====> " + result);
	}

	/**
	 * 订单的退货
	 */

	public static String erpSalesReturnRequest() {
		testERPLogin();
		StringBuffer sb = new StringBuffer();
		sb.append("{\"salesReturnEntity\":{\"approveEmpCode\":\"admin\",\"approveStatus\":1,\"buzEmpCode\":\"admin\",");
		sb.append("\"createEmpCode\":\"zgt2\",\"customerCode\":\"281273374720655360\",\"enterCode\":\"04U030SPIQ\",");
		sb.append("\"paymentAmount\":519.48,\"paymentType\":\"在线支付\",\"salesReturnItems\":[{\"excludeTaxPrice\":519.48,");
		sb.append("\"giftCount\":0,\"includeTaxPrice\":519.48,\"packingUnitItemName\":\"个\",\"productCode\":\"0002\",");
		sb.append("\"sort\":1,\"srCount\":1,\"sumCount\":1,\"voucherCode\":\"281289933757349888\"}],");
		sb.append("\"settleMoney\":519.48,\"settlePayAmount\":519.48,\"settled\":1,\"sumMoney\":519.48,");
		sb.append("\"voucherCode\":\"281289933757349888\"}}");
		String result = ApiUtil.sendPostAPI(ApiAddress.SalesReturnRequest, sb.toString());
		System.out.println("订单的退货 SalesReturnRequest ====> " + result);
		return result;
	}

	public static String erpSalesDeliverRequest() {
		testERPLogin();
		StringBuffer sb = new StringBuffer();
		sb.append("{\"salesDeliverEntity\":{\"approveStatus\":false,\"buzEmpCode\":\"zgt2\",");
		sb.append("\"createEmpCode\":\"277536098345811968\",\"customerCode\":\"281273374720655360\",");
		sb.append("\"enterCode\":\"04U030SPIQ\",\"isSettled\":1,\"paymentAmount\":519.48,");
		sb.append("\"paymentType\":\"online\",\"salesDeliverItems\":[{\"costPrice\":0,\"count\":1,");
		sb.append("\"excludeTaxPrice\":519.48,\"giftCount\":0,\"includeTaxPrice\":519.48,\"packingUnitItemName\":\"个\",");
		sb.append("\"productCode\":\"0002\",\"sort\":0,\"sumCount\":1,\"taxCostPrice\":0,\"taxWholesalePrice\":0,");
		sb.append("\"voucherCode\":\"14092272060690488\"}],\"settleMoney\":519.48,\"settlePayAmount\":519.48,");
		sb.append("\"sumMoney\":519.48,\"voucherCode\":\"14092272060690488\"}}");
		String result = ApiUtil.sendPostAPI(ApiAddress.SalesDeliverRequest, sb.toString());
		System.out.println("销售单的新增 SalesDeliverRequest ====> " + result);
		return result;
	}

}
