package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.ActivityDecreaseamount;

import java.util.Map;

/**
 * 满减活动优惠价格区间数据接口
*/
public interface ActivityDecreaseamountService extends BaseService<ActivityDecreaseamount, String> {

    /**
     * 根据商品ID和商品总金额查询满足的满减
     * @param paramMap
     * @param goodsId
     * @param goodsPriceCount
     * @return
     * @throws Exception
     * TianYu 2016-04-15
     */
    ActivityDecreaseamount getDecreByGoodsId(Map<String, Object> paramMap, String goodsId, Double goodsPriceCount) throws Exception;
}
