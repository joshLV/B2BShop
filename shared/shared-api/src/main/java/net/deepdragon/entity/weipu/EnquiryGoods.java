package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：询价商品表
 * 表代码：b2b_enquiry_goods
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"EnquiryGoods")
public class EnquiryGoods extends BaseEntity {

	private static final long serialVersionUID = 1537501484054568067L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*询价表ID
	*/
	private String enquiryId;
	
	/**
	*商品名称
	*/
	private String goodsName;
	
	/**
	*商品分类
	*/
	private String categoryId;
	
	/**
	*分类路径
	*/
	private String categoryPath;
	
	/**
	*数量
	*/
	private Integer goodsNum;
	
	/**
	*单位
	*/
	private String goodsUnit;
	
	/**
	*描述:现用于 展示时保存 分类名称
	*/
	private String goodsDescribe;
	
	/**
	*附件(图片/图纸/文档)
	*/
	private String goodsAccessory;
	
	/**
	*删除标识
	*/
	private Integer isDelete;


	/**
	 * 分类名称
	 */
	private String categoryName;
	
	
	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getTenantId() {
		return this.tenantId;
	}

	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setTenantId(String tenantId) {
		 this.tenantId = tenantId;
    }
    
	/**
	* 字段名称 :询价表ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getEnquiryId() {
		return this.enquiryId;
	}

	/**
	* 字段名称 :询价表ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setEnquiryId(String enquiryId) {
		 this.enquiryId = enquiryId;
    }
    
	/**
	* 字段名称 :商品名称
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getGoodsName() {
		return this.goodsName;
	}

	/**
	* 字段名称 :商品名称
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setGoodsName(String goodsName) {
		 this.goodsName = goodsName;
    }
    
	/**
	* 字段名称 :商品分类
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getCategoryId() {
		return this.categoryId;
	}

	/**
	* 字段名称 :商品分类
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setCategoryId(String categoryId) {
		 this.categoryId = categoryId;
    }
    
	/**
	* 字段名称 :分类路径
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public String getCategoryPath() {
		return this.categoryPath;
	}

	/**
	* 字段名称 :分类路径
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public void setCategoryPath(String categoryPath) {
		 this.categoryPath = categoryPath;
    }
    
	/**
	* 字段名称 :数量
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getGoodsNum() {
		return this.goodsNum;
	}

	/**
	* 字段名称 :数量
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setGoodsNum(Integer goodsNum) {
		 this.goodsNum = goodsNum;
    }
    
	/**
	* 字段名称 :单位
	* 数据类型 :varchar(20)
	* 是否必填 :false
	*/
	public String getGoodsUnit() {
		return this.goodsUnit;
	}

	/**
	* 字段名称 :单位
	* 数据类型 :varchar(20)
	* 是否必填 :false
	*/
	public void setGoodsUnit(String goodsUnit) {
		 this.goodsUnit = goodsUnit;
    }
    
	/**
	* 字段名称 :描述
	* 数据类型 :varchar(500)
	* 是否必填 :false
	*/
	public String getGoodsDescribe() {
		return this.goodsDescribe;
	}

	/**
	* 字段名称 :描述
	* 数据类型 :varchar(500)
	* 是否必填 :false
	*/
	public void setGoodsDescribe(String goodsDescribe) {
		 this.goodsDescribe = goodsDescribe;
    }
    
	/**
	* 字段名称 :附件(图片/图纸/文档)
	* 数据类型 :TEXT
	* 是否必填 :false
	*/
	public String getGoodsAccessory() {
		return this.goodsAccessory;
	}

	/**
	* 字段名称 :附件(图片/图纸/文档)
	* 数据类型 :TEXT
	* 是否必填 :false
	*/
	public void setGoodsAccessory(String goodsAccessory) {
		 this.goodsAccessory = goodsAccessory;
    }
    
	/**
	* 字段名称 :删除标识
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public Integer getIsDelete() {
		return this.isDelete;
	}

	/**
	* 字段名称 :删除标识
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public void setIsDelete(Integer isDelete) {
		 this.isDelete = isDelete;
    }


	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
}