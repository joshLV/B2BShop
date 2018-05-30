package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.B2BBuyerHistory;

import java.util.List;
import java.util.Map;

/**
 * 会员浏览历史表数据接口
 */
public interface B2BBuyerHistoryService extends BaseService<B2BBuyerHistory, String> {
	/**
	 * 
	 * @param paramMap
	 * @param buyerId
	 *            会员ID
	 * @param goodsId
	 *            商品ID
	 * @return
	 * @throws Exception
	 */
	Boolean saveHistoryValues(Map<String, Object> paramMap, String buyerId, String goodsId) throws Exception;

	/**
	 * 
	 * @param paramMap
	 * @param userkey
	 *            会员ID
	 * @param goodsId
	 *            商品ID
	 * @return
	 * @throws Exception
	 */
	Boolean saveHistoryValuesByUserKey(Map<String, Object> paramMap, String userkey, String goodsId) throws Exception;

	/**
	 * 
	 * @param paramMap
	 * @param buyerId
	 *            会员ID
	 * @return
	 * @throws Exception
	 */

	List<B2BBuyerHistory> getListByBuyerId(Map<String, Object> paramMap, String buyerId) throws Exception;

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
