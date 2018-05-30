package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：ghj_ghj_vm_redenvelopaccount
 * 表代码：ghj_ghj_vm_redenvelopaccount
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjVmRedenvelopaccount")
public class GhjVmRedenvelopaccount extends BaseEntity {

	private static final long serialVersionUID = 1230602123697161759L;
	
	/**
	*buyerId
	*/
	private String buyerId;
	/**
	*groupId 红包分组ID
	*/
	private String groupId;

	/**
	 *红包类型：rebate： 返利红包；action：活动红包
	 */
	private String redEnvelopType;

	/**
	*redEnvelopId
	*/
	private String redEnvelopId;

	/**
	 * 生效时间
	 */
	private Date createTime;

	/**
	 * 失效时间
	 */
	private Date expiryTime;
	
	/**
	*amount 可用金额
	*/
	private Double amount;
	
	/**
	*发放方：platform-平台，merchant-供应商
	*/
	private String releaseSource;
	/**
	*merchantId
	*/
	private String merchantId;
	
	/**
	*type
	*/
	private Integer type;
	
	/**
	*0：定向；1：非定向
	*/
	private Integer isAssigned;

	/**
	*限额阈值，为0时表示不限定（使用该红包支付时，需要判定订单金额是否满足该限额）
	*/
	private Double limitation;

	/**
	*单笔交易中可使用的最大金额,为0时为不限制
	*/
	private Double singleMaximum;
	
	/**
	*红包有效期（单位天）；为0时表示永远有效
	*/
	private Integer validityPeriod;

	/**
	 * 是否可用
	 * Y 可用， N 不可用
	 */
	private String isEnable;

	/**
	 * 本次可用金额
	 */
	private Double usedAmount;

	/**
	 *本次使用资金
	 */
	private Double thisUsedAmount;

	/**
	 *商家名称
	 */
	private String merchantName;

	public GhjVmRedenvelopaccount() {
	}

	/**
	* 字段名称 :buyerId
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getBuyerId() {
		return this.buyerId;
	}

	/**
	* 字段名称 :buyerId
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setBuyerId(String buyerId) {
		 this.buyerId = buyerId;
    }
    
	/**
	* 字段名称 :redEnvelopId
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getRedEnvelopId() {
		return this.redEnvelopId;
	}

	/**
	* 字段名称 :redEnvelopId
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setRedEnvelopId(String redEnvelopId) {
		 this.redEnvelopId = redEnvelopId;
    }
    
	/**
	* 字段名称 :amount
	* 数据类型 :decimal(46,2)
	* 是否必填 :false
	*/
	public Double getAmount() {
		return this.amount;
	}

	/**
	* 字段名称 :amount
	* 数据类型 :decimal(46,2)
	* 是否必填 :false
	*/
	public void setAmount(Double amount) {
		 this.amount = amount;
    }
    
	/**
	* 字段名称 :merchantId
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getMerchantId() {
		return this.merchantId;
	}

	/**
	* 字段名称 :merchantId
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setMerchantId(String merchantId) {
		 this.merchantId = merchantId;
    }
    
	/**
	* 字段名称 :type
	* 数据类型 :int(2)
	* 是否必填 :false
	*/
	public Integer getType() {
		return this.type;
	}

	/**
	* 字段名称 :type
	* 数据类型 :int(2)
	* 是否必填 :false
	*/
	public void setType(Integer type) {
		 this.type = type;
    }
    
