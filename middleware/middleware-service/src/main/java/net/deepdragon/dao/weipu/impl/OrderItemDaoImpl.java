package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.OrderItemDao;
import net.deepdragon.entity.weipu.OrderItem;
import net.deepdragon.mybatis.domain.PageBounds;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 订单(购物)明细数据接口实现
*/
@Repository(Weipu.SIGN + "OrderItemDaoImpl")
public class OrderItemDaoImpl extends BaseDaoImpl<OrderItem, String> implements OrderItemDao {

    /**
     * 删除订单里的商品项对象
     *
     * @param paramMap 租户ID
     * @param property 字段名称
     * @param value    字段值
     * @param isBatch  是否采用批量模式操作
     *
     * @return 受影响的行数
     */
    public int deleteOrderItems(Map<String, Object> paramMap, String property, Object value, boolean isBatch) {
        String defaultStatement = OrderItem.class.getName() + "Mapper.deleteByProperty";

		paramMap.put("property", property);
		paramMap.put("value", value);
        if (isBatch) {
            return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).delete(defaultStatement, paramMap);
        } else {
            return sqlSessionTemplateFactory.getSqlSessionTemplate().delete(defaultStatement, paramMap);
        }
    }

	@Override
	public List<OrderItem> getExportList(Map<String, Object> paramMap, Criteria criteria) {
		String defaultStatement = OrderItem.class.getName() + "Mapper.getExportList";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
                defaultStatement, criteria);
	}

    @Override
    public List<OrderItem> getOrderItemPager(Map<String, Object> paramMap, Criteria
            criteria, PageBounds pageBounds) {
        String defaultStatement = OrderItem.class.getName()+
                "Mapper.getOrderItemPager";

        return this.sqlSessionTemplateFactory.getSqlSessionTemplate()
                .selectList(defaultStatement, criteria, pageBounds);
    }

	@Override
	public List<Map<String, Object>> getBestSellersGoodsByTime(Map<String, Object> paramMap,
			String start, String end, int num) {
		String defaultStatement = OrderItem.class.getName() + "Mapper.getBestSellersGoodsByTime";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("start", start);
		parameter.put("end", end);
		parameter.put("num", num);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}

	@Override
	public List<Map<String, Object>> getDullSellersGoodsByTime(Map<String, Object> paramMap,
			String start, String end, int num) {
		String defaultStatement = OrderItem.class.getName() + "Mapper.getDullSellersGoodsByTime";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("start", start);
		parameter.put("end", end);
		parameter.put("num", num);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}

	@Override
	public List<Map<String, Object>> getCrossBorderItemList(Map<String, Object> paramMap, Criteria criteria) {
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(OrderItem.class.getName() + "Mapper.getCrossBorderItemList", criteria);
	}

	public List<OrderItem> getPagerItemsGpGoodsId(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) {
		String defaultStatement = OrderItem.class.getName() + "Mapper.getPagerItemsGpGoodsId";

		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
	}


}
