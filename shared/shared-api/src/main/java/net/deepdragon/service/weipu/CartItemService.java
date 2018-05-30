package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.B2BGoodsPrice;
import net.deepdragon.entity.weipu.CartItem;

import java.util.List;
import java.util.Map;

/**
 * 购物车项数据接口
 */
public interface CartItemService extends BaseService<CartItem, String> {
	/**
	 *  @param paramMap
	 * @param memberId
	 *            会员ID
	 * @param goodsId
	 *            商品ID
	 * @param shopId 商家ID
	 * @param quantity
	 *            够买数量  @return
	 * @param specification 规格
	 * @throws Exception
	 */
	Boolean saveCartItemValues(Map<String, Object> paramMap, String memberId,
							   String goodsId, String shopId, int quantity, String specification) throws Exception;

	/**
	 *  @param paramMap
	 * @param buyerId
	 *            采购商ID
	 * @param parentBuyerId
	 *            如果是操作员登录，保存其管理员ID
	 * @param goodsId
	 *            商品ID
	 * @param shopId 商家ID
	 * @param quantity
	 *            够买数量  @return
	 * @param specification 规格
	 * @throws Exception
	 */
	Boolean saveCartItemValues4B2B(Map<String, Object> paramMap, String buyerId, String parentBuyerId, String goodsId, String shopId, int quantity, String specification) throws Exception;

	/**
	 *  @param paramMap
	 * @param userkey
	 *            会员ID
	 * @param goodsId
 *            商品ID
	 * @param shopId 商家ID
	 * @param quantity
*            够买数量  @return
	 * @param specification 规格
	 * @throws Exception
	 */
	Boolean saveCartItemValuesByUserKey(Map<String, Object> paramMap, String userkey,
										String goodsId, String shopId, int quantity, String specification) throws Exception;

	/**
	 * 
	 * @param paramMap
	 * @param memberId
	 *            会员ID
	 * @return
	 * @throws Exception
	 */

	List<CartItem> getListByMemberId(Map<String, Object> paramMap, String memberId)
			throws Exception;

	/**
	 *
	 * @param paramMap
	 * @param buyerId
	 *            采购商ID
	 * @return
	 * @throws Exception
	 */

	List<CartItem> getListByBuyerId(Map<String, Object> paramMap, String buyerId)
			throws Exception;

	/**
	 * 
	 * @param paramMap
	 * @param userKey
	 *            会话ID
	 * @return
	 * @throws Exception
	 */

	List<CartItem> getListByUserKey(Map<String, Object> paramMap, String userKey)
			throws Exception;


	List<CartItem> getListByMemberIdAndIds(Map<String, Object> paramMap, String memberId,List<String> ids)
			throws Exception;


	List<CartItem> getIdAndGoodsIdByMemberIdAndIds(Map<String, Object> paramMap, String memberId,List<String> ids) throws Exception;

	/**
	 * @param goodsId
	 * @param quantity
	 *            根据 商品ID 和 批发数量 查询 对应阶梯的批发价
	 * @return
	 * @throws Exception
	 */
	List<B2BGoodsPrice> getGoodsTradePrice(Map<String, Object> paramMap,String goodsId,Integer quantity)
			throws Exception;

	/**
	 * 根据购物车ID获取商品信息
	 * @param paramMap
	 * @param ids
	 * @return
	 */
	public List<Map<String, Object>> getBuyGoodsByIds(Map<String, Object> paramMap, List<String> ids) throws Exception;


	/**
	 * 批量删除购物车商品
	 * @param paramMap
	 * @param cartItemIds
	 * @throws Exception
	 */
	public int deleteByIds(Map<String, Object> paramMap, List<String> cartItemIds) throws Exception;
}
