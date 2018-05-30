package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.GoodsAttributeItemDao;
import net.deepdragon.entity.weipu.GoodsAttributeItem;
import net.deepdragon.util.Constant;
import net.deepdragon.util.ReflectUtils;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

/**
 * 商品分类属性项数据接口实现
*/
@Repository(Weipu.SIGN + "GoodsAttributeItemDaoImpl")
public class GoodsAttributeItemDaoImpl extends BaseDaoImpl<GoodsAttributeItem, String> implements
		GoodsAttributeItemDao {
    @Override
    public GoodsAttributeItem save(Map<String, Object> paramMap, GoodsAttributeItem entity) {
        String defaultStatement = GoodsAttributeItem.class.getName()
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
    public int delete(Map<String, Object> paramMap, String id) {
        String defaultStatement = GoodsAttributeItem.class.getName()
                + "Mapper.delete";
        return sqlSessionTemplateFactory.getSqlSessionTemplate(
                ExecutorType.BATCH).delete(defaultStatement, id);
    }

    @Override
    public int delete(Map<String, Object> paramMap, String property, Object value) {
        String defaultStatement = GoodsAttributeItem.class.getName()
                + "Mapper.deleteByProperty";

        paramMap.put("property", property);
        paramMap.put("value", value);

        return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).delete(
                defaultStatement, paramMap);
    }
}
