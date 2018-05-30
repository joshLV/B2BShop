package net.deepdragon.weipu.controller.mall;

import com.google.code.kaptcha.Constants;
import com.weixin.common.Configure;
import com.weixin.protocol.AccessTokenReqData;
import com.weixin.protocol.AccessTokenResData;
import com.weixin.service.AccessTokenService;
import net.deepdragon.bean.Pager;
import net.deepdragon.bean.SystemSetKey;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.Area;
import net.deepdragon.entity.DeliveryMethod;
import net.deepdragon.entity.DeliveryTime;
import net.deepdragon.entity.PaymentMethod;
import net.deepdragon.entity.cuxiao.MTPromotions;
import net.deepdragon.entity.cuxiao.Promotions;
import net.deepdragon.entity.cuxiao.PromotionsGoods;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.erp.yunji.api.YunJiErpApiUtil;
import net.deepdragon.service.*;
import net.deepdragon.service.cuxiao.PromotionsGoodsService;
import net.deepdragon.service.cuxiao.PromotionsService;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.Constant;
import net.deepdragon.util.DateUtils;
import net.deepdragon.util.MyBeanUtils;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.bean.CartItemCookie;
import net.deepdragon.weipu.bean.UserCookie;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.tools.db.ERPDBUtil;
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
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 会员相关
 */
@Controller(Global.APP_SIGN + Global.MALL + "MemberController")
@RequestMapping(Global.MALL_PATH + "/member")
public class MemberController extends BaseMallController {

	@Resource
	private MemberRankService memberRankService;
	@Resource
	private MemberService memberService;
	@Resource
	private CacheData cacheData;
	@Resource
	private MenuService menuService;
	@Resource
	private CartItemService cartItemService;
	@Resource
	private GoodsImagesService goodsImagesService;
	@Resource
	private PaymentMethodService paymentMethodService;
	@Resource
	private DeliveryMethodService deliveryMethodService;
	@Resource
	private DeliveryTimeService deliveryTimeService;
	@Resource
	private ReceiverService receiverService;
	@Resource
	private OrderService orderService;
	@Resource
	private OrderItemService orderItemService;
	@Resource
	private AreaService areaService;
	@Resource
	private GoodsService goodsService;
	@Resource
	private MemberInvoiceService memberInvoiceService;
	@Resource
	private SystemSetService systemSetService;
	@Resource
	private GoodsReviewService goodsReviewService;

	@Resource
	private ActivityFullcutService activityFullcutService;
	@Resource
	private ActivityFullcutItemService activityFullcutItemService;
	@Resource
	private ActivityDecreaseamountService activityDecreaseamountService;


	@Resource
	private PromotionsService promotionsService;
	@Resource
	private PromotionsGoodsService promotionsGoodsService;

	@Resource
	private OrderRefundService orderRefundService;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private HttpSession session;

	/**
	 * 会员注册
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping("/register")
	public String register(Model model, HttpServletRequest request) {
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		String info = "访问会员注册页面";
		setLogInfo(info);
		logger.debug(info);

		getAllCatelog(model);// 首页类目展示

		model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
		model.addAttribute("services", cacheData.getServices(getParamMap()));
		if (Global.WHICH_APP.equals(whichclient)) {
			return Global.TEMPLATE_APP + PATH + "/member/register";
		} else {
			return Global.TEMPLATE_MALL + PATH + "/member/register";
		}
	}

	@RequestMapping(value = "/username/check", method = {RequestMethod.POST})
	public
	@ResponseBody
	Object usernameCheck(String property, String userName, HttpServletRequest request) {
		boolean result = false;
//		String value = getParameter(request, "userName");
		try {
			result = !memberService.isExist(getParamMap(), property, userName.toUpperCase());
		} catch (Exception e) {
			logger.error(property + "是否可用ajax验证时，发生异常Exception:" + e);
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(value = "/save", method = {RequestMethod.POST})
	public
	@ResponseBody
	Object save(String userName, String password, String repassword, String authcode, String nickName, String iDcode, HttpSession session, HttpServletRequest request) {
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		String info = "保存注册会员信息(userName:" + userName + ")";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			if (Global.WHICH_APP.equals(whichclient)) {

			} else {
				// 校验用户名和验证码
				String kaptchaTxt = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
				if (!StringUtils.equals(authcode, kaptchaTxt)) {
					result.put(STATUS, ERROR);
					result.put(MESSAGE, "验证码错误，请重新输入。");
					return result;
				}
			}

			Member member = new Member();
			member.setUserName(userName);
			String passwordMd5 = new Md5Hash(password).toHex();
			member.setPasswd(passwordMd5);
			member.setRankId(memberRankService.getDefaultMemberRank(getParamMap()).getId());
			member.setTenantId(getTenantId());
			member.setStatus(1);
			member.setCreateUser("register");
			member.setCreateDate(new Date());
			member.setSex(1);

			member.setMobile(userName);
			if (StringUtil.isNotEmpty(iDcode)) {
				member.setIDCode(iDcode.toUpperCase());
			}
			member.setNickName(nickName);

			//注册的时候判断是否是微信自动登录过来的，如果是就把openId保存 2016-08-01 lxb

			logger.debug("注册的时候session获取openId-------------->"+request.getSession().getAttribute("openId"));
			if(request.getSession().getAttribute("openId")!=null){
				member.setOpenId((String)request.getSession().getAttribute("openId"));
			}
			member = memberService.save(getParamMap(), member);

			Member currentMember = member;
			session.setAttribute(Global.CURRENT_MERMBER, currentMember);

			/**执行同步到ERP平台操作 Auth:zhanqiang Time:2015-11-05 18:18:35 Start*/
			Map<String,String> map = ERPDBUtil.getMapCG();
			String priceFlag = map.get("synMemberInfoToERP");
			if(null!=priceFlag&&!"".equals(priceFlag)&&"true".equals(priceFlag)){
				if (StringUtil.isNotEmpty(member.getId())) {
					MemberRank memberRank = memberRankService.find(getParamMap(), "id", member.getRankId());
					String ERPId = ErpMemberInfo.saveERPMember(member, memberRank.getSign());
					if (StringUtil.isNotEmpty(ERPId)) {
						Member memberUpdate = new Member();
						memberUpdate.setId(member.getId());
						memberUpdate.setERPVipCode(ERPId);
						memberUpdate.setIsSynch(1);
						memberUpdate.setTenantId(member.getTenantId());
						memberService.update(getParamMap(),memberUpdate);
					}
				}
			}