	/**
	* 字段名称 :限额阈值，为0时表示不限定（使用该红包支付时，需要判定订单金额是否满足该限额）
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getLimitation() {
		return this.limitation;
	}

	/**
	* 字段名称 :限额阈值，为0时表示不限定（使用该红包支付时，需要判定订单金额是否满足该限额）
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setLimitation(Double limitation) {
		this.limitation = limitation;
    }
    
	/**
	* 字段名称 :单笔交易中可使用的最大金额,为0时为不限制
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getSingleMaximum() {
		return this.singleMaximum;
	}

	/**
	* 字段名称 :单笔交易中可使用的最大金额,为0时为不限制
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setSingleMaximum(Double singleMaximum) {
		 this.singleMaximum = singleMaximum;
    }

	public String getIsEnable() {
		return isEnable;
	}

	public void setIsEnable(String isEnable) {
		this.isEnable = isEnable;
	}

	public Double getUsedAmount() {
		return usedAmount;
	}

	public void setUsedAmount(Double usedAmount) {
		this.usedAmount = usedAmount;
	}

	public Double getThisUsedAmount() {
		return thisUsedAmount;
	}

	public void setThisUsedAmount(Double thisUsedAmount) {
		this.thisUsedAmount = thisUsedAmount;
	}

	public String getRedEnvelopType() {
		return redEnvelopType;
	}

	public void setRedEnvelopType(String redEnvelopType) {
		this.redEnvelopType = redEnvelopType;
	}

	public String getReleaseSource() {
		return releaseSource;
	}

	public void setReleaseSource(String releaseSource) {
		this.releaseSource = releaseSource;
	}

	public Integer getIsAssigned() {
		return isAssigned;
	}

	public void setIsAssigned(Integer isAssigned) {
		this.isAssigned = isAssigned;
	}


	public Integer getValidityPeriod() {
		return validityPeriod;
	}

	public void setValidityPeriod(Integer validityPeriod) {
		this.validityPeriod = validityPeriod;
	}



	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getExpiryTime() {
		return expiryTime;
	}

	public void setExpiryTime(Date expiryTime) {
		this.expiryTime = expiryTime;
	}

	public String getMerchantName() {
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}

	/**
	 * 初始化可用余额
	 * @param vrvc
	 * @param payAmount
	 * 可用余额 和 红包金额  、 阈值  、 单笔限额进行比较，取最小值
	 */
	public static void initUsedAmount(GhjVmRedenvelopaccount vrvc, Double payAmount){
		if(vrvc.getUsedAmount() != null ){
			return;
		}

		vrvc.setLimitation( vrvc.getLimitation() == null ? 0d : vrvc.getLimitation() );
		vrvc.setSingleMaximum(vrvc.getSingleMaximum() == null ? 0d : vrvc.getSingleMaximum());

		Double usedAmount = 0d;
		if( vrvc.getSingleMaximum() != 0 ){
			usedAmount = vrvc.getSingleMaximum() - payAmount;

			//如果 可用余额
			if( usedAmount <= 0 ){
				vrvc.setUsedAmount( 0d );
				vrvc.setIsEnable("N");
				return;
			}
		}

		//比较 可用金额 和 红包金额， 取最小值赋给 可用金额
		usedAmount = usedAmount <= vrvc.getAmount() ? usedAmount : vrvc.getAmount();

		if( vrvc.getLimitation() == 0 ){//无阈值
			if( vrvc.getSingleMaximum() == 0 ){//无单笔限额
				//此时无需进行判断
			}else{//有单笔限额
				usedAmount = vrvc.getSingleMaximum() <= usedAmount ? vrvc.getSingleMaximum() : usedAmount;
			}
		}else{//有阈值
			if( vrvc.getSingleMaximum() == 0 ){//无单笔限额
				usedAmount = vrvc.getLimitation() <= usedAmount ? vrvc.getLimitation() : usedAmount;
			}else{//有单笔限额
				usedAmount = vrvc.getLimitation() <= usedAmount ? vrvc.getLimitation() : usedAmount;
				usedAmount = vrvc.getSingleMaximum() <= usedAmount ? vrvc.getSingleMaximum() : usedAmount;
			}
		}

		vrvc.setUsedAmount( usedAmount);

		if(vrvc.getUsedAmount() <= 0) {
			vrvc.setIsEnable("N");
		}
	}

}