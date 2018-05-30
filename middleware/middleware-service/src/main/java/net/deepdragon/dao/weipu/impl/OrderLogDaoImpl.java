package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.OrderLogDao;
import net.deepdragon.entity.weipu.OrderLog;
import net.deepdragon.util.Constant;
import net.deepdragon.util.ReflectUtils;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.Map;

/**
 * 订单日志数据接口实现
 */
@Repository(Weipu.SIGN + "OrderLogDaoImpl")
public class OrderLogDaoImpl extends BaseDaoImpl<OrderLog, String> implements OrderLogDao {

    /**
     * 记录订单日志
     *
     * @param paramMap 租户Id
     * @param entity   订单日志对象
     * @param isBatch  是否启用批量执行模式
     *
     * @return 保存后的日志对象
     */
    public OrderLog saveOrderLog(Map<String, Object> paramMap, OrderLog entity, boolean isBatch) {
        String defaultStatement = OrderLog.class.getName() + "Mapper.save";

        // 实体类存在tenantId字段
        Field field = ReflectUtils.getFieldByFieldName(entity, Constant.TENANTID_KEY);
        if (field != null) {
            ReflectUtils.setValueByFieldName(entity, Constant.TENANTID_KEY, paramMap.get(Constant.TENANTID_KEY).toString());
        }

        if (isBatch) {
            this.sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).insert(defaultStatement, entity);
        } else {
            this.sqlSessionTemplateFactory.getSqlSessionTemplate().insert(defaultStatement, entity);
        }

        return entity;
    }

}
