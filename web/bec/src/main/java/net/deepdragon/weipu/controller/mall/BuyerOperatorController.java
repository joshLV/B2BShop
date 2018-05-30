package net.deepdragon.weipu.controller.mall;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.Area;
import net.deepdragon.entity.DeliveryMethod;
import net.deepdragon.entity.DeliveryTime;
import net.deepdragon.entity.PaymentMethod;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.AreaService;
import net.deepdragon.service.DeliveryMethodService;
import net.deepdragon.service.DeliveryTimeService;
import net.deepdragon.service.PaymentMethodService;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.Constant;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.bean.CartItemCookie;
import net.deepdragon.weipu.bean.UserCookie;
import net.deepdragon.weipu.cache.CacheData;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 采购商操作员信息
 */
@Controller(Global.APP_SIGN + Global.MALL + "BuyerOperatorController")
@RequestMapping(Global.MALL_PATH + "/buerOperator")
public class BuyerOperatorController extends BaseMallController {
	private static Map<String,String> roleValueMap = null;

	@Resource
	private BuyerService buyerService;
	@Resource
	private CacheData cacheData;
	@Resource
	private BuyerOperatorService buyerOperatorService;

	/**
	 * Desc:获取采购商的操作员列表信息
	 * @param pager
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "list")
	public String list(Pager pager,Model model,HttpServletRequest request) {
		String info = "获取操作员列表信息";
		setLogInfo(info);
		logger.debug(info);

		try{
//			Buyer mb = getCurrentMember(request);
//			Criteria criteria = new Criteria();
//			criteria.add(Restrictions.eq("buyerId", mb.getId()));
//			criteria.add(Restrictions.eq("isDelete", 1));
//			criteria.add(Restrictions.order("createDate","DESC"));
//			pager.setOrderType("DESC");
//			pager.setOrderBy("createDate");
//			pager.setPageSize( 20 );
//			pager = buyerOperatorService.getPager(getParamMap(), criteria, pager);

			pager = getData(request,pager);

			List<BuyerOperator> buyerOplist = (List<BuyerOperator>) pager.getList();
			model.addAttribute("goodslist",getBuyerOperatorRoleValue(buyerOplist));
			model.addAttribute("pager", pager);
			model.addAttribute("roleMap", getAllRole());

			//获取查询操作员时，是否填写 操作员用户名作为条件
			String search_userName = request.getParameter("search_userName");
			if (StringUtil.isNotEmpty(search_userName)) {
				model.addAttribute("search_userName", search_userName);
			}

			//获取查询操作员时，是否填写 操作员真实姓名作为条件
			String search_realName = request.getParameter("search_realName");
			if (StringUtil.isNotEmpty(search_realName)) {
				model.addAttribute("search_realName", search_realName);
			}
			getAllCatelog(model);
			setPublicDate2Model(model);

			/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
			LoginType loginType = getLoginType(request);
			model.addAttribute("loginType", loginType);
			String operatorRole = getOperatorRole(request);
			if (LoginType.operator.equals(loginType)) {
				model.addAttribute("role", operatorRole);
			}
            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/

		}catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
		}

		return Global.TEMPLATE_MALL + PATH + "/member/buyerOperator";

	}

	/**
	 * aJax获取下一页数据
	 * @param pager
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "ajaxBuyerOperatorData")
	@ResponseBody
	public Map<String, Object> ajaxBuyerOperatorData(Pager pager,HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();

		try {
			String info = "操作员列表页";
			setLogInfo(info);
			logger.error(info);

			pager = getData(request,pager);

			List<BuyerOperator> buyerOplist = (List<BuyerOperator>) pager.getList();

			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "成功");
			result.put("pager", pager);
			result.put("total", pager.getTotalCount());
			result.put("pageNumber", pager.getPageNumber());

			result.put("goodslist", getBuyerOperatorRoleValue(buyerOplist));

		} catch (Exception e){
			logger.error("获取操作员时，发生异常", e);
			e.printStackTrace();
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "获取操作员时，发生异常");
		}

		return result;
	}

	/**
	 * Desc:根据条件查询操作员信息
	 * @param pager
	 * @return
	 */
	private Pager getData(HttpServletRequest request,Pager pager) {
		try {
			Buyer mb = getCurrentMember(request);

			Criteria criteria = new Criteria();

			pager.setPageSize(10);

			criteria.add(Restrictions.eq("buyerId", mb.getId()));
			criteria.add(Restrictions.eq("isDelete", 1));

			//获取查询操作员时，是否填写 操作员用户名作为条件
			String search_userName = request.getParameter("search_userName");
			if (StringUtil.isNotEmpty(search_userName)) {
				criteria.add(Restrictions.eq("userName", search_userName));
			}

			//获取查询操作员时，是否填写 操作员真实姓名作为条件
			String search_realName = request.getParameter("search_realName");
			if (StringUtil.isNotEmpty(search_realName)) {
				criteria.add(Restrictions.likeTwo("realName", "'%"+search_realName+"%'"));
			}

			criteria.add(Restrictions.order("createDate","DESC"));
			pager = buyerOperatorService.getPager(getParamMap(), criteria, pager);
		}catch (Exception e){
			logger.error("获取操作员时，发生异常", e);
			e.printStackTrace();
		}
		return pager;
	}

