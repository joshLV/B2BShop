package net.deepdragon.weipu;

public class Global {
	
	public static final String APP_NAME = "所有模块";//微铺电子商务系统
	public static final String APP_SIGN = "weipu";
	
	public static final String URL_LOGIN = "/admin/account/login";
	public static final String URL_LOGOUT = "/admin/account/logout";
	public static final String URL_UNAUTHORIZED = "/admin/shiro/unauthorized";
	public static final String WHICHCLIENT = "whichclient";
	public static final String WHICH_APP = "whichapp";
	public static final String WHICH_WEIXIN_APP = "whichwechat";

	public static final String WHICH_WEB = "whichweb";
	public static final String HYBRIDAPP = "hybridapp";

	//设置管理端访问路径
	public static final String ADMIN = "admin";
	public static final String ADMIN_PATH = "/" + ADMIN;
	public static final String WEIPU_PATH = ADMIN_PATH + "/weipu";
	public static final String TEMPLATE_WEIPU =  ADMIN + "/weipu";
	
	
	//设置商城端访问路径
	public static final String MALL = "mall";
	public static final String MALL_PATH = "";//"/" + MALL
	public static final String TEMPLATE_MALL =  MALL;

	//设置商城手机端访问路径
	public static final String APP = "app";
	public static final String APP_PATH = "";//"/" + app
	public static final String TEMPLATE_APP =  APP;
	
	//设置商家店铺访问路径
	public static final String MERCHANT = "merchant";
	public static final String MERCHANT_PATH = "/" + MERCHANT;//"/" + MALL
	public static final String TEMPLATE_MERCHANT =  MERCHANT;
	
	public static final String SHARED_TENANTID = "00000";
	
	//是否启用性能监控(拦截器记录访问时间)
	public static final boolean PERFORMANCE_MONITORING = true;
	
	
	//当前用户的Session key
	public static final String CURRENT_USER = APP_SIGN + "_CURRENT_USER";
	
	//是否为超级用户
	public static final String SUPPER_USER = APP_SIGN + "_SUPPER_USER";
	
	//当前用户所拥有的模块-Map存储
	public static final String CURRENT_USER_MODULE_MAP = APP_SIGN + "_CURRENT_USER_MODULE_MAP";
	
	//当前会员的Session key
	public static final String CURRENT_MERMBER = APP_SIGN + "_CURRENT_MERMBER";
	
	//当前商家店铺的Session key
	public static final String CURRENT_MERCHANT = APP_SIGN + "_CURRENT_MERCHANT";
	
	//当前商家店铺操作员的Session key
	public static final String CURRENT_MERCHANT_USER = APP_SIGN + "_CURRENT_MERCHANT_USER";
	
}
