package com.icbc.rtrep;

/**
 * Created by Administrator on 2016/6/16.
 */
public class Bank {

    private String TranBatchNo;
    private String notifyDate;
    private String tranStat;
    private String comment;

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getNotifyDate() {
        return notifyDate;
    }

    public void setNotifyDate(String notifyDate) {
        this.notifyDate = notifyDate;
    }

    public String getTranBatchNo() {
        return TranBatchNo;
    }

    public void setTranBatchNo(String tranBatchNo) {
        TranBatchNo = tranBatchNo;
    }

    public String getTranStat() {
        return tranStat;
    }

    public void setTranStat(String tranStat) {
        this.tranStat = tranStat;
    }
}
