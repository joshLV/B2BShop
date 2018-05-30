package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.AccountCashDao;
import net.deepdragon.dao.weipu.AccountDao;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.entity.weipu.Account;
import net.deepdragon.entity.weipu.AccountCash;
import net.deepdragon.service.weipu.AccountCashService;
import net.deepdragon.service.weipu.AccountService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service(Weipu.SIGN+"AccountCashServiceImpl")
public class AccountCashServiceImpl extends BaseServiceImpl<AccountCash, String> implements AccountCashService {
	@Resource(name = Weipu.SIGN+ "AccountCashDaoImpl")
	private AccountCashDao accountCashDao;

	@Override
	protected BaseDao<AccountCash, String> getBaseDao() {
		return this.accountCashDao;
	}
}

