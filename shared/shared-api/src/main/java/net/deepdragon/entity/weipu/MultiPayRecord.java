package net.deepdragon.entity.weipu;

import java.util.ArrayList;
import java.util.List;

/**
 * Explain: 用于多方支付时组装保存的数据
 * FileName:
 * Author: TianYu
 * Time: 2016-02-25 18:00
 * Desc:
 * Version: V1.0
 */
public class MultiPayRecord implements java.io.Serializable{
    private static final long serialVersionUID = 230743157735155061L;
    /**
     * Map说明：account = Account, accountLog = wp_account_log , creditReplys = List<ghj_credit_reply> ,
     * creditUsedLog = List<ghj_credit_used_log>
     *	  redenvelopAccesslogs = List<ghj_redenvelop_accesslog>, orderPayLogs = List<OrderPayLog>
     */

    /** 账户 */
    private Account account;

    /** 账户日志 */
    private AccountLog accountLog;

    /** 授信更新 */
    private List<GhjCreditReply> creditReplyList;// = new ArrayList<GhjCreditReply>(0);

    /** 授信日志 */
    private List<GhjCreditUsedLog> creditUsedLogList;

    /** 红包使用 */
    private List<GhjRedenvelopAccesslog> redenvelopAccesslogList;// = new ArrayList<GhjRedenvelopAccesslog>(0);

    /** 支付日志 */
    private List<OrderPaylog> orderPaylogList;

    /** 已支付总金额 */
    private Double payAmountTotal;

    /** 接收页面提交的红包记录 */
    List<GhjVmRedenvelopaccount> redenvelopaccounts;

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public AccountLog getAccountLog() {
        return accountLog;
    }

    public void setAccountLog(AccountLog accountLog) {
        this.accountLog = accountLog;
    }

    public List<GhjCreditReply> getCreditReplyList() {
        return creditReplyList;
    }

    public void setCreditReplyList(List<GhjCreditReply> creditReplyList) {
        this.creditReplyList = creditReplyList;
    }

    public List<GhjCreditUsedLog> getCreditUsedLogList() {
        return creditUsedLogList;
    }

    public void setCreditUsedLogList(List<GhjCreditUsedLog> creditUsedLogList) {
        this.creditUsedLogList = creditUsedLogList;
    }

    public List<GhjRedenvelopAccesslog> getRedenvelopAccesslogList() {
        return redenvelopAccesslogList;
    }

    public void setRedenvelopAccesslogList(List<GhjRedenvelopAccesslog> redenvelopAccesslogList) {
        this.redenvelopAccesslogList = redenvelopAccesslogList;
    }

    public List<OrderPaylog> getOrderPaylogList() {
        return orderPaylogList;
    }

    public void setOrderPaylogList(List<OrderPaylog> orderPaylogList) {
        this.orderPaylogList = orderPaylogList;
    }

    public Double getPayAmountTotal() {
        return payAmountTotal;
    }

    public void setPayAmountTotal(Double payAmountTotal) {
        this.payAmountTotal = payAmountTotal;
    }

    public List<GhjVmRedenvelopaccount> getRedenvelopaccounts() {
        return redenvelopaccounts;
    }

    public void setRedenvelopaccounts(List<GhjVmRedenvelopaccount> redenvelopaccounts) {
        this.redenvelopaccounts = redenvelopaccounts;
    }
}
