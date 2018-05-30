package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.MerchantTypeDao;
import net.deepdragon.entity.weipu.MerchantType;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

/**
 * 商家类型数据接口实现
 */
@Repository(Weipu.SIGN + "MerchantTypeDaoImpl")
public class MerchantTypeDaoImpl extends BaseDaoImpl<MerchantType, String>
		implements MerchantTypeDao {

	@Override
	public int updateDefault(Map<String, Object> paramMap, String id) {
		String defaultStatement = MerchantType.class.getName()
				+ "Mapper.updateDefault";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("id", id);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().update(
				defaultStatement, parameter);
	}
}