	/**
	 * Desc:角色名称转换
	 * @param getBuyerOperatorList
	 * @return
	 */
	private List<BuyerOperator> getBuyerOperatorRoleValue(List<BuyerOperator> getBuyerOperatorList){
		String info = "查看相关角色";
		setLogInfo(info);
		logger.debug(info);
		List<BuyerOperator> buyerOperatorLists = new ArrayList<BuyerOperator>();
		try {
			if(StringUtil.isNotEmpty(getBuyerOperatorList)){
				for(int i=0;i<getBuyerOperatorList.size();i++){
					String roleValuess = "";
					BuyerOperator buyerOperator = getBuyerOperatorList.get(i);

					if (StringUtil.isNotEmpty(buyerOperator.getRoleValue())) {
						String[] roleArrays = buyerOperator.getRoleValue().split(",");
						if (roleArrays.length > 0) {
							for(int j=0;j<roleArrays.length;j++){

								if(StringUtil.isNotEmpty(getRoleNames(roleArrays[j]))){
									roleValuess += getRoleNames(roleArrays[j]);
									if(roleArrays.length -1 != j){
										roleValuess +=",";
									}
								}
							}
						}
					}
					buyerOperator.setRoleNameChn(roleValuess);
					buyerOperatorLists.add(buyerOperator);
				}
			}
		}catch (Exception ex) {
			logger.error("查看相关角色，发生异常。", ex);
			ex.printStackTrace();
		}
		return buyerOperatorLists;
	}


	/**
	 * 校验手机号是否被注册
	 * @param request
	 * @param mobile
	 * @return
	 */
	@RequestMapping(value = "/checkMobile", method = { RequestMethod.POST })
	public @ResponseBody
	Object checkMobile(HttpServletRequest request,String mobile) {
		String info = "校验手机号是否被注册";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		Criteria criteria = new Criteria();
		try {
			if (StringUtils.isNotBlank(mobile) ) {
//				criteria.add(Restrictions.eq("status", 2));
				criteria.add(Restrictions.eq("isDelete", 1));
				criteria.add(Restrictions.eq("tenantId", getTenantId()));
				criteria.add(Restrictions.eq("userName", mobile));

				List<Buyer> buyerList = buyerService.getList(getParamMap(),criteria);
				if(buyerList != null && buyerList.size() > 0){
					result.put(STATUS, ERROR);
					result.put(MESSAGE, "失败");
				}else {
					Criteria criterias = new Criteria();
					criterias.add(Restrictions.eq("isDelete", 1));
					criterias.add(Restrictions.eq("tenantId", getTenantId()));
					criterias.add(Restrictions.eq("userName", mobile));

					List<BuyerOperator> buyerOperatorList = buyerOperatorService.getList(getParamMap(),criterias);

					if(buyerOperatorList != null && buyerOperatorList.size() > 0){
						result.put(STATUS, ERROR);
						result.put(MESSAGE, "失败");
						return result;
					}

					result.put(STATUS, SUCCESS);
					result.put(MESSAGE, "成功");
				}
			}
		}catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "校验手机号是否被注册");
		}
		return result;
	}


