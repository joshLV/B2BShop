package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.SpecificationDao;
import net.deepdragon.entity.weipu.Specification;
import net.deepdragon.util.Constant;
import net.deepdragon.util.ReflectUtils;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.Map;

/**
 * 规格定义表数据接口实现
 */
@Repository(Weipu.SIGN + "SpecificationDaoImpl")
public class SpecificationDaoImpl extends BaseDaoImpl<Specification, String>
		implements SpecificationDao {
	@Override
	public Specification save(Map<String, Object> paramMap, Specification entity) {
		String defaultStatement = Specification.class.getName() + "Mapper.save";
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
	public int update(Map<String, Object> paramMap, Specification entity) {
		String defaultStatement = Specification.class.getName()
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
		String defaultStatement = Specification.class.getName()
				+ "Mapper.delete";
		return sqlSessionTemplateFactory.getSqlSessionTemplate(
				ExecutorType.BATCH).delete(defaultStatement, id);
	}
}
