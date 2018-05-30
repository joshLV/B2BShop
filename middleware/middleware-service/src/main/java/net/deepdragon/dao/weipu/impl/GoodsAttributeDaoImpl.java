package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.GoodsAttributeDao;
import net.deepdragon.entity.weipu.GoodsAttribute;
import net.deepdragon.util.Constant;
import net.deepdragon.util.ReflectUtils;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.Map;

/**
 * 商品分类属性数据接口实现
*/
@Repository(Weipu.SIGN + "GoodsAttributeDaoImpl")
public class GoodsAttributeDaoImpl extends BaseDaoImpl<GoodsAttribute, String> implements
        GoodsAttributeDao {
    @Override
    public GoodsAttribute save(Map<String, Object> paramMap, GoodsAttribute entity) {
        String defaultStatement = GoodsAttribute.class.getName() + "Mapper.save";
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
    public int update(Map<String, Object> paramMap, GoodsAttribute entity) {
        String defaultStatement = GoodsAttribute.class.getName()
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
        String defaultStatement = GoodsAttribute.class.getName()
                + "Mapper.delete";
        return sqlSessionTemplateFactory.getSqlSessionTemplate(
                ExecutorType.BATCH).delete(defaultStatement, id);
    }
}
