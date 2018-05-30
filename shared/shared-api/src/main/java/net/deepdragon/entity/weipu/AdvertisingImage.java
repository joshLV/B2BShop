package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：广告图片管理 表代码：wp_advertising_image
 */
@Alias(Weipu.SIGN + "AdvertisingImage")
public class AdvertisingImage extends BaseEntity {

	private static final long serialVersionUID = 1158319194116404422L;

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 名称
	 */
	private String name;

	/**
	 * 位置
	 */
	private String advertisingId;

	/**
	 * 位置名称
	 */
	private String advertisingName;

	/**
	 * 位置宽度
	 */
	private Integer width;
	/**
	 * 位置高度
	 */
	private Integer height;
	/**
	 * 链接
	 */
	private String link;

	/**
	 * 图片组
	 */
	private String groupName;

	/**
	 * 图片
	 */
	private String image;

	private String pic;

	/**
	 *所属平台
	 */
	private String platform;

	/**
	 * 字段名称 :所属平台
	 * 数据类型 :bigint
	 * 是否必填 :true
	 */
	public String getPlatform() {
		return this.platform;
	}

	/**
	 * 字段名称 :所属平台
	 * 数据类型 :bigint
	 * 是否必填 :true
	 */
	public void setPlatform(String platform) {
		this.platform = platform;
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
	 * 字段名称 :名称 数据类型 :varchar(16) 是否必填 :true
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 字段名称 :名称 数据类型 :varchar(16) 是否必填 :true
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 字段名称 :位置 数据类型 :bigint 是否必填 :true
	 */
	public String getAdvertisingId() {
		return this.advertisingId;
	}

	/**
	 * 字段名称 :位置 数据类型 :bigint 是否必填 :true
	 */
	public void setAdvertisingId(String advertisingId) {
		this.advertisingId = advertisingId;
	}

	public String getAdvertisingName() {
		return advertisingName;
	}

	public void setAdvertisingName(String advertisingName) {
		this.advertisingName = advertisingName;
	}

	/**
	 * 字段名称 :链接 数据类型 :varchar(256) 是否必填 :true
	 */
	public String getLink() {
		return this.link;
	}

	/**
	 * 字段名称 :链接 数据类型 :varchar(256) 是否必填 :true
	 */
	public void setLink(String link) {
		this.link = link;
	}

	/**
	 * 字段名称 :图片组 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getGroupName() {
		return this.groupName;
	}

	/**
	 * 字段名称 :图片组 数据类型 :varchar(32) 是否必填 :false
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

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public Integer getWidth() {
		return width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}
}