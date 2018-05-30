package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.GoodsAttention;

import java.util.List;
import java.util.Map;

/**
 * 商品关注列表数据接口
 */
public interface GoodsAttentionService extends BaseService<GoodsAttention, String> {
	/**
	 * 
	 * @param paramMap
	 * @param memberId
	 *            会员ID
	 * @param goodsId
	 *            商品ID
	 * @return
	 * @throws Exception
	 */
	Boolean saveHistoryValues(Map<String, Object> paramMap, String memberId, String goodsId) throws Exception;

	/**
	 * 
	 * @param paramMap
	 * @param memberId
	 *            会员ID
	 * @return
	 * @throws Exception
	 */

	List<GoodsAttention> getListByMemberId(Map<String, Object> paramMap, String memberId) throws Exception;

	/**
	 * 
	 * @param paramMap
	 * @param memberId
	 *            会员ID
	 * @return
	 * @throws Exception
	 */
	int deleteAllByMemberId(Map<String, Object> paramMap, String memberId) throws Exception;
}
