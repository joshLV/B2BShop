package net.deepdragon.weipu.controller.mall;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.Buyer;
import net.deepdragon.entity.weipu.BuyerMerchant;
import net.deepdragon.entity.weipu.Menu;
import net.deepdragon.entity.weipu.Merchant;
import net.deepdragon.service.weipu.BuyerMerchantService;
import net.deepdragon.service.weipu.BuyerService;
import net.deepdragon.service.weipu.MenuService;
import net.deepdragon.service.weipu.MerchantService;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 我的供应商
 */
@Controller(Global.APP_SIGN + Global.MALL + "BuyerMerchantController")
@RequestMapping(Global.MALL_PATH + "/buyerMerchant")
public class BuyerMerchantController extends BaseMallController {
	
	@Resource
	private BuyerMerchantService buyerMerchantService;
	@Resource
	private MenuService menuService;
	@Resource
	private CacheData cacheData;
	@Resource
	private BuyerService buyerService;
	@Resource
	private MerchantService merchantService;

	@RequestMapping(value = "list")
	public String list(Pager pager, Model model, HttpServletRequest request) {
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		String info = "我的供应商";
		setLogInfo(info);
		logger.debug(info);

		try {

			String buyerId=getCurrentMember(request).getId();
			if(net.deepdragon.util.StringUtil.isNotEmpty(buyerId)){
				String search_mechantName = request.getParameter("search_mechantName");
				pager.setPageSize(10);
				Criteria criterias = new Criteria();
				criterias.add(Restrictions.eq("m.buyerId", buyerId));
				criterias.add(Restrictions.eq("m.tenantId", getParamMap()));
				if(net.deepdragon.util.StringUtil.isNotEmpty(search_mechantName)){
					criterias.add(Restrictions.like("b.name", "%"+search_mechantName+"%"));
					model.addAttribute("search_mechantName", search_mechantName);
				}
				pager = buyerMerchantService.getPager(getParamMap(), criterias, pager);
				List merchatList = pager.getList();
				model.addAttribute("merchatList", merchatList);
				model.addAttribute("pager", pager);

			}
		} catch (Exception ex) {
			logger.error("访问" + info + "时，发生异常", ex);
			ex.printStackTrace();
		}
		model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
		model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
		model.addAttribute("services", cacheData.getServices(getParamMap()));
		if(Global.WHICH_APP.equals(whichclient)){
			return Global.TEMPLATE_APP + PATH + "/member/my_order_list";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/b2b/buyerMerchant";
		}

	}

	/**
	 * 获取供应商
	 *
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/findMerchant", method = { RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> findMerchant(String merchantName, HttpServletRequest request, HttpServletResponse response,
							  HttpSession session) {
		String info = "获取我的供应商";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			if(net.deepdragon.util.StringUtil.isNotEmpty(merchantName)){
				List<Merchant> merchantList = merchantService.getNameMerchants(getParamMap(),merchantName);
				result.put("list", merchantList);
				result.put(STATUS, SUCCESS);
				result.put(MESSAGE, "此采购商未审核!");
			}else{
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "未获取到!");
			}

		}catch (Exception e) {
			logger.error("获取供应商，发生异常", e);
			e.printStackTrace();
		}
		return result;

	}

	/**
	 * 保存我的供应商
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/save", method = { RequestMethod.POST })
	public @ResponseBody
	Object save(String merchantId, HttpSession session,HttpServletRequest request) {
		String info = "保存我的供应商";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			/**
			 * 创建供应商对象 将页面传来的值 set进去
			 * */
			BuyerMerchant buyerMerchant = new BuyerMerchant();
			Buyer buyers = getCurrentMember(request);

			if(net.deepdragon.util.StringUtil.isNotEmpty(buyers.getId()) && net.deepdragon.util.StringUtil.isNotEmpty(merchantId)){
				Criteria criteria = new Criteria();
				criteria.add(Restrictions.eq("buyerId", buyers.getId()));
				criteria.add(Restrictions.eq("merchantId", merchantId));
				criteria.add(Restrictions.eq("isDelete", 1));
				List<BuyerMerchant> buyerMerchantList = buyerMerchantService.getList(getParamMap(), criteria);
				if(buyerMerchantList == null || buyerMerchantList.size() == 0){
//					buyerMerchant.setTenantId(getParamMap());
					buyerMerchant.setBuyerId(buyers.getId());
					buyerMerchant.setMerchantId(merchantId);
					buyerMerchant.setType(0);
					buyerMerchant.setIsDelete(1);
					buyerMerchant.setCreateUser(buyers.getUserName());
					buyerMerchant.setCreateDate(new Date());

					/**
					 * 保存我的供应商
					 * */
					buyerMerchantService.save(getParamMap(), buyerMerchant);
					result.put(STATUS, SUCCESS);
					result.put(MESSAGE, "添加成功!");
				}else{
					result.put(STATUS, "report");
					result.put(MESSAGE, "已有此供应商!");
				}
			} else {
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "添加失败!");
			}

		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "保存失败，请联系管理员。");
		}
		return result;

	}

	/**
	 * 删除我的供应商
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/delete", method = { RequestMethod.POST })
	public @ResponseBody
	Object delete(String merchantId, HttpSession session,HttpServletRequest request) {
		String info = "删除我的供应商";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Buyer buyers = getCurrentMember(request);

			if(net.deepdragon.util.StringUtil.isNotEmpty(buyers.getId()) && net.deepdragon.util.StringUtil.isNotEmpty(merchantId)){
				/**
				 * 删除我的供应商
				 * */
				buyerMerchantService.updateBuyerMerchantState(getParamMap(),buyers.getId(),merchantId);
				result.put(STATUS, SUCCESS);
				result.put(MESSAGE, "删除成功!");
			}else{
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "删除失败!");
			}

		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "删除失败，请联系管理员。");
		}
		return result;

	}

}
