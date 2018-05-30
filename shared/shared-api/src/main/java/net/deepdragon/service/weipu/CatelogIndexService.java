package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.CatelogIndex;

import java.util.List;
import java.util.Map;

/**
 * 首页商品类目数据接口
 */
public interface CatelogIndexService extends BaseService<CatelogIndex, String> {

	/**
	 * 保存商品相关的一系列东西
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param goodsMap
	 *            商品相关数据
	 */
	boolean saveCatelogIndexs(Map<String, Object> paramMap, List<CatelogIndex> list)
			throws Exception;

}
