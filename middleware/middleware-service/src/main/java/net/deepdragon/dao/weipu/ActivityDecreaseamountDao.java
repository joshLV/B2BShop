package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.ActivityDecreaseamount;

import java.util.Map;

public interface ActivityDecreaseamountDao extends BaseDao<ActivityDecreaseamount, String> {

    /**
     * 根据商品ID和商品总金额查询满足的满减
     * @param paramMap
     * @param goodsId
     * @param goodsPriceCount
     * @return
     * @throws Exception
     * TianYu 2016-04-15
     */
    ActivityDecreaseamount getDecreByGoodsId(Map<String, Object> paramMap, String goodsId, Double goodsPriceCount);
}
