package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：团购商品表
 * 表代码：wp_group_sale
*/
@Alias(Weipu.SIGN+"GroupSale")
public class GroupSale extends BaseEntity {

	private static final long serialVersionUID = 1155370487958269717L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*商品ID
	*/
	private String goodsId;
	
	/**
	*总量
	*/
	private Integer total;
	
	/**
	*预售价格
	*/
	private Double ypice;
	
	/**
	 * 每个会员最多限购数量
	 */
	private Integer purchase;
	
	/**
	*广告语
	*/
	private String slogan;
	
	/**
	*商品介绍
	*/
	private String description;
	
	/**
	*冻结数量
	*/
	private Integer frozen;
	
	/**
	*已售数量
	*/
	private Integer sold;
	
	/**
	*组名
	*/
	private String groupName;
	
	/**
	*图片
	*/
	private String image;

    /**
     *图片全路径
     */
    private String pic;
	
	/**
	*配送方式
	*/
	private String methodId;

	/**
	*状态
	*/
	private Integer status;
	
	/**
	*排序
	*/
	private Integer orderNo;
	
	private String price;//商品原价
	
	private String name;//商品名称

    /**
     * 条形码
     */
    private String barcode;
    /**
     * 商品编号
     */
    private String sn;

    public String getBarcode() {
        return barcode;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

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
	* 字段名称 :总量
	* 数据类型 :int
	* 是否必填 :true
	*/
	public Integer getTotal() {
		return this.total;
	}

	/**
	* 字段名称 :总量
	* 数据类型 :int
	* 是否必填 :true
	*/
	public void setTotal(Integer total) {
		 this.total = total;
    }
    
	/**
	* 字段名称 :预售价格
	* 数据类型 :decimal(24,2)
	* 是否必填 :true
	*/
	public Double getYpice() {
		return this.ypice;
	}

	/**
	* 字段名称 :预售价格
	* 数据类型 :decimal(24,2)
	* 是否必填 :true
	*/
	public void setYpice(Double ypice) {
		 this.ypice = ypice;
    }
    
	/**
	* 字段名称 :限购数量
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getPurchase() {
		return this.purchase;
	}

	/**
	* 字段名称 :限购数量
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setPurchase(Integer purchase) {
		 this.purchase = purchase;
    }
    
	/**
	* 字段名称 :广告语
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public String getSlogan() {
		return this.slogan;
	}

	/**
	* 字段名称 :广告语
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public void setSlogan(String slogan) {
		 this.slogan = slogan;
    }
	
	/**
	* 字段名称 :商品介绍
	* 数据类型 :longtext
	* 是否必填 :false
	*/
	public String getDescription() {
		return this.description;
	}

	/**
	* 字段名称 :商品介绍
	* 数据类型 :longtext
	* 是否必填 :false
	*/
	public void setDescription(String description) {
		 this.description = description;
    }
    
	/**
	* 字段名称 :冻结数量
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getFrozen() {
		return this.frozen;
	}

	/**
	* 字段名称 :冻结数量
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setFrozen(Integer frozen) {
		 this.frozen = frozen;
    }
    
	/**
	* 字段名称 :已售数量
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getSold() {
		return this.sold;
	}

	/**
	* 字段名称 :已售数量
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setSold(Integer sold) {
		 this.sold = sold;
    }
    
	/**
	* 字段名称 :组名
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public String getGroupName() {
		return this.groupName;
	}

	/**
	* 字段名称 :组名
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public void setGroupName(String groupName) {
		 this.groupName = groupName;
    }
    
	/**
	* 字段名称 :图片
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public String getImage() {
		return this.image;
	}

	/**
	* 字段名称 :图片
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public void setImage(String image) {
		 this.image = image;
    }
    
	/**
	* 字段名称 :配送方式
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getMethodId() {
		return this.methodId;
	}

	/**
	* 字段名称 :配送方式
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setMethodId(String methodId) {
		 this.methodId = methodId;
    }
    
	/**
	* 字段名称 :状态
	* 数据类型 :int
	* 是否必填 :true
	*/
	public Integer getStatus() {
		return this.status;
	}

	/**
	* 字段名称 :状态
	* 数据类型 :int
	* 是否必填 :true
	*/
	public void setStatus(Integer status) {
		 this.status = status;
    }
    
	/**
	* 字段名称 :排序
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getOrderNo() {
		return this.orderNo;
	}

	/**
	* 字段名称 :排序
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setOrderNo(Integer orderNo) {
		 this.orderNo = orderNo;
    }

    public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }
}