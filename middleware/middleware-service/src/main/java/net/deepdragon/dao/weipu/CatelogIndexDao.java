package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.CatelogIndex;

import java.util.Map;

public interface CatelogIndexDao extends BaseDao<CatelogIndex, String> {
	/**
	 * 删除实体对象
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param id
	 *            PK
	 * @return 受影响的行数
	 */
	int deleteAll(Map<String, Object> paramMap);
}