			/**执行同步到ERP平台操作 Auth:zhanqiang Time:2015-11-05 18:18:35 End*/

			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "");

			if (isUseErpApi(getParamMap())) {
				try {
					// ERP---客户信息新增
					YunJiErpApiUtil.businessPartners(currentMember.getId(), currentMember.getUserName(), "");
				} catch (Exception ex) {
					logger.error("调用ERP-API客户信息新增时，发生异常", ex);
				}
			}
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "保存失败，请联系管理员。");
		}
		return result;

	}

	/**
	 * 会员登录页面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping("/login")
	public String login(Model model, HttpServletRequest request) {
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		String info = "访问会员登录页面";
		setLogInfo(info);
		logger.debug(info);
		model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
		model.addAttribute("services", cacheData.getServices(getParamMap()));
		String type = request.getParameter("type");
		model.addAttribute("type", type != null ? type : "");
		getAllCatelog(model);// 首页类目展示

		if (Global.WHICH_APP.equals(whichclient)) {
			return Global.TEMPLATE_APP + PATH + "/member/login";
		} else {
			return Global.TEMPLATE_MALL + PATH + "/member/login";
		}
	}

	@RequestMapping("/update_tel")
	public String updateTel(Model model, HttpServletRequest request) {
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		String info = "修改用户密码页面";
		setLogInfo(info);
		logger.debug(info);

		if (Global.WHICH_APP.equals(whichclient)) {
			return Global.TEMPLATE_APP + PATH + "/update_tel";
		} else {
			return Global.TEMPLATE_MALL + PATH + "/member/login";
		}
	}

	/**
	 * 弹出层登录
	 */
	@RequestMapping(value = "popuplogin")
	public String popupLogin(Model model) {
		String info = "访问会员登录页面(弹出层登录)";
		setLogInfo(info);
		logger.debug(info);
		return Global.TEMPLATE_MALL + PATH + "/member/login_popup";
	}

	/**
	 * 登录校验
	 *
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/check", method = {RequestMethod.POST})
	public
	@ResponseBody
	Map<String, Object> check(String userName, String password,
							  HttpServletRequest request, HttpServletResponse response,
							  HttpSession session) {
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		String type = request.getParameter("type");

		Map<String, Object> result = new HashMap<String, Object>();
		String passwordMd5 = new Md5Hash(password).toHex();
		Criteria criteria = new Criteria();
		criteria.add(Restrictions.eq("userName", userName));
		criteria.add(Restrictions.eq("passwd", passwordMd5));
		try {
			List<Member> list = memberService.getList(getParamMap(), criteria);

			String ecLogRemark = "";

			if (CollectionUtils.isNotEmpty(list) && list.size() == 1) {
				/**判断当list.get(0).getStatus()为1 表示会员状态为正常，否则为禁用会员 不许登录，但是有提示 Auth:zhangqiang Time:2015-09-22 16:55:35 Start */
				if (list.get(0).getStatus() == 1) {
					result.put(STATUS, SUCCESS);
					if (Global.WHICH_APP.equals(whichclient)) {
						if ("shoppingCart".equals(type)) {
							result.put("url", "/cart/list?whichclient=whichapp");
						} else {
							result.put("url", "/member/index?whichclient=whichapp");
						}
					} else {
						result.put("url", "member/index");
					}


					session.removeAttribute(Global.CURRENT_MERMBER);
					Member currentMember = list.get(0);
					session.setAttribute(Global.CURRENT_MERMBER, currentMember);

					// 先清空cookie
					Cookie loginMemberUsernameCookie = new Cookie(UserCookie.LOGIN_MEMBER_USERNAME_COOKIE_NAME, null);
					loginMemberUsernameCookie.setPath(request.getContextPath() + "/");
					response.addCookie(loginMemberUsernameCookie);
					Cookie loginMemberNickeNameCookie = new Cookie(UserCookie.LOGIN_MEMBER_NICKNAME_COOKIE_NAME, null);
					loginMemberNickeNameCookie.setPath(request.getContextPath() + "/");
					response.addCookie(loginMemberNickeNameCookie);
					Cookie rememberMeCookie = new Cookie(UserCookie.LOGIN_MEMBER_ME4_COOKIE_NAME, null);
					rememberMeCookie.setPath(request.getContextPath() + "/");
					response.addCookie(rememberMeCookie);

					// 登陆成功后根据当前浏览器的cookie 生成会员购物车
					setMermberCart(currentMember.getId(), request);
					// 写入会员登录Cookie
					loginMemberUsernameCookie = new Cookie(UserCookie.LOGIN_MEMBER_USERNAME_COOKIE_NAME, URLEncoder.encode(currentMember.getUserName().toLowerCase(), "UTF-8"));
					loginMemberUsernameCookie.setPath(request.getContextPath() + "/");
					loginMemberUsernameCookie.setMaxAge(UserCookie.COOKIE_MAX_AGE);
					response.addCookie(loginMemberUsernameCookie);
					if (StringUtils.isNotEmpty(currentMember.getNickName())) {
						loginMemberNickeNameCookie = new Cookie(UserCookie.LOGIN_MEMBER_NICKNAME_COOKIE_NAME, URLEncoder.encode(currentMember.getNickName().toLowerCase(), "UTF-8"));
						loginMemberNickeNameCookie.setPath(request.getContextPath() + "/");
						loginMemberNickeNameCookie.setMaxAge(UserCookie.COOKIE_MAX_AGE);
						response.addCookie(loginMemberNickeNameCookie);
					}
					rememberMeCookie = new Cookie(UserCookie.LOGIN_MEMBER_ME4_COOKIE_NAME, URLEncoder.encode("true".toLowerCase(), "UTF-8"));
					rememberMeCookie.setPath(request.getContextPath() + "/");
					rememberMeCookie.setMaxAge(-1);// 负数 - 当浏览器关闭时自动删除。
					response.addCookie(rememberMeCookie);

					ecLogRemark = "用户正常登录";
				} else {
					result.put(STATUS, ERROR);
					result.put(MESSAGE, "此会员已禁用,请联系系统管理员!");
					if (Global.WHICH_APP.equals(whichclient)) {
						result.put("url", Global.TEMPLATE_APP + PATH + "/member/login");
					} else {
						result.put("url", "member/login");
					}

					ecLogRemark= "已禁用账户尝试登录";
				}
				/**判断当list.get(0).getStatus()为1 表示会员状态为正常，否则为禁用会员 不许登录，但是有提示 Auth:zhangqiang Time:2015-09-22 16:55:35 End */
			} else {
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "用户名或密码错误");
				if (Global.WHICH_APP.equals(whichclient)) {
					result.put("url", Global.TEMPLATE_APP + PATH + "/member/login");
				} else {
					result.put("url", "member/login");
				}
				ecLogRemark= "错误用户名或密码登录";
			}

			// 保存登录日志信息
			Map<String, Object> ecLogParamMap = new HashMap<String, Object>();
			saveEcLog( request, BecLog.LogType.登录.toString(), ecLogRemark, ecLogParamMap);
		} catch (Exception e) {
			logger.error("会员登录校验时，发生异常", e);
			e.printStackTrace();
		}
		return result;
	}


	/**
	 * 会员退出登录
	 *
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request,
						 HttpServletResponse response, HttpSession session) {
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		String info = "会员退出登录";
		setLogInfo(info);
		logger.debug(info);
		try {
			session.removeAttribute(Global.CURRENT_MERMBER);
			Cookie rememberMeCookie = new Cookie(UserCookie.LOGIN_MEMBER_ME4_COOKIE_NAME, "false");
			rememberMeCookie.setPath(request.getContextPath() + "/");
			rememberMeCookie.setMaxAge(0);// 0 - 立即删除
			response.addCookie(rememberMeCookie);
		} catch (Exception e) {
			logger.error("会员退出,注销会员信息时发生错误", e);
		}
		if (Global.WHICH_APP.equals(whichclient)) {
            return "redirect:login?whichclient=whichapp";
		} else if(Global.WHICH_WEIXIN_APP.equals(whichclient)){
			return "redirect:/app_index";
		} else{
			return "redirect:" + "/index";
		}
	}

	/**
	 * 会员退出登录
	 *
	 * @return
	 */
	@RequestMapping(value = "/logoutForApp", method = {RequestMethod.POST})
	public
	@ResponseBody
	Object logoutForApp(HttpServletRequest request,
						 HttpServletResponse response, HttpSession session) {
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		String info = "logoutForApp";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			session.removeAttribute(Global.CURRENT_MERMBER);
			result.put(STATUS, SUCCESS);
			return result;
		} catch (Exception e) {
			logger.error("会员退出,注销会员信息时发生错误", e);
			result.put(STATUS, ERROR);
			return result;
		}

	}

	/**
	 * 会员中心主页面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "index")
	public String index(Model model, HttpServletRequest request,
						HttpServletResponse response) {
		String info = "会员中心主页面";
		setLogInfo(info);
		logger.debug(info);
		setPublicDate2Model( model );
		try {
			Member mb = getCurrentMember(request);
			MemberRank mbr = memberRankService.get(getParamMap(), mb.getRankId());
			model.addAttribute("mbr", mbr);
			/**查看会员 以及刷新时查询会员当前积分 Auth:zhangqiang Time:2015-10-08 17:46:35 Start */
			List<String> memberIds = null;
			memberIds = Arrays.asList(mb.getId());
			List<Member> memberList = memberService.findListByIds(getParamMap(), memberIds);
			if (memberList.size() > 0) {
				mb = memberList.get(0);
			}
			/**查看会员 以及刷新时查询会员当前积分 Auth:zhangqiang Time:2015-10-08 17:46:35 End */
			model.addAttribute("mb", mb);
			Criteria criteria = new Criteria();
			List<Order.OrderStatus> orderStatusList = new ArrayList<Order.OrderStatus>();
			// orderStatusList.add(Order.OrderStatus.cancel);
			orderStatusList.add(Order.OrderStatus.deleted);
			orderStatusList.add(Order.OrderStatus.invalid);
			criteria.add(Restrictions.notIn("a.orderStatus", orderStatusList));
			criteria.add(Restrictions.eq("a.memberId", mb.getId()));
			criteria.add(Restrictions.eq("a.platform", getPlatform()));//所属平台
			criteria.add(Restrictions.order("a.createDate","DESC"));
			criteria.add(Restrictions.group(" a.orderSn"));
			Pager pager = new Pager();
			pager.setPageSize(8);
			pager.setPageNumber(1);

			List<Order> orderList = (List<Order>)orderService.getPager(getParamMap(), criteria,pager).getList();

			List<Order> removeOrderList = new ArrayList<Order>();
			List<OrderItem> allOrderItemList = new ArrayList<OrderItem>();

			String refundLimitDayStr = getSystemSetByKey(SystemSetKey.refundLimitDay);
			int refundLimitDay = 0;

			if( StringUtils.isNotBlank( refundLimitDayStr ) ){
				refundLimitDay = Integer.parseInt( refundLimitDayStr );
			}

			if(orderList!=null && orderList.size()>0) {
				for (Order order : orderList) {

					if( refundLimitDay - 0 > 0 && Order.OrderStatus.trade_finished.equals( order.getOrderStatus() )){
						int diff = DateUtils.dateDiff('d',  Calendar.getInstance(), DateUtils.getCalendar( order.getModifyDate() ));
						if( refundLimitDay - diff <= 0 ){
							order.setAllowRefund("N");
						}
					}

					Integer isReview=1;
					criteria = new Criteria();
					criteria.add(Restrictions.eq("orderSn", order.getOrderSn()));
					criteria.add(Restrictions.limit("0", "3"));
					List<OrderItem> orderItemList = orderItemService.getList(getParamMap(), criteria);
					if(orderItemList != null && orderItemList.size() > 0) {
						for (OrderItem orderItem : orderItemList) {
							criteria = new Criteria();
							criteria.add(Restrictions.eq("goodsId", orderItem.getGoodsId()));
							criteria.add(Restrictions.limit("0", "1"));
							List<GoodsImages> goodsImagesList = goodsImagesService.getList(getParamMap(), criteria);
							if (goodsImagesList != null && goodsImagesList.size() > 0) {
								String pic = goodsImagesList.get(0).getPic();
								orderItem.setPic(pic);
							}
							allOrderItemList.add(orderItem);
							// 由于一单中多个商品有一个未评价，则为未评价 chenbin@2015-10-23
							if( isReview == 1){
								isReview=(orderItem.getIsReview()==0)?0:1;
							}
						}
					} else {
						removeOrderList.add(order);
					}

					order.setIsReview(isReview);
				}
				orderList.removeAll(removeOrderList);
			}
			criteria = new Criteria();
			criteria.add(Restrictions.eq("memberId", mb.getId()));
			criteria.add(Restrictions.eq("isRead", "NO"));
			criteria.add(Restrictions.notEq("whichSys", "EC"));
			List<GoodsReview> grs = goodsReviewService.getAllByCriteria(getParamMap(), criteria);
			model.addAttribute("unreadGoodsReviewCount", grs == null ? 0 : grs.size());
			getAllCatelog(model);// 首页类目展示
			model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
			model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
			model.addAttribute("orderItemList", allOrderItemList);
			model.addAttribute("orderList", orderList);
			model.addAttribute("orderStatusMapping", getOrderStatusMapping());
			model.addAttribute("cls", "app_setting1");

			// 便利提醒统计数量
//			getConvenientTips(model, request);

			// 写入Cookie
			writeCookie(request, response);

		} catch (Exception ex) {
			model.addAttribute(STATUS,ERROR);
			logger.error("访问" + info + "时，发生异常", ex);
			ex.printStackTrace();
		}
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		if (Global.WHICH_APP.equals(whichclient)) {
			return Global.TEMPLATE_APP + PATH + "/member/index";
		} else {
			return Global.TEMPLATE_MALL + PATH + "/member/index";
		}
	}



	private void writeCookie(HttpServletRequest request,
							 HttpServletResponse response) throws UnsupportedEncodingException {
		Member currentMember = getCurrentMember(request);
		// 先清空cookie
		Cookie loginMemberUsernameCookie = new Cookie(UserCookie.LOGIN_MEMBER_USERNAME_COOKIE_NAME, null);
		loginMemberUsernameCookie.setPath(request.getContextPath() + "/");
		response.addCookie(loginMemberUsernameCookie);
		Cookie loginMemberNickeNameCookie = new Cookie(UserCookie.LOGIN_MEMBER_NICKNAME_COOKIE_NAME, null);
		loginMemberNickeNameCookie.setPath(request.getContextPath() + "/");
		response.addCookie(loginMemberNickeNameCookie);
		Cookie rememberMeCookie = new Cookie(UserCookie.LOGIN_MEMBER_ME4_COOKIE_NAME, null);
		rememberMeCookie.setPath(request.getContextPath() + "/");
		response.addCookie(rememberMeCookie);
		// 登陆成功后根据当前浏览器的cookie 生成会员购物车
		if (currentMember != null) {
			setMermberCart(currentMember.getId(), request);
			// 写入会员登录Cookie
			loginMemberUsernameCookie = new Cookie(UserCookie.LOGIN_MEMBER_USERNAME_COOKIE_NAME, URLEncoder.encode(currentMember.getUserName().toLowerCase(), "UTF-8"));
			loginMemberUsernameCookie.setPath(request.getContextPath() + "/");
			loginMemberUsernameCookie.setMaxAge(UserCookie.COOKIE_MAX_AGE);
			response.addCookie(loginMemberUsernameCookie);
			if (currentMember.getNickName() != null) {
				loginMemberNickeNameCookie = new Cookie(UserCookie.LOGIN_MEMBER_NICKNAME_COOKIE_NAME, URLEncoder.encode(currentMember.getNickName().toLowerCase(), "UTF-8"));
				loginMemberNickeNameCookie.setPath(request.getContextPath() + "/");
				loginMemberNickeNameCookie.setMaxAge(UserCookie.COOKIE_MAX_AGE);
				response.addCookie(loginMemberNickeNameCookie);
			}
			rememberMeCookie = new Cookie(UserCookie.LOGIN_MEMBER_ME4_COOKIE_NAME, URLEncoder.encode("true".toLowerCase(), "UTF-8"));
			rememberMeCookie.setPath(request.getContextPath() + "/");
			rememberMeCookie.setMaxAge(-1);
			response.addCookie(rememberMeCookie);
		}

	}

	/**
	 * 帮助页面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "help")
	public String hlep(Model model) {
		String info = "帮助页面";
		setLogInfo(info);
		logger.error(info);
		return Global.TEMPLATE_MALL + PATH + "/member/index_help";
	}

	/**
	 * 结算之前进行库存校验
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping("/stockJudge")
	@ResponseBody
	public Object stockJudge(HttpServletRequest request) {
		String info = "结算前库存校验";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		/**增加对商品是否上下架的判断 Auth:zhangqiang Time:2015-10-12 17:42:35 Start */
