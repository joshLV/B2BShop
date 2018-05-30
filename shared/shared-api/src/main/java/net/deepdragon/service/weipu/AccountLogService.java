package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.AccountLog;

import java.util.Map;

/**
 * 账户信息数据接口
*/
public interface AccountLogService extends BaseService<AccountLog, String> {

    AccountLog getByOrderSn(Map<String, Object> paramMap, boolean isBatch) throws Exception;
}
