package net.deepdragon.dao.open.impl;

import net.deepdragon.dao.open.WalletDao;
import net.deepdragon.dao.weipu.impl.BaseDaoImpl;
import net.deepdragon.entity.open.Wallet;
import org.springframework.stereotype.Repository;

/**
 * 开放平台模块数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Open.SIGN + "WalletDaoImpl")
public class WalletDaoImpl extends BaseDaoImpl<Wallet, String> implements
		WalletDao {

}
