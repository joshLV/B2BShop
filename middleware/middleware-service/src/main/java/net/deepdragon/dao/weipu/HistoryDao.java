package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.Goods;
import net.deepdragon.entity.weipu.History;

import java.util.List;
import java.util.Map;

public interface HistoryDao extends BaseDao<History, String> {
	/**
	 * 
	 * @param paramMap
	 * @param memberId
	 *            会员id
	 * @return
	 */
	List<History> getListByMemberId(Map<String, Object> paramMap, String memberId);

	/**
	 * 
	 * @param paramMap
	 * @param memberId
	 *            会员id
	 * @return
	 */
	int deleteAllByMemberId(Map<String, Object> paramMap, String memberId);

    List<Goods> getGoodsByCatelog4ViewCount(Map<String, Object> paramMap, String catelogId);
}
