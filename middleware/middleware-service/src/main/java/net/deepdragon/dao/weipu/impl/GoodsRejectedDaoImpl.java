package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.GoodsRejectedDao;
import net.deepdragon.entity.weipu.GoodsRejected;
import net.deepdragon.util.Constant;
import net.deepdragon.util.ReflectUtils;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.Map;

/**
 * wp_goods_rejected数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "GoodsRejectedDaoImpl")
public class GoodsRejectedDaoImpl extends BaseDaoImpl<GoodsRejected, String> implements
		GoodsRejectedDao {

	@Override
	public Object saveGoodsRejected(Map<String, Object> paramMap, GoodsRejected entity) {
		String defaultStatement = GoodsRejected.class.getName() + "Mapper.save";
		// 实体类存在tenantId字段
		Field field = ReflectUtils.getFieldByFieldName(entity, "tenantId");
		if (field != null) {
			ReflectUtils.setValueByFieldName(entity, "tenantId", paramMap.get(Constant.TENANTID_KEY));
		}
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).insert(defaultStatement, entity);
	}
}
