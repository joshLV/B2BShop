package net.deepdragon.dao;

import net.deepdragon.entity.SystemSet;

import java.util.Map;

public interface SystemSetDao extends BaseDao<SystemSet, String> {
	
	/**
	 * 
	 * @param paramMap
	 * @return
	 */
	int deleteAll(Map<String, Object> paramMap);
}
