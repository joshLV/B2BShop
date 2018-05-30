package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.util.StringUtil;
import org.apache.ibatis.type.Alias;

import java.util.ArrayList;
import java.util.List;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：商家(店铺)信息 表代码：wp_merchant
 */
@Alias(Weipu.SIGN + "Merchant")
public class Merchant extends BaseEntity {

	private static final long serialVersionUID = 1985065595834444734L;

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 商家类型
	 */
	private String typeId;

	/**
	 * 商家名称
	 */
	private String name;

	/**
	 * 商家简称
	 */
	private String shortName;

	/**
	 * 营业执照编码
	 */
	private String businessLicenseCode;

	/**
	 * 营业执照照片
	 */
	private String businessLicense;

	/**
	 * 组名
	 */
	private String groupName;

	/**
	 * 原图宽度
	 */
	private Integer imageWidth;

	/**
	 * 原图高度
	 */
	private Integer imageHeight;

	/**
	 * 负责人
	 */
	private String head;

	/**
	 * 性别
	 */
	private Integer sex;

	/**
	 * 手机号码
	 */
	private String mobile;

	/**
	 * 固定电话
	 */
	private String telphone;

	/**
	 * 电子信箱
	 */
	private String email;

	/**
	 * 所属地区
	 */
	private String areaPath;

	/**
	 * 详细地址
	 */
	private String address;

	/**
	 * 商家状态
     * -1:关闭店铺、审核驳回
     * 0:初始状态
     * 3:审核通过
	 */
	private Integer status;

	/**
	 * 店铺标识
	 */
	private String sign;

	/**
	 * 店铺地址
	 */
	private String urlAddress;
	/**
	 * 客服QQ号码，以逗号分隔开(,)
	 */
	private String qqKeFu;

	private List<String> qqKeFuList = new ArrayList<String>(0);

	private String url;
	private String pic;
	private String enableHeadAd;

	/**   `hasRebate` varchar(5) NOT NULL DEFAULT 'no' COMMENT '是否返利 yes返利 no不返利', */
	private String hasRebate;

	/**
	 * 维信二维码图片
	 */
	private String weixinImg;

	private String deliveryDay;

	private Double initialPost;

	/**
	 * 官网
	 */
	private String website;
	private String km;
	private String sile;

	public String getKm() {
		return km;
	}

	public void setKm(String km) {
		this.km = km;
	}

	public String getSile() {
		return sile;
	}

