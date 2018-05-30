package net.deepdragon.erp.yunji.entity;

import java.util.Date;
import java.util.Set;

/**
 * 退货参数对象
 * 
 * @author ZGT
 * 
 */
public class SalesReturnEntity {
	public String voucherCode;
	public String salesCheckOutID;
	public String warehouseID;
	public String warehouseCode;
	public String customerID;
	public String customerCode;
	public String departmentID;
	public String departmentCode;
	public double settleMoney;
	public Date createDate;
	public String enterID;
	public String enterCode;
	public String createEmpID;
	public String createEmpCode;
	public String approveEmpID;
	public String approveEmpCode;

	public int settled;
	public int approveStatus;
	public String buzEmpID;
	public String buzEmpCode;
	public String remarks;
	public String approveDate;
	public double sumMoney;
	public String description;
	public double paymentAmount;

	public String cashAccountID;
	public String paymentType;
	public String paymentID;
	public double settlePayAmount;
	public String dailyVoucherCode;
	public Set<SalesReturnItemEntity> salesReturnItems;

	public String getVoucherCode() {
		return voucherCode;
	}

	public void setVoucherCode(String voucherCode) {
		this.voucherCode = voucherCode;
	}

	public String getSalesCheckOutID() {
		return salesCheckOutID;
	}

	public void setSalesCheckOutID(String salesCheckOutID) {
		this.salesCheckOutID = salesCheckOutID;
	}

	public String getWarehouseID() {
		return warehouseID;
	}

	public void setWarehouseID(String warehouseID) {
		this.warehouseID = warehouseID;
	}

	public String getWarehouseCode() {
		return warehouseCode;
	}

	public void setWarehouseCode(String warehouseCode) {
		this.warehouseCode = warehouseCode;
	}

	public String getCustomerID() {
		return customerID;
	}

	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getDepartmentID() {
		return departmentID;
	}

	public void setDepartmentID(String departmentID) {
		this.departmentID = departmentID;
	}

	public String getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}

	public double getSettleMoney() {
		return settleMoney;
	}

	public void setSettleMoney(double settleMoney) {
		this.settleMoney = settleMoney;
	}

	public Date getCreateDate() {
		return createDate!=null?(Date)createDate.clone():null;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate!=null?(Date)createDate.clone():null;
	}

	public String getEnterID() {
		return enterID;
	}

	public void setEnterID(String enterID) {
		this.enterID = enterID;
	}

	public String getEnterCode() {
		return enterCode;
	}

	public void setEnterCode(String enterCode) {
		this.enterCode = enterCode;
	}

	public String getCreateEmpID() {
		return createEmpID;
	}

	public void setCreateEmpID(String createEmpID) {
		this.createEmpID = createEmpID;
	}

	public String getCreateEmpCode() {
		return createEmpCode;
	}

	public void setCreateEmpCode(String createEmpCode) {
		this.createEmpCode = createEmpCode;
	}

	public String getApproveEmpID() {
		return approveEmpID;
	}

	public void setApproveEmpID(String approveEmpID) {
		this.approveEmpID = approveEmpID;
	}

	public String getApproveEmpCode() {
		return approveEmpCode;
	}

	public void setApproveEmpCode(String approveEmpCode) {
		this.approveEmpCode = approveEmpCode;
	}

	public int getSettled() {
		return settled;
	}

	public void setSettled(int settled) {
		this.settled = settled;
	}

	public int getApproveStatus() {
		return approveStatus;
	}

	public void setApproveStatus(int approveStatus) {
		this.approveStatus = approveStatus;
	}

	public String getBuzEmpID() {
		return buzEmpID;
	}

	public void setBuzEmpID(String buzEmpID) {
		this.buzEmpID = buzEmpID;
	}

	public String getBuzEmpCode() {
		return buzEmpCode;
	}

	public void setBuzEmpCode(String buzEmpCode) {
		this.buzEmpCode = buzEmpCode;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getApproveDate() {
		return approveDate;
	}

	public void setApproveDate(String approveDate) {
		this.approveDate = approveDate;
	}

	public double getSumMoney() {
		return sumMoney;
	}

	public void setSumMoney(double sumMoney) {
		this.sumMoney = sumMoney;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(double paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public String getCashAccountID() {
		return cashAccountID;
	}

	public void setCashAccountID(String cashAccountID) {
		this.cashAccountID = cashAccountID;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getPaymentID() {
		return paymentID;
	}

	public void setPaymentID(String paymentID) {
		this.paymentID = paymentID;
	}

	public double getSettlePayAmount() {
		return settlePayAmount;
	}

	public void setSettlePayAmount(double settlePayAmount) {
		this.settlePayAmount = settlePayAmount;
	}

	public String getDailyVoucherCode() {
		return dailyVoucherCode;
	}

	public void setDailyVoucherCode(String dailyVoucherCode) {
		this.dailyVoucherCode = dailyVoucherCode;
	}

	public Set<SalesReturnItemEntity> getSalesReturnItems() {
		return salesReturnItems;
	}

	public void setSalesReturnItems(Set<SalesReturnItemEntity> salesReturnItems) {
		this.salesReturnItems = salesReturnItems;
	}
}
