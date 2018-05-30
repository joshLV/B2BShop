package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.ActivityDecreaseamountDao;
import net.deepdragon.entity.weipu.ActivityDecreaseamount;

import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 满减活动优惠价格区间数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "ActivityDecreaseamountDaoImpl")
public class ActivityDecreaseamountDaoImpl extends BaseDaoImpl<ActivityDecreaseamount, String> implements
		ActivityDecreaseamountDao {

	@Override
	public ActivityDecreaseamount getDecreByGoodsId(Map<String, Object> paramMap, String goodsId, Double goodsPriceCount) {
		String defaultStatement = ActivityDecreaseamount.class.getName() + "Mapper.getDecreByGoodsId";

		paramMap.put("goodsId", goodsId);
		paramMap.put("goodsPriceCount", goodsPriceCount);

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(defaultStatement, paramMap);
	}
}
