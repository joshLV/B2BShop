package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：商品图片表 表代码：wp_goods_images
 */
@Alias(Weipu.SIGN + "GoodsImages")
public class GoodsImages extends BaseEntity {

	private static final long serialVersionUID = 1219584001431867624L;

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 所属商品
	 */
	private String goodsId;

	/**
	 * 标题
	 */
	private String title;

	/**
	 * 组名
	 */
	private String groupName;

	/**
	 * 图片路径
	 */
	private String url;

	/**
	 * 原图宽度
	 */
	private Integer imageWidth;

	/**
	 * 原图高度
	 */
	private Integer imageHeight;

	/**
	 * 显示序号
	 */
	private Integer orderNo;
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
	 * 字段名称 :所属商品 数据类型 :bigint 是否必填 :true
	 */
	public String getGoodsId() {
		return this.goodsId;
	}

	/**
	 * 字段名称 :所属商品 数据类型 :bigint 是否必填 :true
	 */
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	/**
	 * 字段名称 :标题 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getTitle() {
		return this.title;
	}

	/**
	 * 字段名称 :标题 数据类型 :varchar(32) 是否必填 :false
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * 字段名称 :组名 数据类型 :varchar(64) 是否必填 :true
	 */
	public String getGroupName() {
		return this.groupName;
	}

	/**
	 * 字段名称 :组名 数据类型 :varchar(64) 是否必填 :true
	 */
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	/**
	 * 字段名称 :图片路径 数据类型 :varchar(256) 是否必填 :false
	 */
	public String getUrl() {
		return this.url;
	}

	/**
	 * 字段名称 :图片路径 数据类型 :varchar(256) 是否必填 :false
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * 字段名称 :原图宽度 数据类型 :int 是否必填 :false
	 */
	public Integer getImageWidth() {
		return this.imageWidth;
	}

	/**
	 * 字段名称 :原图宽度 数据类型 :int 是否必填 :false
	 */
	public void setImageWidth(Integer imageWidth) {
		this.imageWidth = imageWidth;
	}

	/**
	 * 字段名称 :原图高度 数据类型 :int 是否必填 :false
	 */
	public Integer getImageHeight() {
		return this.imageHeight;
	}

	/**
	 * 字段名称 :原图高度 数据类型 :int 是否必填 :false
	 */
	public void setImageHeight(Integer imageHeight) {
		this.imageHeight = imageHeight;
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

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

}