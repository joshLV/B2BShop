package net.deepdragon.erp.yunji.entity;
/**
 * 退货单明细对象
 * @author ZGT
 *
 */
public class SalesReturnItemEntity {
	public String voucherID;
	public String voucherCode;
	public String productID;
	public String productCode;
	public String packingUnitItemID;
	public String packingUnitItemName;
	public String goodsLocationID;
	public String goodsLocationCode;
	public float srCount;
	public float giftCount;
	public float sumCount;
	public double includeTaxPrice;
	public double excludeTaxPrice;
	public String remarks;
	public String specificationID1;
	public String specificationID2;
	public int sort;

	public String getVoucherID() {
		return voucherID;
	}

	public void setVoucherID(String voucherID) {
		this.voucherID = voucherID;
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

	public float getSrCount() {
		return srCount;
	}

	public void setSrCount(float srCount) {
		this.srCount = srCount;
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

	public String getSpecificationID1() {
		return specificationID1;
	}

	public void setSpecificationID1(String specificationID1) {
		this.specificationID1 = specificationID1;
	}

	public String getSpecificationID2() {
		return specificationID2;
	}

	public void setSpecificationID2(String specificationID2) {
		this.specificationID2 = specificationID2;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

}
