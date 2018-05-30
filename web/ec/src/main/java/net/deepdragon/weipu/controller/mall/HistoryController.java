package net.deepdragon.weipu.controller.mall;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.deepdragon.bean.Pager;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.weipu.GoodsService;
import net.deepdragon.service.weipu.MenuService;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.service.weipu.HistoryService;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;

import net.deepdragon.weipu.tools.CrossborderUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller(Global.APP_SIGN + Global.MALL + "HistoryController")
@RequestMapping(Global.MALL_PATH + "/member/history")
public class HistoryController extends BaseMallController {
	@Resource
	private MenuService menuService;
	@Resource
	private CacheData cacheData;
	@Resource
	private HistoryService historyService;
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
		setPublicDate2Model( model );
		String type = request.getParameter(Global.WHICHCLIENT);
		if(Global.WHICH_APP.equals(type)){
			return Global.TEMPLATE_APP + PATH + "/member/history";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/member/history";
		}
		/*return Global.TEMPLATE_MALL + PATH + "/member/history";*/
	}

	// 获取浏览历史
	public void getHisList(Pager pager,Model model, HttpServletRequest request) throws Exception {
		Member member = getCurrentMember(request);
		Criteria criteria = new Criteria();
		if("1".equals(request.getParameter("goodsType"))){
			criteria.add(Restrictions.eq("a.type", 1));
		}else{
			criteria.add(Restrictions.eq("a.type", 0));
		}
		criteria.add(Restrictions.eq("c.memberId", member.getId()));
		criteria.add(Restrictions.group("d.goodsId"));
		criteria.add(Restrictions.order("c.createDate","DESC"));
		pager.setOrderType("DESC");
		pager.setOrderBy("c.createDate");
		pager.setPageSize( 10 );
		pager = historyService.getPager(getParamMap(), criteria, pager);
//		model.addAttribute("hisList", pager.getList());

		//判断跨境商品 开关 是否打开
		if(CrossborderUtil.isCrossborder()){
			if(pager.getList().size() > 0 && pager.getList() != null){
				List<History> historyList = (List<History>) pager.getList();
				model.addAttribute("hisList",getIfCrossborder(historyList));
			}
		}else{
			model.addAttribute("hisList", pager.getList());

		}

		model.addAttribute("pager", pager);
	}

	/**
	 * Desc:判断是否为跨境商品
	 * Auth:zhangqiang
	 * Time:2016-01-29 14:53:25
	 * @param historyList
	 * @return
	 */
	public List<History> getIfCrossborder(List<History> historyList){
		String info = "获取商品是否为跨境商品";
		setLogInfo(info);
		List<History> goodsCrossBorderList = new ArrayList<History>();
		try{
			if (historyList.size() > 0 && historyList != null) {
				for (int i=0;i<historyList.size();i++) {
					History history = historyList.get(i);
					if (StringUtil.isNotEmpty(history.getGoodsId())) {
						Goods goods = goodsService.get(getParamMap(),history.getGoodsId());
						if (StringUtil.isNotEmpty(goods)) {
							if(StringUtil.isNotEmpty(goods.getShopId()) && StringUtil.isNotEmpty(goods.getCategoryId())){
								if(CrossborderUtil.isShopCatelog(goods.getShopId(), goods.getCategoryId())){
									//1表示 为跨境商品
									history.setCrossBorder("1");
								}else{
									history.setCrossBorder("0");
								}
							}
						}
						goodsCrossBorderList.add(history);
					}
				}
			}
		}catch (Exception e) {
			logger.error(info+"发生异常", e);
			e.printStackTrace();
		}
		return goodsCrossBorderList;
	}

	@RequestMapping(value = "/loadmore")
	public @ResponseBody
	Object ajaxLoadmore(HttpServletRequest request) {
		String info = "根据浏览历史ID删除";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Member member = getCurrentMember(request);
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("c.memberId", member.getId()));
			criteria.add(Restrictions.group("d.goodsId"));
			criteria.add(Restrictions.order("c.createDate","DESC"));
			Pager pager = new Pager();
			pager.setOrderType("DESC");
			pager.setOrderBy("c.createDate");
			pager.setPageSize( 10 );
			pager.setPageNumber(Integer.valueOf(request.getParameter("pageNumber")));
			pager = historyService.getPager(getParamMap(), criteria, pager);
			List<History> list =(List<History>)pager.getList();
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

	@RequestMapping(value = "/ajaxDeleteAllByMemberId")
	public @ResponseBody
	Object ajaxDeleteAllByMemberId(HttpServletRequest request) {
		String info = "清空浏览历史";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Member member = getCurrentMember(request);
			historyService.deleteAllByMemberId(getParamMap(), member.getId());
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
