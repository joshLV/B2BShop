package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.GoodsParameterDao;
import net.deepdragon.entity.weipu.GoodsParameter;
import net.deepdragon.util.Constant;
import net.deepdragon.util.ReflectUtils;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;

/**
 * 商品参数选项表数据接口实现
*/
@Repository(Weipu.SIGN + "GoodsParameterDaoImpl")
public class GoodsParameterDaoImpl extends BaseDaoImpl<GoodsParameter, String> implements GoodsParameterDao {
    @Override
    public GoodsParameter save(Map<String, Object> paramMap, GoodsParameter entity) {
        String defaultStatement = GoodsParameter.class.getName() + "Mapper.save";
        // 实体类存在tenantId字段
        Field field = ReflectUtils.getFieldByFieldName(entity, Constant.TENANTID_KEY);
        if (field != null) {
            ReflectUtils.setValueByFieldName(entity, Constant.TENANTID_KEY, paramMap.get(Constant.TENANTID_KEY).toString());
        }
        this.sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).insert(defaultStatement, entity);
        return entity;
    }

    @Override
    public int update(Map<String, Object> paramMap, GoodsParameter entity) {
        String defaultStatement = GoodsParameter.class.getName() + "Mapper.update";
        // 实体类存在tenantId字段
        Field field = ReflectUtils.getFieldByFieldName(entity, Constant.TENANTID_KEY);
        if (field != null) {
            ReflectUtils.setValueByFieldName(entity, Constant.TENANTID_KEY, paramMap.get(Constant.TENANTID_KEY).toString());
        }
        return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).update(defaultStatement, entity);
    }

    @Override
    public int delete(Map<String, Object> paramMap, String id) {
        String defaultStatement = GoodsParameter.class.getName() + "Mapper.delete";
        return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).delete(defaultStatement, id);
    }

    public List<Map<String,Object>> getParamNoGroup(Map<String, Object> paramMap, String goodsId){
        String defaultStatement = GoodsParameter.class.getName() + "Mapper.getParamNoGroup";

        paramMap.put("goodsId", goodsId);

        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
    }
}
