package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

/**
 * Created by Administrator on 2015/10/16.
 */

@Alias(Weipu.SIGN + "B2BGoodsPrice")
public class B2BGoodsPrice extends BaseEntity {
    private static final long serialVersionUID = 1013563823539850228L;

    /**
     * 商品ID
     */
    private String goodsId;
    /**
     * 起批数量-起 计算时起批数量必须大于 此字段值。
     */
    private Integer startBatchNum;
    /**
     * 起批数量-至 计算时起批数量必须小于等于  此字段值。
     */
    private Integer endBatchNum;
    /**
     * 批发价格
     */
    private String batchPrice;
    /**
     * 排序
     */
    private String batchOrder;

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getStartBatchNum() {
        return startBatchNum;
    }

    public void setStartBatchNum(Integer startBatchNum) {
        this.startBatchNum = startBatchNum;
    }

    public Integer getEndBatchNum() {
        return endBatchNum;
    }

    public void setEndBatchNum(Integer endBatchNum) {
        this.endBatchNum = endBatchNum;
    }

    public String getBatchPrice() {
        return batchPrice;
    }

    public void setBatchPrice(String batchPrice) {
        this.batchPrice = batchPrice;
    }

    public String getBatchOrder() {
        return batchOrder;
    }

    public void setBatchOrder(String batchOrder) {
        this.batchOrder = batchOrder;
    }
}
