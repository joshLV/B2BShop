package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.FlashSaleDao;
import net.deepdragon.entity.weipu.FlashSale;
import net.deepdragon.util.Constant;
import net.deepdragon.util.ReflectUtils;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 参与活动的产品数据接口实现
 */
@Repository(Weipu.SIGN + "FlashSaleDaoImpl")
public class FlashSaleDaoImpl extends BaseDaoImpl<FlashSale, String> implements
		FlashSaleDao {

	@Override
	public int delFlashSale(Map<String, Object> paramMap, String detailId) {
		String defaultStatement = FlashSale.class.getName()
				+ "Mapper.delFlashSale";
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().delete(defaultStatement, detailId);
	}

	@Override
	public int saveFlashSale(Map<String, Object> paramMap, FlashSale entity) {
		String defaultStatement = FlashSale.class.getName() + "Mapper.save";

		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().insert(defaultStatement, entity);
	}

	@Override
	public List<Map<String, Object>> getFlashSaleGoods(Map<String, Object> paramMap,int type) {
		String defaultStatement = FlashSale.class.getName() + "Mapper.getFlashSaleGoods";
		paramMap.put("type", type);
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement,paramMap);
	}
	
	@Override
	public FlashSale get(Map<String, Object> paramMap, String id) {
		String defaultStatement = FlashSale.class.getName() + "Mapper.get";

		paramMap.put("id", id);
		return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).selectOne(defaultStatement, paramMap);
	}
	
	@Override
	public int update(Map<String, Object> paramMap, FlashSale entity) {
		String defaultStatement = FlashSale.class.getName() + "Mapper.update";
		// 实体类存在tenantId字段
		Field field = ReflectUtils.getFieldByFieldName(entity,
				"tenantId");
		if (field != null) {
			ReflectUtils.setValueByFieldName(entity, Constant.TENANTID_KEY, paramMap);
		}
		return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).update(
				defaultStatement, entity);
	}
	
	@Override
	public List<Map<String,Object>> getAllFlashSaleGoods(Map<String, Object> paramMap,int type){
		String defaultStatement = FlashSale.class.getName() + "Mapper.getAllFlashSaleGoods";
		paramMap.put("type", type);
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement,paramMap);
	}

}
