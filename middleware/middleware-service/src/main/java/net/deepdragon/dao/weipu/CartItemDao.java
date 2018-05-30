package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.B2BGoodsPrice;
import net.deepdragon.entity.weipu.CartItem;

import java.util.List;
import java.util.Map;

public interface CartItemDao extends BaseDao<CartItem, String> {
	/**
	 * 
	 * @param paramMap
	 * @param memberId
	 *            会员id
	 * @return
	 */
	List<CartItem> getListByMemberId(Map<String, Object> paramMap, String memberId);

	/**
	 * 
	 * @param paramMap
	 * @param userKey
	 *            会话ID
	 * @return
	 */
	List<CartItem> getListByUserKey(Map<String, Object> paramMap, String userKey);

    /**
     * 根据条件批量删除购物车内的数据
     *
     * @param paramMap 租户Id
     * @param property 字段名
     * @param value    字段值
     *
     * @return 删除了多少条数据
     */
    int deleteBatch(Map<String, Object> paramMap, String property, Object value);

	List<CartItem> getListByMemberIdAndIds(Map<String, Object> paramMap, String memberId, List<String> ids);

	/**
	 * B2B采购商购物车
	 * @param paramMap
	 * @param buyerId
	 * @return
	 */
	List<CartItem> getListByBuyerId(Map<String, Object> paramMap, String buyerId);

	/**
	 * B2B 商品批发价
	 * @param goodsId
	 * @param quantity
	 * @return
	 */
	List<B2BGoodsPrice> getGoodsTradePrice(Map<String, Object> paramMap,String goodsId, Integer quantity);


	/**
	 * 根据购物车ID集合删除购物车内的数据
	 *
	 * @param paramMap 租户Id
	 * @param ids    购物车ID集合
	 *
	 * @return 删除了多少条数据
	 */
	int deleteByIds(Map<String, Object> paramMap, List<String> ids);

	/**
	 * 根据购物车ID获取商品信息
	 * @param paramMap
	 * @param ids
     * @return
     */
	public List<Map<String, Object>> getBuyGoodsByIds(Map<String, Object> paramMap, List<String> ids);

	/**
	 * 根据购物车ID获取购物车ID和商品ID
	 * @param paramMap
	 * @param ids
	 * @return
	 */
    List<CartItem> getIdAndGoodsIdByMemberIdAndIds(Map<String, Object> paramMap, String memberId, List<String> ids);
}
