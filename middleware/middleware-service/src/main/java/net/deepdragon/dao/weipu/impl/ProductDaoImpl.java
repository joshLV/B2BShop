package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.ProductDao;
import net.deepdragon.entity.weipu.Product;
import net.deepdragon.util.Constant;
import net.deepdragon.util.ReflectUtils;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.Map;

/**
 * 单品信息表数据接口实现
 */
@Repository(Weipu.SIGN + "ProductDaoImpl")
public class ProductDaoImpl extends BaseDaoImpl<Product, String> implements
		ProductDao {

	@Override
	public Product save(Map<String, Object> paramMap, Product entity) {
		String defaultStatement = Product.class.getName() + "Mapper.save";
		// 实体类存在tenantId字段
		Field field = ReflectUtils.getFieldByFieldName(entity, Constant.TENANTID_KEY);
		if (field != null) {
			ReflectUtils.setValueByFieldName(entity, Constant.TENANTID_KEY, paramMap.get(Constant.TENANTID_KEY));
		}
		this.sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).insert(defaultStatement, entity);
		return entity;
	}
	
}
