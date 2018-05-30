package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.BuyerRank;

import java.util.Map;

/**
 * 采购商等级数据接口
*/
public interface BuyerRankService extends BaseService<BuyerRank, String> {
    /**
     * 获取默认的会员等级
     *
     * @param paramMap
     *            租户标识
     * @return
     * @throws Exception
     */
    BuyerRank getDefaultBuyerRank(Map<String, Object> paramMap) throws Exception;

}
