package net.deepdragon.weipu.controller.mall;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.weipu.B2BGoodsAttentionService;
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
import java.util.*;

@Controller(Global.APP_SIGN + Global.MALL + "GoodsAttentionController")
@RequestMapping(Global.MALL_PATH + "/member/goodsattention")
public class GoodsAttentionController extends BaseMallController {
	@Resource
	private MenuService menuService;
	@Resource
	private CacheData cacheData;
	@Resource
	private B2BGoodsAttentionService goodsAttentionService;
	@Resource
	private GoodsService goodsService;


	@RequestMapping(value = "list")
	public String list(Pager pager,Model model, HttpServletRequest request) {
		String info = "我的关注";
		setLogInfo(info);
		logger.debug(info);
		try {
			getGoodsAttentionList(pager,model, request);
		} catch (Exception ex) {
			logger.error("访问" + info + "时，发生异常", ex);
			ex.printStackTrace();
		}
		getAllCatelog(model);
		setPublicDate2Model(model);
		String type = request.getParameter(Global.WHICHCLIENT);

		/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
		LoginType loginType = getLoginType(request);
		model.addAttribute("loginType", loginType);
		String operatorRole = getOperatorRole(request);
		if (LoginType.operator.equals(loginType)) {
			model.addAttribute("role", operatorRole);
		}
        /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/

		if(Global.WHICH_APP.equals(type)){
			return Global.TEMPLATE_APP + PATH + "/member/goodsattention";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/member/goodsattention";
		}
		//return Global.TEMPLATE_MALL + PATH + "/member/goodsattention";
	}


	/**
	 * app获取关注商品信息
	 * @param goodsId
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "appList")
	public @ResponseBody
	Object appList(String goodsId, HttpServletRequest request,Model model) {
        String info = "关注商品";
		setLogInfo(info);
		logger.debug(info);
		Map<String,Object> result=new HashMap<String,Object>();
		Goods goods=null;
		Map<String,List<Map<String,Object>>> goodsSpInfoMap=new HashMap<String,List<Map<String,Object>>>();
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






	// 获取商品关注列表
	public void getGoodsAttentionList(Pager pager, Model model, HttpServletRequest request) throws Exception {
		Buyer mb = getCurrentMember(request);
		Criteria criteria = new Criteria();

		//众筹商品也显示关注列表中 2016-05-04 liuxiaobing
//		if("1".equals(request.getParameter("goodsType"))){
//			criteria.add(Restrictions.eq("a.type", 1));
//		}else{
//			criteria.add(Restrictions.eq("a.type", 0));
//		}
		criteria.add(Restrictions.eq("c.buyerId", mb.getId()));
		criteria.add(Restrictions.group("c.goodsId"));
		pager.setOrderType("DESC");
		pager.setOrderBy("c.createDate");
		pager.setPageSize( 10 );
		pager = goodsAttentionService.getPager(getParamMap(), criteria, pager);
		model.addAttribute("goodsAttentionList", pager.getList());
		model.addAttribute("pager", pager);
	}
	@RequestMapping(value = "/loadmore")
	public @ResponseBody
	Object ajaxLoadmore(HttpServletRequest request) {
		String info = "AJAX加载我的关注";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Buyer mb = getCurrentMember(request);
			Pager pager = new Pager();
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("c.buyerId", mb.getId()));
			criteria.add(Restrictions.group("c.goodsId"));
			pager.setOrderType("DESC");
			pager.setOrderBy("c.createDate");
			pager.setPageSize( 10 );
			pager.setPageNumber(Integer.valueOf(request.getParameter("pageNumber")));
			pager = goodsAttentionService.getPager(getParamMap(), criteria, pager);
			List<B2BGoodsAttention> list = (List<B2BGoodsAttention>)pager.getList();
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
	@RequestMapping(value = "/ajaxDeleteGoodsAttentionId")
	public @ResponseBody
	Object ajaxDeleteGoodsAttentionId(HttpServletRequest request) {
		String info = "根据商品关注列ID删除";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String id = request.getParameter("id");
			goodsAttentionService.delete(getParamMap(), id);
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

	@RequestMapping(value = "/ajaxDeleteAllByMemberId")
	public @ResponseBody
	Object ajaxDeleteAllByMemberId(HttpServletRequest request) {
		String info = "清空商品关注列表";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Buyer member = getCurrentMember(request);
			goodsAttentionService.deleteAllByBuyerId(getParamMap(), member.getId());
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

	@RequestMapping(value = "/ajaxIsAttention")
	public @ResponseBody
	Object ajaxIsAttention(String gid, HttpServletRequest request) {
		String info = "清空商品关注列表";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			if( !StringUtils.isNotEmpty( gid ) ){
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "商品ID不能为空");
				return result;
			}

			Buyer member = getCurrentMember(request);

			if( member == null ){
				result.put(STATUS, SUCCESS);
				result.put("isAttention", false);
				result.put(MESSAGE, "操作成功");
				return result;
			}

			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("c.goodsId", gid));
			criteria.add(Restrictions.eq("c.buyerId", member.getId()));

			List<B2BGoodsAttention> goodsAttentionList = this.goodsAttentionService.getList(getParamMap(), criteria);
			if( goodsAttentionList != null && goodsAttentionList.size() > 0 ){
				result.put("isAttention", true);
			}else{
				result.put("isAttention", false);
			}

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
