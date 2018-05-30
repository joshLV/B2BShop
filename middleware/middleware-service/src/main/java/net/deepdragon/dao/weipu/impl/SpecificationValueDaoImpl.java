package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.SpecificationValueDao;
import net.deepdragon.entity.weipu.SpecificationValue;
import net.deepdragon.util.Constant;
import net.deepdragon.util.ReflectUtils;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.Map;

/**
 * 商品规格项数据接口实现
 */
@Repository(Weipu.SIGN
		+ "SpecificationValueDaoImpl")
public class SpecificationValueDaoImpl extends
		BaseDaoImpl<SpecificationValue, String> implements
		SpecificationValueDao {
	@Override
	public SpecificationValue save(Map<String, Object> paramMap, SpecificationValue entity) {
		String defaultStatement = SpecificationValue.class.getName()
				+ "Mapper.save";
		// 实体类存在tenantId字段
		Field field = ReflectUtils.getFieldByFieldName(entity, Constant.TENANTID_KEY);
		if (field != null) {
			ReflectUtils.setValueByFieldName(entity, Constant.TENANTID_KEY, paramMap.get(Constant.TENANTID_KEY).toString());
		}
		this.sqlSessionTemplateFactory
				.getSqlSessionTemplate(ExecutorType.BATCH).insert(
						defaultStatement, entity);
		return entity;
	}

	@Override
	public int update(Map<String, Object> paramMap, SpecificationValue entity) {
		String defaultStatement = SpecificationValue.class.getName()
				+ "Mapper.update";
		// 实体类存在tenantId字段
		Field field = ReflectUtils.getFieldByFieldName(entity, Constant.TENANTID_KEY);
		if (field != null) {
			ReflectUtils.setValueByFieldName(entity, Constant.TENANTID_KEY, paramMap.get(Constant.TENANTID_KEY).toString());
		}
		return sqlSessionTemplateFactory.getSqlSessionTemplate(
				ExecutorType.BATCH).update(defaultStatement, entity);
	}

	@Override
	public int delete(Map<String, Object> paramMap, String id) {
		String defaultStatement = SpecificationValue.class.getName()
				+ "Mapper.delete";
		return sqlSessionTemplateFactory.getSqlSessionTemplate(
				ExecutorType.BATCH).delete(defaultStatement, id);
	}
	
	@Override
	public int delete(Map<String, Object> paramMap, String property, Object value) {
		String defaultStatement = SpecificationValue.class.getName()
				+ "Mapper.deleteByProperty";

		paramMap.put("property", property);
		paramMap.put("value", value);

		return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).delete(
				defaultStatement, paramMap);
	}

    @Override
    public SpecificationValue getSpBatch(Map<String, Object> paramMap, String id) {
        String defaultStatement = SpecificationValue.class.getName() + "Mapper.get";

		paramMap.put("id", id);

        return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).selectOne(defaultStatement, paramMap);
    }
}
