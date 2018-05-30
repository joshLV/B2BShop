package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.Buyer;
import net.deepdragon.entity.weipu.Merchant;

import java.util.List;
import java.util.Map;

/**
 * 采购商数据接口
*/
public interface BuyerService extends BaseService<Buyer, String> {
    /**
     * 根据采购商ID获取我的供应商列表.
     *
     * @param paramMap
     *            租户标识
     * @param id
     *            采购商ID
     * @return
     * @throws ServiceException
     */
    List<Merchant> getMyMerchants(Map<String, Object> paramMap, String id) throws Exception;

}
