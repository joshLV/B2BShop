package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.B2BBuyerHistory;

import java.util.List;
import java.util.Map;

public interface B2BBuyerHistoryDao extends BaseDao<B2BBuyerHistory, String> {
	/**
	 * 
	 * @param paramMap
	 * @param buyerId
	 *            会员id
	 * @return
	 */
	List<B2BBuyerHistory> getListByBuyerId(Map<String, Object> paramMap, String buyerId);

	/**
	 * 
	 * @param paramMap
	 * @param buyerId
	 *            会员id
	 * @return
	 */
	int deleteAllByBuyerId(Map<String, Object> paramMap, String buyerId);

}
