package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

import java.util.Date;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：活动商品表 表代码：wp_activity_shop
 */
@Alias(Weipu.SIGN + "ActivityShop")
public class ActivityShop extends BaseEntity {

	private static final long serialVersionUID = 1257002057777166212L;

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 名称
	 */
	private String name;

	/**
	 * 标识
	 */
	private String sign;

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
	 * 开始时间
	 */
	private Date startTime;

	/**
	 * 结束时间
	 */
	private Date endTime;

	/**
	 * 配送方式
	 */
	private String methodId;

	/**
	 * 备注说明
	 */
	private String description;

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
	 * 字段名称 :名称 数据类型 :varchar(64) 是否必填 :true
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 字段名称 :名称 数据类型 :varchar(64) 是否必填 :true
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 字段名称 :标识 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getSign() {
		return this.sign;
	}

	/**
	 * 字段名称 :标识 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setSign(String sign) {
		this.sign = sign;
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
	 * 字段名称 :开始时间 数据类型 :datetime 是否必填 :true
	 */
	public Date getStartTime() {
		return this.startTime;
	}

	/**
	 * 字段名称 :开始时间 数据类型 :datetime 是否必填 :true
	 */
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	/**
	 * 字段名称 :结束时间 数据类型 :datetime 是否必填 :true
	 */
	public Date getEndTime() {
		return this.endTime;
	}

	/**
	 * 字段名称 :结束时间 数据类型 :datetime 是否必填 :true
	 */
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
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
	 * 字段名称 :备注说明 数据类型 :varchar(128) 是否必填 :false
	 */
	public String getDescription() {
		return this.description;
	}

	/**
	 * 字段名称 :备注说明 数据类型 :varchar(128) 是否必填 :false
	 */
	public void setDescription(String description) {
		this.description = description;
	}

}