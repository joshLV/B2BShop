package net.deepdragon.erp.yunji.entity;
/**
 * 网店状态调整参数
 * @author ZGT
 *
 */
public class EnterPriseEshopRequest {
	private String enterpriseFlag;
	private String eshopFlag;
	private String state;

	public String getEnterpriseFlag() {
		return enterpriseFlag;
	}

	public void setEnterpriseFlag(String enterpriseFlag) {
		this.enterpriseFlag = enterpriseFlag;
	}

	public String getEshopFlag() {
		return eshopFlag;
	}

	public void setEshopFlag(String eshopFlag) {
		this.eshopFlag = eshopFlag;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
