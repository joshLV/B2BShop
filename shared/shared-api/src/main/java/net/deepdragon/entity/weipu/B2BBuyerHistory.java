package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

import java.util.Date;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：会员浏览历史表 表代码：wp_history
 */
@Alias(Weipu.SIGN + "B2BBuyerHistory")
public class B2BBuyerHistory extends BaseEntity {

	private static final long serialVersionUID = 1879892491705796096L;

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 会员ID
	 */
	private String buyerId;

	/**
	 * 会员标识
	 */
	private String userkey;

	/**
	 * 商品ID
	 */
	private String goodsId;

	private String name;// 商品名称
	private String sn;// 商品编码
	private String price;// 销售价格
	private String marketPrice;// 市场价
	private String image;// 展示图片
	private String type;//商品类型：0_普通商品，1_众筹商品
	private String isMarketable;//商品是否上架(0: 未上架, 1: 已上架)
	private Date createDate;

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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
	 * 字段名称 :会员ID 数据类型 :bigint 是否必填 :false
	 */
	public String getBuyerId() {
		return this.buyerId;
	}

	/**
	 * 字段名称 :会员ID 数据类型 :bigint 是否必填 :false
	 */
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getIsMarketable() {
		return isMarketable;
	}

	public void setIsMarketable(String isMarketable) {
		this.isMarketable = isMarketable;
	}
}