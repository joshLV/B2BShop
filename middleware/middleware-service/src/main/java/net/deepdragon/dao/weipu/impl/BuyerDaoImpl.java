package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.BuyerDao;
import net.deepdragon.entity.weipu.Buyer;
import net.deepdragon.entity.weipu.Merchant;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 采购商数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "BuyerDaoImpl")
public class BuyerDaoImpl extends BaseDaoImpl<Buyer, String> implements
		BuyerDao {
	@Override
	public List<Merchant> getMyMerchants(Map<String, Object> paramMap, String id) {
		String defaultStatement = Buyer.class.getName() + "Mapper.getMyMerchants";
		paramMap.put("id", id);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}

}
