package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.GoodsAttention;

import java.util.List;
import java.util.Map;

public interface GoodsAttentionDao extends BaseDao<GoodsAttention, String> {
	/**
	 * 
	 * @param paramMap
	 * @param memberId
	 *            会员id
	 * @return
	 */
	List<GoodsAttention> getListByMemberId(Map<String, Object> paramMap, String memberId);

	/**
	 * 
	 * @param paramMap
	 * @param memberId
	 *            会员id
	 * @return
	 */
	int deleteAllByMemberId(Map<String, Object> paramMap, String memberId);
}
