package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.MerchantUserDao;
import net.deepdragon.entity.weipu.MerchantUser;
import net.deepdragon.service.weipu.MerchantUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service(Weipu.SIGN+"MerchantUserServiceImpl")
public class MerchantUserServiceImpl extends BaseServiceImpl<MerchantUser, String> implements MerchantUserService{

	@Resource(name= Weipu.SIGN+"MerchantUserDaoImpl")
	private MerchantUserDao merchantUserDao;
	
	@Override
	public BaseDao<MerchantUser, String> getBaseDao() {
		return this.merchantUserDao;
	}
	
	@Override
	public int updatePasswd(Map<String, Object> paramMap, String userId, String passwd)
			throws Exception {
		try {
			return this.merchantUserDao.updatePasswd(paramMap, userId, passwd);
		} catch (Exception e) {
			throw e;
		}
	}
}

