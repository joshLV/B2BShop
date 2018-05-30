package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

import java.util.Date;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：wp_merchant_extend
 * 表代码：wp_merchant_extend
*/
@Alias(Weipu.SIGN+"MerchantExtend")
public class MerchantExtend extends BaseEntity {

	private static final long serialVersionUID = 1065572120122451761L;
	
	/**
	*外键
	*/
	private String merchantId;
	
	/**
	*商户ID
	*/
	private String tenantId;
	
	/**
	*介绍
	*/
	private String introduce;
	
	/**
	*扩展字段1
	*/
	private String ex1;
	
	/**
	*扩展字段2
	*/
	private String ex2;
	
	/**
	*扩展字段3
	*/
	private String ex3;
	
	/**
	*扩展字段4
	*/
	private String ex4;
	
	/**
	*扩展字段5
	*/
	private String ex5;
	
	/**
	*扩展字段6
	*/
	private Date ex6;
	
	/**
	*扩展字段7
	*/
	private Date ex7;
	
	/**
	*扩展字段8
	*/
	private Integer ex8;
	
	/**
	*扩展字段9
	*/
	private Integer ex9;
	
	
	/**
	* 字段名称 :外键
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getMerchantId() {
		return this.merchantId;
	}

	/**
	* 字段名称 :外键
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setMerchantId(String merchantId) {
		 this.merchantId = merchantId;
    }
    
	/**
	* 字段名称 :商户ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getTenantId() {
		return this.tenantId;
	}

	/**
	* 字段名称 :商户ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setTenantId(String tenantId) {
		 this.tenantId = tenantId;
    }
    
	/**
	* 字段名称 :介绍
	* 数据类型 :text
	* 是否必填 :false
	*/
	public String getIntroduce() {
		return this.introduce;
	}

	/**
	* 字段名称 :介绍
	* 数据类型 :text
	* 是否必填 :false
	*/
	public void setIntroduce(String introduce) {
		 this.introduce = introduce;
    }
    
	/**
	* 字段名称 :扩展字段1
	* 数据类型 :varchar
	* 是否必填 :false
	*/
	public String getEx1() {
		return this.ex1;
	}

	/**
	* 字段名称 :扩展字段1
	* 数据类型 :varchar
	* 是否必填 :false
	*/
	public void setEx1(String ex1) {
		 this.ex1 = ex1;
    }
    
	/**
	* 字段名称 :扩展字段2
	* 数据类型 :varchar
	* 是否必填 :false
	*/
	public String getEx2() {
		return this.ex2;
	}

	/**
	* 字段名称 :扩展字段2
	* 数据类型 :varchar
	* 是否必填 :false
	*/
	public void setEx2(String ex2) {
		 this.ex2 = ex2;
    }
    
	/**
	* 字段名称 :扩展字段3
	* 数据类型 :varchar
	* 是否必填 :false
	*/
	public String getEx3() {
		return this.ex3;
	}

	/**
	* 字段名称 :扩展字段3
	* 数据类型 :varchar
	* 是否必填 :false
	*/
	public void setEx3(String ex3) {
		 this.ex3 = ex3;
    }
    
	/**
	* 字段名称 :扩展字段4
	* 数据类型 :varchar
	* 是否必填 :false
	*/
	public String getEx4() {
		return this.ex4;
	}

	/**
	* 字段名称 :扩展字段4
	* 数据类型 :varchar
	* 是否必填 :false
	*/
	public void setEx4(String ex4) {
		 this.ex4 = ex4;
    }
    
	/**
	* 字段名称 :扩展字段5
	* 数据类型 :varchar
	* 是否必填 :false
	*/
	public String getEx5() {
		return this.ex5;
	}

	/**
	* 字段名称 :扩展字段5
	* 数据类型 :varchar
	* 是否必填 :false
	*/
	public void setEx5(String ex5) {
		 this.ex5 = ex5;
    }
    
	/**
	* 字段名称 :扩展字段6
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getEx6() {
		return this.ex6;
	}

	/**
	* 字段名称 :扩展字段6
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setEx6(Date ex6) {
		 this.ex6 = ex6;
    }
    
	/**
	* 字段名称 :扩展字段7
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getEx7() {
		return this.ex7;
	}

	/**
	* 字段名称 :扩展字段7
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setEx7(Date ex7) {
		 this.ex7 = ex7;
    }
    
	/**
	* 字段名称 :扩展字段8
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getEx8() {
		return this.ex8;
	}

	/**
	* 字段名称 :扩展字段8
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setEx8(Integer ex8) {
		 this.ex8 = ex8;
    }
    
	/**
	* 字段名称 :扩展字段9
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getEx9() {
		return this.ex9;
	}

	/**
	* 字段名称 :扩展字段9
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setEx9(Integer ex9) {
		 this.ex9 = ex9;
    }
    
}