//		boolean success = true;
		String success = "success";
		/**增加对商品是否上下架的判断 Auth:zhangqiang Time:2015-10-12 17:42:35 End */
		StringBuilder msg = new StringBuilder();
		String msgStr = "";

		String o = request.getParameter("o");//购物车数据ID集合
		Member currentMember = getCurrentMember(request);

		try {
			String[] orderIds = o.split(",");
			List<String> orderIdsList = new ArrayList<String>();
			for (String orderId : orderIds) {
				if (!StringUtils.isEmpty(orderId)) {
					orderIdsList.add(orderId);
				}
			}
			List<CartItem> cartItemList = cartItemService.findListByIds(getParamMap(), orderIdsList) ;//getListByMemberIdAndIds(getParamMap(), currentMember.getId(), orderIdsList);

			for (CartItem ci : cartItemList) {
				Goods goods = goodsService.get(getParamMap(), ci.getGoodsId());
				/**增加对商品是否上下架的判断 Auth:zhangqiang Time:2015-10-12 17:42:35 Start */
				if (goods.getIsMarketable() != 1) {
					success = "isMarketable";
					result.put("goodsId", ci.getGoodsId());
					msgStr = "商品【" + ci.getName() + "】 已下架,请删除此商品再结算!";
					break;
				}

				//20160802 dzz 根据商品id查询对应的活动类型信息
				/*Criteria c1 = new Criteria();
				c1.add(Restrictions.eq("goodsId", ci.getGoodsId()));
				Pager pager = new Pager();
				pager = promotionsService.getMxAndTgPager(getParamMap(), c1, null, pager);
				if(pager.getList()!=null && pager.getList().size()>0) {
					MTPromotions mTPromotions = pager.getList() != null && pager.getList().size() > 0 ? (MTPromotions) pager.getList().get(0) : null;*/
				MTPromotions mTPromotions = promotionsService.getMTProtions4ValidGoodsNumsByGoodsId(getParamMap(), goods.getId());
				if(mTPromotions != null){

					//2、查询促销(团购)活动
					Promotions promotions = this.promotionsService.get(getParamMap(), mTPromotions.getId());


					//3、查询促销(团购)商品
					Criteria pgCriteria = new Criteria();
					pgCriteria.add(Restrictions.eq("promotionsId", promotions.getId()));
					pgCriteria.add(Restrictions.eq("goodsId", ci.getGoodsId()));

					List<PromotionsGoods> promotionsGoodsList = this.promotionsGoodsService.getList(getParamMap(), pgCriteria);
					PromotionsGoods promotionsGoods = new PromotionsGoods();
					if(promotionsGoodsList!=null && promotionsGoodsList.size()>0) {
						for(int i=0; i<promotionsGoodsList.size(); i++) {
							if(ci.getGoodsId().equals(promotionsGoodsList.get(i).getGoodsId())) {
								promotionsGoods = promotionsGoodsList.get(i);
							}
						}
					}

					if("ing".equals(mTPromotions.getStatus().trim())) {
						if("create".equals(mTPromotions.getIsOpen().trim())) {//判断活动是否开始, 开始后则不进行更新
							promotions.setIsOpen("start");//设置活动为已开始状态
							promotionsService.update(getParamMap(), promotions);

							int newStartNum = promotionsGoods.getNewStartNum();    //新起买数量
							int newLimitNum = promotionsGoods.getNewLimitNum();    //新限购数量
							int newStock = promotionsGoods.getNewStock();    //新限购数量

							//20160805 dzz 同步商品原起购, 原限购数量 到 促销活动商品起购, 限购数量
							promotionsGoods.setOldStartNum(StringUtil.isNotEmpty(goods.getStartNum()) ? goods.getStartNum() : 0);
							promotionsGoods.setOldLimitNum(StringUtil.isNotEmpty(goods.getLimitNum()) ? goods.getLimitNum() : 0);
							promotionsGoods.setOldStock( goods.getStock()==null?0:goods.getStock().intValue() );
							promotionsGoodsService.update(getParamMap(), promotionsGoods);

							//20160805 daa 同步促销活动新起购, 新限购数量 到 商品中起购限购
							goods.setPrice(mTPromotions.getPromotionsPrice());//设置更新商品价位促销价
							goods.setStartNum(newStartNum);
							goods.setLimitNum(newLimitNum);
							goods.setStock(Double.parseDouble(newStock+""));
							int goodsResult = goodsService.update(getParamMap(), goods);
							if(goodsResult>0) {
								if(goods.getLimitNum()!=0) {
									/*Map<String, Object> paramMap = new HashMap<String, Object>(0);
									paramMap = getParamMap();
									paramMap.put("promotionsId", mTPromotions.getId());
									if(StringUtil.isNotEmpty(getCurrentMember(request))) {
										paramMap.put("memberId", getCurrentMember(request).getId());
									}
									List<MTPromotions> countResult = promotionsService.getCountPromotionsOrder(paramMap, new Criteria());*/
									List<MTPromotions> countResult = promotionsService.getCountPromotions(getParamMap(), mTPromotions.getId(), null, getCurrentMember(request)==null?null:getCurrentMember(request).getId());
									if(countResult!=null && countResult.size()>0) {
										int beBuy = ci.getQuantity() + countResult.get(0).getResultCount();
										if(!(beBuy>=goods.getStartNum() && beBuy<=goods.getLimitNum())) {
											success = "validNums"; //验证促销商品购买数量是否合法
											result.put("cartItemId", ci.getId());
											msgStr = "商品【" + ci.getName() + "】 购买数量异常,请重新选择数量后再结算!";
											break;
										}
									} else {
										if(!(ci.getQuantity()>=goods.getStartNum() && ci.getQuantity()<=goods.getLimitNum())) {
											success = "validNums"; //验证促销商品购买数量是否合法
											result.put("cartItemId", ci.getId());
											msgStr = "商品【" + ci.getName() + "】 购买数量异常,请重新选择数量后再结算!";
											break;
										}
									}
								}
							}
						}
					}  else if("after".equals(mTPromotions.getStatus().trim())) {
						if("start".equals(mTPromotions.getIsOpen().trim()) || "create".equals(mTPromotions.getIsOpen().trim())) {//判断活动是否结束, 结束状态则进行更新
							promotions.setIsOpen("end");//设置活动为已结束状态
							promotionsService.update(getParamMap(), promotions);

							int oldStartNum = promotionsGoods.getOldStartNum();    //原起买数量
							int oldLimitNum = promotionsGoods.getOldLimitNum();    //原限购数量
							int oldStock = promotionsGoods.getOldStock();    //原库存数量
							int newStock = promotionsGoods.getNewStock();    //原库存数量

							goods.setPrice(mTPromotions.getGoodsPrice());//设置商品价为原商品价
							goods.setStartNum(oldStartNum);
							goods.setLimitNum(oldLimitNum);
							goods.setStock( oldStock - (newStock - goods.getStock() ) );
							goodsService.update(getParamMap(), goods);
						}
					}
				}

				/**增加对商品是否上下架的判断 Auth:zhangqiang Time:2015-10-12 17:42:35 End */
				if (ci.getQuantity() > goods.getStock()) {
					success = "false";
					msg.append("商品【" + ci.getName() + "】、");
				}
			}

			if ("success".equals(success)) {
				msg.append("库存校验成功");
				/**增加对商品是否上下架的判断 Auth:zhangqiang Time:2015-10-12 17:42:35 Start */
			} else if ("isMarketable".equals(success)) {
				msg.append(msgStr);
				/**增加对商品是否上下架的判断 Auth:zhangqiang Time:2015-10-12 17:42:35 End */
			} else if ("validNums".equals(success)) {
				msg.append(msgStr);
			} else {
				msg = new StringBuilder(msg.substring(0, msg.length() - 1)).append("库存不足，请联系商家");
			}

		} catch (Exception e) {
			logger.error(info + "库存校验时，发生异常:" + e);
			e.printStackTrace();
			success = "false";
			result.put("success", success);
			result.put("msg", "系统异常，请联系管理员！");
			return result;
		}

		result.put("success", success);
		result.put("msg", msg);
		return result;
	}


	/**
	 * 核对订单页面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping("/ordercheck")
	public String orderCheck(Model model, HttpServletRequest request) {
		String info = "订单核对页面";
		setLogInfo(info);
		logger.debug(info);

		String type = request.getParameter(Global.WHICHCLIENT);
		/**** new 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23 Start */
		String o = request.getParameter("o");//购物车数据ID集合
		if (StringUtils.isEmpty(o)) {
			logger.error(info + "获取订单信息时，发生异常：无效的订单信息");
			if (Global.WHICH_APP.equals(type)) {
				return "redirect:/cart/list?whichclient=whichapp";
			} else {
				return "redirect:/cart/list";
			}
		}
		/**** new 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23 Old */

		model.addAttribute("o", o);//商品ID

		Member currentMember = getCurrentMember(request);

		try {
			/** 获取会员等级 TianYu  2016-1-18 14:45:56 Start **/
			MemberRank memberRank = this.memberRankService.get(getParamMap(), currentMember.getRankId());
			model.addAttribute("memberRankScale", memberRank.getScale()/100);
			/** 获取会员等级 TianYu  2016-1-18 14:45:56 End **/

			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("re.memberId", currentMember.getId()));
			String receiverId=request.getParameter("receiverId");

			List<Receiver> receiverList = receiverService.getList(getParamMap(), criteria);
			model.addAttribute("receiverList", receiverList);
			Receiver ReceiverN=new Receiver();

			if (receiverList != null && receiverList.size() > 0 ) {
				if(null != receiverId && !"".equals(receiverId)){
					criteria.add(Restrictions.eq("re.id", receiverId));
					model.addAttribute("receiver", receiverService.getList(getParamMap(),criteria).get(0));
					MyBeanUtils.copyBean2Bean(ReceiverN,receiverService.getList(getParamMap(),criteria).get(0));
				}else{
					/**重新修改默认收货地址获取逻辑   hks   2015-11-06  modify  start **/
	//				Receiver receiver = receiverList.get(0);
	//				model.addAttribute("receiver", receiver);// 默认第一个收货地址
					for(Receiver receiver:receiverList){
						if(receiver.getIsDefault()==1){
							model.addAttribute("receiver", receiver);
							MyBeanUtils.copyBean2Bean(ReceiverN,receiver);
							break;
						}
					}
					/**重新修改默认收货地址获取逻辑   hks   2015-11-06  modify  start **/
				}
				model.addAttribute("receiverN", ReceiverN);
			}

			Map<String, String> invoiceInfo = new HashMap<String, String>();
			invoiceInfo.put("invoiceContent", "no");
			invoiceInfo.put("invoiceTitle", "");
			invoiceInfo.put("invoiceType", "");
			MemberInvoice memberInvoice = memberInvoiceService.getDefaultInvoiceInfo(getParamMap(), currentMember.getId());
			if (memberInvoice != null) {
				invoiceInfo.put("invoiceContent", "infos");
				invoiceInfo.put("invoiceTitle", memberInvoice.getInvoiceTitle());
				invoiceInfo.put("invoiceType", "normal");
			} else {
				memberInvoice = new MemberInvoice();
			}
			List<MemberInvoice> memberInvoicesList = memberInvoiceService.findList(getParamMap(), "memberId", currentMember.getId());
			if (memberInvoicesList.isEmpty()) {
				MemberInvoice newInvoice = new MemberInvoice();
				newInvoice.setInvoiceTitle("个人");
				newInvoice.setTenantId(getTenantId());
				newInvoice.setMemberId(currentMember.getId());
				newInvoice.setIsDefault(1);
				newInvoice.setCreateUser(currentMember.getId());
				newInvoice.setCreateDate(new Date());
				memberInvoiceService.save(getParamMap(), newInvoice);
				memberInvoicesList.add(newInvoice);
			}
			/****
			 * OLD 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23
			 List<CartItem> cartItemList = cartItemService.getListByMemberId(getTenantId(), currentMember.getId());
			 */
			/**** new 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23 Start */
			String[] orderIds = o.split(",");
			List<String> orderIdsList = new ArrayList<String>();
			for (String orderId : orderIds) {
				if (!StringUtils.isEmpty(orderId)) {
					orderIdsList.add(orderId);
				}
			}
			List<CartItem> cartItemList = cartItemService.getListByMemberIdAndIds(getParamMap(), currentMember.getId(), orderIdsList);
			/** 获取商品满减优惠金额 hks 2016-4-15 11:47:24   Start**/
			for(CartItem cartItem : cartItemList){
				getActivityDecreaseAmount(cartItem);
			}
			/** 获取商品满减优惠金额 hks  2016-4-15 11:47:24 end**/


			/**** new 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23 End */

			//model.addAttribute("cartItemList", groupCartItemByShop(cartItemList));
			model.addAttribute("member", currentMember);
			//发票信息
			model.addAttribute("invoiceInfo", invoiceInfo);
			model.addAttribute("memberInvoice", memberInvoice);
			model.addAttribute("memberInvoicesList", memberInvoicesList);
			// 支付方式
			List<PaymentMethod> paymentMethods = getPaymentMethodList();
			model.addAttribute("paymentMethodList", paymentMethods);

			String paymentMethodId = request.getParameter("paymentMethodId");

			/** APP端订单确认页面已选择支付方式后又重新请求 LiaoHanyin 2015-11-4 start*/
			String payMentId=request.getParameter("paymentMethodId");

			PaymentMethod paymentMethodsN=new PaymentMethod();
			if(StringUtil.isNotEmpty(payMentId)){
				/**  从原来的根据Id查询数据库改为遍历获取  TianYu  2015-12-08 15:11:52 Start */
				PaymentMethod paymentMethod = null;
				if(paymentMethods!=null && paymentMethods.size()>0){
					for( PaymentMethod pm : paymentMethods){
						if( payMentId.equals( pm.getId() ) ){
							paymentMethod = pm;
							break;
						}
					}
				}
				/**  从原来的根据Id查询数据库改为遍历获取  TianYu  2015-12-08 15:11:52 End */
				model.addAttribute("paymentMethod", paymentMethod);
				MyBeanUtils.copyBean2Bean(paymentMethodsN, paymentMethod);
				model.addAttribute("paymentMethodN",paymentMethodsN);
				if (!StringUtil.isEmpty(paymentMethodId)) {
					model.addAttribute("paymentMethodIds", paymentMethodId);
				}else{
					model.addAttribute("paymentMethodIds", paymentMethod.getId());
				}
			}else{
				model.addAttribute("paymentMethod", paymentMethods!=null&&paymentMethods.size()>0?paymentMethods.get(0):null);
				MyBeanUtils.copyBean2Bean(paymentMethodsN, paymentMethods!=null&&paymentMethods.size()>0?paymentMethods.get(0):null);
				model.addAttribute("paymentMethodN",paymentMethodsN);
				if (!StringUtil.isEmpty(paymentMethodId)) {
					model.addAttribute("paymentMethodIds", paymentMethodId);
				}else{
					model.addAttribute("paymentMethodIds", paymentMethods!=null&&paymentMethods.size()>0?paymentMethods.get(0).getId():null);
				}
			}

			/** 组装店铺商品总额、运费、总价等数据 Tianyu 2015-8-19 Start */
			List<Map<String, Object>> items = groupCartItemByShop(cartItemList);


			String deliveryId = null;

			/******** 修改配送方式，获取默认的配送方式  TianYu 2016-1-18 10:08:57  New Start ***********/
			List<DeliveryMethod> deliveryMethods = getDeliveryMethodList();
			model.addAttribute("deliveryMethodList", getDeliveryMethodList());
			if( deliveryMethods!=null && deliveryMethods.size() > 0){
				DeliveryMethod defaultDeliveryMethod = null;
				for(DeliveryMethod dm : deliveryMethods){
					if( 0 == dm.getIsDefault() ){
						defaultDeliveryMethod = dm;
						break;
					}
				}

				if( defaultDeliveryMethod != null ){
					model.addAttribute("deliveryMethod", defaultDeliveryMethod);
					deliveryId = defaultDeliveryMethod.getId();
				}else{
					model.addAttribute("deliveryMethod", deliveryMethods.get(0));
					deliveryId = deliveryMethods.get(0).getId();
				}
			}else{
				throw new Exception("商城未设置配送方式");
			}
			/******** 修改配送方式，获取默认的配送方式  TianYu 2016-1-18 10:08:57  New End ***********/

