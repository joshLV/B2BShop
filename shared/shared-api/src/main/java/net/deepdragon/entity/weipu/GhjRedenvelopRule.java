package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：ghj_ghj_redenvelop_rule
 * 表代码：ghj_ghj_redenvelop_rule
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjRedenvelopRule")
public class GhjRedenvelopRule extends BaseEntity {

	private static final long serialVersionUID = 1277315192075891372L;
	
	/**
	*tenantId
	*/
	private String tenantId;
	
	/**
	*红包ID，参考ghj_redenvelop_grandlog表的主键字段
	*/
	private String redEnvelopId;
	
	/**
	*商品Id
	*/
	private String goodsId;

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getRedEnvelopId() {
		return redEnvelopId;
	}

	public void setRedEnvelopId(String redEnvelopId) {
		this.redEnvelopId = redEnvelopId;
	}

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
}