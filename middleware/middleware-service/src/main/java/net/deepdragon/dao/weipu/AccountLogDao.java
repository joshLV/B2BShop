package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.AccountLog;

import java.util.Map;

public interface AccountLogDao extends BaseDao<AccountLog, String> {
    AccountLog save(Map<String, Object> paramMap, AccountLog entity, boolean isBatch);

    AccountLog getByOrderSn(Map<String, Object> paramMap, boolean isBatch);
}
