package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.ActivityShopDao;
import net.deepdragon.entity.weipu.ActivityShop;
import net.deepdragon.util.Constant;
import net.deepdragon.util.ReflectUtils;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

/**
 * 活动商品表数据接口实现
 */
@Repository(Weipu.SIGN + "ActivityShopDaoImpl")
public class ActivityShopDaoImpl extends BaseDaoImpl<ActivityShop, String> implements ActivityShopDao {

	@Override
	public int saveShop(Map<String, Object> paramMap, ActivityShop entity) {
		String defaultStatement = ActivityShop.class.getName() + "Mapper.save";

		// 实体类存在tenantId字段
		Field field = ReflectUtils.getFieldByFieldName(entity, Constant.TENANTID_KEY);
		if (field != null) {
			ReflectUtils.setValueByFieldName(entity, Constant.TENANTID_KEY, paramMap.get(Constant.TENANTID_KEY).toString());
		}
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().insert(defaultStatement, entity);
	}

	@Override
	public ActivityShop get(Map<String, Object> paramMap, String id) {
		String defaultStatement = ActivityShop.class.getName() + "Mapper.get";

		paramMap.put("id", id);
		return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).selectOne(defaultStatement, paramMap);
	}

	@Override
	public int update(Map<String, Object> paramMap, ActivityShop entity) {
		String defaultStatement = ActivityShop.class.getName() + "Mapper.update";
		// 实体类存在tenantId字段
		Field field = ReflectUtils.getFieldByFieldName(entity, Constant.TENANTID_KEY);
		if (field != null) {
			ReflectUtils.setValueByFieldName(entity, Constant.TENANTID_KEY, paramMap.get(Constant.TENANTID_KEY).toString());
		}
		return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).update(defaultStatement, entity);
	}
}
