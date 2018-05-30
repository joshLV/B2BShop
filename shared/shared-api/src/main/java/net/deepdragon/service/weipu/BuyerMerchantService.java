package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.BuyerMerchant;
import net.deepdragon.entity.weipu.Merchant;

import java.util.List;
import java.util.Map;

/**
 * 我的供应商数据接口
*/
public interface BuyerMerchantService extends BaseService<BuyerMerchant, String> {
    /**
     * 根据采购商ID获取我的供应商列表.
     *
     * @param paramMap
     *            租户标识
     * @param id
     *            采购商ID
     * @return
     * @throws Exception
     */
    List<Merchant> getByMerchantNameBuyerMerchants(Map<String, Object> paramMap, String id,String searMerchantName) throws Exception;
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
