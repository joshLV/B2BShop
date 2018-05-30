package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

import java.util.Date;
import java.util.Map;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：订单支付记录
 * 表代码：wp_order_paylog
*/
@Alias(Weipu.SIGN+"OrderPaylog")
public class OrderPaylog extends BaseEntity {

	private static final long serialVersionUID = 1137528382580589324L;


	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*订单编号
	*/
	private String orderSn;
	
	/**
	*会员ID
	*/
	private String memberId;
	
	/**
	*支付账户
	*/
	private String no;
	
	/**
	*支付标识
	*/
	private String sign;
	/**
	 * 支付标识：支付
	 */
	public static String SIGN_PAY = "pay";
	/**
	 * 支付标识：支付
	 */
	public static String YL_PAY = "unionpay";

	/**
	 * 支付标识：银联跨境支付
	 */
	public static String KJ_PAY = "kjpay";

	/**
	 * 支付标识：微信公众号支付
	 */
	public static String SIGN_WXPAY_JSAPI = "wxpay_jsapi";

	/**
	 * 支付标识：微信APP支付
	 */
	public static String SIGN_WXPAY_APP = "wxpay_app";
	/**
	 * 支付标识：微信原生扫码支付
	 */
	public static String SIGN_WXPAY_NATIVE = "wxpay_native";
	/**
	 * 支付标识：refund_退款
	 */
	public     String SIGN_REFUND = "refund";
	/**
	 * 支付标识：consumeUndo_撤销支付
	 */
	public static String SIGN_CONSUME_UNDO = "consumeUndo";
	
	/**
	*支付名称
	*/
	private String name;
	
	/**
	*支付流水号
	*/
	private String uniqueno;
	
	/**
	*支付金额
	*/
	private Double amount;
	
	/**
	*支付时间
	*/
	private String payDate;
	
	/**
	*支付状态
	*/
	private String status;
	
	/**
	*消息
	*/
	private String info;

	/**
	 * 合并订单号
	 */
	private String mergeOrderSn;

	/**
	 *是否删除，已删除-Y，未删除-N
	 */
	private String isDetele;

	public OrderPaylog() {
	}

	/**
	 * 银联在线支付使用构造
	 */
	public OrderPaylog(Order order, Map<String, String> respData,String sign,String name,String info ) {
		this.tenantId = order.getTenantId();
		this.memberId = order.getMemberId();
		this.orderSn = respData.get("orderId");
		this.no = respData.get("accNo");
		this.sign = sign;
		this.name = name;
		this.uniqueno = respData.get("queryId");
		this.amount = Double.parseDouble(respData.get("txnAmt")) / 100;
		this.payDate = respData.get("txnTime");//yyyyMMddHHmmss
		this.status = "true";
		this.info = info;
		super.setCreateUser("system");
		super.setCreateDate( new Date() );
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
	* 字段名称 :订单编号
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getOrderSn() {
		return this.orderSn;
	}

	/**
	* 字段名称 :订单编号
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setOrderSn(String orderSn) {
		 this.orderSn = orderSn;
    }
    
	/**
	* 字段名称 :会员ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public String getMemberId() {
		return this.memberId;
	}

	/**
	* 字段名称 :会员ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public void setMemberId(String memberId) {
		 this.memberId = memberId;
    }
    
	/**
	* 字段名称 :支付账户
	* 数据类型 :varchar(64)
	* 是否必填 :true
	*/
	public String getNo() {
		return this.no;
	}

	/**
	* 字段名称 :支付账户
	* 数据类型 :varchar(64)
	* 是否必填 :true
	*/
	public void setNo(String no) {
		 this.no = no;
    }
    
	/**
	* 字段名称 :支付标识
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getSign() {
		return this.sign;
	}

	/**
	* 字段名称 :支付标识
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setSign(String sign) {
		 this.sign = sign;
    }
    
	/**
	* 字段名称 :支付名称
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :支付名称
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setName(String name) {
		 this.name = name;
    }
    
	/**
	* 字段名称 :支付流水号
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public String getUniqueno() {
		return this.uniqueno;
	}

	/**
	* 字段名称 :支付流水号
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public void setUniqueno(String uniqueno) {
		 this.uniqueno = uniqueno;
    }
    
	/**
	* 字段名称 :支付金额
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public Double getAmount() {
		return this.amount;
	}

	/**
	* 字段名称 :支付金额
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public void setAmount(Double amount) {
		 this.amount = amount;
    }
    
	/**
	* 字段名称 :支付时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public String getPayDate() {
		return this.payDate;
	}

	/**
	* 字段名称 :支付时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setPayDate(String payDate) {
		 this.payDate = payDate;
    }
    
	/**
	* 字段名称 :支付状态
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getStatus() {
		return this.status;
	}

	/**
	* 字段名称 :支付状态
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setStatus(String status) {
		 this.status = status;
    }
    
	/**
	* 字段名称 :消息
	* 数据类型 :varchar(1024)
	* 是否必填 :false
	*/
	public String getInfo() {
		return this.info;
	}

	/**
	* 字段名称 :消息
	* 数据类型 :varchar(1024)
	* 是否必填 :false
	*/
	public void setInfo(String info) {
		 this.info = info;
    }


	public String getIsDetele() {
		return isDetele;
	}

	public void setIsDetele(String isDetele) {
		this.isDetele = isDetele;
	}

	public String getMergeOrderSn() {
		return mergeOrderSn;
	}

	public void setMergeOrderSn(String mergeOrderSn) {
		this.mergeOrderSn = mergeOrderSn;
	}
}