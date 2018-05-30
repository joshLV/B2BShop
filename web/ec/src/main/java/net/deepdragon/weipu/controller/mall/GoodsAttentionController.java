package net.deepdragon.weipu.controller.mall;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.weipu.GoodsAttentionService;
import net.deepdragon.service.weipu.GoodsService;
import net.deepdragon.service.weipu.MenuService;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.Global;

import net.deepdragon.weipu.tools.CrossborderUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller(Global.APP_SIGN + Global.MALL + "GoodsAttentionController")
@RequestMapping(Global.MALL_PATH + "/member/goodsattention")
public class GoodsAttentionController extends BaseMallController {
	@Resource
	private MenuService menuService;
	@Resource
	private CacheData cacheData;
	@Resource
	private GoodsAttentionService goodsAttentionService;
	@Resource
	private GoodsService goodsService;

	@RequestMapping(value = "list")
	public String list(Pager pager,Model model, HttpServletRequest request) {
		String info = "我的关注";
		setLogInfo(info);
		logger.debug(info);
		try {
			getGoodsAttentionList(pager, model, request);
		} catch (Exception ex) {
			logger.error("访问" + info + "时，发生异常", ex);
			ex.printStackTrace();
		}
		getAllCatelog(model);
		setPublicDate2Model( model );
		String type = request.getParameter(Global.WHICHCLIENT);
		if(Global.WHICH_APP.equals(type)){
			return Global.TEMPLATE_APP + PATH + "/member/goodsattention";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/member/goodsattention";
		}
		//return Global.TEMPLATE_MALL + PATH + "/member/goodsattention";
	}

	// 获取商品关注列表
	public void getGoodsAttentionList(Pager pager,Model model, HttpServletRequest request) throws Exception {
		Member member = getCurrentMember(request);
		Criteria criteria = new Criteria();
		if("1".equals(request.getParameter("goodsType"))){
			criteria.add(Restrictions.eq("a.type", 1));
		}else{
			criteria.add(Restrictions.eq("a.type", 0));
		}
		criteria.add(Restrictions.eq("c.memberId", member.getId()));
		criteria.add(Restrictions.group("c.goodsId"));
		pager.setOrderType("DESC");
		pager.setOrderBy("c.createDate");
		pager.setPageSize( 10 );
		pager = goodsAttentionService.getPager(getParamMap(), criteria, pager);
//		model.addAttribute("goodsAttentionList", pager.getList());

		//判断跨境商品 开关 是否打开
		if(CrossborderUtil.isCrossborder()){
			if(pager.getList().size() > 0 && pager.getList() != null){
				List<GoodsAttention> gList = (List<GoodsAttention>) pager.getList();
				model.addAttribute("goodsAttentionList",getIfCrossborder(gList));
			}
		}else{
			model.addAttribute("goodsAttentionList", pager.getList());

		}

		model.addAttribute("pager", pager);
	}

	/**
	 * Desc:判断是否为跨境商品
	 * Auth:zhangqiang
	 * Time:2016-01-29 14:53:25
	 * @param goodsAttentionList
	 * @return
	 */
	public List<GoodsAttention> getIfCrossborder(List<GoodsAttention> goodsAttentionList){
		String info = "获取商品是否为跨境商品";
		setLogInfo(info);
		List<GoodsAttention> goodsCrossBorderList = new ArrayList<GoodsAttention>();
		try{
			if (goodsAttentionList.size() > 0 && goodsAttentionList != null) {
				for (int i=0;i<goodsAttentionList.size();i++) {
					GoodsAttention goodsAttention = goodsAttentionList.get(i);
					if (StringUtil.isNotEmpty(goodsAttention.getGoodsId())) {
						Goods goods = goodsService.get(getParamMap(),goodsAttention.getGoodsId());
						if (StringUtil.isNotEmpty(goods)) {
							if(StringUtil.isNotEmpty(goods.getShopId()) && StringUtil.isNotEmpty(goods.getCategoryId())){
								if(CrossborderUtil.isShopCatelog(goods.getShopId(), goods.getCategoryId())){
									//1表示 为跨境商品
									goodsAttention.setCrossBorder("1");
								}else{
									goodsAttention.setCrossBorder("0");
								}
							}
						}
						goodsCrossBorderList.add(goodsAttention);
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
		String info = "AJAX加载我的关注";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Member mb = getCurrentMember(request);
			Pager pager = new Pager();
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("c.memberId", mb.getId()));
			criteria.add(Restrictions.group("c.goodsId"));
			pager.setOrderType("DESC");
			pager.setOrderBy("c.createDate");
			pager.setPageSize( 10 );
			pager.setPageNumber(Integer.valueOf(request.getParameter("pageNumber")));
			pager = goodsAttentionService.getPager(getParamMap(), criteria, pager);
			List<GoodsAttention> list = (List<GoodsAttention>)pager.getList();
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
			Member member = getCurrentMember(request);
			goodsAttentionService.deleteAllByMemberId(getParamMap(), member.getId());
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
