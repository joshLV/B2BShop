package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.BuyerMerchantDao;
import net.deepdragon.entity.weipu.BuyerMerchant;
import net.deepdragon.entity.weipu.Merchant;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 我的供应商数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "BuyerMerchantDaoImpl")
public class BuyerMerchantDaoImpl extends BaseDaoImpl<BuyerMerchant, String> implements
		BuyerMerchantDao {
	@Override
	public List<Merchant> getByMerchantNameBuyerMerchants(Map<String, Object> paramMap, String id,String searMerchantName) {
		String defaultStatement = BuyerMerchant.class.getName() + "Mapper.getByMerchantNameBuyerMerchants";
		paramMap.put("id", id);
		paramMap.put("searMerchantName", searMerchantName);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}

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
	public int updateBuyerMerchantState(Map<String, Object> paramMap, String buyerId, String merchantId) {
		String defaultStatement = BuyerMerchant.class.getName() + "Mapper.updateBuyerMerchantState";
		paramMap.put("buyerId", buyerId);
		paramMap.put("merchantId", merchantId);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().update(defaultStatement, paramMap);
	}

}
