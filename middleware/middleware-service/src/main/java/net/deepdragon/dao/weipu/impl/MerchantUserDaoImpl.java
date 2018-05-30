package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.MerchantUserDao;
import net.deepdragon.entity.weipu.MerchantUser;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

/**
 * 店铺操作员数据接口实现
*/
@Repository(Weipu.SIGN + "MerchantUserDaoImpl")
public class MerchantUserDaoImpl extends BaseDaoImpl<MerchantUser, String> implements
		MerchantUserDao {
	@Override
	public int updatePasswd(Map<String, Object> paramMap, String userId, String passwd) {
		String defaultStatement = MerchantUser.class.getName() + "Mapper.updatePasswd";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("userId", userId);
		parameter.put("passwd", passwd);
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().delete(
				defaultStatement, parameter);
	}
}
