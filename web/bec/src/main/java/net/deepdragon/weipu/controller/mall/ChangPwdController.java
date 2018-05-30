package net.deepdragon.weipu.controller.mall;

import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.Buyer;
import net.deepdragon.entity.weipu.BuyerOperator;
import net.deepdragon.entity.weipu.Catelog;
import net.deepdragon.entity.weipu.Menu;
import net.deepdragon.service.weipu.BuyerOperatorService;
import net.deepdragon.service.weipu.BuyerService;
import net.deepdragon.service.weipu.MenuService;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller(Global.APP_SIGN + Global.MALL + "ChangPwdController")
@RequestMapping(Global.MALL_PATH + "/member/changepwd")
public class ChangPwdController extends BaseMallController {
	@Resource
	private MenuService menuService;
	@Resource
	private CacheData cacheData;
	@Resource
	private BuyerService buyerService;
	@Resource
	private BuyerOperatorService buyerOperatorService;

	@RequestMapping(value = "list")
	public String list(Model model,HttpServletRequest request) {
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		String info = "账户安全";
		setLogInfo(info);
		logger.debug(info);

		getAllCatelog(model);
		setPublicDate2Model(model);

		/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
		LoginType loginType = getLoginType(request);
		model.addAttribute("loginType", loginType);
		String operatorRole = getOperatorRole(request);
		BuyerOperator buyerOperator = getCurrentOperator(request);
		if (LoginType.operator.equals(loginType)) {
			model.addAttribute("mp", buyerOperator);
			model.addAttribute("role", operatorRole);
		}
        /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/

		if(Global.WHICH_APP.equals(whichclient)){
			return Global.TEMPLATE_APP + PATH + "/member/changepwd";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/member/changepwd";
		}

	}

	// 校验旧密码
	@RequestMapping(value = "/ajaxCheckPwd")
	public @ResponseBody
	Object ajaxCheckPwd(HttpServletRequest request) {
		String info = "验证用户名旧密码否存在";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		String password = request.getParameter("password");
		try {
			BuyerOperator buyerOperator = getCurrentOperator(request);
			Buyer member = getCurrentMember(request);

			String passwordMd5 = new Md5Hash(password).toHex();

			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("passwd", passwordMd5));

			/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
			LoginType loginType = getLoginType(request);
			if (LoginType.operator.equals(loginType)) {
				criteria.add(Restrictions.eq("id", buyerOperator.getId()));

				List<BuyerOperator> list = buyerOperatorService.getList(getParamMap(), criteria);
				if (list != null && list.size() > 0) {
					result.put(STATUS, SUCCESS);
					result.put(MESSAGE, "操作成功");
					result.put(DATA, true);
				} else {
					result.put(STATUS, WARN);
					result.put(MESSAGE, "旧密码不正确");
				}
			}else{
				criteria.add(Restrictions.eq("id", member.getId()));

				List<Buyer> list = buyerService.getList(getParamMap(), criteria);
				if (list != null && list.size() > 0) {
					result.put(STATUS, SUCCESS);
					result.put(MESSAGE, "操作成功");
					result.put(DATA, true);
				} else {
					result.put(STATUS, WARN);
					result.put(MESSAGE, "旧密码不正确");
				}
			}
			/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/
			return result;
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "操作失败");
			return result;
		}
	}

	// 修改密码
	@RequestMapping(value = "/ajaxchangePwd")
	public @ResponseBody
	Object ajaxchangePwd(HttpServletRequest request) {
		String info = "修改密码";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		String password = request.getParameter("newpwd");
		String oldpwd = request.getParameter("oldpwd");
		try {
			Buyer member = getCurrentMember(request);
			BuyerOperator buyerOperator = getCurrentOperator(request);
			Criteria criteria = new Criteria();

			String oldpasswordMd5 = new Md5Hash(oldpwd).toHex();
			criteria.add(Restrictions.eq("passwd", oldpasswordMd5));

			/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
			LoginType loginType = getLoginType(request);
			if (LoginType.operator.equals(loginType)) {
				criteria.add(Restrictions.eq("id", buyerOperator.getId()));

				List<BuyerOperator> list = buyerOperatorService.getList(getParamMap(), criteria);
				if(list!=null && list.size()>0){
					String passwordMd5 = new Md5Hash(password).toHex();
					buyerOperator.setPasswd(passwordMd5);
					buyerOperatorService.update(getParamMap(), buyerOperator);
					result.put(STATUS, SUCCESS);
					result.put(MESSAGE, "操作成功");
				}else{
					result.put(STATUS, WARN);
					result.put(MESSAGE, "旧密码不正确");
				}
			}else{
				criteria.add(Restrictions.eq("id", member.getId()));

				List<Buyer> list = buyerService.getList(getParamMap(), criteria);
				if(list!=null && list.size()>0){
					String passwordMd5 = new Md5Hash(password).toHex();
					member.setPasswd(passwordMd5);
					buyerService.update(getParamMap(), member);
					result.put(STATUS, SUCCESS);
					result.put(MESSAGE, "操作成功");
				}else{
					result.put(STATUS, WARN);
					result.put(MESSAGE, "旧密码不正确");
				}
			}
			/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/
			return result;
			
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "操作失败");
			return result;
		}
	}

}
