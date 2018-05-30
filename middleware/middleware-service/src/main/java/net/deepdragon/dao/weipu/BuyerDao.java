package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.Buyer;
import net.deepdragon.entity.weipu.Merchant;

import java.util.List;
import java.util.Map;

public interface BuyerDao extends BaseDao<Buyer, String> {
    /**
     * 根据ID获取实体对象.
     *
     * @param paramMap
     *            租户ID
     * @param id
     *            记录ID
     * @return 实体对象
     */
    List<Merchant> getMyMerchants(Map<String, Object> paramMap, String id);

}
