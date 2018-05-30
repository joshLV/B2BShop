package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：店铺广告 表代码：wp_merchant_advertising
 */
@Alias(Weipu.SIGN + "MerchantAdvertising")
public class MerchantAdvertising extends BaseEntity {

	private static final long serialVersionUID = 1188881623450451794L;

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 商户ID
	 */
	private String shopId;

	/**
	 * 组名
	 */
	private String groupName;

	/**
	 * 图片
	 */
	private String image;

	/**
	 * 图片
	 */
	private String image1;

	/**
	 * 图片
	 */
	private String image2;

	/**
	 * 图片
	 */
	private String image3;

	/**
	 * 图片
	 */
	private String image4;

	/**
	 * 图片宽
	 */
	private Integer imageWidth;

	/**
	 * 图片高
	 */
	private Integer imageHight;

	/**
	 * 链接地址
	 */
	private String url;

	/**
	 * 显示序号
	 */
	private Integer orderNo;

	/**
	 * 备注说明
	 */
	private String description;

	private String pic;

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
	 * 字段名称 :商户ID 数据类型 :bigint 是否必填 :true
	 */
	public String getShopId() {
		return this.shopId;
	}

	/**
	 * 字段名称 :商户ID 数据类型 :bigint 是否必填 :true
	 */
	public void setShopId(String shopId) {
		this.shopId = shopId;
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
	 * 字段名称 :图片 数据类型 :varchar(128) 是否必填 :false
	 */
	public String getImage() {
		return this.image;
	}

	/**
	 * 字段名称 :图片 数据类型 :varchar(128) 是否必填 :false
	 */
	public void setImage(String image) {
		this.image = image;
	}

	/**
	 * 字段名称 :图片宽 数据类型 :int 是否必填 :false
	 */
	public Integer getImageWidth() {
		return this.imageWidth;
	}

	/**
	 * 字段名称 :图片宽 数据类型 :int 是否必填 :false
	 */
	public void setImageWidth(Integer imageWidth) {
		this.imageWidth = imageWidth;
	}

	/**
	 * 字段名称 :图片高 数据类型 :int 是否必填 :false
	 */
	public Integer getImageHight() {
		return this.imageHight;
	}

	/**
	 * 字段名称 :图片高 数据类型 :int 是否必填 :false
	 */
	public void setImageHight(Integer imageHight) {
		this.imageHight = imageHight;
	}

	/**
	 * 字段名称 :链接地址 数据类型 :varchar(256) 是否必填 :true
	 */
	public String getUrl() {
		return this.url;
	}

	/**
	 * 字段名称 :链接地址 数据类型 :varchar(256) 是否必填 :true
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * 字段名称 :显示序号 数据类型 :int 是否必填 :false
	 */
	public Integer getOrderNo() {
		return this.orderNo;
	}

	/**
	 * 字段名称 :显示序号 数据类型 :int 是否必填 :false
	 */
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
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

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getImage4() {
		return image4;
	}

	public void setImage4(String image4) {
		this.image4 = image4;
	}
}