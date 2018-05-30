package net.deepdragon.service;

import net.deepdragon.entity.Permissions;

import java.util.List;
import java.util.Map;

/**
 * 权限表数据接口
 */
public interface PermissionsService extends BaseService<Permissions, String> {
	/**
	 * 保存权限信息
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param roleId
	 *            角色ID
	 * @param permissions
	 *            权限集合
	 * @return
	 * @throws Exception
	 */
	boolean saveRelationship(Map<String, Object> paramMap, String roleId,
			List<Permissions> permissions) throws Exception;

	/**
	 * 获取用户的权限信息
	 * 
	 * @param paramMap
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	List<Permissions> getList(Map<String, Object> paramMap, String userId) throws Exception;
	
}
