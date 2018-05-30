package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.AccountCashDao;
import net.deepdragon.dao.weipu.AccountDao;
import net.deepdragon.entity.weipu.Account;
import net.deepdragon.entity.weipu.AccountCash;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 采购商数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "AccountCashDaoImpl")
public class AccountCashDaoImpl extends BaseDaoImpl<AccountCash, String> implements AccountCashDao {

}
