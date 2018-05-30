package net.deepdragon.erp.yunji.entity;

public class SalesDeliverItemEntity {
	public String salesDeliverID;// 主单ID
	public String voucherCode;// 主单code
	public String productID;// 商品ID
	public String productCode;// 商品code
	public String packingUnitItemID;// 计量单位ID
	public String packingUnitItemName;// 计量单位名称
	public String goodsLocationID;// 货位ID
	public String goodsLocationCode;// 货位code
	public float count;// 数量
	public float giftCount;// 赠品数量
	public float sumCount;// 小计
	public double includeTaxPrice;// 含税单价
	public double excludeTaxPrice;// 去税单价
	public String remarks;// 备注
	public String specID1;// 规格1
	public String specID2;// 规格2
	public int sort;// 销售单明细信息排序
	public float costPrice;// 成本价
	public float taxCostPrice;// 含税成本价
	public float taxWholesalePrice;// 含税批发价（商品原价）原含税价

	public String getSalesDeliverID() {
		return salesDeliverID;
	}

	public void setSalesDeliverID(String salesDeliverID) {
		this.salesDeliverID = salesDeliverID;
	}

	public String getVoucherCode() {
		return voucherCode;
	}

	public void setVoucherCode(String voucherCode) {
		this.voucherCode = voucherCode;
	}

	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getPackingUnitItemID() {
		return packingUnitItemID;
	}

	public void setPackingUnitItemID(String packingUnitItemID) {
		this.packingUnitItemID = packingUnitItemID;
	}

	public String getPackingUnitItemName() {
		return packingUnitItemName;
	}

	public void setPackingUnitItemName(String packingUnitItemName) {
		this.packingUnitItemName = packingUnitItemName;
	}

	public String getGoodsLocationID() {
		return goodsLocationID;
	}

	public void setGoodsLocationID(String goodsLocationID) {
		this.goodsLocationID = goodsLocationID;
	}

	public String getGoodsLocationCode() {
		return goodsLocationCode;
	}

	public void setGoodsLocationCode(String goodsLocationCode) {
		this.goodsLocationCode = goodsLocationCode;
	}

	public float getCount() {
		return count;
	}

	public void setCount(float count) {
		this.count = count;
	}

	public float getGiftCount() {
		return giftCount;
	}

	public void setGiftCount(float giftCount) {
		this.giftCount = giftCount;
	}

	public float getSumCount() {
		return sumCount;
	}

	public void setSumCount(float sumCount) {
		this.sumCount = sumCount;
	}

	public double getIncludeTaxPrice() {
		return includeTaxPrice;
	}

	public void setIncludeTaxPrice(double includeTaxPrice) {
		this.includeTaxPrice = includeTaxPrice;
	}

	public double getExcludeTaxPrice() {
		return excludeTaxPrice;
	}

	public void setExcludeTaxPrice(double excludeTaxPrice) {
		this.excludeTaxPrice = excludeTaxPrice;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getSpecID1() {
		return specID1;
	}

	public void setSpecID1(String specID1) {
		this.specID1 = specID1;
	}

	public String getSpecID2() {
		return specID2;
	}

	public void setSpecID2(String specID2) {
		this.specID2 = specID2;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public float getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(float costPrice) {
		this.costPrice = costPrice;
	}

	public float getTaxCostPrice() {
		return taxCostPrice;
	}

	public void setTaxCostPrice(float taxCostPrice) {
		this.taxCostPrice = taxCostPrice;
	}

	public float getTaxWholesalePrice() {
		return taxWholesalePrice;
	}

	public void setTaxWholesalePrice(float taxWholesalePrice) {
		this.taxWholesalePrice = taxWholesalePrice;
	}

}
