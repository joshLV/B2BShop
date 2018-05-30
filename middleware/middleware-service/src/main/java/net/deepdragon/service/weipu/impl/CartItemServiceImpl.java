package net.deepdragon.service.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.CartItemDao;
import net.deepdragon.dao.weipu.GoodsDao;
import net.deepdragon.entity.weipu.B2BGoodsPrice;
import net.deepdragon.entity.weipu.CartItem;
import net.deepdragon.entity.weipu.Goods;
import net.deepdragon.service.weipu.CartItemService;
import net.deepdragon.util.Constant;
import net.deepdragon.util.StringUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN + "CartItemServiceImpl")
public class CartItemServiceImpl extends BaseServiceImpl<CartItem, String>
		implements CartItemService {



	@Resource(name = Weipu.SIGN
			+ "CartItemDaoImpl")
	private CartItemDao cartItemDao;
	@Resource(name = Weipu.SIGN + "GoodsDaoImpl")
	private GoodsDao goodsDao;

	@Override
	public BaseDao<CartItem, String> getBaseDao() {
		return this.cartItemDao;
	}

	@Override
	public Boolean saveCartItemValues(Map<String, Object> paramMap, String memberId,
									  String goodsId, String shopId, int quantity, String specification) throws Exception {
		try {
			CartItem ci = new CartItem();
			ci.setMemberId(memberId);
			ci.setCreateUser(memberId);
			ci.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
			ci.setQuantity(quantity);
			ci.setGoodsId(goodsId);
			ci.setMerchantId(shopId);

			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("memberId", memberId));
			criteria.add(Restrictions.eq("goodsId", goodsId));
			List<CartItem> list = cartItemDao.getList(paramMap, criteria);
			if (list != null && list.size() > 0) {
				CartItem cartItem = list.get(0);
				int newQuantity = cartItem.getQuantity() + quantity;

				//组装规格值
				cartItem.setSpecification(installSp(cartItem.getSpecification(), specification, cartItem.getQuantity(), quantity));
				cartItem.setQuantity(newQuantity);
				cartItem.setMerchantId(ci.getMerchantId());
				cartItemDao.update(paramMap, cartItem);
			} else {

				//组装规格值
				ci.setSpecification(specification);
				cartItemDao.save(paramMap, ci);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 组装 规格
	 * @param oldSp
	 * @param newSp
	 * @param oldQuantity
	 * @param newQuantity
	 * @return
	 */
	private String installSp(String oldSp, String newSp, int oldQuantity, int newQuantity){
		if( StringUtil.isNotEmpty(oldSp) ){

			//规格中已存在新添加的规格
			if( oldSp.contains( newSp ) ){
				StringBuilder specifucation = new StringBuilder();
				//如果存在，且不是最后一个，更新数量
				if( oldSp.contains( "("+newSp+")X" ) ){
					if( oldSp.indexOf("("+newSp+")X") == 0){
						specifucation.append( "(" ).append(newSp).append(")X").append( Integer.parseInt( oldSp.substring(oldSp.indexOf("X")+1, oldSp.indexOf(";")))  + newQuantity);
						specifucation.append( oldSp.substring(oldSp.indexOf(";")) );
					}else{
						//获取数量
						String[] sps = oldSp.split("("+newSp+")X");
						String[] sps1 = sps[1].split(";");
						specifucation.append(sps[0]).append (Integer.parseInt(sps1[0]) + oldQuantity).append(";");

						//拼接后面的规格
						for(int i = 1;i < sps1.length; i++ ){
							specifucation.append( sps1[i] );
							if( i != sps1.length-1){
								specifucation.append(";");
							}
						}
					}
 				}else{//是最后一个
					specifucation.append(oldSp);
				}

				return specifucation.toString();
			}else{//规格中不存在新添加的规格

				//已有多种规格
				if( oldSp.indexOf(")X") > 0 ){

					int count = 0;
					String[] sps = oldSp.split(";");
					StringBuilder specifucation = new StringBuilder();
					for(int i = 0; i< sps.length; i++){
						String sp = sps[i];
						if( i != 0 ){
							specifucation.append(";");
						}
						if( i < sps.length-1 ) {
							count += Integer.parseInt(sp.substring(sp.lastIndexOf("X") + 1));
						}
						specifucation.append(sp);
					}
					specifucation.append("X").append( oldQuantity - count );
					return specifucation + ";(" + newSp + ")";
				}else{//只有一种规格
					return "("+ oldSp + ")X"+ oldQuantity + ";(" + newSp +")";
				}
			}

		}else{
			return newSp;
		}
	}

	@Override
	public Boolean saveCartItemValuesByUserKey(Map<String, Object> paramMap, String userkey,
											   String goodsId, String shopId, int quantity, String specification) throws Exception {
		try {
			CartItem ci = new CartItem();
			ci.setUserkey(userkey);
			ci.setCreateUser(userkey);
			ci.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
			ci.setQuantity(quantity);
			ci.setGoodsId(goodsId);
			ci.setMerchantId(shopId);
			ci.setSpecification(specification);
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("userkey", userkey));
			criteria.add(Restrictions.eq("goodsId", goodsId));
			List<CartItem> list = cartItemDao.getList(paramMap, criteria);
			if (list != null && list.size() > 0) {
				CartItem cartItem = list.get(0);

				//组装规格值
				cartItem.setSpecification(installSp(cartItem.getSpecification(), specification, cartItem.getQuantity(), quantity));
				int newQuantity = cartItem.getQuantity() + quantity;
				cartItem.setQuantity(newQuantity);
				cartItemDao.update(paramMap, cartItem);
			} else {
				//组装规格值
				ci.setSpecification(specification);
				cartItemDao.save(paramMap, ci);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List<CartItem> getListByMemberId(Map<String, Object> paramMap, String memberId)
			throws Exception {
		return cartItemDao.getListByMemberId(paramMap, memberId);
	}

	@Override
	public List<CartItem> getListByUserKey(Map<String, Object> paramMap, String userKey)
			throws Exception {
		return cartItemDao.getListByUserKey(paramMap, userKey);
	}

	@Override
	public List<CartItem> getListByMemberIdAndIds(Map<String, Object> paramMap, String memberId, List<String> ids) throws Exception {
		return cartItemDao.getListByMemberIdAndIds(paramMap, memberId, ids);
	}

	@Override
	public List<CartItem> getIdAndGoodsIdByMemberIdAndIds(Map<String, Object> paramMap, String memberId,List<String> ids) throws Exception{
		return cartItemDao.getIdAndGoodsIdByMemberIdAndIds(paramMap, memberId, ids);
	}

	@Override
	public List<B2BGoodsPrice> getGoodsTradePrice(Map<String, Object> paramMap,String goodsId, Integer quantity) throws Exception {
		return cartItemDao.getGoodsTradePrice(paramMap,goodsId, quantity);
	}


	@Override
	public Boolean saveCartItemValues4B2B(Map<String, Object> paramMap, String buyerId, String parentBuyerId, String goodsId, String shopId, int quantity, String specification) throws Exception {
		try {
			CartItem ci = new CartItem();
			ci.setMemberId(buyerId);
			ci.setCreateUser(buyerId);
			ci.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
			ci.setQuantity(quantity);
			ci.setGoodsId(goodsId);
			ci.setMerchantId(shopId);
			ci.setParentBuyerId( parentBuyerId );

			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("memberId", buyerId));
			criteria.add(Restrictions.eq("goodsId", goodsId));
			List<CartItem> list = cartItemDao.getList(paramMap, criteria);
			if (list != null && list.size() > 0) {
				CartItem cartItem = list.get(0);
				int newQuantity = cartItem.getQuantity() + quantity;

				/** 添加数量校验：大于等于起批数量 小于等于限购数量， 且是 包装系数的倍数 TianYu 2016-3-14 10:34:57 Start **/
				Goods goods = this.goodsDao.get(paramMap, cartItem.getGoodsId());
				//如果小于起批数量， 数量 = 起批数量
				if( newQuantity < goods.getStartNum()  ){
					newQuantity = goods.getStartNum();
				}

				//如果存在限购数量，数量必须小于等于限购数量
				if( goods.getLimitNum() != 0 && newQuantity > goods.getLimitNum()){
					newQuantity = goods.getLimitNum();
				}

				//如果数量不是包装系数的整数倍，修改为最接近的较小整数倍
				if( newQuantity % goods.getPackageModulus() != 0 ){
					if(newQuantity / goods.getPackageModulus() *  goods.getPackageModulus() < goods.getStartNum() ){
						newQuantity = (newQuantity / goods.getPackageModulus() + 1) * goods.getPackageModulus();
					}else {
						newQuantity = newQuantity / goods.getPackageModulus() * goods.getPackageModulus();
					}
				}
				/** 添加数量校验：大于等于起批数量 小于等于限购数量， 且是 包装系数的倍数 TianYu 2016-3-14 10:34:57 End **/

				//组装规格值
				cartItem.setSpecification(installSp(cartItem.getSpecification(), specification, cartItem.getQuantity(), quantity));
				cartItem.setQuantity(newQuantity);
				cartItem.setMerchantId(ci.getMerchantId());
				cartItemDao.update(paramMap, cartItem);
			} else {

				//组装规格值
				ci.setSpecification(specification);

				/** 添加数量校验：大于等于起批数量 小于等于限购数量， 且是 包装系数的倍数 TianYu 2016-3-14 10:34:57 Start **/
				Goods goods = this.goodsDao.get(paramMap, ci.getGoodsId());
				int newQuantity = ci.getQuantity();
				//如果小于起批数量， 数量 = 起批数量
				if( newQuantity < goods.getStartNum()  ){
					newQuantity = goods.getStartNum();
				}

				//如果存在限购数量，数量必须小于等于限购数量
				if( goods.getLimitNum() != 0 && newQuantity > goods.getLimitNum()){
					newQuantity = goods.getLimitNum();
				}

				//如果数量不是包装系数的整数倍，修改为最接近的较小整数倍
				if( newQuantity % goods.getPackageModulus() != 0 ){
					if(newQuantity / goods.getPackageModulus() *  goods.getPackageModulus() < goods.getStartNum() ){
						newQuantity = (newQuantity / goods.getPackageModulus() + 1) * goods.getPackageModulus();
					}else {
						newQuantity = newQuantity / goods.getPackageModulus() * goods.getPackageModulus();
					}

				}
				ci.setQuantity(newQuantity);
				/** 添加数量校验：大于等于起批数量 小于等于限购数量， 且是 包装系数的倍数 TianYu 2016-3-14 10:34:57 End **/

				cartItemDao.save(paramMap, ci);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List<CartItem> getListByBuyerId(Map<String, Object> paramMap, String buyerId) throws Exception {
		return cartItemDao.getListByBuyerId(paramMap, buyerId);
	}

	@Override
	public List<Map<String, Object>> getBuyGoodsByIds(Map<String, Object> paramMap, List<String> ids) throws Exception {
		return cartItemDao.getBuyGoodsByIds(paramMap, ids);
	}


	/**
	 * 批量删除购物车商品
	 * @param paramMap
	 * @param cartItemIds
	 * @throws Exception
	 */
	public int deleteByIds(Map<String, Object> paramMap, List<String> cartItemIds) throws Exception {
		return cartItemDao.deleteByIds(paramMap, cartItemIds);
	}
}
