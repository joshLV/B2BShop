package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.AccountCashDao;
import net.deepdragon.dao.weipu.AccountLogDao;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.entity.weipu.AccountCash;
import net.deepdragon.entity.weipu.AccountLog;
import net.deepdragon.service.weipu.AccountCashService;
import net.deepdragon.service.weipu.AccountLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service(Weipu.SIGN+"AccountLogServiceImpl")
public class AccountLogServiceImpl extends BaseServiceImpl<AccountLog, String> implements AccountLogService {
	@Resource(name = Weipu.SIGN+ "AccountLogDaoImpl")
	private AccountLogDao accountLogDao;

	@Override
	protected BaseDao<AccountLog, String> getBaseDao() {
		return this.accountLogDao;
	}

	@Override
	public AccountLog getByOrderSn(Map<String, Object> paramMap, boolean isBatch) throws Exception {
		return accountLogDao.getByOrderSn(paramMap, isBatch);
	}
}

