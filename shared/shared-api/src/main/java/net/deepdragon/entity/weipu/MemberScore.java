package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

import java.util.Date;

/**
 * Created by gzj on 2015/9/17 0017.
 */
@Alias(Weipu.SIGN+"MemberScore")
public class MemberScore extends BaseEntity{

    private static final long serialVersionUID = 1297366078283688775L;

    /**
     * 订单主键
     * */
    private String orderId;

    /**
     * 订单编号
     * */
    private String orderSn;
    /**
     *会员Id
     * */
    private String memberId;
    /**
     *积分数
     * */
    private Integer score;
    /**
     *积分产生标识(1 购买商品 2退款)
     * */
    private Integer flag;
    /**
     *说明
     * */
    private String description;
    /**
     *使用类型
     * */
    private Integer type;
    /**
     *规则
     * */
    private String rules;
    /**
     *有效期
     * */
    private Date useLimitDate;
    /**
     *备注
     * */
    private String remark;

    public String getOrderSn() {
        return orderSn;
    }

    public void setOrderSn(String orderSn) {
        this.orderSn = orderSn;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getRules() {
        return rules;
    }

    public void setRules(String rules) {
        this.rules = rules;
    }

    public Date getUseLimitDate() {
        return useLimitDate;
    }

    public void setUseLimitDate(Date useLimitDate) {
        this.useLimitDate = useLimitDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }
}
