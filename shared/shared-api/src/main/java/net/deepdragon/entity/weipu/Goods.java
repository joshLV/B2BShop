package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

import java.util.Date;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：商品信息表 表代码：wp_goods
 */
@Alias(Weipu.SIGN + "Goods")
public class Goods extends BaseEntity {

	private static final long serialVersionUID = 1746706371717346029L;

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 所属分类
	 */
	private String categoryId;

	/**
	 * 分类路径
	 */
	private String categoryPath;

	/**
	 * 所属品牌
	 */
	private String brandId;

	/**
	 * 所属店铺
	 */
	private String shopId;

	/**
	 * 所属单品
	 */
	private String productId;

	/**
	 * 商品名称
	 */
	private String name;

	/**
	 * 商品编号
	 */
	private String sn;

	/**
	 * 条形码
	 */
	private String barcode;
	
	/**
	*电话购物码
	*/
	private String phoneShopNo;

	/**
	 * 全名称
	 */
	private String fullName;

	/**
	 * 销售价
	 */
	private Double price;

	/**
	 * 成本价
	 */
	private Double cost;

	/**
	 * 市场价
	 */
	private Double marketPrice;

	/**
	 * 批发价格区间
	 */
	private String batchPrice;
	/**
	 * 批发价格-最小值
	 */
	private Double minBatchPrice;
	/**
	 * 批发价格-最大值
	 */
	private Double maxBatchPrice;

	/**
	 * 起批数量
	 */
	private Integer startBatchNum;

	/**
	*默认会员价
	*/
	private Double defaultPrice;

	/**
	 * 是否启用会员价
	 */
	private Integer isMemberPrice;

	/**
	 * 计量单位
	 */
	private String unit;

	/**
	 * 重量
	 */
	private Double weight;

	/**
	 * 广告语
	 */
	private String adwords;

	/**
	 * 展示图片
	 */
	private String image;

	/**
	 * 库存数量
	 */
	private Double stock;

	/**
	 * 库存备注
	 */
	private String stockMemo;

	/**
	 * 赠送积分
	 */
	private Double point;

	/**
	 * 是否上架
	 */
	private Integer isMarketable;

	/**
	 * 是否置顶
	 */
	private Integer isTop;

	/**
	 * 是否列出
	 */
	private Integer isList;

	/**
	 * 是否赠品
	 */
	private Integer isGift;

	/**
	 * 是否联营商品
	 */
	private Integer isLianYing;
	
	/**
	 * 商品介绍
	 */
	private String introduction;

	/**
	 * 搜索关键字
	 */
	private String keywords;

	/**
	 * 点击次数
	 */
	private Integer hits;

	/**
	 * 周点击次数
	 */
	private Integer weekHits;

	/**
	 * 周最后一次访问
	 */
	private Date weekHitsDate;

	/**
	 * 月访问次数
	 */
	private Integer monthHits;

	/**
	 * 月最后一次访问
	 */
	private Date monthHitsDate;

	/**
	 * 总销量
	 */
	private Double sales;

	/**
	 * 周销量
	 */
	private Double weekSales;

	/**
	 * 周最后销售日期
	 */
	private Date weekSalesDate;

	/**
	 * 月销量
	 */
	private Double monthSales;

	/**
	 * 月最后销售日期
	 */
	private Date monthSalesDate;

	/**
	 * 评论次数
	 */
	private Integer scoreCount;

	/**
	 * 评论总分数
	 */
	private Double scoreTotal;

	/**
	 * 评论平均分
	 */
	private Double score;

	/**
	 * 是否首页
	 */
	private Integer isIndex;

	/**
	 * 首页排序
	 */
	private Integer indexOrder;

	/**
	 * 商品描述
	 */
	private String description;
	private String pic;// 商品展示图片
	/**
	 * 是否删除
	 */
	private Integer isDelete;

	/**
	 * 商家
	 */
	/**
	 * 所属商家名称
	 */
	private String shopName;
	/** 商家URL */
	private String shopUrlAddress;

