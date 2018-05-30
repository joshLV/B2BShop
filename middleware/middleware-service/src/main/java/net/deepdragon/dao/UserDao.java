package net.deepdragon.dao;

import net.deepdragon.entity.User;

import java.util.List;
import java.util.Map;

public interface UserDao extends BaseDao<User, String> {

	/**
	 * 批量保存角色信息
	 * 
	 * 角色ID
	 * 
	 * @param roleIds
	 *            权限集合
	 * @return
	 */
	int[] saveRelationUserRole(Map<String, Object> paramMap, String userId,
			List<String> roleIds);

	/**
	 * 根据用户名获取用户实体对象
	 * 
	 * @param userName
	 *            用户名
	 * @return
	 */
	User getUserByUserName(String userName);

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
	List<String> getRoleIdByUserId(Map<String, Object> paramMap, String userId);

	/**
	 * 删除用户角色关系
	 * 
	 * @param userId
	 *            * @param roles 角色集合
	 * @return
	 * @throws Exception
	 */
	int delRelationUserRole(Map<String, Object> paramMap, String userId);

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
