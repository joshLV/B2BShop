package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.Goods;
import net.deepdragon.entity.weipu.History;

import java.util.List;
import java.util.Map;

/**
 * 会员浏览历史表数据接口
 */
public interface HistoryService extends BaseService<History, String> {
	/**
	 * 
	 * @param paramMap
	 * @param memberId
	 *            会员ID
	 * @param goodsId
	 *            商品ID
	 * @param quantity
	 *            够买数量
	 * @return
	 * @throws Exception
	 */
	Boolean saveHistoryValues(Map<String, Object> paramMap, String memberId, String goodsId) throws Exception;

	/**
	 * 
	 * @param paramMap
	 * @param userkey
	 *            会员ID
	 * @param goodsId
	 *            商品ID
	 * @param quantity
	 *            够买数量
	 * @return
	 * @throws Exception
	 */
	Boolean saveHistoryValuesByUserKey(Map<String, Object> paramMap, String userkey, String goodsId) throws Exception;

	/**
	 * 
	 * @param paramMap
	 * @param memberId
	 *            会员ID
	 * @return
	 * @throws Exception
	 */

	List<History> getListByMemberId(Map<String, Object> paramMap, String memberId) throws Exception;

	/**
	 * 
	 * @param paramMap
	 * @param memberId
	 *            会员ID
	 * @return
	 * @throws Exception
	 */
	int deleteAllByMemberId(Map<String, Object> paramMap, String memberId) throws Exception;

	/**
	 * 根据商品分类查询浏览历史表中浏览次数最多的3个商品
	 * @param paramMap
	 * @param catelogId
	 * @return
	 * @throws Exception
	 */
    List<Goods> getGoodsByCatelog4ViewCount(Map<String, Object> paramMap, String catelogId) throws Exception;
}
