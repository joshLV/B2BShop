package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.MerchantUser;

import java.util.Map;

/**
 * 店铺操作员数据接口
*/
public interface MerchantUserService extends BaseService<MerchantUser, String> {
	/**
	 * 修改用户密码
	 * 
	 * @param paramMap
	 * @param userId
	 * @param passwd
	 * @return
	 * @throws Exception
	 */
	int updatePasswd(Map<String, Object> paramMap, String userId, String passwd)
			throws Exception;

}
