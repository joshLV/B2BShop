package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.GoodsImagesDao;
import net.deepdragon.entity.weipu.GoodsImages;
import net.deepdragon.util.Constant;
import net.deepdragon.util.ReflectUtils;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.Map;

/**
 * 商品图片表数据接口实现
 */
@Repository(Weipu.SIGN + "GoodsImagesDaoImpl")
public class GoodsImagesDaoImpl extends BaseDaoImpl<GoodsImages, String>
		implements GoodsImagesDao {

	@Override
	public GoodsImages save(Map<String, Object> paramMap, GoodsImages entity) {
		String defaultStatement = GoodsImages.class.getName() + "Mapper.save";
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

}
