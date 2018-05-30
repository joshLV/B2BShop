package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.B2BGoodsAttention;

import java.util.List;
import java.util.Map;

/**
 * 商品关注列表数据接口
 */
public interface B2BGoodsAttentionService extends BaseService<B2BGoodsAttention, String> {
	/**
	 * 
	 * @param paramMap
	 * @param buyerId
	 *            会员ID
	 * @param buyerUserName
	 *            会员姓名
	 * @param goodsId
	 *            商品ID
	 * @return
	 * @throws Exception
	 */
	Boolean saveHistoryValues(Map<String, Object> paramMap, String buyerId, String buyerUserName, String goodsId) throws Exception;

	/**
	 *
	 * @param paramMap
	 * @param buyerId
	 *            会员ID
	 * @return
	 * @throws Exception
	 */

	List<B2BGoodsAttention> getListByBuyerId(Map<String, Object> paramMap, String buyerId) throws Exception;

	/**
	 *
	 * @param paramMap
	 * @param buyerId
	 *            会员ID
	 * @return
	 * @throws Exception
	 */
	int deleteAllByBuyerId(Map<String, Object> paramMap, String buyerId) throws Exception;
}
