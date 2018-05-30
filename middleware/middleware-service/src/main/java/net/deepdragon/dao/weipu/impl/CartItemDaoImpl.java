package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.CartItemDao;
import net.deepdragon.entity.weipu.B2BGoodsPrice;
import net.deepdragon.entity.weipu.CartItem;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 购物车项数据接口实现
 */
@Repository(Weipu.SIGN + "CartItemDaoImpl")
public class CartItemDaoImpl extends BaseDaoImpl<CartItem, String> implements CartItemDao {

    @Override
    public List<CartItem> getListByMemberId(Map<String, Object> paramMap, String memberId) {
        String defaultStatement = CartItem.class.getName() + "Mapper.getListByMemberId";
        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, memberId);
    }

    @Override
    public List<CartItem> getListByUserKey(Map<String, Object> paramMap, String userKey) {
        String defaultStatement = CartItem.class.getName() + "Mapper.getListByUserKey";
        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, userKey);
    }

    /**
     * 根据条件批量删除购物车内的数据
     *
     * @param paramMap 租户Id
     * @param property 字段名
     * @param value    字段值
     *
     * @return 删除了多少条数据
     */
    public int deleteBatch(Map<String, Object> paramMap, String property, Object value) {
        String defaultStatement = CartItem.class.getName() + "Mapper.deleteByProperty";

        paramMap.put("property", property);
        paramMap.put("value", value);

        return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).delete(defaultStatement, paramMap);
    }

    @Override
    public List<CartItem> getListByMemberIdAndIds(Map<String, Object> paramMap, String memberId, List<String> ids) {
        String defaultStatement = CartItem.class.getName() + "Mapper.getListByMemberIdAndIds";

        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("memberId", memberId);
        parameter.put("ids", ids);

        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
    }

    @Override
    public List<CartItem> getListByBuyerId(Map<String, Object> paramMap, String buyerId) {
        String defaultStatement = CartItem.class.getName() + "Mapper.getListByMemberId";
        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, buyerId);
    }

    @Override
    public List<B2BGoodsPrice> getGoodsTradePrice(Map<String, Object> paramMap, String goodsId, Integer quantity) {
        String defaultStatement = CartItem.class.getName() + "Mapper.getGoodsTradePrice";

        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("goodsId", goodsId);
        parameter.put("quantity", quantity);

        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
    }


    @Override
    public int deleteByIds(Map<String, Object> paramMap, List<String> ids){
        String defaultStatement = CartItem.class.getName() + "Mapper.deleteByIds";

        paramMap.put("ids", ids);

        return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).delete(defaultStatement, paramMap);
    }

    @Override
    public List<Map<String, Object>> getBuyGoodsByIds(Map<String, Object> paramMap, List<String> ids) {
        String defaultStatement = CartItem.class.getName() + "Mapper.getBuyGoodsByIds";

        paramMap.put("ids", ids);

        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
    }

    @Override
    public List<CartItem> getIdAndGoodsIdByMemberIdAndIds(Map<String, Object> paramMap, String memberId, List<String> ids) {
        String defaultStatement = CartItem.class.getName() + "Mapper.getIdAndGoodsIdByMemberIdAndIds";

        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("memberId", memberId);
        parameter.put("ids", ids);

        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
    }
}
