package net.deepdragon.erp.yunji.entity;
/**
 * 库存锁定或解锁参数
 * @author ZGT	
 *
 */
public class ERPWareHouseListQueryRequest {
	public String enterpriseFlag;// 企业标志
	public String eshopFlag;// 网上店铺标志
	public String shopCode;// 店铺编码
	public String wareHouseCode;// 仓库编码
	public String productCode;// 商品编码
	public String goodsLocationCode;// 货位编码
	public String mainUnitID;// 单位ID
	public String mainUnitName;// 单位名称
	public int stock;// 库存数量
	public int state;// 锁定状态(0 为锁定库存 1为解锁库)

	public String getEnterpriseFlag() {
		return enterpriseFlag;
	}

	public void setEnterpriseFlag(String enterpriseFlag) {
		this.enterpriseFlag = enterpriseFlag;
	}

	public String getEshopFlag() {
		return eshopFlag;
	}

	public void setEshopFlag(String eshopFlag) {
		this.eshopFlag = eshopFlag;
	}

	public String getShopCode() {
		return shopCode;
	}

	public void setShopCode(String shopCode) {
		this.shopCode = shopCode;
	}

	public String getWareHouseCode() {
		return wareHouseCode;
	}

	public void setWareHouseCode(String wareHouseCode) {
		this.wareHouseCode = wareHouseCode;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getGoodsLocationCode() {
		return goodsLocationCode;
	}

	public void setGoodsLocationCode(String goodsLocationCode) {
		this.goodsLocationCode = goodsLocationCode;
	}

	public String getMainUnitID() {
		return mainUnitID;
	}

	public void setMainUnitID(String mainUnitID) {
		this.mainUnitID = mainUnitID;
	}

	public String getMainUnitName() {
		return mainUnitName;
	}

	public void setMainUnitName(String mainUnitName) {
		this.mainUnitName = mainUnitName;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

}
