package net.deepdragon.erp.yunji.unit;

/**
 * 云集API接口
 * 
 * @author ZGT
 * 
 */
public class ApiAddress {
	// IP +PORT
	public static String WEBAPI = "http://192.168.1.9:8082/web-api/";
	// 登陆
	public static String LoginInRequest = WEBAPI + "ecm/login";
	// 登出
	public static String LoginOutRequest = WEBAPI + "ecm/loginout";
	// 品牌信息查询
	public static String BrandRequest = WEBAPI + "ecm/brand";
	// 单位信息查询
	public static String PackingUnitRequest = WEBAPI + "ecm/packingunit";
	// 销售退货单
	public static String SalesReturnRequest = WEBAPI + "ecm/salesreturn";
	// 销售单的新增
	public static String SalesDeliverRequest = WEBAPI + "ecm/salesdeliver";
	// 商品价格信息
	public static String EntProductPricesRequest = WEBAPI + "ecm/entproductprices";
	// 商品信息
	public static String ProductRequest = WEBAPI + "ecm/product";
	// 网上店铺客户信息新增
	public static String BusinessPartnersRequest = WEBAPI + "ecm/businesspartners";
	// 库存操作
	public static String WareHouseListRequest = WEBAPI + "ecm/warehouseoperate";
	// 库存查询
	public static String WareHouseListQueryRequest = WEBAPI + "ecm/warehouseList";
	// ERP锁定或者解锁库存
	public static String CWareHouseListQueryRequest = WEBAPI + "ecm/warehouseList";
	// 销售订单
	public static String SalesOrderRequest = WEBAPI + "erp/salesorder/";
	// 网店状态调整
	public static String EnterPriseEshopRequest = WEBAPI + "ecm/enterpriseeshop";

}
