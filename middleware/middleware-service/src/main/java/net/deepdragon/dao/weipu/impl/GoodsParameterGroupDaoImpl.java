package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.GoodsParameterGroupDao;
import net.deepdragon.entity.weipu.GoodsParameterGroup;
import net.deepdragon.util.Constant;
import net.deepdragon.util.ReflectUtils;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.Map;

/**
 * 商品参数分组表数据接口实现
*/
@Repository(Weipu.SIGN + "GoodsParameterGroupDaoImpl")
public class GoodsParameterGroupDaoImpl extends BaseDaoImpl<GoodsParameterGroup, String> implements GoodsParameterGroupDao {

    @Override
    public int update(Map<String, Object> paramMap, GoodsParameterGroup entity) {
        String defaultStatement = GoodsParameterGroup.class.getName() + "Mapper.update";
        // 实体类存在tenantId字段
        Field field = ReflectUtils.getFieldByFieldName(entity, Constant.TENANTID_KEY);
        if (field != null) {
            ReflectUtils.setValueByFieldName(entity, Constant.TENANTID_KEY, paramMap.get(Constant.TENANTID_KEY));
        }
        return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).update(defaultStatement, entity);
    }

    @Override
    public int delete(Map<String, Object> paramMap, String id) {
        String defaultStatement = GoodsParameterGroup.class.getName() + "Mapper.delete";
        return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).delete(defaultStatement, id);
    }

    @Override
    public GoodsParameterGroup save(Map<String, Object> paramMap, GoodsParameterGroup entity) {
        String defaultStatement = GoodsParameterGroup.class.getName() + "Mapper.save";
        // 实体类存在tenantId字段
        Field field = ReflectUtils.getFieldByFieldName(entity, Constant.TENANTID_KEY);
        if (field != null) {
            ReflectUtils.setValueByFieldName(entity, Constant.TENANTID_KEY, paramMap.get(Constant.TENANTID_KEY));
        }
        this.sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).insert(defaultStatement, entity);
        return entity;
    }
}
