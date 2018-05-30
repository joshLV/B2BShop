package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：商品(配件)车型关联关系
 * 表代码：wp_goods_cartype
*/
@Alias(Weipu.SIGN+"GoodsCartype")
public class GoodsCartype extends BaseEntity {

	private static final long serialVersionUID = 1949705246574014189L;
	
	/**
	*商品ID
	*/
	private String goodsId;
	
	/**
	*车型ID
	*/
	private String cartypeId;
	
	
	/**
	* 字段名称 :商品ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public String getGoodsId() {
		return this.goodsId;
	}

	/**
	* 字段名称 :商品ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public void setGoodsId(String goodsId) {
		 this.goodsId = goodsId;
    }
    
	/**
	* 字段名称 :车型ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public String getCartypeId() {
		return this.cartypeId;
	}

	/**
	* 字段名称 :车型ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public void setCartypeId(String cartypeId) {
		 this.cartypeId = cartypeId;
    }
    
}