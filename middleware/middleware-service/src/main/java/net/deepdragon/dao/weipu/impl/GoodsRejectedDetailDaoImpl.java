package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.GoodsRejectedDetailDao;
import net.deepdragon.entity.weipu.GoodsRejectedDetail;
import net.deepdragon.util.Constant;
import net.deepdragon.util.ReflectUtils;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.Map;

/**
 * wp_goods_rejected_detail数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "GoodsRejectedDetailDaoImpl")
public class GoodsRejectedDetailDaoImpl extends BaseDaoImpl<GoodsRejectedDetail, String> implements
		GoodsRejectedDetailDao {

	@Override
	public Object saveGoodsRejectedDetail(Map<String, Object> paramMap, GoodsRejectedDetail entity) {
		String defaultStatement = GoodsRejectedDetail.class.getName() + "Mapper.save";
		// 实体类存在tenantId字段
		Field field = ReflectUtils.getFieldByFieldName(entity, "tenantId");
		if (field != null) {
			ReflectUtils.setValueByFieldName(entity, "tenantId", paramMap.get(Constant.TENANTID_KEY));
		}
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).insert(defaultStatement, entity);
	}
}
