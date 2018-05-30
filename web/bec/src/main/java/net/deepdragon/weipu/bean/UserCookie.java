package net.deepdragon.weipu.bean;

public class UserCookie {
	public static final String LOGIN_MEMBER_USERNAME_COOKIE_NAME = "memberUsername";// 保存登录会员用户名的Cookie名称
	public static final String LOGIN_MEMBER_NICKNAME_COOKIE_NAME = "memberNickname";// 保存登录会员用户昵称的Cookie名称
	public static final String LOGIN_MEMBER_ME4_COOKIE_NAME = "rememberMe4Member";// 保存登录状态的Cookie名称
	public static final String LOGIN_REDIRECTION_URL_SESSION_NAME = "redirectionUrl";// 保存登录来源URL的Session名称
	public static final int COOKIE_MAX_AGE = 86400;// 保存未登录会员购物车项集合的Cookie最大有效时间（单位：秒）
	public static final int STATUS_COOKIE_MAX_AGE = 1800;// 保存未登录会员购物车项集合的Cookie最大有效时间（单位：秒）

//	public static final String LOGIN_MEMBER_OPERATOR_COOKIE_NAME = "operatorUsername";// 操作员用户名的Cookie名称
//	public static final String LOGIN_MEMBER_OPERATORREALNAME_COOKIE_NAME = "operatorReanlName";// 保存操作员真实名称的Cookie名称
//	public static final String LOGIN_MEMBER_ME4_OPERATOR_COOKIE_NAME = "reOperatorMe4Member";// 保存操作员登录状态的Cookie名称
}