	// ==秒杀相关
	private String ypice;// 秒杀价格
	private String total;// 预售数量
	private String frozen;// 冻结数量
	private String sold;// 已售数量
	private Date startTime;// 开始时间
	private Date endTime;// 结束时间
	private String saleId;// 活动ID
	private String methodId;// 配送费用
	private String orderNo;// 顺序
	private Integer status;// 状态(0-待提审,1-商家待审核,2-商家审核不通过,3-商城待审核,4-商场审核不通过,5-已审核)
	private String shippingOrderUrl; //商品相关证书

	/**
	 * 订单号
	 */
	private String orderSn;

	/**
	 * 商品简称
	 */
	private String shortName;

	/**
	 * 商品预计送达时间
	 */
	private String predictDay;


	/**
	 * 是否包邮： 0 不包邮， 1 包邮
	 */
	private int isPost;


	/** `hasRebate` varchar(5) NOT NULL DEFAULT 'no' COMMENT '是否返利 yes返利 no不返利', */
	private String hasRebate;
	/** `startNum` int(11) NOT NULL DEFAULT '1' COMMENT '商品起批数量', */
	private Integer startNum;
	/** `limitNum` int(11) NOT NULL DEFAULT '0' COMMENT '商品限购数量,0_不限制', */
	private Integer limitNum;
	/** `packageModulus` int(11) DEFAULT NULL COMMENT '包装系数', */
	private Integer packageModulus;
	/** `packageUnit` varchar(20) DEFAULT NULL COMMENT '包装系数单位', */
	private String packageUnit;
	/** `packageBarCode` varchar(32) DEFAULT NULL COMMENT '商品外包装条形码', */
	private String packageBarCode;
	/** `phoneIntroduction` longtext COMMENT '手机端商品介绍', */
	private String phoneIntroduction;
	/** `enableBatchPrice`  int(1) not NULL default '1' COMMENT '是否启用阶梯价：1_启用,0_不启用' */
	private Integer enableBatchPrice;


	//众筹字段开始-------------------------
	private Integer type;               //商品类型：0_普通商品，1_众筹商品
	private Integer zhongChouStatus;	//扩展状态：1_待发布，2_进行中，3_成功，4失败，5_作废
	private Date zcStartTime;			//众筹开始时间
	private Date zcEndTime;				//结束时间，默认当天的23:59:59结束
	private Integer buyMinNum;			//购买最小数量
	private Integer buyMaxNum;			//允许购买最大数量,为0时为不限制
	private Integer maxNum;				//众筹允许最大数量，为0时为不限制
	private Integer thresholdType;		//阈值类型：1_数量，2_金额 ,默认2 金额
	private Double threshold;			//阈值，成功数量或金额
	private String thresholdUnit;		//阈值“成功数量或金额“的单位
	private Double successPrice;		//成功后单价
	private Integer prepaymentType;		//预付类型：1_比例，2_金额,默认使用比例
	private Double prepaymentRatio;		//预付比例，80%保存80
	private String remark;				//失败原因
	private String reserve1;			//预留字段1
	private String reserve2;			//预留字段1
	private String reserve3;			//预留字段3
	private Date reserveDateTime1;		//预留时间字段1
	private Date reserveDateTime2;		//预留时间字段2
	//专题活动
	private Double goodsPrice;			//原价
	private Double promotionsPrice;		//促销价
	//优惠信息  满减等
	private String discount;

	private Double volume;

