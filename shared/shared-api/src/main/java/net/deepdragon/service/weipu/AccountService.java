package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.Account;
import net.deepdragon.entity.weipu.AccountCash;
import net.deepdragon.entity.weipu.AccountLog;

import java.util.Map;

/**
 * 账户信息数据接口
*/
public interface AccountService extends BaseService<Account, String> {
    /**
     * 获取账户信息
     * @param paramMap
     * @return
     * @throws Exception
     */
    Account findAccountByUser(Map<String, Object> paramMap) throws Exception;

    void block(Map<String, Object> paramMap, Account acct, AccountLog log, boolean isBatch);

    void unblock(Map<String, Object> paramMap, Account acct, AccountLog log, boolean isBatch);
}
