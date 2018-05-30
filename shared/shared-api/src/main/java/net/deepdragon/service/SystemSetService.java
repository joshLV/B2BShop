package net.deepdragon.service;

import net.deepdragon.entity.SystemSet;

import java.util.List;
import java.util.Map;

/**
 * 系统设置数据接口
 */
public interface SystemSetService extends BaseService<SystemSet, String> {
	
	/**
	 * 更新系统设置项
	 * @param paramMap
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	boolean updateSystemSet(Map<String, Object> paramMap, List<SystemSet> entity)
			throws Exception;
}
