package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.MerchantUser;

import java.util.Map;

public interface MerchantUserDao extends BaseDao<MerchantUser, String> {
	/**
	 * 修改用户密码
	 * 
	 * @param paramMap
	 * @param userId
	 * @param passwd
	 * @return
	 */
	int updatePasswd(Map<String, Object> paramMap, String userId, String passwd);
}
