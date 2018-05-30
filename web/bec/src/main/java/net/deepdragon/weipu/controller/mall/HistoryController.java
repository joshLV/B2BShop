package net.deepdragon.weipu.controller.mall;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.weipu.B2BBuyerHistoryService;
import net.deepdragon.service.weipu.GoodsService;
import net.deepdragon.service.weipu.MenuService;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.apache.commons.lang3.StringUtils;
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

@Controller(Global.APP_SIGN + Global.MALL + "HistoryController")
@RequestMapping(Global.MALL_PATH + "/member/history")
public class HistoryController extends BaseMallController {
	@Resource
	private MenuService menuService;
	@Resource
	private CacheData cacheData;
	@Resource
	private B2BBuyerHistoryService historyService;
	@Resource
	private GoodsService goodsService;

	@RequestMapping(value = "list")
	public String list(Pager pager,Model model, HttpServletRequest request) {
		String info = "浏览历史";
		setLogInfo(info);
		logger.debug(info);
		try {
			getHisList(pager, model, request);
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

		String type = request.getParameter(Global.WHICHCLIENT);
		if(Global.WHICH_APP.equals(type)){
			return Global.TEMPLATE_APP + PATH + "/member/history";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/member/history";
		}
		/*return Global.TEMPLATE_MALL + PATH + "/member/history";*/
	}


	/**
	 * app获取浏览历史商品信息
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "appList")
	public @ResponseBody
	 Object appList(String goodsId, HttpServletRequest request,Model model) {
		String info = "浏览历史";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		Goods goods = null;
		Map<String, List<Map<String, Object>>> goodsSpInfoMap = new HashMap<String, List<Map<String, Object>>>();
		try{
		goodsSpInfoMap = goodsService.getGoodsSpInfo(getParamMap(), goodsId);
		model.addAttribute("spInfoMap", goodsSpInfoMap);
		goods = goodsService.get(getParamMap(), goodsId);
		result.put(DATA,goods);
		result.put("goodsSpInfoMap",goodsSpInfoMap);
		result.put(STATUS, SUCCESS);
		result.put(MESSAGE, "操作成功");
		return result;
		}catch(Exception e){
			logger.error(info + "时，发生异常",e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "操作失败");
		    return result;
		}
	}





	// 获取浏览历史
	public void getHisList(Pager pager,Model model, HttpServletRequest request) throws Exception {
		Buyer member = getCurrentMember(request);
		Criteria criteria = new Criteria();
		if("1".equals(request.getParameter("goodsType"))){
			criteria.add(Restrictions.eq("a.type", 1));
		}/*else{
			criteria.add(Restrictions.eq("a.type", 0));
		}*/
		criteria.add(Restrictions.eq("c.buyerId", member.getId()));
		criteria.add(Restrictions.group("d.goodsId"));
		criteria.add(Restrictions.order("c.createDate","DESC"));
		pager.setOrderType("DESC");
		pager.setOrderBy("c.createDate");
		pager.setPageSize( 10 );
		pager = historyService.getPager(getParamMap(), criteria, pager);
		model.addAttribute("hisList", pager.getList());
		model.addAttribute("pager", pager);
	}

	@RequestMapping(value = "/loadmore")
	public @ResponseBody
	Object ajaxLoadmore(HttpServletRequest request) {
		String info = "根据浏览历史ID删除";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Buyer member = getCurrentMember(request);
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("c.buyerId", member.getId()));
			criteria.add(Restrictions.group("d.goodsId"));
			criteria.add(Restrictions.order("c.createDate","DESC"));
			Pager pager = new Pager();
			pager.setOrderType("DESC");
			pager.setOrderBy("c.createDate");
			pager.setPageSize( 10 );
			pager.setPageNumber(Integer.valueOf(request.getParameter("pageNumber")));
			pager = historyService.getPager(getParamMap(), criteria, pager);
			List<B2BBuyerHistory> list =(List<B2BBuyerHistory>)pager.getList();
			result.put(DATA, list);
			result.put("pager", pager);
			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "操作成功");
			return result;
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "操作失败");
			return result;
		}
	}


	@RequestMapping(value = "/ajaxDeleteHisId")
	public @ResponseBody
	Object ajaxDeleteHisId(HttpServletRequest request) {
		String info = "根据浏览历史ID删除";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String id = request.getParameter("id");
			historyService.delete(getParamMap(), id);
			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "操作成功");
			return result;
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "操作失败");
			return result;
		}
	}

	@RequestMapping(value = "/ajaxDeleteAllByBuyerId")
	public @ResponseBody
	Object ajaxDeleteAllByBuyerId(HttpServletRequest request) {
		String info = "清空浏览历史";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Buyer member = getCurrentMember(request);
			historyService.deleteAllByBuyerId(getParamMap(), member.getId());
			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "操作成功");
			return result;
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "操作失败");
			return result;
		}
	}



}
