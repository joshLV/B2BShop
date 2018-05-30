package net.deepdragon.service;

import net.deepdragon.entity.User;

import java.util.List;
import java.util.Map;

/**
 * 用户表数据接口
 */
public interface UserService extends BaseService<User, String> {

	/**
	 * 根据用户名获取用户实体对象
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param userName
	 *            用户名
	 * @return
	 * @throws Exception
	 */
	User getUserByUserName(Map<String, Object> paramMap, String userName) throws Exception;

	/**
	 * 保存用户角色关系
	 * 
	 * @param userId
	 *            * @param roles 角色集合
	 * @return
	 * @throws Exception
	 */
	boolean saveRelationUserRole(Map<String, Object> paramMap, String userId,
			List<String> roleIds) throws Exception;

	/**
	 * 根据用户id获取角色实体对象
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param userId
	 *            用户ID
	 * @return
	 * @throws Exception
	 */
	List<String> getRoleIdByUserId(Map<String, Object> paramMap, String userId)
			throws Exception;

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
