package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.AccountLogDao;
import net.deepdragon.entity.weipu.AccountLog;
import net.deepdragon.util.Constant;
import net.deepdragon.util.ReflectUtils;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.Map;

/**
 * 采购商数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "AccountLogDaoImpl")
public class AccountLogDaoImpl extends BaseDaoImpl<AccountLog, String> implements AccountLogDao {


    @Override
    public AccountLog save(Map<String, Object> paramMap, AccountLog entity, boolean isBatch) {
        String defaultStatement = AccountLog.class.getName() + "Mapper.save";

        // 实体类存在tenantId字段
        Field field = ReflectUtils.getFieldByFieldName(entity, Constant.TENANTID_KEY);
        if (field != null) {
            ReflectUtils.setValueByFieldName(entity, Constant.TENANTID_KEY, paramMap.get(Constant.TENANTID_KEY).toString());
        }
        if(isBatch){
            this.sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).insert(defaultStatement, entity);
        }else{
            this.sqlSessionTemplateFactory.getSqlSessionTemplate().insert(defaultStatement, entity);
        }
        return entity;
    }

    @Override
    public AccountLog getByOrderSn(Map<String, Object> paramMap, boolean isBatch) {
        String defaultStatement = AccountLog.class.getName() + "Mapper.getByOrderSn";
        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(defaultStatement, paramMap);
    }
}
