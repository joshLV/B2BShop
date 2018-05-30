package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

import java.util.Date;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：秒杀方案明细 表代码：wp_flash_sale_plandetail
 */
@Alias(Weipu.SIGN + "FlashSalePlandetail")
public class FlashSalePlandetail extends BaseEntity {

	private static final long serialVersionUID = 1917408434449853570L;

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 方案ID
	 */
	private String planId;

	/**
	 * 名称
	 */
	private String name;

	/**
	 * 主题
	 */
	private String subject;

	/**
	 * 开始时间
	 */
	private Date startTime;

	/**
	 * 结束时间
	 */
	private Date endTime;

	/**
	 * 组名
	 */
	private String groupName;

	/**
	 * 展示图
	 */
	private String image;

	/**
	 * 是否限购
	 */
	private Integer isPurchase;

	/**
	 * 当前状态
	 */
	private Integer status;

	/**
	 * 活动类型
	 */
	private Integer type;

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
	 * 字段名称 :方案ID 数据类型 :bigint 是否必填 :false
	 */
	public String getPlanId() {
		return this.planId;
	}

	/**
	 * 字段名称 :方案ID 数据类型 :bigint 是否必填 :false
	 */
	public void setPlanId(String planId) {
		this.planId = planId;
	}

	/**
	 * 字段名称 :名称 数据类型 :varchar(512) 是否必填 :true
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 字段名称 :名称 数据类型 :varchar(512) 是否必填 :true
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 字段名称 :主题 数据类型 :varchar(512) 是否必填 :true
	 */
	public String getSubject() {
		return this.subject;
	}

	/**
	 * 字段名称 :主题 数据类型 :varchar(512) 是否必填 :true
	 */
	public void setSubject(String subject) {
		this.subject = subject;
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
	 * 字段名称 :组名 数据类型 :varchar(64) 是否必填 :false
	 */
	public String getGroupName() {
		return this.groupName;
	}

	/**
	 * 字段名称 :组名 数据类型 :varchar(64) 是否必填 :false
	 */
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	/**
	 * 字段名称 :展示图 数据类型 :varchar(256) 是否必填 :false
	 */
	public String getImage() {
		return this.image;
	}

	/**
	 * 字段名称 :展示图 数据类型 :varchar(256) 是否必填 :false
	 */
	public void setImage(String image) {
		this.image = image;
	}

	/**
	 * 字段名称 :是否限购 数据类型 :int 是否必填 :false
	 */
	public Integer getIsPurchase() {
		return this.isPurchase;
	}

	/**
	 * 字段名称 :是否限购 数据类型 :int 是否必填 :false
	 */
	public void setIsPurchase(Integer isPurchase) {
		this.isPurchase = isPurchase;
	}

	/**
	 * 字段名称 :当前状态 数据类型 :int 是否必填 :true
	 */
	public Integer getStatus() {
		return this.status;
	}

	/**
	 * 字段名称 :当前状态 数据类型 :int 是否必填 :true
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}

	/**
	 * 字段名称 :活动类型 数据类型 :int 是否必填 :true
	 */
	public Integer getType() {
		return this.type;
	}

	/**
	 * 字段名称 :活动类型 数据类型 :int 是否必填 :true
	 */
	public void setType(Integer type) {
		this.type = type;
	}
}