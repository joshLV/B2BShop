package net.deepdragon.weipu.controller.mall;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.Area;
import net.deepdragon.entity.DeliveryTime;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.AreaService;
import net.deepdragon.service.DeliveryTimeService;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.Constant;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * 报价单页面
 */
@Controller(Global.APP_SIGN + Global.MALL + "QuotationController")
@RequestMapping(Global.MALL_PATH + "/quotation")
public class QuotationController extends BaseMallController {
	
	@Resource
	private EnquiryService enquiryService;
	@Resource
	private EnquiryGoodsService enquiryGoodsService;
	@Resource
	private QuotationLogService quotationLogService;
	@Resource
	private QuotationService quotationService;
	@Resource
	private CatelogService catelogService;
	@Resource
	private BuyerService buyerService;
	@Resource
	private QuotationDetailsService quotationDetailsService;
	@Resource
	private AreaService areaService;
	@Resource
	private MerchantService merchantService;
	@Resource
	private CacheData cacheData;
	@Resource
	private DeliveryTimeService deliveryTimeService;

	/**
	 * 查询报价单列表页面
	 *
	 * @param model
	 * @param pager
	 * @param request
	 * @return
	 */
	@RequestMapping("list")
	public String list(Model model, Pager pager,HttpServletRequest request){
		Map<String, String> formMap = new HashMap<String, String>();
		Buyer buyer = getCurrentMember(request);
		model.addAttribute("buyer", buyer);
		Enquiry enquiry = null;

		try {
			Criteria criteria = new Criteria();

			String enquiryId = getParameter(request, "enquiryId");
			if (StringUtils.isNotBlank(enquiryId) ) {
				//询价单信息
				enquiry = this.enquiryService.get(getParamMap(), enquiryId);
				model.addAttribute("enquiry", enquiry);
				long date1 = new Date().getTime();
				long date2 = enquiry.getOfferEndDateTime().getTime();

				//剩余时间
				if(date2 > date1){
					model.addAttribute("surplusDay", (date2-date1)/(1000 * 60 * 60 * 24));
					model.addAttribute("surplusHour", ((date2-date1)%(1000 * 60 * 60 * 24))/(1000 * 60 * 60));
				}else{
					model.addAttribute("surplusDay", 0);
					/**
					 * Desc:小时默认给0 Auth:zhangqiang Time:2015-11-19 16:14:35 Start
					 */
//					model.addAttribute("surplusDay", 0);
					model.addAttribute("surplusHour", 0);
					/**
					 * Desc:小时默认给0 Auth:zhangqiang Time:2015-11-19 16:14:35 End
					 */
				}

				//询价商品
				List<EnquiryGoods> goods = this.enquiryGoodsService.findList(getParamMap(), "enquiryId", enquiryId);
				if( goods != null && goods.size() > 0 ){
					if( goods.size() == 1 ){
						model.addAttribute("goodsNames", goods.get(0).getGoodsName() + "("+ goods.get(0).getGoodsNum() + goods.get(0).getGoodsUnit() + ")");
					}else{
						model.addAttribute("goodsNames", goods.size() + "种");
					}
				}else{
					model.addAttribute("goodsNames", "无商品");
				}

				//报价单数据
				criteria.add(Restrictions.eq("o.enquiryId", enquiryId));
				criteria.add(Restrictions.eq("o.tenantId", getTenantId()));
				if (StringUtils.isNotEmpty(pager.getOrderBy()) && StringUtils.isNotEmpty(pager.getOrderType())) {
					criteria.add(Restrictions.order(pager.getOrderBy(), pager.getOrderType()));
				}
				pager.setPageSize(10);
				pager = this.quotationService.getPagerByEnquiryId(getParamMap(), criteria, pager);
				List<Map<String,Object>> quotationList = (List<Map<String,Object>>)pager.getList();

				//判断是否过期报价
				if( quotationList != null && quotationList.size() > 0 ){
					for(Map<String,Object> m : quotationList ){
						Date quotationPeriod = (Date)m.get("quotationPeriod");
						if( quotationPeriod.getTime() > new Date().getTime() ){
							m.put("isEnd", false);
						}else{
							m.put("isEnd", true);
						}
					}
				}

				model.addAttribute("quotationList", quotationList);
				model.addAttribute("pager", pager);

				//查询条件
				model.addAttribute("formMap", formMap);

				//报价单数量
				model.addAttribute("countTotal", pager.getTotalCount());

				//状态名称Map
				Map<String, String> statusMap = new HashMap<String, String>();
				statusMap.put("1","接受报价中");
				statusMap.put("2", "报价已截止");
				statusMap.put("3", "已完结");
				statusMap.put("4", "询价已撤销");
				model.addAttribute("statusMap", statusMap);
			}

			setPublicDate2Model(model);
			getAllCatelog(model);
		}catch (Exception e){
			logger.error("访问[报价单列表]时，发生异常", e);
			e.printStackTrace();
		}
		if (Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))){
			return Global.TEMPLATE_APP + PATH + "/member/quotation_list";
		}
		return Global.TEMPLATE_MALL + PATH + "/b2b/quotation_list";
	}

	/**
	 * 查询报价单详情并把报价更新为已读
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("list_detail")
	public String listDetail(Model model,HttpServletRequest request){
		Quotation quotation = null;
		Buyer buyer = null;
		try {
			//获取报价单ID
			String quotationId = getParameter(request, "quotationId");
			if (StringUtils.isNotBlank(quotationId) ) {
				quotation = this.quotationService.get(getParamMap(), quotationId);
				String qutationStatus = "";
				Integer qus = quotation.getQuotationState();
				//报价单状态
				if(qus == 1){
					qutationStatus = "已报价";
				}else if(qus == 2){
					qutationStatus = "被退回";
				}else{
					qutationStatus = "已撤回";
				}

				//现在距有效期日期相差天数
				int days = daysBetween(new Date(),quotation.getQuotationPeriod());
				if(days<=0){
					model.addAttribute("daysType", "1");
				}
				model.addAttribute("days", days);
				model.addAttribute("qutationStatus", qutationStatus);
				model.addAttribute("quotation", quotation);

				//更新报价单为已读
				Quotation quotations = new Quotation();
				quotations.setId(quotationId);
				quotations.setIsBuyerRead(2);
				quotationService.update(getParamMap(),quotations);

				//查询报价单详情相关信息
				Criteria criteria = new Criteria();
				criteria.add(Restrictions.eq("quotationId", quotationId));
				criteria.add(Restrictions.eq("isDelete", 1));
				List<QuotationDetails> quotationDetailsList =  quotationDetailsService.getList(getParamMap(),criteria);
				model.addAttribute("quotationDetailsList", quotationDetailsList);

				//查询相应的供应商信息
				buyer = buyerService.get(getParamMap(),quotation.getBuyerId());
				model.addAttribute("buyer", buyer);

				//区域转换
				Area areas = areaService.get(getParamMap(),buyer.getAreaId());
				StringBuffer sbs = new StringBuffer();
				sbs.append(areas.getFullName());
				if (StringUtils.isNotBlank(buyer.getAddress()) ) {
					sbs.append(buyer.getAddress());
				}
				model.addAttribute("buyAddress", sbs.toString());

				//查询询价单信息
				Enquiry enquiry = this.enquiryService.get(getParamMap(), quotation.getEnquiryId());
				model.addAttribute("enquiry", enquiry);

				Area area = areaService.get(getParamMap(),enquiry.getRecAreaId());
				StringBuffer sb = new StringBuffer();
				sb.append(area.getFullName());
				if (StringUtils.isNotBlank(enquiry.getRecAddress()) ) {
					sb.append(enquiry.getRecAddress());
				}
				model.addAttribute("address", sb.toString());

				//查询商家信息
				Merchant merchant = merchantService.get(getParamMap(), quotation.getMerchantId());
				model.addAttribute("merchant", merchant);

				//保存日志
				QuotationLog log = new QuotationLog();
				log.setIsDelete(1);
				log.setTenantId(getTenantId());
				log.setQuotationId(quotation.getId());
				log.setContent("查询报价单详情并更新为已读!");
				log.setCreateUser(buyer.getId());
				log.setCreateDate(new Date());

				this.quotationLogService.save(getParamMap(), log);
			}

			// 送货时间
			model.addAttribute("deliveryTimeList", getDeliveryTimeList());

			model.addAttribute("services", cacheData.getServices(getParamMap()));
			model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
			model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
		}catch (Exception e){
			logger.error("访问[报价单详情]时，发生异常", e);
			e.printStackTrace();
		}
		if (Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))){
			return Global.TEMPLATE_APP + PATH + "/member/quotation_detail";
		}
		return Global.TEMPLATE_MALL + PATH + "/b2b/quotation_detail";
	}
	/**
	 * 查询送货时间方式
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
	 * 弹出删除提示框
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("popupDel")
	public String popupDelQuotation(String id,Model model, HttpServletRequest request){

		model.addAttribute("id", id);
		return Global.TEMPLATE_MALL + PATH + "/b2b/quotation_del_popup";
	}

	/**
	 * 弹出撤销提示框
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("popupReturn")
	public String popupReturnQuotation(String id,Model model, HttpServletRequest request){

		model.addAttribute("id", id);
		return Global.TEMPLATE_MALL + PATH + "/b2b/quotation_return_popup";
	}

	/**
	 * 删除
	 * @param id 询价单ID
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("del/{id}")
	@ResponseBody
	public Object delQuotation(@PathVariable String id,Model model, HttpServletRequest request){
		Map<String, Object> result = new HashMap<String, Object>();
		String tenantId = getTenantId();
		Buyer buyer = getCurrentMember(request);

		try {
			if (StringUtil.isNotEmpty(id)) {
				Quotation quotation = this.quotationService.get(getParamMap(), id);
				if(quotation != null){
					quotation = new Quotation();
					quotation.setId(id);
					quotation.setQuotationState(4);
					quotation.setModifyUser(buyer.getId());
					quotation.setModifyDate(new Date());

					this.quotationService.update(getParamMap(), quotation);

					//保存日志
					QuotationLog log = new QuotationLog();
					log.setIsDelete(1);
					log.setTenantId(tenantId);
					log.setQuotationId(quotation.getId());
					log.setContent("删除报价单");
					log.setCreateUser(buyer.getId());
					log.setCreateDate(new Date());

					this.quotationLogService.save(getParamMap(), log);
				}else{
					result.put(STATUS, ERROR);
					result.put(MESSAGE, "报价单不存在");
					return result;
				}
			}else{
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "报价单不存在");
				return result;
			}
		}catch (Exception e){
			logger.error("删除报价单", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "删除报价单时，发生异常");
			return result;
		}

		result.put(STATUS, SUCCESS);
		result.put(MESSAGE, "");
		return result;
	}

	/**
	 * 撤销
	 * 更新
	 *    Desc:将退回原因与补充说明放开，便于MCM端显示。
	 *    Auth:zhangqiang
	 *    Time:2015-11-26 11:35:35
	 * @param id 询价单ID
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("returnQ/{id}/{anewOffer}/{reason}/{otherRea}")
	@ResponseBody
	public Object returnQuotation(@PathVariable String id,@PathVariable Integer anewOffer,@PathVariable String reason,@PathVariable String otherRea,Model model, HttpServletRequest request){
		Map<String, Object> result = new HashMap<String, Object>();
		String tenantId = getTenantId();
		Buyer buyer = getCurrentMember(request);

		try {
			if (StringUtil.isNotEmpty(id)) {
				Quotation quotation = this.quotationService.get(getParamMap(), id);
				if(quotation != null){
					quotation = new Quotation();
					quotation.setId(id);
					quotation.setQuotationState(2);
					quotation.setModifyUser(buyer.getId());
					quotation.setModifyDate(new Date());
					quotation.setAnewOffer(anewOffer);

					this.quotationService.update(getParamMap(), quotation);

					//保存日志
					QuotationLog log = new QuotationLog();
					log.setIsDelete(1);
					log.setTenantId(tenantId);
					log.setQuotationId(quotation.getId());
					if(StringUtil.isNotEmpty(otherRea)){
						log.setContent("退回报价单,原因："+URLDecoder.decode(reason,"utf-8")+"\n补充说明："+URLDecoder.decode(otherRea,"utf-8"));
					}else {
						log.setContent("退回报价单,原因："+URLDecoder.decode(reason,"utf-8"));
					}
					log.setCreateUser(buyer.getId());
					log.setCreateDate(new Date());

					this.quotationLogService.save(getParamMap(), log);
				}else{
					result.put(STATUS, ERROR);
					result.put(MESSAGE, "报价单不存在");
					return result;
				}
			}else{
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "报价单不存在");
				return result;
			}
		}catch (Exception e){
			logger.error("退回报价单", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "退回报价单时，发生异常");
			return result;
		}

		result.put(STATUS, SUCCESS);
		result.put(MESSAGE, "");
		return result;
	}

	/**
	 * 计算两个日期之间相差的天数
	 * @param smdate 较小的时间
	 * @param bdate  较大的时间
	 * @return 相差天数
	 * @throws
	 */
	public static int daysBetween(Date smdate,Date bdate) throws ParseException {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		smdate=sdf.parse(sdf.format(smdate));
		bdate=sdf.parse(sdf.format(bdate));
		Calendar cal = Calendar.getInstance();
		cal.setTime(smdate);
		long time1 = cal.getTimeInMillis();
		cal.setTime(bdate);
		long time2 = cal.getTimeInMillis();
		long between_days=(time2-time1)/(1000*3600*24);

		return Integer.parseInt(String.valueOf(between_days));
	}

}
