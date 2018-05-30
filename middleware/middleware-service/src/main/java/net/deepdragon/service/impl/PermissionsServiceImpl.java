package net.deepdragon.service.impl;

import net.deepdragon.constant.Shared;
import net.deepdragon.dao.BaseDao;
import net.deepdragon.dao.PermissionsDao;
import net.deepdragon.entity.Permissions;
import net.deepdragon.service.PermissionsService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Shared.SIGN + "PermissionsServiceImpl")
public class PermissionsServiceImpl extends
		BaseServiceImpl<Permissions, String> implements PermissionsService {

	@Resource(name = Shared.SIGN + "PermissionsDaoImpl")
	private PermissionsDao permissionsDao;

	@Override
	public BaseDao<Permissions, String> getBaseDao() {
		return permissionsDao;
	}

	@Override
	public boolean saveRelationship(Map<String, Object> paramMap, String roleId,
			List<Permissions> permissions) throws Exception {
		try {
			// 清除角色历史权限信息
			this.permissionsDao.deleteRelationship(paramMap, roleId);
			// 保存权限数据
			if (CollectionUtils.isNotEmpty(permissions)) {
				this.permissionsDao.saveRelationship(paramMap, roleId,
						permissions);
			}
			return true;
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<Permissions> getList(Map<String, Object> paramMap, String userId)
			throws Exception {
		try {
			return this.permissionsDao.getList(paramMap, userId);
		} catch (Exception e) {
			throw e;
		}
	}

}