	public void setSile(String sile) {
		this.sile = sile;
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
	 * 字段名称 :商家类型 数据类型 :bigint 是否必填 :true
	 */
	public String getTypeId() {
		return this.typeId;
	}

	/**
	 * 字段名称 :商家类型 数据类型 :bigint 是否必填 :true
	 */
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	/**
	 * 字段名称 :商家名称 数据类型 :varchar(64) 是否必填 :true
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 字段名称 :商家名称 数据类型 :varchar(64) 是否必填 :true
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 字段名称 :商家简称 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getShortName() {
		return this.shortName;
	}

	/**
	 * 字段名称 :商家简称 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	/**
	 * 字段名称 :营业执照编码 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getBusinessLicenseCode() {
		return this.businessLicenseCode;
	}

	/**
	 * 字段名称 :营业执照编码 数据类型 :varchar(32) 是否必填 :false
	 */
	public void setBusinessLicenseCode(String businessLicenseCode) {
		this.businessLicenseCode = businessLicenseCode;
	}

	/**
	 * 字段名称 :营业执照照片 数据类型 :varchar(256) 是否必填 :false
	 */
	public String getBusinessLicense() {
		return this.businessLicense;
	}

	/**
	 * 字段名称 :营业执照照片 数据类型 :varchar(256) 是否必填 :false
	 */
	public void setBusinessLicense(String businessLicense) {
		this.businessLicense = businessLicense;
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
	 * 字段名称 :负责人 数据类型 :varchar(16) 是否必填 :true
	 */
	public String getHead() {
		return this.head;
	}

	/**
	 * 字段名称 :负责人 数据类型 :varchar(16) 是否必填 :true
	 */
	public void setHead(String head) {
		this.head = head;
	}

	/**
	 * 字段名称 :性别 数据类型 :int 是否必填 :false
	 */
	public Integer getSex() {
		return this.sex;
	}

	/**
	 * 字段名称 :性别 数据类型 :int 是否必填 :false
	 */
	public void setSex(Integer sex) {
		this.sex = sex;
	}

	/**
	 * 字段名称 :手机号码 数据类型 :varchar(16) 是否必填 :false
	 */
	public String getMobile() {
		return this.mobile;
	}

	/**
	 * 字段名称 :手机号码 数据类型 :varchar(16) 是否必填 :false
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/**
	 * 字段名称 :固定电话 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getTelphone() {
		return this.telphone;
	}

	/**
	 * 字段名称 :固定电话 数据类型 :varchar(32) 是否必填 :false
	 */
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

	/**
	 * 字段名称 :电子信箱 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getEmail() {
		return this.email;
	}

	/**
	 * 字段名称 :电子信箱 数据类型 :varchar(32) 是否必填 :false
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * 字段名称 :所属地区 数据类型 :varchar(256) 是否必填 :false
	 */
	public String getAreaPath() {
		return this.areaPath;
	}

	/**
	 * 字段名称 :所属地区 数据类型 :varchar(256) 是否必填 :false
	 */
	public void setAreaPath(String areaPath) {
		this.areaPath = areaPath;
	}

	/**
	 * 字段名称 :详细地址 数据类型 :varchar(128) 是否必填 :false
	 */
	public String getAddress() {
		return this.address;
	}

	/**
	 * 字段名称 :详细地址 数据类型 :varchar(128) 是否必填 :false
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * 字段名称 :商家状态 数据类型 :int 是否必填 :true
	 */
	public Integer getStatus() {
		return this.status;
	}

	/**
	 * 字段名称 :商家状态 数据类型 :int 是否必填 :true
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}

	/**
	 * 字段名称 :店铺标识 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getSign() {
		return this.sign;
	}

	/**
	 * 字段名称 :店铺标识 数据类型 :varchar(32) 是否必填 :false
	 */
	public void setSign(String sign) {
		this.sign = sign;
	}

	/**
	 * 字段名称 :店铺地址 数据类型 :varchar(256) 是否必填 :false
	 */
	public String getUrlAddress() {
		return this.urlAddress;
	}

	/**
	 * 字段名称 :店铺地址 数据类型 :varchar(256) 是否必填 :false
	 */
	public void setUrlAddress(String urlAddress) {
		this.urlAddress = urlAddress;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getEnableHeadAd() {
		return enableHeadAd;
	}

	public void setEnableHeadAd(String enableHeadAd) {
		this.enableHeadAd = enableHeadAd;
	}

	public String getQqKeFu() {
		return qqKeFu;
	}

	public void setQqKeFu(String qqKeFu) {
		this.qqKeFu = qqKeFu;
		//拆分客服QQ
		if(StringUtil.isNotEmpty(qqKeFu)){
			List<String> qqs = new ArrayList<String>();
			for( String qq : qqKeFu.split(",") ){
				qqs.add(qq);
			}
			this.setQqKeFuList( qqs );
		}
	}

	public List<String> getQqKeFuList() {
		return qqKeFuList;
	}

	public void setQqKeFuList(List<String> qqKeFuList) {
		this.qqKeFuList = qqKeFuList;
	}

	public String getHasRebate() {
		return hasRebate;
	}

	public void setHasRebate(String hasRebate) {
		this.hasRebate = hasRebate;
	}

	private String linkMan;
	private String linkMobel;
	private String linkTel;

	public String getLinkMan() {
		return linkMan;
	}

	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}

	public String getLinkMobel() {
		return linkMobel;
	}

	public void setLinkMobel(String linkMobel) {
		this.linkMobel = linkMobel;
	}

	public String getLinkTel() {
		return linkTel;
	}

	public void setLinkTel(String linkTel) {
		this.linkTel = linkTel;
	}

	public String getWeixinImg() {
		return weixinImg;
	}

	public void setWeixinImg(String weixinImg) {
		this.weixinImg = weixinImg;
	}

	public String getDeliveryDay() {
		return deliveryDay;
	}

	public void setDeliveryDay(String deliveryDay) {
		this.deliveryDay = deliveryDay;
	}

	public Double getInitialPost() {
		return initialPost;
	}

	public void setInitialPost(Double initialPost) {
		this.initialPost = initialPost;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}
}