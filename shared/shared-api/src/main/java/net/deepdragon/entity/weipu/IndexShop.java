package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

import java.util.List;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：首页品牌旗舰店 表代码：wp_index_shop
 */
@Alias(Weipu.SIGN + "IndexShop")
public class IndexShop extends BaseEntity {

	private static final long serialVersionUID = 1700365350990592023L;

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 名称
	 */
	private String name;

	/**
	 * 关联店铺
	 */
	private String shopId;

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
	
	/**
	 * 图片地址
	 */
	private String pic;

	/**
	 * 店铺名称
	 */
	private String shopName;
	
	/**
	 * 店铺地址
	 */
	private String urlAddress;

	/**
	 *所属平台
	 */
	private String platform;

	/**
	 * 微信二维码
	 */
	private String weixinImg;

	private String atitude;
	private String longitude;
	private String km;
	private String areaPath;
	private String address;
	private String sile;
	//店铺商品
	private List<Goods> list;

	public String getSile() {
		return sile;
	}

	public void setSile(String sile) {
		this.sile = sile;
	}

	public List<Goods> getList() {
		return list;
	}

	public void setList(List<Goods> list) {
		this.list = list;
	}

	public String getAreaPath() {
		return areaPath;
	}

	public void setAreaPath(String areaPath) {
		this.areaPath = areaPath;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAtitude() {
		return atitude;
	}

	public void setAtitude(String atitude) {
		this.atitude = atitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getKm() {
		return km;
	}

	public void setKm(String km) {
		this.km = km;
	}

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
	 * 字段名称 :名称 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 字段名称 :名称 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 字段名称 :关联店铺 数据类型 :bigint 是否必填 :false
	 */
	public String getShopId() {
		return this.shopId;
	}

	/**
	 * 字段名称 :关联店铺 数据类型 :bigint 是否必填 :false
	 */
	public void setShopId(String shopId) {
		this.shopId = shopId;
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

	public String getShopName() {
		return shopName;
	}
	
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}
	
	public String getUrlAddress() {
		return urlAddress;
	}
	
	public void setUrlAddress(String urlAddress) {
		this.urlAddress = urlAddress;
	}

	public String getWeixinImg() {
		return weixinImg;
	}

	public void setWeixinImg(String weixinImg) {
		this.weixinImg = weixinImg;
	}
}