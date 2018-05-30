package net.deepdragon.service.impl;

import net.deepdragon.constant.Shared;
import net.deepdragon.dao.BaseDao;
import net.deepdragon.dao.UserDao;
import net.deepdragon.entity.User;
import net.deepdragon.service.UserService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Shared.SIGN + "UserServiceImpl")
public class UserServiceImpl extends BaseServiceImpl<User, String> implements
		UserService {

	@Resource(name = Shared.SIGN + "UserDaoImpl")
	private UserDao userDao;

	@Override
	public BaseDao<User, String> getBaseDao() {
		return userDao;
	}

	@Override
	public boolean saveRelationUserRole(Map<String, Object> paramMap, String userId,
			List<String> roleIds) throws Exception {
		try {
            userDao.delRelationUserRole(paramMap, userId);
			if (CollectionUtils.isNotEmpty(roleIds)) {
                userDao.saveRelationUserRole(paramMap, userId, roleIds);
			}
			return true;
		} catch (Exception e) {
			throw e;
		}
	}

    @Override
    public List<String> getRoleIdByUserId(Map<String, Object> paramMap, String userId) {
            return this.userDao.getRoleIdByUserId(paramMap,userId);
    }
    
    @Override
	public User getUserByUserName(Map<String, Object> paramMap, String userName)
			throws Exception {
		try {
			return this.userDao.getUserByUserName(userName);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int updatePasswd(Map<String, Object> paramMap, String userId, String passwd)
			throws Exception {
		try {
			return this.userDao.updatePasswd(paramMap, userId, passwd);
		} catch (Exception e) {
			throw e;
		}
	}
	
}
