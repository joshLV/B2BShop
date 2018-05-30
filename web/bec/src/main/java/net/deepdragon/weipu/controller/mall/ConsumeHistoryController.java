package net.deepdragon.weipu.controller.mall;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.Buyer;
import net.deepdragon.entity.weipu.Catelog;
import net.deepdragon.entity.weipu.Menu;
import net.deepdragon.entity.weipu.Order;
import net.deepdragon.service.weipu.MenuService;
import net.deepdragon.service.weipu.OrderService;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller(Global.APP_SIGN + Global.MALL + "ConsumeHistoryController")
@RequestMapping(Global.MALL_PATH + "/member/consumehistory")
public class ConsumeHistoryController extends BaseMallController {
	@Resource
	private MenuService menuService;
	@Resource
	private CacheData cacheData;
	@Resource
	private OrderService orderService;

	@RequestMapping(value = "list")
	public String list(Pager pager,Model model, HttpServletRequest request) {
		String info = "消费记录";
		setLogInfo(info);
		logger.debug(info);
		try {
			Buyer mb = getCurrentMember(request);
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("a.orderStatus", "trade_finished"));
			criteria.add(Restrictions.eq("a.memberId", mb.getId()));
			pager.setOrderType("DESC");
			pager.setOrderBy("a.createDate");
			pager.setPageSize( 20 );
			pager = orderService.getPager(getParamMap(), criteria, pager);
			model.addAttribute("orderList", pager.getList());
			model.addAttribute("pager", pager);
		} catch (Exception ex) {
			logger.error("访问" + info + "时，发生异常", ex);
			ex.printStackTrace();
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
		return Global.TEMPLATE_MALL + PATH + "/member/consumehistory";
	}

	@RequestMapping(value = "cancellist")
	public String cancellist(Model model, HttpServletRequest request) {
		String info = "取消订单记录";
		setLogInfo(info);
		logger.debug(info);
		try {
			Buyer mb = getCurrentMember(request);
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("orderStatus", "cancel"));
			criteria.add(Restrictions.eq("memberId", mb.getId()));
			criteria.add(Restrictions.limit("0", "20"));
			criteria.add(Restrictions.order("createDate", "DESC"));
			List<Order> orderList = orderService.getList(getParamMap(), criteria);
			model.addAttribute("orderList", orderList);
		} catch (Exception ex) {
			logger.error("访问" + info + "时，发生异常", ex);
			ex.printStackTrace();
		}
		getAllCatelog(model);
		setPublicDate2Model(model);
		return Global.TEMPLATE_MALL + PATH + "/member/order_cancel";
	}


}
