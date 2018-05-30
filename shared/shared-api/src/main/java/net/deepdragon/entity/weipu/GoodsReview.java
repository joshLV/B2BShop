package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

import java.util.Date;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：商品评论表
 * 表代码：wp_goods_review
*/
@Alias(Weipu.SIGN+"GoodsReview")
public class GoodsReview extends BaseEntity {

	private static final long serialVersionUID = 1481557533758275670L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	/**
	*评论父ID
	*/
	private String parentId;
	
	/**
	 * 订单编号
	 */
	private String orderSn;
	
	/**
	*所属商品
	*/
	private String goodsId;
	
	/**
	*会员ID
	*/
	private String memberId;
	
	/**
	*评论内容
	*/
	private String content;
	
	/**
	*客户端IP地址
	*/
	private String ip;
	
	/**
	*评论打分
	*/
	private Double score;
	
	/**
	*是否显示
	*/
	private Integer isShow;
	
	/**
	 * 购买时间
	 */
	private Date buyDate;

	/**
	 * 系统 EC ECM MCM
	 */
	private String whichSys;

	private String  replyContent;

	private Date replyDate;

	private String orderItemId;

	/**
	 * 是否已读(YES已读 NO未读)
	 */
	private String isRead;
	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public String getTenantId() {
		return this.tenantId;
	}

	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public void setTenantId(String tenantId) {
		 this.tenantId = tenantId;
    }
    
	/**
	* 字段名称 :所属商品
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public String getGoodsId() {
		return this.goodsId;
	}

	/**
	* 字段名称 :所属商品
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public void setGoodsId(String goodsId) {
		 this.goodsId = goodsId;
    }
    
	/**
	* 字段名称 :会员ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getMemberId() {
		return this.memberId;
	}

	/**
	* 字段名称 :会员ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setMemberId(String memberId) {
		 this.memberId = memberId;
    }
    
	/**
	* 字段名称 :评论内容
	* 数据类型 :text
	* 是否必填 :false
	*/
	public String getContent() {
		return this.content;
	}

	/**
	* 字段名称 :评论内容
	* 数据类型 :text
	* 是否必填 :false
	*/
	public void setContent(String content) {
		 this.content = content;
    }
    
	/**
	* 字段名称 :客户端IP地址
	* 数据类型 :varchar(64)
	* 是否必填 :true
	*/
	public String getIp() {
		return this.ip;
	}

	/**
	* 字段名称 :客户端IP地址
	* 数据类型 :varchar(64)
	* 是否必填 :true
	*/
	public void setIp(String ip) {
		 this.ip = ip;
    }
    
	/**
	* 字段名称 :评论打分
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getScore() {
		return this.score;
	}

	/**
	* 字段名称 :评论打分
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setScore(Double score) {
		 this.score = score;
    }
    
	/**
	* 字段名称 :是否显示
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getIsShow() {
		return this.isShow;
	}

	/**
	* 字段名称 :是否显示
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setIsShow(Integer isShow) {
		 this.isShow = isShow;
    }

	public String getOrderSn() {
		return orderSn;
	}

	public void setOrderSn(String orderSn) {
		this.orderSn = orderSn;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getWhichSys() {
		return whichSys;
	}

	public void setWhichSys(String whichSys) {
		this.whichSys = whichSys;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	public String getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(String orderItemId) {
		this.orderItemId = orderItemId;
	}

	public String getIsRead() {
		return isRead;
	}

	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}
}