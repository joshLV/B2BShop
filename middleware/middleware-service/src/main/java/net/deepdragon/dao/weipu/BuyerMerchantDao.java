package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.BuyerMerchant;
import net.deepdragon.entity.weipu.Merchant;

import java.util.List;
import java.util.Map;

public interface BuyerMerchantDao extends BaseDao<BuyerMerchant, String> {
    /**
     * 根据ID获取实体对象.
     *
     * @param paramMap
     *            租户ID
     * @param id
     *            记录ID
     * @return 实体对象
     */
    List<Merchant> getByMerchantNameBuyerMerchants(Map<String, Object> paramMap, String id,String searMerchantName);
    /**
     * 根据店铺Id调整商品上/下架
     *
     * @param paramMap
     *            租户Id
     * @param buyerId
     *            店铺Id
     * @param merchantId
     *            是否上架. 1：上架。0：下架
     */
    int updateBuyerMerchantState(Map<String, Object> paramMap, String buyerId, String merchantId);

}