	/**
	 * 输入价格
	 */
	private Double inputPrice;

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public Double getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(Double goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public Double getPromotionsPrice() {
		return promotionsPrice;
	}

	public void setPromotionsPrice(Double promotionsPrice) {
		this.promotionsPrice = promotionsPrice;
	}

	public Integer getZhongChouStatus() {
		return zhongChouStatus;
	}

	public void setZhongChouStatus(Integer zhongChouStatus) {
		this.zhongChouStatus = zhongChouStatus;
	}

	public Date getZcStartTime() {
		return zcStartTime;
	}

	public void setZcStartTime(Date zcStartTime) {
		this.zcStartTime = zcStartTime;
	}

	public Date getZcEndTime() {
		return zcEndTime;
	}

	public void setZcEndTime(Date zcEndTime) {
		this.zcEndTime = zcEndTime;
	}

	public Integer getBuyMinNum() {
		return buyMinNum;
	}

	public void setBuyMinNum(Integer buyMinNum) {
		this.buyMinNum = buyMinNum;
	}

	public Integer getBuyMaxNum() {
		return buyMaxNum;
	}

	public void setBuyMaxNum(Integer buyMaxNum) {
		this.buyMaxNum = buyMaxNum;
	}

	public Integer getMaxNum() {
		return maxNum;
	}

	public void setMaxNum(Integer maxNum) {
		this.maxNum = maxNum;
	}

	public Integer getThresholdType() {
		return thresholdType;
	}

	public void setThresholdType(Integer thresholdType) {
		this.thresholdType = thresholdType;
	}

	public Double getThreshold() {
		return threshold;
	}

	public void setThreshold(Double threshold) {
		this.threshold = threshold;
	}

	public String getThresholdUnit() {
		return thresholdUnit;
	}

	public void setThresholdUnit(String thresholdUnit) {
		this.thresholdUnit = thresholdUnit;
	}

	public Double getSuccessPrice() {
		return successPrice;
	}

	public void setSuccessPrice(Double successPrice) {
		this.successPrice = successPrice;
	}

	public Integer getPrepaymentType() {
		return prepaymentType;
	}

	public void setPrepaymentType(Integer prepaymentType) {
		this.prepaymentType = prepaymentType;
	}

	public Double getPrepaymentRatio() {
		return prepaymentRatio;
	}

	public void setPrepaymentRatio(Double prepaymentRatio) {
		this.prepaymentRatio = prepaymentRatio;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getReserve1() {
		return reserve1;
	}

	public void setReserve1(String reserve1) {
		this.reserve1 = reserve1;
	}

	public String getReserve2() {
		return reserve2;
	}

	public void setReserve2(String reserve2) {
		this.reserve2 = reserve2;
	}

	public String getReserve3() {
		return reserve3;
	}

	public void setReserve3(String reserve3) {
		this.reserve3 = reserve3;
	}

	public Date getReserveDateTime1() {
		return reserveDateTime1;
	}

	public void setReserveDateTime1(Date reserveDateTime1) {
		this.reserveDateTime1 = reserveDateTime1;
	}

	public Date getReserveDateTime2() {
		return reserveDateTime2;
	}

	public void setReserveDateTime2(Date reserveDateTime2) {
		this.reserveDateTime2 = reserveDateTime2;
	}
	//众筹字段结束-------------------------

	//B2B所搜商品
	private String becScoreCount;
	private String brandname;
	private String categoryname;
	private String paramname;
	private String spname;
	private String spvname;

	//判断是否为跨境商品
	private String crossBorder;

	public String getCrossBorder() {
		return crossBorder;
	}

	public void setCrossBorder(String crossBorder) {
		this.crossBorder = crossBorder;
	}

	public String getSpvname() {
		return spvname;
	}

	public void setSpvname(String spvname) {
		this.spvname = spvname;
	}

	public String getBecScoreCount() {
		return becScoreCount;
	}

	public void setBecScoreCount(String becScoreCount) {
		this.becScoreCount = becScoreCount;
	}

	public String getBrandname(){
		return brandname;
	}

	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}

	public String getCategoryname(){
		return categoryname;
	}

	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}

	public String getParamname(){
		return paramname;
	}

	public void setParamname(String paramname) {
		this.paramname = paramname;
	}

	public String getSpname(){
		return spname;
	}

	public void setSpname(String spname) {
		this.spname = spname;
	}



	public String getBatchPrice() {
		return batchPrice;
	}

	public void setBatchPrice(String batchPrice) {
		this.batchPrice = batchPrice;
	}

	public String getOrderSn() {
		return orderSn;
	}

