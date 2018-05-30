package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：前台类目 表代码：wp_catelog
 */
@Alias(Weipu.SIGN + "Catelog")
public class Catelog extends BaseEntity {

	private static final long serialVersionUID = 1180910098356677439L;

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 父分类
	 */
	private String parentId;

	/**
	 * 分类名称
	 */
	private String name;

	/**
	 * 图片组
	 */
	private String groupName;

	/**
	 * 类目图片
	 */
	private String image;

	private String pic;

	/**
	 * 分类标识
	 */
	private String sign;

	/**
	*分类路径
	*/
	private String path;
	
	/**
	 * 显示序号
	 */
	private Integer orderNo;

	/**
	 * 是否启用
	 */
	private Integer enabled;

	/**
	 * 分类描述
	 */
	private String description;

	/**
	 * 分类类型
	 */
	private String catelogType;

	/**
	 * 最父级ID
	 */
	private String grandfather;
	/**
	 * 第几级标示
	 */
	private String cateTypeFlage;
	public String getCateTypeFlage() {
		return this.cateTypeFlage;
	}
	public void setCateTypeFlage(String cateTypeFlage) {
		this.cateTypeFlage = cateTypeFlage;
	}
	/**
	 * 字段名称 :最父级ID 数据类型 :varchar 是否必填 :false
	 */
	public String getGrandfather() {
		return this.grandfather;
	}

	/**
	 * 字段名称 :最父级ID 数据类型 :varchar 是否必填 :false
	 */
	public void setGrandfather(String grandfather) {
		this.grandfather = grandfather;
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
	 * 字段名称 :父分类 数据类型 :bigint 是否必填 :false
	 */
	public String getParentId() {
		return this.parentId;
	}

	/**
	 * 字段名称 :父分类 数据类型 :bigint 是否必填 :false
	 */
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	/**
	 * 字段名称 :分类名称 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 字段名称 :分类名称 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 字段名称 :图片组 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getGroupName() {
		return this.groupName;
	}

	/**
	 * 字段名称 :图片组 数据类型 :varchar(32) 是否必填 :false
	 */
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	/**
	 * 字段名称 :类目图片 数据类型 :varchar(256) 是否必填 :false
	 */
	public String getImage() {
		return this.image;
	}

	/**
	 * 字段名称 :类目图片 数据类型 :varchar(256) 是否必填 :false
	 */
	public void setImage(String image) {
		this.image = image;
	}

	/**
	 * 字段名称 :分类标识 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getSign() {
		return this.sign;
	}

	/**
	 * 字段名称 :分类标识 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setSign(String sign) {
		this.sign = sign;
	}

	/**
	* 字段名称 :分类路径
	* 数据类型 :varchar(256)
	* 是否必填 :true
	*/
	public String getPath() {
		return this.path;
	}

	/**
	* 字段名称 :分类路径
	* 数据类型 :varchar(256)
	* 是否必填 :true
	*/
	public void setPath(String path) {
		 this.path = path;
    }
    
	/**
	 * 字段名称 :显示序号 数据类型 :int 是否必填 :true
	 */
	public Integer getOrderNo() {
		return this.orderNo;
	}

	/**
	 * 字段名称 :显示序号 数据类型 :int 是否必填 :true
	 */
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	/**
	 * 字段名称 :是否启用 数据类型 :int 是否必填 :false
	 */
	public Integer getEnabled() {
		return this.enabled;
	}

	/**
	 * 字段名称 :是否启用 数据类型 :int 是否必填 :false
	 */
	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

	/**
	 * 字段名称 :分类描述 数据类型 :varchar(128) 是否必填 :false
	 */
	public String getDescription() {
		return this.description;
	}

	/**
	 * 字段名称 :分类描述 数据类型 :varchar(128) 是否必填 :false
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getCatelogType() {
		return catelogType;
	}

	public void setCatelogType(String catelogType) {
		this.catelogType = catelogType;
	}

}