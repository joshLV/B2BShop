package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.AccountDao;
import net.deepdragon.entity.weipu.Account;
import net.deepdragon.util.Constant;
import net.deepdragon.util.ReflectUtils;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.Map;

/**
 * 采购商数据接口实现
 */
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "AccountDaoImpl")
public class AccountDaoImpl extends BaseDaoImpl<Account, String> implements AccountDao {


    @Override
    public Account findAccountByUser(Map<String, Object> paramMap) throws Exception {
        String defaultStatement = Account.class.getName() + "Mapper.findAccountByUser";
        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(defaultStatement, paramMap);
    }

    @Override
    public Account get(Map<String, Object> paramMap, String id, boolean isBatch) {
        String defaultStatement = Account.class.getName() + "Mapper.get";
        paramMap.put("id", id);
        if (isBatch) {
            return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).selectOne(
                    defaultStatement, paramMap);
        } else {
            return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(
                    defaultStatement, paramMap);
        }

    }

    @Override
    public Account update(Map<String, Object> paramMap, Account entity, boolean isBatch) {
        String defaultStatement = Account.class.getName() + "Mapper.update";

        // 实体类存在tenantId字段
        Field field = ReflectUtils.getFieldByFieldName(entity, Constant.TENANTID_KEY);
        if (field != null) {
            ReflectUtils.setValueByFieldName(entity, Constant.TENANTID_KEY, paramMap.get(Constant.TENANTID_KEY).toString());
        }
        if (isBatch) {
            this.sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).update(defaultStatement, entity);
        } else {
            this.sqlSessionTemplateFactory.getSqlSessionTemplate().update(defaultStatement, entity);
        }
        return entity;
    }
}