	public void setOrderSn(String orderSn) {
		this.orderSn = orderSn;
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
	 * 字段名称 :商品简称 数据类型 :varchar(30) 是否必填 :true
	 */
	public String getShortName() {
		return this.shortName;
	}

	/**
	 * 字段名称 :商品简称 数据类型 :varchar(30) 是否必填 :true
	 */
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	/**
	 * 字段名称 :商品预计送达时间 数据类型 :varchar(50) 是否必填 :true
	 */
	public String getPredictDay() {
		return this.predictDay;
	}

	/**
	 * 字段名称 :商品预计送达时间 数据类型 :varchar(50) 是否必填 :true
	 */
	public void setPredictDay(String predictDay) {
		this.predictDay = predictDay;
	}

	/**
	 * 字段名称 :所属分类 数据类型 :bigint 是否必填 :false
	 */
	public String getCategoryId() {
		return this.categoryId;
	}

	/**
	 * 字段名称 :所属分类 数据类型 :bigint 是否必填 :false
	 */
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	/**
	 * 字段名称 :分类路径 数据类型 :varchar(256) 是否必填 :true
	 */
	public String getCategoryPath() {
		return this.categoryPath;
	}

	/**
	 * 字段名称 :分类路径 数据类型 :varchar(256) 是否必填 :true
	 */
	public void setCategoryPath(String categoryPath) {
		this.categoryPath = categoryPath;
	}

	/**
	 * 字段名称 :所属品牌 数据类型 :bigint 是否必填 :false
	 */
	public String getBrandId() {
		return this.brandId;
	}

	/**
	 * 字段名称 :所属品牌 数据类型 :bigint 是否必填 :false
	 */
	public void setBrandId(String brandId) {
		this.brandId = brandId;
	}

	/**
	 * 字段名称 :所属店铺 数据类型 :bigint 是否必填 :false
	 */
	public String getShopId() {
		return this.shopId;
	}

	/**
	 * 字段名称 :所属店铺 数据类型 :bigint 是否必填 :false
	 */
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	/**
	 * 字段名称 :所属单品 数据类型 :bigint 是否必填 :true
	 */
	public String getProductId() {
		return this.productId;
	}

	/**
	 * 字段名称 :所属单品 数据类型 :bigint 是否必填 :true
	 */
	public void setProductId(String productId) {
		this.productId = productId;
	}

	/**
	 * 字段名称 :商品名称 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 字段名称 :商品名称 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 字段名称 :商品编号 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getSn() {
		return this.sn;
	}

	/**
	 * 字段名称 :商品编号 数据类型 :varchar(32) 是否必填 :false
	 */
	public void setSn(String sn) {
		this.sn = sn;
	}

	/**
	 * 字段名称 :条形码 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getBarcode() {
		return this.barcode;
	}

	/**
	 * 字段名称 :条形码 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	
	/**
	* 字段名称 :电话购物码
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getPhoneShopNo() {
		return this.phoneShopNo;
	}

	/**
	* 字段名称 :电话购物码
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setPhoneShopNo(String phoneShopNo) {
		 this.phoneShopNo = phoneShopNo;
    }

	/**
	 * 字段名称 :全名称 数据类型 :varchar(128) 是否必填 :false
	 */
	public String getFullName() {
		return this.fullName;
	}

	/**
	 * 字段名称 :全名称 数据类型 :varchar(128) 是否必填 :false
	 */
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	/**
	 * 字段名称 :销售价 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public Double getPrice() {
		return this.price;
	}

	/**
	 * 字段名称 :销售价 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public void setPrice(Double price) {
		this.price = price;
	}

	/**
	 * 字段名称 :成本价 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public Double getCost() {
		return this.cost;
	}

	/**
	 * 字段名称 :成本价 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public void setCost(Double cost) {
		this.cost = cost;
	}

	/**
	 * 字段名称 :市场价 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public Double getMarketPrice() {
		return this.marketPrice;
	}

	/**
	 * 字段名称 :市场价 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public void setMarketPrice(Double marketPrice) {
		this.marketPrice = marketPrice;
	}
	
	/**
	* 字段名称 :默认会员价
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getDefaultPrice() {
		return this.defaultPrice;
	}

	/**
	* 字段名称 :默认会员价
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setDefaultPrice(Double defaultPrice) {
		 this.defaultPrice = defaultPrice;
    }

	/**
	 * 字段名称 :是否启用会员价 数据类型 :int 是否必填 :false
	 */
	public Integer getIsMemberPrice() {
		return this.isMemberPrice;
	}

	/**
	 * 字段名称 :是否启用会员价 数据类型 :int 是否必填 :false
	 */
	public void setIsMemberPrice(Integer isMemberPrice) {
		this.isMemberPrice = isMemberPrice;
	}

	/**
	 * 字段名称 :计量单位 数据类型 :varchar(16) 是否必填 :false
	 */
	public String getUnit() {
		return this.unit;
	}

	/**
	 * 字段名称 :计量单位 数据类型 :varchar(16) 是否必填 :false
	 */
	public void setUnit(String unit) {
		this.unit = unit;
	}

	/**
	 * 字段名称 :重量 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public Double getWeight() {
		return this.weight;
	}

	/**
	 * 字段名称 :重量 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public void setWeight(Double weight) {
		this.weight = weight;
	}

	/**
	 * 字段名称 :广告语 数据类型 :varchar(256) 是否必填 :false
	 */
	public String getAdwords() {
		return this.adwords;
	}

	/**
	 * 字段名称 :广告语 数据类型 :varchar(256) 是否必填 :false
	 */
	public void setAdwords(String adwords) {
		this.adwords = adwords;
	}

	/**
	 * 字段名称 :展示图片 数据类型 :varchar(256) 是否必填 :false
	 */
	public String getImage() {
		return this.image;
	}

	/**
	 * 字段名称 :展示图片 数据类型 :varchar(256) 是否必填 :false
	 */
	public void setImage(String image) {
		this.image = image;
	}

	/**
	 * 字段名称 :库存数量 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public Double getStock() {
		return this.stock;
	}

	/**
	 * 字段名称 :库存数量 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public void setStock(Double stock) {
		this.stock = stock;
	}

	/**
	 * 字段名称 :库存备注 数据类型 :varchar(64) 是否必填 :false
	 */
	public String getStockMemo() {
		return this.stockMemo;
	}

	/**
	 * 字段名称 :库存备注 数据类型 :varchar(64) 是否必填 :false
	 */
	public void setStockMemo(String stockMemo) {
		this.stockMemo = stockMemo;
	}

	/**
	 * 字段名称 :赠送积分 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public Double getPoint() {
		return this.point;
	}

	/**
	 * 字段名称 :赠送积分 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public void setPoint(Double point) {
		this.point = point;
	}

	/**
	 * 字段名称 :是否上架 数据类型 :int 是否必填 :false
	 */
	public Integer getIsMarketable() {
		return this.isMarketable;
	}

	/**
	 * 字段名称 :是否上架 数据类型 :int 是否必填 :false
	 */
	public void setIsMarketable(Integer isMarketable) {
		this.isMarketable = isMarketable;
	}

	/**
	 * 字段名称 :是否置顶 数据类型 :int 是否必填 :false
	 */
	public Integer getIsTop() {
		return this.isTop;
	}

	/**
	 * 字段名称 :是否置顶 数据类型 :int 是否必填 :false
	 */
	public void setIsTop(Integer isTop) {
		this.isTop = isTop;
	}

	/**
	 * 字段名称 :是否列出 数据类型 :int 是否必填 :false
	 */
	public Integer getIsList() {
		return this.isList;
	}

	/**
	 * 字段名称 :是否列出 数据类型 :int 是否必填 :false
	 */
	public void setIsList(Integer isList) {
		this.isList = isList;
	}

	/**
	 * 字段名称 :是否赠品 数据类型 :int 是否必填 :false
	 */
	public Integer getIsGift() {
		return this.isGift;
	}

	/**
	 * 字段名称 :是否赠品 数据类型 :int 是否必填 :false
	 */
	public void setIsGift(Integer isGift) {
		this.isGift = isGift;
	}
	
	public Integer getIsLianYing() {
		return isLianYing;
	}

	public void setIsLianYing(Integer isLianYing) {
		this.isLianYing = isLianYing;
	}

	/**
	 * 字段名称 :商品介绍 数据类型 :longtext 是否必填 :false
	 */
	public String getIntroduction() {
		return this.introduction;
	}

	/**
	 * 字段名称 :商品介绍 数据类型 :longtext 是否必填 :false
	 */
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	/**
	 * 字段名称 :搜索关键字 数据类型 :varchar(256) 是否必填 :false
	 */
	public String getKeywords() {
		return this.keywords;
	}

	/**
	 * 字段名称 :搜索关键字 数据类型 :varchar(256) 是否必填 :false
	 */
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	/**
	 * 字段名称 :点击次数 数据类型 :int 是否必填 :false
	 */
	public Integer getHits() {
		return this.hits;
	}

	/**
	 * 字段名称 :点击次数 数据类型 :int 是否必填 :false
	 */
	public void setHits(Integer hits) {
		this.hits = hits;
	}

	/**
	 * 字段名称 :周点击次数 数据类型 :int 是否必填 :false
	 */
	public Integer getWeekHits() {
		return this.weekHits;
	}

	/**
	 * 字段名称 :周点击次数 数据类型 :int 是否必填 :false
	 */
	public void setWeekHits(Integer weekHits) {
		this.weekHits = weekHits;
	}

	/**
	 * 字段名称 :周最后一次访问 数据类型 :datetime 是否必填 :false
	 */
	public Date getWeekHitsDate() {
		return this.weekHitsDate;
	}

	/**
	 * 字段名称 :周最后一次访问 数据类型 :datetime 是否必填 :false
	 */
	public void setWeekHitsDate(Date weekHitsDate) {
		this.weekHitsDate = weekHitsDate;
	}

	/**
	 * 字段名称 :月访问次数 数据类型 :int 是否必填 :false
	 */
	public Integer getMonthHits() {
		return this.monthHits;
	}

	/**
	 * 字段名称 :月访问次数 数据类型 :int 是否必填 :false
	 */
	public void setMonthHits(Integer monthHits) {
		this.monthHits = monthHits;
	}

	/**
	 * 字段名称 :月最后一次访问 数据类型 :datetime 是否必填 :false
	 */
	public Date getMonthHitsDate() {
		return this.monthHitsDate;
	}

	/**
	 * 字段名称 :月最后一次访问 数据类型 :datetime 是否必填 :false
	 */
	public void setMonthHitsDate(Date monthHitsDate) {
		this.monthHitsDate = monthHitsDate;
	}

	/**
	 * 字段名称 :总销量 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public Double getSales() {
		return this.sales;
	}

	/**
	 * 字段名称 :总销量 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public void setSales(Double sales) {
		this.sales = sales;
	}

	/**
	 * 字段名称 :周销量 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public Double getWeekSales() {
		return this.weekSales;
	}

	/**
	 * 字段名称 :周销量 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public void setWeekSales(Double weekSales) {
		this.weekSales = weekSales;
	}

	/**
	 * 字段名称 :周最后销售日期 数据类型 :datetime 是否必填 :false
	 */
	public Date getWeekSalesDate() {
		return this.weekSalesDate;
	}

	/**
	 * 字段名称 :周最后销售日期 数据类型 :datetime 是否必填 :false
	 */
	public void setWeekSalesDate(Date weekSalesDate) {
		this.weekSalesDate = weekSalesDate;
	}

	/**
	 * 字段名称 :月销量 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public Double getMonthSales() {
		return this.monthSales;
	}

	/**
	 * 字段名称 :月销量 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public void setMonthSales(Double monthSales) {
		this.monthSales = monthSales;
	}

	/**
	 * 字段名称 :月最后销售日期 数据类型 :datetime 是否必填 :false
	 */
	public Date getMonthSalesDate() {
		return this.monthSalesDate;
	}

	/**
	 * 字段名称 :月最后销售日期 数据类型 :datetime 是否必填 :false
	 */
	public void setMonthSalesDate(Date monthSalesDate) {
		this.monthSalesDate = monthSalesDate;
	}

	/**
	 * 字段名称 :评论次数 数据类型 :int 是否必填 :false
	 */
	public Integer getScoreCount() {
		return this.scoreCount;
	}

	/**
	 * 字段名称 :评论次数 数据类型 :int 是否必填 :false
	 */
	public void setScoreCount(Integer scoreCount) {
		this.scoreCount = scoreCount;
	}

	/**
	 * 字段名称 :评论总分数 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public Double getScoreTotal() {
		return this.scoreTotal;
	}

	/**
	 * 字段名称 :评论总分数 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public void setScoreTotal(Double scoreTotal) {
		this.scoreTotal = scoreTotal;
	}

	/**
	 * 字段名称 :评论平均分 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public Double getScore() {
		return this.score;
	}

	/**
	 * 字段名称 :评论平均分 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public void setScore(Double score) {
		this.score = score;
	}

	/**
	 * 字段名称 :是否首页 数据类型 :int 是否必填 :false
	 */
	public Integer getIsIndex() {
		return this.isIndex;
	}

	/**
	 * 字段名称 :是否首页 数据类型 :int 是否必填 :false
	 */
	public void setIsIndex(Integer isIndex) {
		this.isIndex = isIndex;
	}

	/**
	 * 字段名称 :首页排序 数据类型 :int 是否必填 :false
	 */
	public Integer getIndexOrder() {
		return this.indexOrder;
	}

	/**
	 * 字段名称 :首页排序 数据类型 :int 是否必填 :false
	 */
	public void setIndexOrder(Integer indexOrder) {
		this.indexOrder = indexOrder;
	}

	/**
	 * 字段名称 :商品描述 数据类型 :varchar(128) 是否必填 :false
	 */
	public String getDescription() {
		return this.description;
	}

	/**
	 * 字段名称 :商品描述 数据类型 :varchar(128) 是否必填 :false
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getYpice() {
		return ypice;
	}

	public void setYpice(String ypice) {
		this.ypice = ypice;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getFrozen() {
		return frozen;
	}

	public void setFrozen(String frozen) {
		this.frozen = frozen;
	}

	public String getSold() {
		return sold;
	}

	public void setSold(String sold) {
		this.sold = sold;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getSaleId() {
		return saleId;
	}

	public void setSaleId(String saleId) {
		this.saleId = saleId;
	}

	public String getMethodId() {
		return methodId;
	}

	public void setMethodId(String methodId) {
		this.methodId = methodId;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getShippingOrderUrl() {
		return shippingOrderUrl;
	}

	public void setShippingOrderUrl(String shippingOrderUrl) {
		this.shippingOrderUrl = shippingOrderUrl;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getShopUrlAddress() {
		return shopUrlAddress;
	}

	public void setShopUrlAddress(String shopUrlAddress) {
		this.shopUrlAddress = shopUrlAddress;
	}

	public Double getMinBatchPrice() {
		return minBatchPrice;
	}

	public void setMinBatchPrice(Double minBatchPrice) {
		this.minBatchPrice = minBatchPrice;
	}

	public Double getMaxBatchPrice() {
		return maxBatchPrice;
	}

	public void setMaxBatchPrice(Double maxBatchPrice) {
		this.maxBatchPrice = maxBatchPrice;
	}

	public Integer getStartBatchNum() {
		return startBatchNum;
	}

	public void setStartBatchNum(Integer startBatchNum) {
		this.startBatchNum = startBatchNum;
	}


	public String getHasRebate() {
		return hasRebate;
	}

	public void setHasRebate(String hasRebate) {
		this.hasRebate = hasRebate;
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

	public String getPackageUnit() {
		return packageUnit;
	}

	public void setPackageUnit(String packageUnit) {
		this.packageUnit = packageUnit;
	}

	public String getPackageBarCode() {
		return packageBarCode;
	}

	public void setPackageBarCode(String packageBarCode) {
		this.packageBarCode = packageBarCode;
	}

	public String getPhoneIntroduction() {
		return phoneIntroduction;
	}

	public void setPhoneIntroduction(String phoneIntroduction) {
		this.phoneIntroduction = phoneIntroduction;
	}

	public Integer getEnableBatchPrice() {
		return enableBatchPrice;
	}

	public void setEnableBatchPrice(Integer enableBatchPrice) {
		this.enableBatchPrice = enableBatchPrice;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	public int getIsPost() {
		return isPost;
	}

	public void setIsPost(int isPost) {
		this.isPost = isPost;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Double getInputPrice() {
		return inputPrice;
	}

	public void setInputPrice(Double inputPrice) {
		this.inputPrice = inputPrice;
	}

	/*当前用户下商品关注计数*/
	private Integer attentionCount;

	public Integer getAttentionCount() {
		return attentionCount;
	}

	public void setAttentionCount(Integer attentionCount) {
		this.attentionCount = attentionCount;
	}

	/*统计当前用户是否购买众筹商品*/
	private Integer isNaNOrder;

	public Integer getIsNaNOrder() {
		return isNaNOrder;
	}

	public void setIsNaNOrder(Integer isNaNOrder) {
		this.isNaNOrder = isNaNOrder;
	}

	public Double getVolume() {
		return volume;
	}

	public void setVolume(Double volume) {
		this.volume = volume;
	}
}