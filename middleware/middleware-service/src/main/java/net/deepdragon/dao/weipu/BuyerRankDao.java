package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.BuyerRank;

import java.util.Map;

public interface BuyerRankDao extends BaseDao<BuyerRank, String> {
    /**
     * 获取默认的采购商等级
     *
     * @param paramMap
     *            租户标识
     * @return
     * @throws Exception
     */
    BuyerRank getDefaultBuyerRank(Map<String, Object> paramMap);

}
