package net.deepdragon.weipu.controller.mall;

import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.Catelog;
import net.deepdragon.entity.weipu.Member;
import net.deepdragon.entity.weipu.Menu;
import net.deepdragon.service.weipu.MemberService;
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
	private MemberService memberService;

	@RequestMapping(value = "list")
	public String list(Model model,HttpServletRequest request) {
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		String info = "账户安全";
		setLogInfo(info);
		logger.debug(info);

		getAllCatelog(model);
		setPublicDate2Model( model );
		if(Global.WHICH_APP.equals(whichclient)){
			return Global.TEMPLATE_APP + PATH + "/member/changepwd";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/member/changepwd";
		}

	}

	// 校验旧密码
	@RequestMapping(value = "/ajaxCheckPwd")
	public @ResponseBody
	Object ajaxCheckPwd(HttpServletRequest request, String password) {
		String info = "验证用户名旧密码否存在";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();

		try {
			Member member = getCurrentMember(request);
			String passwordMd5 = new Md5Hash(password).toHex();
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("id", member.getId()));
			criteria.add(Restrictions.eq("passwd", passwordMd5));
			List<Member> list = memberService.getList(getParamMap(), criteria);
			if (list != null && list.size() > 0) {
				result.put(STATUS, SUCCESS);
				result.put(MESSAGE, "操作成功");
				result.put(DATA, true);
			} else {
				result.put(STATUS, WARN);
				result.put(MESSAGE, "旧密码不正确");
			}
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
			Member member = getCurrentMember(request);
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("id", member.getId()));
			String oldpasswordMd5 = new Md5Hash(oldpwd).toHex();
			criteria.add(Restrictions.eq("passwd", oldpasswordMd5));
			List<Member> list = memberService.getList(getParamMap(), criteria);
			if(list!=null && list.size()>0){
				String passwordMd5 = new Md5Hash(password).toHex();
				member.setPasswd(passwordMd5);
				memberService.update(getParamMap(), member);
				result.put(STATUS, SUCCESS);
				result.put(MESSAGE, "操作成功");
			}else{
				result.put(STATUS, WARN);
				result.put(MESSAGE, "旧密码不正确");
			}
			return result;
			
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "操作失败");
			return result;
		}
	}
}
