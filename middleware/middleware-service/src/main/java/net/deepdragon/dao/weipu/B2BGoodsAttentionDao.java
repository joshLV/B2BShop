package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.B2BGoodsAttention;

import java.util.List;
import java.util.Map;

public interface B2BGoodsAttentionDao extends BaseDao<B2BGoodsAttention, String> {
	/**
	 * 
	 * @param paramMap
	 * @param buyerId
	 *            会员id
	 * @return
	 */
	List<B2BGoodsAttention> getListByBuyerId(Map<String, Object> paramMap, String buyerId);

	/**
	 * 
	 * @param paramMap
	 * @param buyerId
	 *            会员id
	 * @return
	 */
	int deleteAllByBuyerId(Map<String, Object> paramMap, String buyerId);
}
