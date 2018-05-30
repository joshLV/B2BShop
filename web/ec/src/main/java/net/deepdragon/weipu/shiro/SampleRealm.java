package net.deepdragon.weipu.shiro;

import net.deepdragon.entity.Permissions;
import net.deepdragon.entity.User;
import net.deepdragon.service.PermissionsService;
import net.deepdragon.service.UserService;
import net.deepdragon.util.Constant;
import net.deepdragon.weipu.Global;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component(Global.APP_SIGN + "SampleRealm")
public class SampleRealm extends AuthorizingRealm {

	private static Logger logger = LoggerFactory.getLogger(SampleRealm.class);

	@Resource
	private UserService userService;
	@Resource
	private PermissionsService permissionsService;
	
	public SampleRealm() {
		setName(Global.APP_SIGN + "SampleRealm");
		setAuthenticationTokenClass(UsernamePasswordToken.class);
		setCredentialsMatcher(new HashedCredentialsMatcher(
				Md5Hash.ALGORITHM_NAME));
		//setAuthenticationCachingEnabled(true);//缓存用户信息
	}
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		logger.debug("SampleRealm doGetAuthorizationInfo 获取用户权限信息");
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		try {
			String currentUserId = (String) SecurityUtils.getSubject().getPrincipal();
			Map<String, Object> tmpMap = new HashMap<String, Object>();
			tmpMap.put(Constant.TENANTID_KEY, Global.SHARED_TENANTID);
			User currentUser = userService.get(tmpMap, currentUserId);

			Map<String, Object> tmpMap2 = new HashMap<String, Object>();
			tmpMap2.put(Constant.TENANTID_KEY, currentUser.getTenantId());
			List<Permissions> permissionsList = permissionsService.getList(tmpMap2, currentUser.getId());
			for (int j = 0; j < permissionsList.size(); j++) {
				if (StringUtils.isNotEmpty(permissionsList.get(j)
						.getPermissions())) {
					info.addStringPermissions(Arrays.asList(permissionsList.get(j).getPermissions().split(",")));
				}
			}
		} catch (Exception e) {
			logger.error("获取用户权限信息时，发生错误 ", e);
		}
		return info;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {
		logger.debug("SampleRealm doGetAuthenticationInfo 用户身份认证");
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		if (StringUtils.isNotEmpty(token.getUsername())) {
			User user = null;
			try {
				Map<String, Object> tmpMap = new HashMap<String, Object>();
				tmpMap.put(Constant.TENANTID_KEY, Global.SHARED_TENANTID);
				user = userService.getUserByUserName(tmpMap, token.getUsername());
			} catch (Exception e) {
				logger.error("获取用户信息时(登陆校验)，发生错误 ", e);
			}
			if (user != null) {
				AuthenticationInfo info = new SimpleAuthenticationInfo(
						user.getId(), user.getPasswd(), getName());
				return info;
			}
		}
		return null;
	}

	/**
	 * 更新用户授权信息缓存.
	 */
	public void clearCachedAuthorizationInfo(String principal) {
		SimplePrincipalCollection principals = new SimplePrincipalCollection(
				principal, getName());
		clearCachedAuthorizationInfo(principals);
	}

	/**
	 * 清除所有用户授权信息缓存.
	 */
	public void clearAllCachedAuthorizationInfo() {
		Cache<Object, AuthorizationInfo> cache = getAuthorizationCache();
		if (cache != null) {
			for (Object key : cache.keys()) {
				cache.remove(key);
			}
		}
	}
	
}
