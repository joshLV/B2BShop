package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：购物车项 表代码：wp_cart_item
 */
@Alias(Weipu.SIGN + "CartItem")
public class CartItem extends BaseEntity {

	private static final long serialVersionUID = 1042073789978453275L;

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 会员ID
	 */
	private String memberId;

	/**
	 * 如果是操作员登录，保存其管理员ID
	 */
	private String parentBuyerId;

	/**
	 * 会员标识
	 */
	private String userkey;

	/**
	 * 商品ID
	 */
	private String goodsId;

	/**
	 * 购买数量
	 */
	private Integer quantity;

	private String name;// 商品名称
	private String shortName;
	private String sn;// 商品编码
	private String price;// 销售价格
	private String marketPrice;// 市场价
	private String pic;// 展示图片
	private Double stock;
	private String specification;//商品规格
	private String batchPrice;// 商品批发价

	private String mjCondition;      //商品参加促销满减活动的优惠金额条件
	private String mjDecreaseAmount;//商品参加促销满减活动的优惠金额

	private Double goodsFeeModulus;//根据商品运费系数计算的费用
	/**
	 * 商品默认起批数量、起批数量、限购数量、包装系数、是否启用阶梯价
	 */
	private Integer startBatchNum;//启用阶梯价 起批数量
	/** `startNum` int(11) NOT NULL DEFAULT '1' COMMENT '商品起批数量', */
	private Integer startNum;
	/** `limitNum` int(11) NOT NULL DEFAULT '0' COMMENT '商品限购数量,0_不限制', */
	private Integer limitNum;
	/** `packageModulus` int(11) DEFAULT NULL COMMENT '包装系数', */
	private Integer packageModulus;
	/** `enableBatchPrice`  int(1) not NULL default '1' COMMENT '是否启用阶梯价：1_启用,0_不启用' */
	private Integer enableBatchPrice;
	/**
	 * 商家ID
	 */
	private String merchantId;

	private String packageUnit;

	public String getPackageUnit() {
		return packageUnit;
	}

	public void setPackageUnit(String packageUnit) {
		this.packageUnit = packageUnit;
	}

	private String unit;

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public Double getGoodsFeeModulus() {
		return goodsFeeModulus;
	}

	public void setGoodsFeeModulus(Double goodsFeeModulus) {
		this.goodsFeeModulus = goodsFeeModulus;
	}

	/**

	 * 商家缩略名
	 */
	private String merchantShortName;

	/**
	 * 商家URL
	 */
	private String merchantUrlAddress;


	/**
	 *活动ID
	 * */
	private String tablePkId;

	/**
	 *活动表名称
	 * */
	private String tableName;

	/**
	 *优惠金额
	 * */
	private Double preferentialMoney;

	public String getTablePkId() {
		return tablePkId;
	}

	public void setTablePkId(String tablePkId) {
		this.tablePkId = tablePkId;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public Double getPreferentialMoney() {
		return preferentialMoney;
	}

	public void setPreferentialMoney(Double preferentialMoney) {
		this.preferentialMoney = preferentialMoney;
	}

	public String getBatchPrice() {
		return batchPrice;
	}

	public void setBatchPrice(String batchPrice) {
		this.batchPrice = batchPrice;
	}

	/**
	 * 字段名称 :租户ID 数据类型 :bigint 是否必填 :true
	 */
	public String getTenantId() {
		return this.tenantId;
	}

	/**
	 * 字段名称 :租户ID 数据类型 :bigint 是否必填 :true
	 */
	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	/**
	 * 字段名称 :会员ID 数据类型 :bigint 是否必填 :true
	 */
	public String getMemberId() {
		return this.memberId;
	}

	/**
	 * 字段名称 :会员ID 数据类型 :bigint 是否必填 :true
	 */
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	/**
	 * 字段名称 :会员标识 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getUserkey() {
		return this.userkey;
	}

	/**
	 * 字段名称 :会员标识 数据类型 :varchar(32) 是否必填 :false
	 */
	public void setUserkey(String userkey) {
		this.userkey = userkey;
	}

	/**
	 * 字段名称 :商品ID 数据类型 :bigint 是否必填 :true
	 */
	public String getGoodsId() {
		return this.goodsId;
	}

	/**
	 * 字段名称 :商品ID 数据类型 :bigint 是否必填 :true
	 */
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	/**
	 * 字段名称 :购买数量 数据类型 :int 是否必填 :false
	 */
	public Integer getQuantity() {
		return this.quantity;
	}

	/**
	 * 字段名称 :购买数量 数据类型 :int 是否必填 :false
	 */
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getMarketPrice() {
		return marketPrice;
	}

	public void setMarketPrice(String marketPrice) {
		this.marketPrice = marketPrice;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public Double getStock() {
		return stock;
	}

	public void setStock(Double stock) {
		this.stock = stock;
	}

	public String getMerchantId() {
		return merchantId;
	}

	public void setMerchantId(String merchantId) {
		this.merchantId = merchantId;
	}

	public String getMerchantShortName() {
		return merchantShortName;
	}

	public void setMerchantShortName(String merchantShortName) {
		this.merchantShortName = merchantShortName;
	}

	public String getMerchantUrlAddress() {
		return merchantUrlAddress;
	}

	public void setMerchantUrlAddress(String merchantUrlAddress) {
		this.merchantUrlAddress = merchantUrlAddress;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public Integer getStartBatchNum() {
		return startBatchNum;
	}

	public void setStartBatchNum(Integer startBatchNum) {
		this.startBatchNum = startBatchNum;
	}

	public Integer getStartNum() {
		return startNum;
	}

	public void setStartNum(Integer startNum) {
		this.startNum = startNum;
	}

	public Integer getLimitNum() {
		return limitNum;
	}

	public void setLimitNum(Integer limitNum) {
		this.limitNum = limitNum;
	}

	public Integer getPackageModulus() {
		return packageModulus;
	}

	public void setPackageModulus(Integer packageModulus) {
		this.packageModulus = packageModulus;
	}

	public Integer getEnableBatchPrice() {
		return enableBatchPrice;
	}

	public void setEnableBatchPrice(Integer enableBatchPrice) {
		this.enableBatchPrice = enableBatchPrice;
	}

	public String getMjDecreaseAmount() {
		return mjDecreaseAmount;
	}

	public void setMjDecreaseAmount(String mjDecreaseAmount) {
		this.mjDecreaseAmount = mjDecreaseAmount;
	}

	public String getMjCondition() {
		return mjCondition;
	}

	public void setMjCondition(String mjCondition) {
		this.mjCondition = mjCondition;
	}

	public String getParentBuyerId() {
		return parentBuyerId;
	}

	public void setParentBuyerId(String parentBuyerId) {
		this.parentBuyerId = parentBuyerId;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getUnit() {
		return unit;
	}
}