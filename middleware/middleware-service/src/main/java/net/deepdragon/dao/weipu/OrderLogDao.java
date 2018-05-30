package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.OrderLog;

import java.util.Map;

public interface OrderLogDao extends BaseDao<OrderLog, String> {

    /**
     * 记录订单日志
     *
     * @param paramMap 租户Id
     * @param entity   订单日志对象
     * @param isBatch  是否启用批量执行模式
     *
     * @return 保存后的日志对象
     */
    OrderLog saveOrderLog(Map<String, Object> paramMap, OrderLog entity, boolean isBatch);
}
