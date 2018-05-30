package net.deepdragon.service;

import net.deepdragon.entity.Area;

import java.util.Map;

/**
 * 地区信息表数据接口
*/
public interface AreaService extends BaseService<Area, String> {

	public Area save(Map<String, Object> paramMap, Area entity, Area parent) throws Exception;
	
}
