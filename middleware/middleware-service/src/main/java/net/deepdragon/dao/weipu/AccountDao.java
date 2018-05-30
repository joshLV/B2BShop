package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.Account;

import java.util.Map;

public interface AccountDao extends BaseDao<Account, String> {
    /**
     * 获取账户信息
     *
     * @param paramMap
     * @return
     * @throws Exception
     */
    Account findAccountByUser(Map<String, Object> paramMap) throws Exception;

    Account get(Map<String, Object> paramMap, String id, boolean isBatch);

    Account update(Map<String, Object> paramMap, Account entity, boolean isBatch);
}