//	@RequestMapping(value = "/username/check", method = { RequestMethod.POST })
//	public @ResponseBody
//	Object usernameCheck(String property, String userName, HttpServletRequest request) {
//		boolean result = false;
//		String value = getParameter(request, property);
//		try {
//			result = !buyerService.isExist(getParamMap(), property, value);
//		} catch (Exception e) {
//			logger.error(property + "是否可用ajax验证时，发生异常Exception:" + e);
//			e.printStackTrace();
//		}
//		return result;
//	}

	/**
	 * 操作员信息保存
	 * @param buyerOperator_userName 相关参数
	 * @return
	 */
	@RequestMapping(value = "/save", method = { RequestMethod.POST })
	public @ResponseBody
	Object save(String buyerOperator_userName, String buyerOperator_passwd, String buyerOperator_realName,String buyerOperator_email,String buyerOperator_isvalid,String buyerOperator_roleValue,HttpSession session,HttpServletRequest request) {
		String info = "保存采购商操作员信息(userName:" + buyerOperator_userName + ")";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();

		try {
			Buyer buyer = getCurrentMember(request);
			BuyerOperator buyerOperator = new BuyerOperator();
			if(StringUtil.isNotEmpty(buyer)){
				buyerOperator.setBuyerId(buyer.getId());
				buyerOperator.setUserName(buyerOperator_userName);
				buyerOperator.setMobile(buyerOperator_userName);

				String passwdMd5 = new Md5Hash(buyerOperator_passwd).toHex();
				buyerOperator.setPasswd(passwdMd5);

				buyerOperator.setRealName(buyerOperator_realName);
				buyerOperator.setEmail(buyerOperator_email);
				buyerOperator.setIsvalid(Integer.parseInt(buyerOperator_isvalid));
				buyerOperator.setRoleValue(buyerOperator_roleValue);
				buyerOperator.setIsDelete(1);

				buyerOperator.setCreateUser(buyer.getUserName());
				buyerOperator.setCreateDate(new Date());

				buyerOperator = buyerOperatorService.save(getParamMap(), buyerOperator);

				result.put(STATUS, SUCCESS);
				result.put(MESSAGE, "新增成功!");
			}else{
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "保存失败，请联系管理员。");
			}
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "保存失败，请联系管理员。");
		}
		return result;
	}

	/**
	 * Desc:查询要修改的操作员
	 * @param buyerOperatorId
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/edit", method = { RequestMethod.POST })
	public @ResponseBody
	Object edit(String buyerOperatorId, HttpServletRequest request) {
		String info = "修改采购商操作员信息(" + buyerOperatorId + ")";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			BuyerOperator buyerOperator = buyerOperatorService.get(getParamMap(), buyerOperatorId);
			result.put("buyerOperator", buyerOperator);
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "修改失败，请联系管理员。");
		}
		return result;
	}

	/**
	 * Desc:保存修改后的操作员数据
	 * @param editid
	 * @param buyerOperator_userName_edit
	 * @param buyerOperator_passwd_edit
	 * @param buyerOperator_realName_edit
	 * @param buyerOperator_email_edit
	 * @param buyerOperator_isvalid_edit
	 * @param buyerOperator_roleValue_edit
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/update", method = { RequestMethod.POST })
	public @ResponseBody
	Object update(String editid,String buyerOperator_userName_edit, String buyerOperator_passwd_edit, String buyerOperator_realName_edit,String buyerOperator_email_edit,String buyerOperator_isvalid_edit,String buyerOperator_roleValue_edit,HttpSession session,HttpServletRequest request) {
		String info = "保存修改后的采购商操作员信息";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			BuyerOperator buyerOperator = new BuyerOperator();

			buyerOperator.setId(editid);
			buyerOperator.setUserName(buyerOperator_userName_edit);
			buyerOperator.setRealName(buyerOperator_realName_edit);
			buyerOperator.setEmail(buyerOperator_email_edit);
			buyerOperator.setIsvalid(Integer.parseInt(buyerOperator_isvalid_edit));
			buyerOperator.setRoleValue(buyerOperator_roleValue_edit);

			if (StringUtil.isNotEmpty(buyerOperator_passwd_edit)) {
				String passwdMd5 = new Md5Hash(buyerOperator_passwd_edit).toHex();
				buyerOperator.setPasswd(passwdMd5);
			}

			buyerOperator.setModifyUser(getCurrentMember(request).getUserName());
			buyerOperator.setModifyDate(new Date());

			buyerOperatorService.update(getParamMap(), buyerOperator);

			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "");
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "修改失败，请联系管理员。");
		}
		return result;
	}

	/**
	 * Desc:逻辑删除操作员
	 * @param buyerOperatorId
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delete", method = { RequestMethod.POST })
	public @ResponseBody
	Object delete(String buyerOperatorId, HttpServletRequest request) {
		String info = "删除采购商操作员信息(" + buyerOperatorId + ")";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			BuyerOperator buyerOperator = buyerOperatorService.get(getParamMap(), buyerOperatorId);
			buyerOperator.setIsDelete(0);
			buyerOperatorService.update(getParamMap(), buyerOperator);
			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "");
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "删除失败，请联系管理员。");
		}
		return result;
	}

	/**
	 * Desc:获取所有角色
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/getAllRole", method = { RequestMethod.POST })
	public @ResponseBody
	Object getAllRole(HttpServletRequest request) {
		String info = "获取所有角色";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String allRole = getRoleNames("ALLROLE");
			if(StringUtil.isNotEmpty(allRole)){
				result.put(STATUS, SUCCESS);
				result.put(MESSAGE, "获取成功!");
				result.put("allRole", allRole);
			}else{
				result.put(STATUS, SUCCESS);
				result.put(MESSAGE, "获取失败!");
			}
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "获取失败!");
		}
		return result;
	}

	/**
	 * Desc:将角色英文字符串转为 单个角色值
	 * @param roleStr 角色英文名称
	 * @return
	 * @throws Exception
	 */
	public static String spitRoleStr(String roleStr) throws Exception{
		String roleCHNName = "";
		if (StringUtil.isNotEmpty(roleStr)) {
			String[] roleVal = roleStr.split(",");

			if (StringUtil.isNotEmpty(roleVal) && roleVal.length > 0) {
				for(int i=0;i<roleVal.length;i++){
					if (StringUtil.isNotEmpty(roleVal[i])) {
						roleCHNName += getRoleNames(roleVal[i]);
						if(i != roleVal.length-1){
							roleCHNName += ",";
						}
					}
				}
			}
		}
		return roleCHNName;
	}

	public static Map<String,String> getAllRole()throws Exception {
		return roleValueMap;
	}

	static{
		if (roleValueMap == null) {
			roleValueMap = new HashMap<String,String>();
			roleValueMap.put("buyer","采购员");
			roleValueMap.put("payment","财会员");
			roleValueMap.put("receipt","收货员");
			roleValueMap.put("inspection","验货员");
		}
	}

	/**
	 * Desc:转换角色中文名称
	 * @param key 角色英文名称
	 * @return
	 * @throws Exception
	 */
	public static String getRoleNames(String key) throws Exception {
		String params = "";

		if(StringUtil.isNotEmpty(key)){
			if("ALLROLE".equals(key)){
				for(Map.Entry<String, String> entry : roleValueMap.entrySet()){
					if(StringUtil.isNotEmpty(entry.getKey()) && StringUtil.isNotEmpty(entry.getValue())){
						params += entry.getKey();
						params += "_";
						params += entry.getValue();
						params += "--";
					}
				}

				params = params.substring(0, params.length() - 2);
			}else{
				params = roleValueMap.get(key).toString();
			}

		}

		return params;
	}


}