//			costCalculation(items);
			costCalculation(items, memberRank.getScale(), deliveryId);
			model.addAttribute("didFlag", deliveryId);
			/**从支付审核页面获取快递ID Auth:zhangqiang Time:2015-09-25 17:49:35 End
			 * */
			model.addAttribute("cartItemList", items);
			/** 组装店铺商品总额、运费、总价等数据 Tianyu 2015-8-19 End */

			// 配送方式
			/******** 修改配送方式，获取默认的配送方式  TianYu 2016-1-18 10:08:57  Old Start ***********/
			/*
			model.addAttribute("deliveryMethodList", getDeliveryMethodList());
			if(StringUtil.isNotEmpty(deliveryId) && !"0".equals(deliveryId)){
				model.addAttribute("deliveryMethod", deliveryMethodService.find(getParamMap(),"id",deliveryId));
			}else{
				model.addAttribute("deliveryMethod", getDeliveryMethodList().get(0));
			}*/
			/******** 修改配送方式，获取默认的配送方式  TianYu 2016-1-18 10:08:57  Old End ***********/


			// 送货时间
			model.addAttribute("deliveryTimeList", getDeliveryTimeList());

			String deliveryTimeId = request.getParameter("deliveryTimeId");
			if (!StringUtil.isEmpty(deliveryTimeId)) {
				model.addAttribute("deliveryTimeIds", deliveryTimeId);
			}else{
				model.addAttribute("deliveryTimeIds", getDeliveryTimeList().get(0).getId());
			}

			String order_deliveryTimeName = request.getParameter("order_deliveryTimeName");
			if (!StringUtil.isEmpty(order_deliveryTimeName)) {
				model.addAttribute("deliveryTimeName", order_deliveryTimeName);
			}else{
				model.addAttribute("deliveryTimeName", getDeliveryTimeList().get(0).getIntroduce());
			}

			// 配送费用
