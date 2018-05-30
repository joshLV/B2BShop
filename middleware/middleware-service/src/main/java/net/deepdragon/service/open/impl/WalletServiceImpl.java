package net.deepdragon.service.open.impl;


import net.deepdragon.dao.open.WalletDao;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.entity.open.Wallet;
import net.deepdragon.service.open.WalletService;
import net.deepdragon.service.weipu.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(net.deepdragon.constant.weipu.Open.SIGN+"WalletServiceImpl")
public class WalletServiceImpl extends BaseServiceImpl<Wallet, String> implements WalletService {

	@Resource(name=net.deepdragon.constant.weipu.Open.SIGN+"WalletDaoImpl")
	private WalletDao walletDao;
	
	@Override
	public BaseDao<Wallet, String> getBaseDao() {
		return this.walletDao;
	}


	@Override
	public List<Wallet> getAll(Map<String, Object> paramMap) throws Exception {
		return walletDao.getAll(paramMap);
	}
}

