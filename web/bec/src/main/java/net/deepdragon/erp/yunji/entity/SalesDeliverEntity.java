package net.deepdragon.erp.yunji.entity;

import java.util.Date;
import java.util.Set;

public class SalesDeliverEntity {
	public String voucherCode;
	public String salesOrderID;
	public String invoiceCode;
	public String warehouseID;

	public String warehouseCode;
	public String customerID;
	public String customerCode;
	public double sumMoney;
	public int isSettled;
	public double settleMoney;
	public String departmentID;
	public String departmentCode;
	public String remarks;

	public String enterID;
	public String enterCode;
	public String createEmpID;
	public String createEmpCode;
	public Date createDate;
	public String approveEmpID;
	public String approveEmpCode;
	public boolean approveStatus;
	public Date approveDate;
	public String buzEmpID;
	public String buzEmpCode;
	public String description;
	public double paymentAmount;
	public String paymentType;
	public String cashAccountID;
	public double settlePayAmount;
	public String paymentID;
	public String dailyVoucherCode;
	public Set<SalesDeliverItemEntity> salesDeliverItems;

	public String getVoucherCode() {
		return voucherCode;
	}

	public void setVoucherCode(String voucherCode) {
		this.voucherCode = voucherCode;
	}

	public String getSalesOrderID() {
		return salesOrderID;
	}

	public void setSalesOrderID(String salesOrderID) {
		this.salesOrderID = salesOrderID;
	}

	public String getInvoiceCode() {
		return invoiceCode;
	}

	public void setInvoiceCode(String invoiceCode) {
		this.invoiceCode = invoiceCode;
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

	public double getSumMoney() {
		return sumMoney;
	}

	public void setSumMoney(double sumMoney) {
		this.sumMoney = sumMoney;
	}

	public int getIsSettled() {
		return isSettled;
	}

	public void setIsSettled(int isSettled) {
		this.isSettled = isSettled;
	}

	public double getSettleMoney() {
		return settleMoney;
	}

	public void setSettleMoney(double settleMoney) {
		this.settleMoney = settleMoney;
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

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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

	public boolean isApproveStatus() {
		return approveStatus;
	}

	public void setApproveStatus(boolean approveStatus) {
		this.approveStatus = approveStatus;
	}

	public Date getApproveDate() {
		return approveDate!=null?(Date)approveDate.clone():null;
	}

	public void setApproveDate(Date approveDate) {
		this.approveDate = approveDate!=null?(Date)approveDate.clone():null;
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

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getCashAccountID() {
		return cashAccountID;
	}

	public void setCashAccountID(String cashAccountID) {
		this.cashAccountID = cashAccountID;
	}

	public double getSettlePayAmount() {
		return settlePayAmount;
	}

	public void setSettlePayAmount(double settlePayAmount) {
		this.settlePayAmount = settlePayAmount;
	}

	public String getPaymentID() {
		return paymentID;
	}

	public void setPaymentID(String paymentID) {
		this.paymentID = paymentID;
	}

	public String getDailyVoucherCode() {
		return dailyVoucherCode;
	}

	public void setDailyVoucherCode(String dailyVoucherCode) {
		this.dailyVoucherCode = dailyVoucherCode;
	}

	public Set<SalesDeliverItemEntity> getSalesDeliverItems() {
		return salesDeliverItems;
	}

	public void setSalesDeliverItems(Set<SalesDeliverItemEntity> salesDeliverItems) {
		this.salesDeliverItems = salesDeliverItems;
	}

}
