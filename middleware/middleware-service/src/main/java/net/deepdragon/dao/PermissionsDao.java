package net.deepdragon.dao;

import net.deepdragon.entity.Permissions;

import java.util.List;
import java.util.Map;

public interface PermissionsDao extends BaseDao<Permissions, String> {
	/**
	 * 批量保存权限信息
	 * 
	 * @param roleId
	 *            角色ID
	 * @param permissions
	 *            权限集合
	 * @return
	 */
	int[] saveRelationship(Map<String, Object> paramMap, String roleId,
			List<Permissions> permissions);

	int deleteRelationship(Map<String, Object> paramMap, String roleId);
	
	List<Permissions> getList(Map<String, Object> paramMap, String userId);
	
}
