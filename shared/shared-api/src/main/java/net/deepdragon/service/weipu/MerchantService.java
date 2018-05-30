package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.Merchant;

import java.util.List;
import java.util.Map;

/**
 * 商家(店铺)信息数据接口
*/
public interface MerchantService extends BaseService<Merchant, String> {
    /**
     * 根据采购商ID获取我的供应商列表.
     *
     * @param paramMap
     *            租户标识
     * @param merchantName
     *            采购商名称
     * @return
     * @throws ServiceException
     */
    List<Merchant> getNameMerchants(Map<String, Object> paramMap, String merchantName) throws Exception;

}
