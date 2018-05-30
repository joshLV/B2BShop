package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.MerchantDao;
import net.deepdragon.entity.weipu.Merchant;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 商家(店铺)信息数据接口实现
*/
@Repository(Weipu.SIGN + "MerchantDaoImpl")
public class MerchantDaoImpl extends BaseDaoImpl<Merchant, String> implements
		MerchantDao {
	public List<Merchant> getNameMerchants(Map<String, Object> paramMap, String merchantName) {
		String defaultStatement = Merchant.class.getName() + "Mapper.getNameMerchants";
		paramMap.put("merchantName", merchantName);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}

}