//			model.addAttribute("deliveryFee", calculateGoodsDeliveryFee(getTenantId(), getDeliveryMethodList().get(0).getId(), cartItemList));



			setPublicDate2Model( model );
		} catch (Exception e) {
			logger.error(info + "获取收货人、购物车等信息时，发生异常:" + e);
			e.printStackTrace();
		}
		if (Global.WHICH_APP.equals(type)) {
			return Global.TEMPLATE_APP + PATH + "/member/ordercheck";
		} else {
			return Global.TEMPLATE_MALL + PATH + "/member/ordercheck";
		}
	}

	/**
	 * 保存新增发票信息
	 */
	@RequestMapping("/saveInvoice")
	@ResponseBody
	public Object saveInvoice(HttpServletRequest request) {
		String info = "保存发票抬头信息";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		boolean success = true;
		StringBuilder msg = new StringBuilder();
		msg.append(info);
		try {
			Member currentMember = getCurrentMember(request);
			String invoiceTitle = request.getParameter("invoiceTitle");
			MemberInvoice newInvoice = new MemberInvoice();
			newInvoice.setInvoiceTitle(invoiceTitle);
			newInvoice.setTenantId(getTenantId());
			newInvoice.setMemberId(currentMember.getId());
			newInvoice.setIsDefault(1);
			newInvoice.setCreateUser(currentMember.getId());
			newInvoice.setCreateDate(new Date());
			newInvoice = memberInvoiceService.save(getParamMap(), newInvoice);
			memberInvoiceService.updateDefault(getParamMap(), currentMember.getId(), newInvoice.getId());
			result.put("id", newInvoice.getId());
			msg.append("成功！");
		} catch (Exception e) {
			logger.error(info + "时，发生异常:" + e);
			success = false;
			msg.append("时，发生异常!");
			e.printStackTrace();
		}
		result.put("success", success);
		result.put("msg", msg);
		return result;
	}

	/**
	 * 保存发票信息设置
	 */
	@RequestMapping("/saveInvoiceSetting")
	@ResponseBody
	public Object saveInvoiceSetting(HttpServletRequest request) {
		String info = "保存发票抬头信息设置";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		boolean success = true;
		StringBuilder msg = new StringBuilder();
		msg.append(info);
		String invoiceContent = request.getParameter("invoiceContent");
		try {
			Member currentMember = getCurrentMember(request);
			if (invoiceContent.equals("no")) {
				memberInvoiceService.updateDefault(getParamMap(), currentMember.getId(), null);
			} else {
				MemberInvoice newInvoice = new MemberInvoice();
				String invoiceTitle = request.getParameter("invoiceTitle");
				String id = request.getParameter("id");
				newInvoice.setId(id);
				newInvoice.setInvoiceTitle(invoiceTitle);
				newInvoice.setTenantId(getTenantId());
				newInvoice.setMemberId(currentMember.getId());
				newInvoice.setIsDefault(1);
				newInvoice.setModifyUser(currentMember.getId());
				newInvoice.setModifyDate(new Date());
				memberInvoiceService.update(getParamMap(), newInvoice);
				memberInvoiceService.updateDefault(getParamMap(), currentMember.getId(), id);
			}
			msg.append("成功！");
		} catch (Exception e) {
			logger.error(info + "时，发生异常:" + e);
			success = false;
			msg.append("时，发生异常!");
			e.printStackTrace();
		}
		result.put("success", success);
		result.put("msg", msg);
		return result;
	}

	/**
	 * 删除发票信息
	 */
	@RequestMapping("/deleteInvoice")
	@ResponseBody
	public Object deleteInvoice(HttpServletRequest request) {
		String info = "删除发票抬头信息";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		boolean success = true;
		StringBuilder msg = new StringBuilder();
		msg.append(info);
		try {
			String id = request.getParameter("id");
			memberInvoiceService.delete(getParamMap(), id);
			msg.append("成功！");
		} catch (Exception e) {
			logger.error(info + "时，发生异常:" + e);
			success = false;
			msg.append("时，发生异常!");
			e.printStackTrace();
		}
		result.put("success", success);
		result.put("msg", msg);
		return result;
	}

	/**
	 * 修改发票信息
	 */
	@RequestMapping("/editInvoice")
	@ResponseBody
	public Object editInvoice(HttpServletRequest request) {
		String info = "修改发票抬头信息";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		boolean success = true;
		StringBuilder msg = new StringBuilder();
		msg.append(info);
		try {
			String id = request.getParameter("id");
			Member currentMember = getCurrentMember(request);
			String invoiceTitle = request.getParameter("invoiceTitle");
			MemberInvoice newInvoice = new MemberInvoice();
			newInvoice.setId(id);
			newInvoice.setInvoiceTitle(invoiceTitle);
			newInvoice.setModifyUser(currentMember.getId());
			newInvoice.setModifyDate(new Date());
			memberInvoiceService.update(getParamMap(), newInvoice);
			msg.append("成功！");
		} catch (Exception e) {
			logger.error(info + "时，发生异常:" + e);
			success = false;
			msg.append("时，发生异常!");
			e.printStackTrace();
		}
		result.put("success", success);
		result.put("msg", msg);
		return result;
	}


	/**
	 * 获取商品参加促销优惠活动的优惠价格 （目前只有 促销满减活动）
	 *
	 * @param cartItem
	 * @return
	 * @author hks
	 * @Date 2016-4-15
	 */
	private void getActivityDecreaseAmount(CartItem cartItem){
		String info = "获取商品满减优惠金额";
		setLogInfo(info);
		List<ActivityFullcutItem> activityFullcutItems = new ArrayList<>();
		List<ActivityFullcut> activityFullcuts = new ArrayList<>();
		List<ActivityDecreaseamount> activityDecreaseamounts = new ArrayList<>();
		try {
			activityFullcutItems = activityFullcutItemService.findList(getParamMap(), "itemId", cartItem.getGoodsId());
			//是否参与满减活动
			if(activityFullcutItems != null && activityFullcutItems.size() > 0){
				List<String> fullCutIds = new ArrayList<>();
				for (ActivityFullcutItem item:activityFullcutItems){
					fullCutIds.add(item.getFullCutId());
				}
				//详情页显示最新活动信息  排序在sql中进行 所以页面显示是获取集合get(0)
				activityFullcuts = activityFullcutService.findListByIds(getParamMap(),fullCutIds);
				if(activityFullcuts !=null && activityFullcuts.size()>0) {
					//ActivityFullcutItem activityFullcutItem = activityFullcutItemService.find(getParamMap(), "fullCutId", activityFullcuts.get(0).getId());
					String itemId = "";
					for(ActivityFullcutItem item : activityFullcutItems ){
						if( item.getFullCutId().equals(activityFullcuts.get(0).getId())){
							itemId = item.getId();
							break;
						}
					}
					if(StringUtil.isNotEmpty(itemId)){
						activityDecreaseamounts = activityDecreaseamountService.findList(getParamMap(), "fullCutItemId", itemId);
						cartItem.setMjDecreaseAmount("0.00");
						for(ActivityDecreaseamount amount:activityDecreaseamounts){
							if(Double.parseDouble(cartItem.getPrice()) * cartItem.getQuantity() >= amount.getTotalPrice()){
								if(amount.getDecreaseAmount()>= Double.parseDouble(cartItem.getMjDecreaseAmount())) {
									cartItem.setMjCondition(String.valueOf(amount.getTotalPrice()));
									cartItem.setMjDecreaseAmount(String.valueOf(amount.getDecreaseAmount()));
								}
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * * 添加方法，list()中调用
	 * 按照商品所属商家对商品进行分组
	 * 返回Map的key：
	 * 1、shopId:String
	 * 2、shopName:String
	 * 3、shopUrl:String
	 * 4、items：List<CartItem>
	 *
	 * @param cartItems
	 * @return
	 * @author TianYu
	 * @Date 2015-8-19
	 */
	private List<Map<String, Object>> groupCartItemByShop(List<CartItem> cartItems) {
		if (cartItems == null || cartItems.size() == 0) {
			return null;
		}
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		//获取所有的商家ID
		Set<String> merchants = new HashSet<String>();
		for (CartItem ci : cartItems) {
			merchants.add(ci.getMerchantId());
		}

		//组装数据
		for (String mid : merchants) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", mid);

			Iterator<CartItem> it = cartItems.iterator();
			List<CartItem> items = new ArrayList<CartItem>(0);
			while (it.hasNext()) {
				CartItem ci = it.next();
				if (mid.equals(ci.getMerchantId())) {
					if (!map.containsKey("shopName") && !map.containsKey("shopUrl")) {
						map.put("shopName", ci.getMerchantShortName());
						map.put("shopUrl", ci.getMerchantUrlAddress());
					}

					//组装规格
					installSp(ci);

					items.add(ci);
					it.remove();
				}
			}

			map.put("items", items);
			list.add(map);
		}

		return list;
	}

	/**
	 * 组装商品规格
	 *
	 * @param ci TianYu
	 *           2015-9-14
	 */
	private void installSp(CartItem ci) {
		if (StringUtil.isNotEmpty(ci.getSpecification())) {
			if (ci.getSpecification().indexOf(")X") > 0) {
				int count = 0;
				String[] sps = ci.getSpecification().split(";");
				for (int i = 0; i < sps.length; i++) {
					if (i < sps.length - 1) {
						count += Integer.parseInt(sps[i].substring(sps[i].lastIndexOf("X") + 1));
					}

				}
				ci.setSpecification(ci.getSpecification() + "X" + (ci.getQuantity() - count));
			} else {
				ci.setSpecification(ci.getSpecification() + "X" + ci.getQuantity());
			}
		}
	}

	/**
	 * * 新增方法：分店铺计算费用
	 * 1、计算店铺商品总金额：goodsTotal
	 * 2、计算店铺总运费：deliveryFeeTotal
	 * 3、店铺合计：shopTotal
	 * 4、店铺优惠金额：discount
	 *
	 * @param items
	 * @param scale 会员等级优惠比例
	 * @param deliveryId 配送方式ID
	 * @author TianYu
	 * @Date 2015-8-19
	 * UpdateUser:zhangqiang
	 * UPdateMessage:增加一个快递ID用于计算快递费用
	 *
	 * updateTime：  2016-1-18 14:56:29
	 * UpdateAuthor： TianYu
	 * DESC：添加会员优惠比例参数，计算订单的优惠金额
	 */
	private void costCalculation(List<Map<String, Object>> items, Double scale, String deliveryId) {
		if (items != null && items.size() > 0) {
			for (Map<String, Object> map : items) {
				/**增加一个存放快递id的参数 用于计算快递费用 Auth:zhangqiang Time:2015-09-25 17:52:35 Start
				 * */
//				Map<String,Double> m = calculateShopFee( (List<CartItem>)map.get("items"));
				Map<String, Double> m = calculateShopFee((List<CartItem>) map.get("items"), deliveryId);
				/**增加一个存放快递id的参数 用于计算快递费用 Auth:zhangqiang Time:2015-09-25 17:52:35 End
				 * */

 				/** 满减金额  hks 2016-4-15 12:52:13  Start**/
				Double mjDecreaseAmount = 0.00;
				List<CartItem> cartItemList = (List<CartItem>) map.get("items");
 				if (cartItemList != null && cartItemList.size() > 0) {
					for (CartItem item : cartItemList) {
						if(item.getMjDecreaseAmount() != null){
							mjDecreaseAmount = mjDecreaseAmount + Double.parseDouble(item.getMjDecreaseAmount());
						}
					}
				}
				/** 满减金额  hks 2016-4-15 12:52:13  Start**/

 				Double discount = StringUtil.numberHalfAdjust(((Double)m.get("goodsTotal")) * scale / 100,2);
				discount = discount + mjDecreaseAmount;
				map.put("goodsTotal", m.get("goodsTotal"));
				map.put("discount", discount);//计算优惠比例
				map.put("deliveryFeeTotal", m.get("deliveryFeeTotal"));
				map.put("shopTotal", m.get("shopTotal") - discount);
			}
		}
	}


	/**
	 * 计算店铺中所有计算商品的
	 * 1、计算店铺商品总金额：goodsTotal
	 * 2、计算店铺总运费：deliveryFeeTotal
	 * 3、店铺合计：shopTotal
	 * <p/>
	 * UpdateUser:zhangqiang
	 * UpdateTime:2015-09-25 17:54:35
	 * UpdateContent:增加一个快递ID参数
	 *
	 * @param cartItemList 订单项列表
	 * @return 最终的配送费用
	 */
	private Map<String, Double> calculateShopFee(List<CartItem> cartItemList, String deliveryId) {
		Map<String, Double> map = new HashMap<String, Double>();
		double goodsTotal = 0.00;
		double deliveryFee = 0.00;
		/**当参数为0表示第一次进入支付审核页面 快递默认是第一个 否则 快递id为传值 Auth:zhangqiang Time:2015-09-25 17:56"35 Start
		 * */
		DeliveryMethod deliveryMethod = null;
		try {
			if ("0".equals(deliveryId)) {
				deliveryMethod = deliveryMethodService.get(getParamMap(), getDeliveryMethodList().get(0).getId());
			} else {
				deliveryMethod = deliveryMethodService.get(getParamMap(), deliveryId);
			}
//			DeliveryMethod deliveryMethod = deliveryMethodService.get(getTenantId(), getDeliveryMethodList().get(0).getId());
			/**当参数为0表示第一次进入支付审核页面 快递默认是第一个 否则 快递id为传值 Auth:zhangqiang Time:2015-09-25 17:56"35 End
			 * */
			if (cartItemList != null && cartItemList.size() > 0) {
				double goodsTotalWeight = 0.00; // 商品总重量
				boolean isFreeDeliveryFee = true; // 默认true为包邮
				for (CartItem item : cartItemList) {
					Goods goods = goodsService.get(getParamMap(), item.getGoodsId());
					if(goods.getIsPost() == 0) { // 0为不包邮, 不包邮计算商品总重量
						isFreeDeliveryFee = false;
						goodsTotalWeight += goods.getWeight() * item.getQuantity();
					}
					goodsTotal += (goods.getPrice() * item.getQuantity());
				}
				if(isFreeDeliveryFee){ // 所有商品都包邮，则运费为0
					deliveryFee = 0.0;
				}else{
					/**  判断是否开启满就包邮  TianYu 2016-1-11 17:53:04  Start ***/
					String freeShippingNum = systemSetService.find(getParamMap(), "setkey", "freeShippingNum").getSetvalue();
					if(!"-1".equals( freeShippingNum )){//是否开启满就包邮
						if( goodsTotal >= Integer.parseInt( freeShippingNum ) ){//高于多少，包邮
							deliveryFee = 0;
						}else{//未达到包邮条件
							// 计算配送费用
							deliveryFee = countDeliveryFeeByWeight(goodsTotalWeight, deliveryMethod);
						}
					}else{
						// 计算配送费用
						deliveryFee = countDeliveryFeeByWeight(goodsTotalWeight, deliveryMethod);
					}
					/**  判断是否开启满就包邮  TianYu 2016-1-11 17:53:04  End ***/
				}

			}
		} catch (Exception e) {
			logger.error("计算配送费用时出异常", e);
		}


		map.put("goodsTotal", goodsTotal);
		map.put("deliveryFeeTotal", deliveryFee);
		map.put("shopTotal", goodsTotal + deliveryFee);
		return map;
	}

	/**
	 * 查询字符方式
	 *
	 * @return
	 */
	private List<PaymentMethod> getPaymentMethodList() {
		List<PaymentMethod> paymentMethods = null;
		try {
			paymentMethods = paymentMethodService.getAll(getParamMap());
		} catch (Exception e) {
			logger.error("查询支付方式时发生异常Exception:" + e);
			e.printStackTrace();
		}
		return paymentMethods;
	}

	/**
	 * 查询配送方式
	 *
	 * @return
	 */
	private List<DeliveryMethod> getDeliveryMethodList() {
		List<DeliveryMethod> deliveryMethods = null;
		try {
			/** 查询配送方式加启用条件 Auth:zhangqiang 2015-09-21 14:47:35 Start */
//			deliveryMethods = deliveryMethodService.getAll(getTenantId());
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("enabled", 1));
			criteria.add(Restrictions.eq(Constant.PLATFORM_KEY, getPlatform()));
			deliveryMethods = deliveryMethodService.getList(getParamMap(), criteria);
			/** 查询配送方式加启用条件 Auth:zhangqiang 2015-09-21 14:47:35 End */
		} catch (Exception e) {
			logger.error("查询配送方式时发生异常Exception:" + e);
			e.printStackTrace();
		}
		return deliveryMethods;
	}

	/**
	 * 查询支付方式
	 *
	 * @return
	 */
	private List<DeliveryTime> getDeliveryTimeList() {
		List<DeliveryTime> list = null;
		try {
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.order("orderNo", "ASC"));
			criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,getPlatform()));
			list = deliveryTimeService.getList(getParamMap(), criteria);
		} catch (Exception e) {
			logger.error("查询支付方式时发生异常Exception:" + e);
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 会员中心收货地址配置页面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "receiver")
	public String receiver(Model model, HttpServletRequest request) {
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		String info = "会员收货地址页面";
		setLogInfo(info);
		logger.debug(info);
		try {
			Member member = getCurrentMember(request);
			/** 判断是从那个入口到收货地址列表　type=information 个人中心，为空则是从订单确认修改收货地址 */
			String type=request.getParameter("type");
			model.addAttribute("type", type);
			Criteria addressCriteria = new Criteria();
			addressCriteria.add(Restrictions.eq("memberId", member.getId()));
			List<Receiver> receiverList = receiverService.getList(getParamMap(), addressCriteria);
			if (null != receiverList) {
				for (Receiver receiver : receiverList) {
					List<String> areaPath = Arrays.asList(StringUtils.split(receiver.getAreaPath(), ","));
					StringBuilder i = new StringBuilder();
					for (String str : areaPath) {
						Area area = areaService.get(getParamMap(), str);
						if (null != area) {
							i.append(area.getName());
						}
					}
					//receiver.setAddress(i + receiver.getAddress());
				}
			}
			String to=request.getParameter("to");
			if(StringUtil.isNotEmpty(to)){
				model.addAttribute("to",to);
				model.addAttribute("o",request.getParameter("o"));
				model.addAttribute("paymentId",request.getParameter("paymentId"));
				model.addAttribute("deliveryId",request.getParameter("deliveryId"));
			}
			model.addAttribute("member", member);
			model.addAttribute("receiverList", receiverList);
			setPublicDate2Model( model );
			getAllCatelog(model);// 首页类目展示
		} catch (Exception ex) {
			logger.error("访问" + info + "时，发生异常", ex);
			ex.printStackTrace();
		}
		if (Global.WHICH_APP.equals(whichclient)) {
			String promotions=request.getParameter("to");
			if(promotions!=null && promotions.equals("promotions")){
				String promotionsId=request.getParameter("promotionsId");
				String goodsId=request.getParameter("goodsId");
				String dealNum=request.getParameter("dealNum");
				model.addAttribute("promotionsId", promotionsId);
				model.addAttribute("goodsId", goodsId);
				model.addAttribute("dealNum", dealNum);
			}

			return Global.TEMPLATE_APP + PATH + "/member/receiverList";
		} else {
			return Global.TEMPLATE_MALL + PATH + "/member/receiver";
		}

	}

	@RequestMapping(value = "/getAreaByParementId")
	public
	@ResponseBody
	Object getAreaById(HttpServletRequest request) {
		String cityId = request.getParameter("provinceId");
		Map<String, List<Area>> result = new HashMap<String, List<Area>>();
		Criteria criteria = new Criteria();
		criteria.add(Restrictions.eq("parentId", cityId));
		try {
			List<Area> areaList = areaService.getList(getParamMap(), criteria);
			result.put("areaList", areaList);
		} catch (Exception e) {
			logger.error("查询子区域时");
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 账户信息
	 */
	@RequestMapping("info")
	public String info(Model model, HttpServletRequest request) {
		String info = "我的账户信息";
		setLogInfo(info);
		logger.debug(info);
		String memberId = getCurrentMember(request).getId();

		model.addAttribute("orderStatusMapping", getOrderStatusMapping());
		setPublicDate2Model( model );
		getAllCatelog(model);// 首页类目展示

		// 获取会员账户信息
		try {
			Member member = memberService.get(getParamMap(), memberId);
			model.addAttribute("member", member);
		} catch (Exception e) {
			logger.error("获取会员账户信息时，发生异常", e);
		}
		if(Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))){
			return Global.TEMPLATE_APP + PATH + "/member/user_info";
		}
		return Global.TEMPLATE_MALL + PATH + "/member/user_info";
	}

	/**
	 * 更新会员账户信息
	 *
	 * @param request
	 */
	@RequestMapping("updateMember")
	@ResponseBody
	public Object update(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		String tenantId = getCurrentMember(request).getTenantId();
		String memberId = getCurrentMember(request).getId();
		if (StringUtils.isBlank(memberId)) {
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "请登录...");
			return result;
		}

		Member member = new Member();
		String nickName = request.getParameter("nickName");
		String sex = request.getParameter("sex");
		String birthday = request.getParameter("birthday");
//		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		member.setId(memberId);
		member.setNickName(nickName);
//		member.setMobile(mobile);
		member.setEmail(email);
		try {
			member.setSex(StringUtils.isNotBlank(sex) ? Integer.parseInt(sex) : 2);
			if (StringUtils.isNotBlank(birthday)) {
				member.setBirthday(org.apache.commons.lang3.time.DateUtils.parseDate(birthday, "yyyy-MM-dd"));
			}
			memberService.update(getParamMap(), member);

			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "");
		} catch (Exception e) {
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "更新账户信息时，发生异常...");
			logger.error("更新账户信息时，发生异常", e);
		}

		return result;
	}

	public void setMermberCart(String memberId, HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if (StringUtils.equalsIgnoreCase(cookie.getName(), CartItemCookie.USERKEY_COOKIE_NAME)) {
					if (StringUtils.isNotEmpty(cookie.getValue())) {
						String userkey = cookie.getValue();
						List<CartItem> cartItemList;
						try {
							cartItemList = cartItemService.getListByUserKey(getParamMap(), userkey);
							List<CartItem> entity = new ArrayList<CartItem>();
							for (CartItem cartItem : cartItemList) {
								cartItem.setUserkey("");
								cartItem.setMemberId(memberId);
								entity.add(cartItem);
							}
							cartItemService.update(getParamMap(), entity);
						} catch (Exception e) {
							// 失败依然登陆
						}
					}
				}
			}
		}
	}

	private Map<String, String> getOrderStatusMapping() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("unconfirm", "未确认");
		map.put("cancel", "已取消");
		map.put("invalid", "已作废");
		map.put("wait_buyer_pay", "等待付款");
		map.put("wait_seller_send_goods", "等待发货");
		map.put("wait_buyer_confirm_goods", "等待收货");
		map.put("trade_finished", "交易完成");
		map.put("refund_part", "部分退款");
		map.put("refund_success", "全额退款");
		map.put("reship_part", "部分退货");
		map.put("reship_success", "已退货");

		return map;
	}

	/**
	 * 发布需求
	 */
	@RequestMapping("add")
	public String add(Model model, HttpServletRequest request) {
		String info = "需求发布";
		setLogInfo(info);
		logger.debug(info);
		String memberId = getCurrentMember(request).getId();

		setPublicDate2Model( model );
		// 获取会员账户信息
		try {
			Member member = memberService.get(getParamMap(), memberId);
			model.addAttribute("member", member);
		} catch (Exception e) {
			logger.error("获取会员账户信息时，发生异常", e);
		}

		return Global.TEMPLATE_MALL + PATH + "/member/demand_add";
	}



	private Date StringTodate(String date) {
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
		Date time = null;
		try {
			String str = formatDate.format(date);
			time = formatDate.parse(str);
		} catch (Exception e) {

		}
		return time;
	}

	@RequestMapping("countDeliveryFee")
	@ResponseBody
	public Object countDeliveryFee(HttpServletRequest request) {
		String deliveryMethodId = getParameter(request, "deliveryMethodId"); // 配送方式Id
		String _cartItemIds = getParameter(request, "cartItemIds"); // 购物车内商品Ids
		List<String> cartItemIds = null;
		if (StringUtils.isNotBlank(_cartItemIds)) {
			cartItemIds = Arrays.asList(_cartItemIds.split(","));
		}
		if (StringUtils.isBlank(deliveryMethodId)) {
			return "请选择配送方式";
		}

		String tenantId = getTenantId();
		double deliveryFee = 0.00;
		try {
			List<CartItem> cartItemList = cartItemService.findListByIds(getParamMap(), cartItemIds);
			deliveryFee = calculateGoodsDeliveryFee(tenantId, deliveryMethodId, cartItemList);
		} catch (Exception e) {
			logger.error("计算配送费用时出异常", e);
		}

		return deliveryFee;
	}

	/**
	 * 计算商品的配送费用
	 *
	 * @param tenantId         租户Id
	 * @param deliveryMethodId 配送方式Id
	 * @param cartItemList     订单项列表
	 * @return 最终的配送费用
	 */
	private Double calculateGoodsDeliveryFee(String tenantId, String deliveryMethodId, List<CartItem> cartItemList) {
		double deliveryFee = 0.00;
		try {
			DeliveryMethod deliveryMethod = deliveryMethodService.get(getParamMap(), deliveryMethodId);
			if (cartItemList != null && cartItemList.size() > 0) {
				double goodsTotalWeight = 0.00; // 商品总重量
				boolean isFreeDeliveryFee = true; // 默认true为包邮
				for (CartItem item : cartItemList) {
					Goods goods = goodsService.get(getParamMap(), item.getGoodsId());
					if(goods.getIsPost() == 0){ // 0为不包邮, 不包邮计算商品总重量
						isFreeDeliveryFee = false;
						goodsTotalWeight += goods.getWeight() * item.getQuantity();
					}
				}
				if(isFreeDeliveryFee){ // 所有商品都包邮，则运费为0
					deliveryFee = 0.0;
				}else{
					// 计算配送费用
					deliveryFee = countDeliveryFeeByWeight(goodsTotalWeight, deliveryMethod);
				}

			}
		} catch (Exception e) {
			logger.error("计算配送费用时出异常", e);
		}

		return deliveryFee;
	}

	/**
	 * 根据重量和配送方式计算配送费用
	 *
	 * @param goodsTotalWeight 商品总重量
	 * @param deliveryMethod   配送方式对象
	 * @return 配送费用
	 */
	private Double countDeliveryFeeByWeight(double goodsTotalWeight, DeliveryMethod deliveryMethod) {
		double deliveryFee = 0.00;
		if (goodsTotalWeight <= deliveryMethod.getFirstWeight()) {
			deliveryFee = deliveryMethod.getFirstPrice();
		} else {
			double overWeight = goodsTotalWeight - deliveryMethod.getFirstWeight(); // 多出来的重量
			int continueUnit = deliveryMethod.getContinueWeight() > 0 ? ((int) Math.ceil(overWeight / deliveryMethod.getContinueWeight())) : 0;// 有几个单位的续重,此处使用进1法，即3.1取4
			deliveryFee = deliveryMethod.getFirstPrice() + deliveryMethod.getContinuePrice() * continueUnit;
		}

		return deliveryFee;
	}

	/**
	 * 便利提醒统计数量
	 */
	private Map<String,String> getConvenientTips(HttpServletRequest request) {
		Map<String,String> result = new HashMap<String,String>();
		String memberId = getCurrentMember(request).getId();
		try {
			Criteria c1 = new Criteria();
			c1.add(Restrictions.eq("memberId", memberId));
			c1.add(Restrictions.eq("orderStatus", Order.OrderStatus.wait_buyer_pay.toString()));
			c1.add(Restrictions.eq("paymentStatus", Order.PaymentStatus.unpaid.toString()));
			List<Order> orderFuKuanCountList = orderService.getList(getParamMap(), c1);
			result.put("orderFuKuanCount", (orderFuKuanCountList != null ? orderFuKuanCountList.size() : 0) + ""); // 待付款

			Criteria c2 = new Criteria();
			c2.add(Restrictions.eq("memberId", memberId));
			c2.add(Restrictions.eq("orderStatus", Order.OrderStatus.wait_seller_send_goods.toString()));
			c2.add(Restrictions.eq("paymentStatus", Order.PaymentStatus.paid.toString()));
			c2.add(Restrictions.eq("shippingStatus", Order.ShippingStatus.unshipped.toString()));
			List<Order> orderFaHuoCountList = orderService.getList(getParamMap(), c2);
			result.put("orderFaHuoCount", (orderFaHuoCountList != null ? orderFaHuoCountList.size() : 0) + "");// 待发货


			Criteria c3 = new Criteria();
			c3.add(Restrictions.eq("memberId", memberId));
			c3.add(Restrictions.eq("orderStatus", Order.OrderStatus.wait_buyer_confirm_goods.toString()));
			c3.add(Restrictions.eq("paymentStatus", Order.PaymentStatus.paid.toString()));
			c3.add(Restrictions.eq("shippingStatus", Order.ShippingStatus.shipped.toString()));
			List<Order> orderConfirmCountList = orderService.getList(getParamMap(), c3);
			result.put("orderConfirmCount", (orderConfirmCountList != null ? orderConfirmCountList.size() : 0) + "");// 待确认收货
		} catch (Exception e) {
			logger.error("统计订单快捷页的便利提醒时出错:", e.getMessage());
		}

		return result;
	}

	/**
	 * 判断当前是否有用户登录，如果有，返回用户信息，没有，返回未登录标记
	 *
	 * @param
	 * @return
	 * 如果有已登录用户，status=success，message=已登录，m=当前登录用户对象
	 * 如果没有已登录用户，status=nologin，message=未登录
	 * 如果发生异常，status=error，message=会员登录校验时，发生异常
	 * TianYu  2016-1-15 10:19:28
	 */
	@RequestMapping(value = "/getCurrM", method = {RequestMethod.POST})
	public
	@ResponseBody
	Map<String, Object> getCurrentMember(HttpServletRequest request, HttpServletResponse response) {

		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Member m = getCurrentMember(request);

			if( m == null ){
				result.put(STATUS, NOLOGIN);
				result.put(MESSAGE, "未登录");
			}else{
				result.put(STATUS, SUCCESS);
				result.put(MESSAGE, "已登录");
				result.put("m", m);
				if(StringUtil.isEmpty(request.getParameter("needTips")) || "true".equals(request.getParameter("needTips"))){
					//查询便利提醒
					result.put("bl", getConvenientTips(request));
				}
			}


		} catch (Exception e) {
			logger.error("会员登录校验时，发生异常", e);
			e.printStackTrace();
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "会员登录校验时，发生异常");
		}
		return result;
	}

	/**
	 * Desc:判断登录会员是否录入了身份证号
	 * Auth:zhangqiang
	 * Time:2016-01-22 09:59:48
	 */
	@RequestMapping(value = "/getMemberIDcode", method = {RequestMethod.POST})
	public
	@ResponseBody
	Map<String, Object> getMemberIDcode(HttpServletRequest request, HttpServletResponse response) {

		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Member m = getCurrentMember(request);

			if( StringUtil.isNotEmpty(m.getId()) ){
				m = memberService.get(getParamMap(), m.getId());
				if (StringUtil.isNotEmpty(m.getIDCode())) {
					result.put(STATUS, SUCCESS);
					result.put(MESSAGE, "有身份证号");
				}else{
					result.put(STATUS, ERROR);
					result.put(MESSAGE, "未填写身份证号");
				}
			}else{
				result.put(STATUS, NOLOGIN);
				result.put(MESSAGE, "未登录");
			}
		} catch (Exception e) {
			logger.error("获取会员身份证号时，发生异常", e);
			e.printStackTrace();
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "获取会员身份证号验时，发生异常");
		}
		return result;
	}

	/**
	 * Desc:录入身份证号
	 * Auth:zhangqiang
	 * Time:2016-01-22 09:59:48
	 */
	@RequestMapping(value = "/saveMemberIDcode", method = {RequestMethod.POST})
	public
	@ResponseBody
	Map<String, Object> saveMemberIDcode(HttpServletRequest request, HttpServletResponse response,String idcode, HttpSession session) {

		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Member m = getCurrentMember(request);

			if( StringUtil.isNotEmpty(idcode) ){
				Member mu = new Member();
				mu.setId(m.getId());
				mu.setIDCode(idcode.toUpperCase());
				memberService.update(getParamMap(), mu);
				result.put(STATUS, SUCCESS);
				result.put(MESSAGE, "录入身份证号成功");
                m.setIDCode(idcode.toUpperCase());
				session.setAttribute(Global.CURRENT_MERCHANT, m);
			}else{
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "录入身份证号失败");
			}
		} catch (Exception e) {
			logger.error("录入会员身份证号时，发生异常", e);
			e.printStackTrace();
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "录入会员身份证号时，发生异常");
		}
		return result;
	}


	@RequestMapping("/weixinAutoLoginIndex")
	public String weixinAutoLoginIndex(Model model, HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		AccessTokenService accessTokenService=new AccessTokenService();
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		try {
			logger.debug("setp1----------->进入微信授权回调地址");
			String code=request.getParameter("code");
			if(code!=null && !code.equals("")){
				logger.debug("setp2----------->获取code：["+code+"]");
				AccessTokenReqData accessTokenReqData=new AccessTokenReqData();
				String appid= Configure.getAppid();
				String appsecret=Configure.getAppsecret();

				accessTokenReqData.buildAppId(appid).buildSecret(appsecret).buildCode(code);
				AccessTokenResData accessTokenResData =accessTokenService.sendRequest(accessTokenReqData);
				logger.debug("setp3----------->获取openid：[" + accessTokenResData.getOpenid()+"]");

				//判断是否绑定
				if(memberService.isExist(getParamMap(),"openId",accessTokenResData.getOpenid())){
					logger.debug("更具openId查找会员是否存在----------->");
					//更具openId获取会员
					Member currentMember= memberService.find(getParamMap(),"openId",accessTokenResData.getOpenid());
					logger.debug("更具openId查找会员存在----------->"+currentMember.getUserName());
					if (currentMember.getStatus() == 1) {
						//Cookie写书用户信息
						writeCookieMemberInfo(currentMember, session, request, response);
						//跳转到首页
						response.sendRedirect(systemSetService.find(getParamMap(), "setkey", "shopUrl").getSetvalue() + "/app_index");
					} else {
						logger.debug("此会员已禁用----------->" + currentMember.getUserName());
						response.setCharacterEncoding("UTF-8");
						response.setContentType("text/html");
						PrintWriter writer = response.getWriter();
						writer.println("["+currentMember.getUserName()+"]此会员已禁用,请联系系统管理员");
					}
				}else{
					response.sendRedirect(systemSetService.find(getParamMap(), "setkey", "shopUrl").getSetvalue() + "/app_index");
				}
			}else{
				response.sendRedirect(systemSetService.find(getParamMap(), "setkey", "shopUrl").getSetvalue() + "/app_index");
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.debug(e.getMessage());
		}
		return Global.TEMPLATE_APP + PATH + "/user_info_bandUsername";
	}

	/**
	 * 微信授权自动登录
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/weixinAutoLogin")
	public String weixinAutoLogin(Model model, HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		AccessTokenService accessTokenService=new AccessTokenService();
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		try {
			logger.debug("setp1----------->进入微信授权回调地址");
			String code=request.getParameter("code");
			if(code!=null && !code.equals("")){
				logger.debug("setp2----------->获取code：["+code+"]");
				AccessTokenReqData accessTokenReqData=new AccessTokenReqData();
				String appid= Configure.getAppid();
				String appsecret=Configure.getAppsecret();

				if (session.getAttribute("openId")==null||session.getAttribute("openId").toString().trim().equals(""))
				{
					accessTokenReqData.buildAppId(appid).buildSecret(appsecret).buildCode(code);
					AccessTokenResData accessTokenResData =accessTokenService.sendRequestN(accessTokenReqData);//accessTokenService.sendRequest(accessTokenReqData);
					String openid=accessTokenResData.getOpenid();
					logger.debug("setp3----------->获取openid：["+openid+"]");



					if(accessTokenResData.getOpenid()!=null && !accessTokenResData.getOpenid().equals("")){
						session.setAttribute("openId",openid);
					/*	Cookie openIdCookie = new Cookie("openId", openid);
						openIdCookie.setPath(request.getContextPath() + "/");
						response.addCookie(openIdCookie);*/
					}
				}

				logger.debug("setp3--------session3--->获取openid：["+session.getAttribute("openId")+"]");


				String openid=session.getAttribute("openId")+"";


				//判断是否绑定
				if(openid!=null && !openid.equals("") && !openid.equals("null") && memberService.isExist(getParamMap(),"openId",openid)){
					logger.debug("更具openId查找会员是否存在----------->");
					//更具openId获取会员
					Member currentMember= memberService.find(getParamMap(),"openId",openid);
					logger.debug("更具openId查找会员存在----------->"+currentMember.getUserName());
					if (currentMember.getStatus() == 1) {
						//Cookie写书用户信息
						writeCookieMemberInfo(currentMember, session, request, response);
						//跳转到首页
						logger.debug("跳转到个人中心...");
						response.sendRedirect(systemSetService.find(getParamMap(), "setkey", "shopUrl").getSetvalue()+"member/index?whichclient=whichapp");
					} else {
						logger.debug("此会员已禁用----------->" + currentMember.getUserName());
						response.setCharacterEncoding("UTF-8");
						response.setContentType("text/html");
						PrintWriter writer = response.getWriter();
						writer.println("["+currentMember.getUserName()+"]此会员已禁用,请联系系统管理员");
					}
				}else{
					logger.debug("更具openId查找会员不存在----------->跳转到绑定手机号页面");
					//跳转到绑定手机号页面
					//session.setAttribute("openId",accessTokenResData.getOpenid());
					model.addAttribute("openId", openid);
					return Global.TEMPLATE_APP + PATH + "/user_info_bandUsername";
					//response.sendRedirect(systemSetService.find(getParamMap(), "setkey", "shopUrl").getSetvalue()+"app_index");
				}
			}else{
				response.sendRedirect(systemSetService.find(getParamMap(), "setkey", "shopUrl").getSetvalue()+"app_index");
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.debug(e.getMessage());
		}
		return Global.TEMPLATE_APP + PATH + "/user_info_bandUsername";
	}

	@RequestMapping(value = "/zg_bandUsername", method = {RequestMethod.POST})
	public
	@ResponseBody
	Map<String, Object> zg_bandUsername(HttpServletRequest request, HttpServletResponse response,HttpSession session) {

		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			String openId=session.getAttribute("openId")+"";
			String openid=request.getParameter("openid");
//			String openId="lxb0001";
			if(username!=null && !username.equals("") && openId!=null && !openId.equals("")){
				//判断用户名是否存在
				if(memberService.isExist(getParamMap(),"userName",username)){
					result.put(STATUS, ERROR);
					result.put(MESSAGE, "此手机号已绑定！");
				}else{
					Member currentMember=new Member();
					currentMember.setRankId(memberRankService.getDefaultMemberRank(getParamMap()).getId());
					currentMember.setPasswd(new Md5Hash(password).toHex());
					currentMember.setStatus(1);
					currentMember.setCreateUser("register");
					currentMember.setCreateDate(new Date());
					currentMember.setIsSynch(0);

					currentMember.setUserName(username);
					currentMember.setMobile(username);
					if((openId==null || openId.equals("")&& (openid==null || openid.equals("")))){
						result.put(STATUS, ERROR);
						result.put(MESSAGE, "获取授权信息失败，请重新授权操作！");
						return result;
					}

					if(openId==null || openId.equals("")){
						//判断这个微信是否在其他账户上面绑定的呢，如果是就先从原来账号解绑
						if(memberService.isExist(getParamMap(),"openId",openid)){
							Member oldm=memberService.find(getParamMap(),"openId",openid);
							oldm.setOpenId("");
							memberService.update(getParamMap(),oldm);
						}
						currentMember.setOpenId(openid);
					}else{
						//判断这个微信是否在其他账户上面绑定的呢，如果是就先从原来账号解绑
						if(memberService.isExist(getParamMap(),"openId",openId)){
							Member oldm=memberService.find(getParamMap(),"openId",openId);
							oldm.setOpenId("");
							memberService.update(getParamMap(),oldm);
						}
						currentMember.setOpenId(openId);
					}

					logger.debug("step3-regeist--------------openId"+openId);
					logger.debug("step3-regeist--------------openid"+openid);
					logger.debug("step3-regeist--------------currentMemberopenId"+currentMember.getOpenId());
					//保存会员信息
					currentMember = memberService.save(getParamMap(), currentMember);
					//Cookie写书用户信息
					writeCookieMemberInfo(currentMember, session, request, response);
					result.put(STATUS, SUCCESS);
					result.put(MESSAGE, "您已绑定成功");
				}
			}else{
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "获取登录信息失败，请重新操作！");
			}

		} catch (Exception e) {
			logger.error("绑定手机号时，发生异常", e);
			e.printStackTrace();
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "绑定手机号时，发生异常");
		}
		return result;
	}

	@RequestMapping(value = "/lg_bandUsername", method = {RequestMethod.POST})
	public
	@ResponseBody
	Map<String, Object> lg_bandUsername(HttpServletRequest request, HttpServletResponse response,HttpSession session) {
			Map<String, Object> result = new HashMap<String, Object>();
		try{
			String username=request.getParameter("username");
			String openId=session.getAttribute("openId")+"";
			String openid=request.getParameter("openid");
//			String openId="lxb0001";
			if(username!=null && !username.equals("") && openId!=null && !openId.equals("")){
				//验证用户名和密码
				Member currentMember=memberService.find(getParamMap(), "username", username);
				if(currentMember!=null){


					if((openId==null || openId.equals("")&& (openid==null || openid.equals("")))){
						result.put(STATUS, ERROR);
						result.put(MESSAGE, "获取授权信息失败，请重新授权操作！");
						return result;
					}

					if(openId==null || openId.equals("")){
						//判断这个微信是否在其他账户上面绑定的呢，如果是就先从原来账号解绑
						if(memberService.isExist(getParamMap(),"openId",openid)){
							Member oldm=memberService.find(getParamMap(),"openId",openid);
							oldm.setOpenId("");
							memberService.update(getParamMap(),oldm);
						}
						currentMember.setOpenId(openid);
					}else{
						//判断这个微信是否在其他账户上面绑定的呢，如果是就先从原来账号解绑
						if(memberService.isExist(getParamMap(),"openId",openId)){
							Member oldm=memberService.find(getParamMap(),"openId",openId);
							oldm.setOpenId("");
							memberService.update(getParamMap(),oldm);
						}
						currentMember.setOpenId(openId);
					}

					logger.debug("step3-loginregeist--------------openId"+openId);
					logger.debug("step3-loginregeist--------------openid"+openid);
					logger.debug("step3-loginregeist--------------currentMemberopenId"+currentMember.getOpenId());

					memberService.update(getParamMap(),currentMember);
					writeCookieMemberInfo(currentMember, session, request, response);
					result.put(STATUS, SUCCESS);
					result.put(MESSAGE, "您已绑定成功");
				}
			}else{
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "获取登录信息失败，请重新操作！");
			}
	} catch (Exception e) {
		logger.error("绑定手机号时，发生异常", e);
		e.printStackTrace();
		result.put(STATUS, ERROR);
		result.put(MESSAGE, "绑定手机号时，发生异常");
	}
		return result;
	}

	/**
	 * 微信解绑用户
	 * @param request
	 * @param response
	 * @param session
     * @return
     */
	@RequestMapping(value = "/unBandUsername", method = {RequestMethod.POST})
	public
	@ResponseBody
	Map<String, Object> unBandUsername(HttpServletRequest request, HttpServletResponse response,HttpSession session) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
				//验证用户名和密码
				Member currentMember=this.getCurrentMember(request);
				if(currentMember!=null){
					currentMember.setOpenId("");
					memberService.update(getParamMap(),currentMember);
					result.put(STATUS, SUCCESS);
					result.put(MESSAGE, "您已解绑成功！");
				}else{
					result.put(STATUS, ERROR);
					result.put(MESSAGE, "获取登录信息失败，请重新操作！");
				}
		} catch (Exception e) {
			logger.error("解绑用户时，发生异常", e);
			e.printStackTrace();
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "绑定手机号时，发生异常");
		}
		return result;
	}




	/**
	 * 写入用户信息
	 * @param currentMember
	 * @param session
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException
	 */
	public void writeCookieMemberInfo(Member currentMember,HttpSession session,HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		session.removeAttribute(Global.CURRENT_MERMBER);
		session.setAttribute(Global.CURRENT_MERMBER, currentMember);

		// 先清空cookie
		Cookie loginMemberUsernameCookie = new Cookie(UserCookie.LOGIN_MEMBER_USERNAME_COOKIE_NAME, null);
		loginMemberUsernameCookie.setPath(request.getContextPath() + "/");
		response.addCookie(loginMemberUsernameCookie);
		Cookie loginMemberNickeNameCookie = new Cookie(UserCookie.LOGIN_MEMBER_NICKNAME_COOKIE_NAME, null);
		loginMemberNickeNameCookie.setPath(request.getContextPath() + "/");
		response.addCookie(loginMemberNickeNameCookie);
		Cookie rememberMeCookie = new Cookie(UserCookie.LOGIN_MEMBER_ME4_COOKIE_NAME, null);
		rememberMeCookie.setPath(request.getContextPath() + "/");
		response.addCookie(rememberMeCookie);
		logger.debug("清空cookie----------->完成");
		// 登陆成功后根据当前浏览器的cookie 生成会员购物车
		setMermberCart(currentMember.getId(), request);
		logger.debug("登陆成功后根据当前浏览器的cookie 生成会员购物车----------->完成");
		// 写入会员登录Cookie
		loginMemberUsernameCookie = new Cookie(UserCookie.LOGIN_MEMBER_USERNAME_COOKIE_NAME, URLEncoder.encode(currentMember.getUserName().toLowerCase(), "UTF-8"));
		loginMemberUsernameCookie.setPath(request.getContextPath() + "/");
		loginMemberUsernameCookie.setMaxAge(UserCookie.COOKIE_MAX_AGE);
		response.addCookie(loginMemberUsernameCookie);
		if (StringUtils.isNotEmpty(currentMember.getNickName())) {
			loginMemberNickeNameCookie = new Cookie(UserCookie.LOGIN_MEMBER_NICKNAME_COOKIE_NAME, URLEncoder.encode(currentMember.getNickName().toLowerCase(), "UTF-8"));
			loginMemberNickeNameCookie.setPath(request.getContextPath() + "/");
			loginMemberNickeNameCookie.setMaxAge(UserCookie.COOKIE_MAX_AGE);
			response.addCookie(loginMemberNickeNameCookie);
		}
		rememberMeCookie = new Cookie(UserCookie.LOGIN_MEMBER_ME4_COOKIE_NAME, URLEncoder.encode("true".toLowerCase(), "UTF-8"));
		rememberMeCookie.setPath(request.getContextPath() + "/");
		rememberMeCookie.setMaxAge(-1);// 负数 - 当浏览器关闭时自动删除。
		response.addCookie(rememberMeCookie);
		logger.debug("写入会员登录Cookie----------->完成");
	}
}
