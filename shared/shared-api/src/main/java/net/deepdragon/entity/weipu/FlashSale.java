package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：参与活动的产品 表代码：wp_flash_sale
 */
@Alias(Weipu.SIGN + "FlashSale")
public class FlashSale extends BaseEntity {

	private static final long serialVersionUID = 1080918831250436077L;

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 方案明细ID
	 */
	private String detailId;

	/**
	 * 商品ID
	 */
	private String goodsId;

	/**
	 * 预售数量
	 */
	private Integer total;

	/**
	 * 预售价格
	 */
	private Double ypice;

	/**
	 * 冻结数量
	 */
	private Integer frozen;

	/**
	 * 已售数量
	 */
	private Integer sold;

	/**
	 * 配送方式
	 */
	private String methodId;

	/**
	 * 排序
	 */
	private Integer orderNo;

	/**
	 * 字段名称 :临时字段 数据类型 :String
	 * 
	 */
	private String goodsName;

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
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
	 * 字段名称 :方案明细ID 数据类型 :bigint 是否必填 :true
	 */
	public String getDetailId() {
		return this.detailId;
	}

	/**
	 * 字段名称 :方案明细ID 数据类型 :bigint 是否必填 :true
	 */
	public void setDetailId(String detailId) {
		this.detailId = detailId;
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
	 * 字段名称 :预售数量 数据类型 :int 是否必填 :true
	 */
	public Integer getTotal() {
		return this.total;
	}

	/**
	 * 字段名称 :预售数量 数据类型 :int 是否必填 :true
	 */
	public void setTotal(Integer total) {
		this.total = total;
	}

	/**
	 * 字段名称 :预售价格 数据类型 :decimal(24,2) 是否必填 :true
	 * 
	 * @param
	 */
	public Double getYpice() {
		return this.ypice;
	}

	/**
	 * 字段名称 :预售价格 数据类型 :decimal(24,2) 是否必填 :true
	 */
	public void setYpice(Double ypice) {
		this.ypice = ypice;
	}

	/**
	 * 字段名称 :冻结数量 数据类型 :int 是否必填 :false
	 */
	public Integer getFrozen() {
		return this.frozen;
	}

	/**
	 * 字段名称 :冻结数量 数据类型 :int 是否必填 :false
	 */
	public void setFrozen(Integer frozen) {
		this.frozen = frozen;
	}

	/**
	 * 字段名称 :已售数量 数据类型 :int 是否必填 :false
	 */
	public Integer getSold() {
		return this.sold;
	}

	/**
	 * 字段名称 :已售数量 数据类型 :int 是否必填 :false
	 */
	public void setSold(Integer sold) {
		this.sold = sold;
	}

	/**
	 * 字段名称 :配送方式 数据类型 :bigint 是否必填 :false
	 */
	public String getMethodId() {
		return this.methodId;
	}

	/**
	 * 字段名称 :配送方式 数据类型 :bigint 是否必填 :false
	 */
	public void setMethodId(String methodId) {
		this.methodId = methodId;
	}

	/**
	 * 字段名称 :排序 数据类型 :int 是否必填 :false
	 */
	public Integer getOrderNo() {
		return this.orderNo;
	}

	/**
	 * 字段名称 :排序 数据类型 :int 是否必填 :false
	 */
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

}