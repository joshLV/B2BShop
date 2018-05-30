package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.*;
import net.deepdragon.entity.weipu.Account;
import net.deepdragon.entity.weipu.AccountLog;
import net.deepdragon.service.weipu.AccountService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"AccountServiceImpl")
public class AccountServiceImpl extends BaseServiceImpl<Account, String> implements AccountService {

	@Resource(name = Weipu.SIGN+ "AccountDaoImpl")
	private AccountDao accountDao;

	@Resource(name = Weipu.SIGN+ "AccountLogDaoImpl")
	private AccountLogDao accountLogDao;
	/**
	 * 获取账户信息
	 * @param paramMap
	 * @return
	 * @throws Exception
	 */
	@Override
	public Account findAccountByUser(Map<String, Object> paramMap) throws Exception{
		return accountDao.findAccountByUser(paramMap);
	}


	@Override
	protected BaseDao<Account, String> getBaseDao() {return this.accountDao;}


    public void block(Map<String, Object> paramMap, Account acct, AccountLog log, boolean isBatch){
        accountDao.update(paramMap, acct, isBatch);
        accountLogDao.save(paramMap, log, isBatch);
    }

    public void unblock(Map<String, Object> paramMap, Account acct, AccountLog log, boolean isBatch){
        accountDao.update(paramMap, acct, isBatch);
        accountLogDao.save(paramMap, log, isBatch);
    }
}

