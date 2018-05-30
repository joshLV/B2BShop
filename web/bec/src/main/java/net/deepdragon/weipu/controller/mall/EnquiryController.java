package net.deepdragon.weipu.controller.mall;

import com.alibaba.fastjson.JSON;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.Area;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.AreaService;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.DateUtils;
import net.deepdragon.util.HTMLDomUtil;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.tools.PropertiesUtil;
import net.deepdragon.weipu.tools.UploadTools;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import java.util.*;


/**
 * 订单页面
 */
@Controller(Global.APP_SIGN + Global.MALL + "EnquiryController")
@RequestMapping(Global.MALL_PATH + "/enquiry")
public class EnquiryController extends BaseMallController {
	
	@Resource
	private EnquiryService enquiryService;
	@Resource
	private EnquiryGoodsService enquiryGoodsService;
	@Resource
	private EnquiryLogService enquiryLogService;
	@Resource
	private EnquiryMerchantService enquiryMerchantService;
	@Resource
	private CatelogService catelogService;
	@Resource
	private BuyerMerchantService buyerMerchantService;
	@Resource
	private MerchantService merchantService;
	@Resource
	private AreaService areaService;
	@Resource
	private CacheData cacheData;
	@Resource
	private PurchaseOrderDetailService purchaseOrderDetailService;
	@Resource
	private MerchantService shopService;
	@Resource
	private SMSLogService smsLogService;
	@Resource
	private SystemSetService systemSetService;

	/**
	 * 非平台商品转为询价单(批量)
	 * @param model
	 * @param request
	 * @param goodsIds  商品ID与数量
	 * @return
	 */
	@RequestMapping("changeEnquiry")
	public String changeEnquiry(Model model, HttpServletRequest request,String goodsIds){
		String info = "非平台商品转为询价单(批量)";
		setLogInfo(info);

		List<EnquiryGoods> goods = new ArrayList<>();
		List<Catelog> catelogList =null;

		try {
			if (StringUtil.isNotEmpty(goodsIds)) {
				String[] goodsIdsNums = goodsIds.split("--");

				if (StringUtil.isNotEmpty(goodsIdsNums) && goodsIdsNums.length > 0) {
					for (int i = 0; i < goodsIdsNums.length; i++) {
						String[] goodsIdNum = goodsIdsNums[i].split("_");
						if (StringUtil.isNotEmpty(goodsIdNum) && goodsIdNum.length > 0) {
							if (StringUtil.isNotEmpty(goodsIdNum[0]) && Integer.parseInt(goodsIdNum[1]) > 0) {
								PurchaseOrderDetail purchaseOrderDetail  = purchaseOrderDetailService.get(getParamMap(), goodsIdNum[0]);

								if (StringUtil.isNotEmpty(purchaseOrderDetail)) {

									EnquiryGoods enquiryGoods = new EnquiryGoods();
									enquiryGoods.setGoodsName(purchaseOrderDetail.getGoodsName());
									enquiryGoods.setGoodsNum(Integer.parseInt(goodsIdNum[1]));

									goods.add(enquiryGoods);
								}
							}
						}
					}
				}
			}

			if(goods.size() > 0){
				model.addAttribute("goods", goods);
				model.addAttribute("goodsCount", goods==null?0:goods.size());//商品种类
			}

			Enquiry enquiry = new Enquiry();
			Buyer buyer = getCurrentMember(request);
			model.addAttribute("goodsCount", 1);
			enquiry.setOfferEndDateTime(DateUtils.dateAddByProp(new Date(), Calendar.DAY_OF_MONTH, 45));
			enquiry.setLinkman(buyer != null ? buyer.getLinkMan() : "");
			enquiry.setPhone(buyer != null ? buyer.getLikeManMobile() : "");
			model.addAttribute("enquiry", enquiry);

			/**Desc:APP端使用JSON数据 Auth:liuxiaobing Date:2015-12-09 Star**/
			catelogList=catelogService.getAllParents(getParamMap());
			model.addAttribute("catelogs",catelogList );
			/**Desc:APP端使用JSON数据 Auth:liuxiaobing Date:2015-12-09 End**/

			model.addAttribute("services", cacheData.getServices(getParamMap()));
			model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
			model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));

		}catch (Exception e){
			logger.error(info+"时异常", e);
		}
		return Global.TEMPLATE_MALL + PATH + "/b2b/enquiry_add";
	}

	/**
	 * 发布询价单
	 * 分类列表
	 * 报价终止日期
	 * 联系人
	 * 电话
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("publish")
	public String publish(String enquiryId,Model model, HttpServletRequest request){
 		String tenantId = getTenantId();
		Buyer buyer = getCurrentMember(request);
		List<Catelog> catelogList =null;
		Enquiry enquiry = null;

		try {
			if (StringUtil.isNotEmpty(enquiryId)) {
				//发布相似询价单
				enquiry = getEnquiryData(getParamMap(), enquiryId, model);
			} else {
				enquiry = new Enquiry();
				model.addAttribute("goodsCount", 1);
				enquiry.setOfferEndDateTime(DateUtils.dateAddByProp(new Date(), Calendar.DAY_OF_MONTH, 45));
				enquiry.setLinkman(buyer != null ? buyer.getLinkMan() : "");
				enquiry.setPhone(buyer != null ? buyer.getLikeManMobile() : "");
			}

			model.addAttribute("enquiry", enquiry);
			/**Desc:APP端使用JSON数据 Auth:liuxiaobing Date:2015-12-09 Star**/
			catelogList=catelogService.getAllParents(getParamMap());
			model.addAttribute("catelogs",catelogList );
			/**Desc:APP端使用JSON数据 Auth:liuxiaobing Date:2015-12-09 End**/


			model.addAttribute("services", cacheData.getServices(getParamMap()));
			model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
			model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));

			/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
			LoginType loginType = getLoginType(request);
			model.addAttribute("loginType", loginType);
			String operatorRole = getOperatorRole(request);
			if (LoginType.operator.equals(loginType)) {
				model.addAttribute("role", operatorRole);
			}
            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/
		}catch (Exception e){
			logger.error("发布询价单", e);
		}
		if(Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))){
			if(catelogList!=null){
				model.addAttribute("catelogsJson",getcatelogListForJson(catelogList));
				try{
					if(enquiry!=null && enquiry.getRecAreaId()!=null){
						Area area = areaService.get(this.getParamMap(), enquiry.getRecAreaId());
						model.addAttribute("fullName", area.getFullName());
						model.addAttribute("enquiryId", enquiryId);
					}
					getBuyersPopup_app(model, request);
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
			return Global.TEMPLATE_APP + PATH + "/member/enquiry_add";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/b2b/enquiry_add";
		}
		//return Global.TEMPLATE_MALL + PATH + "/b2b/enquiry_add";
	}

	public String getcatelogListForJson(List<Catelog> catelogList){
		class CatelogJSON{
			private String id;
			private String value;
			private String text;
			private List<CatelogJSON> children;
			public CatelogJSON(){
				this.id = "";
				this.value = "";
				this.text = "";
			}
			public CatelogJSON build(Catelog catelog){
				this.id = catelog.getId();
				this.value = catelog.getPath();
				this.text = catelog.getName();
				return this;
			}

			public String getId() {
				return id;
			}

			public void setId(String id) {
				this.id = id;
			}

			public String getValue() {
				return value;
			}

			public void setValue(String value) {
				this.value = value;
			}

			public String getText() {
				return text;
			}

			public void setText(String text) {
				this.text = text;
			}

			public List<CatelogJSON> getChildren() {
				return children;
			}

			public void setChildren(List<CatelogJSON> children) {
				this.children = children;
			}
		}
		List<CatelogJSON> catelogJSONs = new ArrayList<CatelogJSON>();
		try {

			List<Catelog> catelog1 = catelogList;
			List<Catelog> catelog2 = new ArrayList<Catelog>();
			List<Catelog> catelog3 = new ArrayList<Catelog>();

			List<CatelogJSON> catelogJSONList1 = new ArrayList<CatelogJSON>();
			List<CatelogJSON> catelogJSONList2 = new ArrayList<CatelogJSON>();
			List<CatelogJSON> catelogJSONList3 = new ArrayList<CatelogJSON>();

			CatelogJSON catelogJSON1=new CatelogJSON();
			CatelogJSON catelogJSON2=new CatelogJSON();
			CatelogJSON catelogJSON3=new CatelogJSON();
			for(int i=0;i<catelog1.size();i++){//一级分类
				catelogJSON1=new CatelogJSON();
				catelogJSON1.build(catelog1.get(i));
				catelog2=catelogService.getSons(getParamMap(), catelog1.get(i).getId());
				if(catelog2!=null){//二级分类
					catelogJSONList2=new  ArrayList<CatelogJSON>();
					for(int j=0;j<catelog2.size();j++){
						catelogJSON2=new CatelogJSON();
						catelogJSON2.build(catelog2.get(j));
						catelog3=catelogService.getSons(getParamMap(), catelog2.get(j).getId());
						if(catelog3!=null){//三级分类
							catelogJSONList3=new  ArrayList<CatelogJSON>();
							for(int k=0;k<catelog3.size();k++){
								catelogJSON3=new CatelogJSON();
								catelogJSON3.build(catelog3.get(k));
								catelogJSONList3.add(catelogJSON3);
							}
							if(catelogJSONList3!=null && catelogJSONList3.size()>0){
								catelogJSON2.setChildren(catelogJSONList3);
							}
						}
						catelogJSONList2.add(catelogJSON2);
					}
					if(catelogJSONList2!=null && catelogJSONList2.size()>0){
						catelogJSON1.setChildren(catelogJSONList2);
					}
				}
				catelogJSONs.add(catelogJSON1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSON.toJSONString(catelogJSONs);
	}

	/**
	 * 查看详情
	 * @param enquiryId
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("detail/{enquiryId}")
	public String detail(@PathVariable String enquiryId,Model model, HttpServletRequest request){
		String tenantId = getTenantId();
		Enquiry enquiry = null;

		try {
			if (StringUtil.isNotEmpty(enquiryId)) {
				enquiry = getEnquiryData(getParamMap(), enquiryId, model,request);
				Area area = this.areaService.get(getParamMap(), enquiry.getRecAreaId());
				enquiry.setRecAddress((area!=null?area.getFullName() + "-":"") + enquiry.getRecAddress());
				model.addAttribute("enquiry", enquiry);

				model.addAttribute("catelogs", catelogService.getAllParents(getParamMap()));
			}

			model.addAttribute("services", cacheData.getServices(getParamMap()));
			model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
			model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
		}catch (Exception e){
			logger.error("询价单详情", e);
		}
		if(Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))){
			return Global.TEMPLATE_APP + PATH + "/member/enquiry_detail";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/b2b/enquiry_detail";
		}
		//return Global.TEMPLATE_MALL + PATH + "/b2b/enquiry_detail";
	}
	private Enquiry getEnquiryData(Map<String, Object> paramMap,String enquiryId,Model model) throws Exception{
		return getEnquiryData(paramMap, enquiryId, model, null);
	}
	/**
	 * 根据询价单ID获取询价单及其明细表数据
	 * @param paramMap
	 * @param enquiryId
	 * @param model
	 * @return
	 * @throws Exception
	 */
	private Enquiry getEnquiryData(Map<String, Object> paramMap,String enquiryId,Model model, HttpServletRequest request) throws Exception{
		Enquiry enquiry = this.enquiryService.get(getParamMap(), enquiryId);

		//指定供应商时，组装供应商数据
		if(2 == enquiry.getEnquiryMode()){
			setMerchantsToEnquiry(getParamMap(),enquiry);
		}

		//商品信息
		List<EnquiryGoods> goods = this.enquiryGoodsService.findList(getParamMap(), "enquiryId", enquiryId);

		//组装分类信息
		setCatelogNameToGood(getParamMap(), goods);
		if(null != request && Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))){
			for(EnquiryGoods aGoods : goods){
				String contextPath = request.getContextPath();
				/*aGoods.setGoodsAccessory(HTMLDomUtil.imgLazyload(aGoods.getGoodsAccessory(), contextPath, UploadTools.getImageServerAddress()));*/
				//aGoods.setGoodsAccessory(HTMLDomUtil.imgLazyload(aGoods.getGoodsAccessory(), contextPath, UploadTools.getImageServerAddress(), UploadTools.getImageServerType()));
			}
		}
		model.addAttribute("goods", goods);
		model.addAttribute("goodsCount", goods==null?0:goods.size());//商品种类
		return enquiry;
	}


	/**
	 * 组装指定供应商数据
	 * @param enquiry
	 */
	private void setMerchantsToEnquiry(Map<String, Object> paramMap,Enquiry enquiry) throws Exception{
		List<EnquiryMerchant> enquiryMerchants = enquiryMerchantService.findList(getParamMap(), "enquiryId", enquiry.getId());

		if(enquiryMerchants != null && enquiryMerchants.size() > 0){
			List<String> ids = new ArrayList<String>();
			for(EnquiryMerchant em : enquiryMerchants){
				ids.add(em.getMerchantId());
			}

			List<Merchant> merchants = merchantService.findListByIds(paramMap, ids);
			if(merchants != null && merchants.size() > 0){

				StringBuffer merchantIds = new StringBuffer();
				StringBuffer merchantNames = new StringBuffer();
				for(int i = 0; i < merchants.size(); i++){
					if( i > 0 ){
						merchantIds.append(",");
						merchantNames.append(",");
					}
					merchantIds.append(merchants.get(i).getId());
					merchantNames.append(merchants.get(i).getName());
				}

				enquiry.setMerchantIds(merchantIds.toString());
				enquiry.setMerchantNames(merchantNames.toString());
			}
		}
	}

	/**
	 * 组装商品的分类名称
	 * @param paramMap
	 * @param goods
	 * @throws Exception
	 */
	private void setCatelogNameToGood(Map<String, Object> paramMap,List<EnquiryGoods> goods) throws  Exception{
		if( goods != null && goods.size() > 0 ){
			for(EnquiryGoods good : goods ){
				String categoryPath = good.getCategoryPath();

				if(categoryPath.contains(",")){
					String[] clIds = categoryPath.split(",");
					List<String> ids = new ArrayList<String>(clIds.length);
					for(String id : clIds){
						ids.add(id);
					}
					List<Catelog> cls = this.catelogService.findListByIds(getParamMap(), ids);
					if( cls != null ){
						int i = 0;
						StringBuffer catelogName = new StringBuffer();
						for(String id : clIds){
							for(Catelog cl : cls ){
								if(id.equals(cl.getId())){
									if( i > 0 ){
										catelogName.append(">");
									}
									catelogName.append(cl.getName());
									i++;
									break;
								}
							}
						}
						good.setCategoryName( catelogName.toString() );
					}
				}else{
					Catelog cl = this.catelogService.get(getParamMap(), categoryPath);
					good.setCategoryName(cl != null ? cl.getName() : "");
				}
			}
		}
	}

	/**
	 * 保存询价单
 	 * @param enquiry
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("save")
	@ResponseBody
	public Object save(Enquiry enquiry,Model model, HttpServletRequest request){
		Map<String, Object> result = new HashMap<String, Object>();

		String tenantId = getTenantId();
		Buyer buyer = getCurrentMember(request);

		try {
			String endDate = request.getParameter("offerEndDateTimeStr");
			enquiry.setOfferEndDateTime(DateUtils.stringToDate(endDate,"yyyy-MM-dd HH:mm:ss"));
			this.enquiryService.saveEnquiry(getParamMap(), buyer.getId(), enquiry);

			//给商家发送短信
			if( enquiry.getEnquiryMode() == 1 ){//全部发送

				sendSMS(null, enquiry.getTitle(),"商城商机库");
			}else if(enquiry.getEnquiryMode() == 2 ){//指定的发送
				List<String> merchantIds = new ArrayList<String>();
				if( enquiry.getMerchantIds().indexOf(",") > 0 ){
					String[] ids = enquiry.getMerchantIds().split(",");
					for(String id : ids){
						merchantIds.add(id);
					}
				}else{
					merchantIds.add( enquiry.getMerchantIds() );
				}
				sendSMS(merchantIds, enquiry.getTitle(),"我的商机库");
			}

		}catch (Exception e){
			logger.error("保存询价单发生异常", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "保存询价单时，发生异常");
			return result;
		}

		result.put(STATUS, SUCCESS);
		result.put(MESSAGE, "");

		return result;
	}

	/**
	 * 询价单发布成功后给商家发短信
	 * @param ids
	 * @param title
	 * @param menu
     */
	private void sendSMS(List<String> ids, String title, String menu) {
		try {
			if("true".equalsIgnoreCase(PropertiesUtil.getValue("applicationContext.properties","application.sendSMSToShop4Paid"))) {
				List<Merchant> merchants = null;
				if (ids == null) {
					Criteria criterias = new Criteria();
					criterias.add(Restrictions.eq("status", 3));
					merchants = this.shopService.getList(getParamMap(), criterias);
				} else {
					merchants = this.shopService.findListByIds(getParamMap(), ids);
				}

				if (merchants != null && merchants.size() > 0) {
					for (Merchant m : merchants) {
						if (net.deepdragon.util.StringUtil.isNotEmpty(m.getMobile())) {
							//发送短信
							String msg = "有新的询价单\""+title+"\",请在\""+menu+"\"查看详情。";
							Map<String, Object> sendResult = smsLogService.sendSMS(getParamMap(), m.getMobile(), msg, systemSetService.getAll(getParamMap()));
							if (!SUCCESS.equals(sendResult.get(STATUS))) {
								logger.error("发布询价单短信通知商家失败");
							} else {
								//保存短信日志
								this.shopService.insertOne(getParamMap(), (String) sendResult.get("smslogSql"));
								logger.error("发布询价单短信通知商家成功");
							}
						}
					}
				}
			}
		}catch (Exception e){
			logger.error("短信通知商家时发生异常");
		}
	}

	@RequestMapping("list")
	public String getList(Model model, Pager pager,HttpServletRequest request,String status,String title){
		Map<String, String> formMap = new HashMap<String, String>();
		Buyer buyer = getCurrentMember(request);
		model.addAttribute("buyer", buyer);

		try {
			Criteria criteria = new Criteria();


			if (StringUtils.isNotBlank(status) && !"-1".equals(status)) {
				criteria.add(Restrictions.eq("e.enquiryState", status));
			}
			formMap.put("status", StringUtils.isNotEmpty(status)?status:"-1");

			if (StringUtils.isNotBlank(title)) {
				criteria.add(Restrictions.like("e.title", "%" + title + "%"));
			}else{

				if (StringUtils.isNotBlank(title)) {
					criteria.add(Restrictions.like("e.title", "%" + StringUtil.decode(title) + "%"));
				}
			}

			formMap.put("title", title);
			formMap.put("currtitle", StringUtil.isNotEmpty(title)?StringUtil.encode(title):"");

			String yearS = getParameter(request, "releaseDateTimeS");
			if (StringUtils.isNotBlank(yearS)) {
				criteria.add(Restrictions.ge("e.releaseDateTime", yearS+" 00:00:00 "));//"str_to_date('" +year+" 00:00:00','%Y-%m-%d %H:%i:%s')"));
			}
			formMap.put("releaseDateTimeS", yearS);
			String yearE = getParameter(request, "releaseDateTimeE");

			if (StringUtils.isNotBlank(yearE)) {
				/*
				 * 20151202 董志忠
				 * 需要查询当天时间
				 */
				criteria.add(Restrictions.le("e.releaseDateTime", yearE+" 23:59:59"));//"str_to_date('" +year+" 00:00:00','%Y-%m-%d %H:%i:%s')"));
			}
			formMap.put("releaseDateTimeE", yearE);


			criteria.add(Restrictions.eq("e.buyerId", buyer.getId()));
			criteria.add(Restrictions.eq("e.isDelete", 1));
			if (StringUtils.isNotEmpty(pager.getOrderBy()) && StringUtils.isNotEmpty(pager.getOrderType())) {
				criteria.add(Restrictions.order(pager.getOrderBy(), pager.getOrderType()));
			}
			pager.setPageSize(10);
			pager = this.enquiryService.getPager(getParamMap(), criteria, pager);
			List enquiryList = pager.getList();

			model.addAttribute("enquiryList", enquiryList);
			model.addAttribute("pager", pager);

			//查询条件
			model.addAttribute("formMap", formMap);

			//询价单各状态数量统计
			model.addAttribute("countMap", this.enquiryService.getCount(getParamMap(), buyer.getId()));

			//状态名称Map
			Map<String, String> statusMap = new HashMap<String, String>();
			statusMap.put("1","接受报价中");
			statusMap.put("2","报价已截止");
			statusMap.put("3","已完结");
			statusMap.put("4","询价已撤销");
			model.addAttribute("statusMap", statusMap);
			setPublicDate2Model(model);
			getAllCatelog(model);

			/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
			LoginType loginType = getLoginType(request);
			model.addAttribute("loginType", loginType);
			String operatorRole = getOperatorRole(request);
			if (LoginType.operator.equals(loginType)) {
				model.addAttribute("role", operatorRole);
			}
            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/
		}catch (Exception e){
			logger.error("访问[询价单列表]时，发生异常", e);
			e.printStackTrace();
		}
		if(Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))){
			return Global.TEMPLATE_APP + PATH + "/member/enquiry_list";
		}
		return Global.TEMPLATE_MALL + PATH + "/b2b/enquiry_list";
	}

	/**
	 * 下载产品批量导入模板
	 * @param request
	 * @param response
	 */
	@RequestMapping("exportTemp")
	public void exportTemp(HttpServletRequest request,HttpServletResponse response){

	}

	/**
	 * 批量导入模板
	 * @return
	 */
	@RequestMapping("importTemp")
	@ResponseBody
	public Object importTemp(){
		return null;
	}

	/**
	 * 弹出 我的 供应商
	 * @param enquiryId
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("getBuyersPopup")
	public String getBuyersPopup(String enquiryId,Model model, HttpServletRequest request){
		try {
			String buyerId=getCurrentMember(request).getId();
			if(net.deepdragon.util.StringUtil.isNotEmpty(buyerId)){
				String search_mechantName = request.getParameter("search_mechantName");
				Criteria criterias = new Criteria();
				criterias.add(Restrictions.eq("m.buyerId", buyerId));
				criterias.add(Restrictions.eq("m.tenantId", getTenantId()));
				if(net.deepdragon.util.StringUtil.isNotEmpty(search_mechantName)){
					criterias.add(Restrictions.like("b.name", "%"+search_mechantName+"%"));
					model.addAttribute("search_mechantName", search_mechantName);
				}else{
					search_mechantName = request.getParameter("searchName");
					if(net.deepdragon.util.StringUtil.isNotEmpty(search_mechantName)){
						model.addAttribute("search_mechantName", URLDecoder.decode(search_mechantName, "UTF-8"));
					}
				}
				List merchatList = buyerMerchantService.getList(getParamMap(), criterias);
				model.addAttribute("merchatList", merchatList);

				String merchantNames = request.getParameter("merchantNames");
				String merchantIds = request.getParameter("merchantIds");
				model.addAttribute("merchantIds", merchantIds);
				model.addAttribute("merchantNames", StringUtil.isNotEmpty(merchantNames)? URLDecoder.decode(merchantNames,"utf-8"):"");
				if( StringUtil.isNotEmpty(merchantIds) ){
					List<String> mids = new ArrayList<String>();
					if( merchantIds.contains(",") ){
						for(String mid : merchantIds.split(",")){
							mids.add(mid);
						}
					}else{
						mids.add( merchantIds );
					}
					model.addAttribute("mids", mids);
				}
			}
		} catch (Exception ex) {
			logger.error("访问[我的供应商]时，发生异常", ex);
			ex.printStackTrace();
		}

		model.addAttribute("enquiryId", enquiryId);
		if(Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))){
			return Global.TEMPLATE_APP + PATH + "/member/enquiry_buyer_merchants_popup";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/b2b/enquiry_buyer_merchants_popup";
		}
		//return Global.TEMPLATE_MALL + PATH + "/b2b/enquiry_buyer_merchants_popup";
	}

	//我的供应商查询
	public void getBuyersPopup_app(Model model, HttpServletRequest request){
		try {
			String buyerId=getCurrentMember(request).getId();
			if(net.deepdragon.util.StringUtil.isNotEmpty(buyerId)){
				String search_mechantName = request.getParameter("search_mechantName");
				Criteria criterias = new Criteria();
				criterias.add(Restrictions.eq("m.buyerId", buyerId));
				criterias.add(Restrictions.eq("m.tenantId", getTenantId()));
				if(net.deepdragon.util.StringUtil.isNotEmpty(search_mechantName)){
					criterias.add(Restrictions.like("b.name", "%"+search_mechantName+"%"));
					model.addAttribute("search_mechantName", search_mechantName);
				}else{
					search_mechantName = request.getParameter("searchName");
					if(net.deepdragon.util.StringUtil.isNotEmpty(search_mechantName)){
						model.addAttribute("search_mechantName", URLDecoder.decode(search_mechantName, "UTF-8"));
					}
				}
				List merchatList = buyerMerchantService.getList(getParamMap(), criterias);
				model.addAttribute("merchatList", merchatList);

				String merchantNames = request.getParameter("merchantNames");
				String merchantIds = request.getParameter("merchantIds");
				model.addAttribute("merchantIds", merchantIds);
				model.addAttribute("merchantNames", StringUtil.isNotEmpty(merchantNames)? URLDecoder.decode(merchantNames,"utf-8"):"");
				if( StringUtil.isNotEmpty(merchantIds) ){
					List<String> mids = new ArrayList<String>();
					if( merchantIds.contains(",") ){
						for(String mid : merchantIds.split(",")){
							mids.add(mid);
						}
					}else{
						mids.add( merchantIds );
					}
					model.addAttribute("mids", mids);
				}
			}
		} catch (Exception ex) {
			logger.error("访问[我的供应商]时，发生异常", ex);
			ex.printStackTrace();
		}
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
	public Object del(@PathVariable String id,Model model, HttpServletRequest request){
		Map<String, Object> result = new HashMap<String, Object>();
		String tenantId = getTenantId();
		Buyer buyer = getCurrentMember(request);

		try {
			if (StringUtil.isNotEmpty(id)) {
				Enquiry enquiry = this.enquiryService.get(getParamMap(), id);
				if(enquiry != null){
					String title = enquiry.getTitle();
					enquiry = new Enquiry();
					enquiry.setId(id);
					enquiry.setIsDelete(0);
					enquiry.setModifyUser(buyer.getId());
					enquiry.setModifyDate(new Date());

					this.enquiryService.update(getParamMap(), enquiry);

					//保存日志
					EnquiryLog log = new EnquiryLog();
					log.setIsDelete(1);
					log.setTenantId(tenantId);
					log.setEnquiryId(enquiry.getId());
					log.setContent("删除询价单[" + title + "]");
					log.setCreateUser(buyer.getId());
					log.setCreateDate(new Date());

					this.enquiryLogService.save(getParamMap(), log);
				}else{
					result.put(STATUS, ERROR);
					result.put(MESSAGE, "询价单不存在");
					return result;
				}
			}else{
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "询价单不存在");
				return result;
			}
		}catch (Exception e){
			logger.error("删除询价单", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "删除询价单时，发生异常");
			return result;
		}

		result.put(STATUS, SUCCESS);
		result.put(MESSAGE, "");
		return result;
	}

	/**
	 * 撤销
	 * @param id 询价单ID
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("revoke/{id}/{reason}")
	@ResponseBody
	public Object revoke(@PathVariable String id,@PathVariable String reason,Model model, HttpServletRequest request){
		Map<String, Object> result = new HashMap<String, Object>();
		String tenantId = getTenantId();
		Buyer buyer = getCurrentMember(request);

		try {
			if (StringUtil.isNotEmpty(id)) {
				Enquiry enquiry = this.enquiryService.get(getParamMap(), id);
				if(enquiry != null){
					String title = enquiry.getTitle();
					enquiry = new Enquiry();
					enquiry.setId(id);
					enquiry.setEnquiryState(4);
					enquiry.setModifyUser(buyer.getId());
					enquiry.setModifyDate(new Date());

					//更新状态
					this.enquiryService.update(getParamMap(), enquiry);

					//保存日志
					EnquiryLog log = new EnquiryLog();
					log.setIsDelete(1);
					log.setTenantId(tenantId);
					log.setEnquiryId(enquiry.getId());
					log.setContent("撤销询价单[" + title + "],原因："+ URLDecoder.decode(reason,"utf-8"));
					log.setCreateUser(buyer.getId());
					log.setCreateDate(new Date());

					this.enquiryLogService.save(getParamMap(), log);
				}else{
					result.put(STATUS, ERROR);
					result.put(MESSAGE, "询价单不存在");
					return result;
				}
			}else{
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "询价单不存在");
				return result;
			}
		}catch (Exception e){
			logger.error("撤销询价单", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "撤销询价单时，发生异常");
			return result;
		}

		result.put(STATUS, SUCCESS);
		result.put(MESSAGE, "");
		return result;
	}

	/**
	 * 弹出删除提示框
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("popupDel")
	public String popupDel(String id,Model model, HttpServletRequest request){

		model.addAttribute("id", id);
		return Global.TEMPLATE_MALL + PATH + "/b2b/enquiry_del_popup";
	}

	/**
	 * 弹出撤销提示框
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("popupRevoke")
	public String popupRevoke(String id,Model model, HttpServletRequest request){

		model.addAttribute("id", id);
		return Global.TEMPLATE_MALL + PATH + "/b2b/enquiry_revoke_popup";
	}


	@RequestMapping(value = "/ajax/loadmore", method = {RequestMethod.POST})
	public
	@ResponseBody
	Object loadMore(HttpServletRequest request) {
		String info = "Ajax加载更多的我的订单";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(STATUS, SUCCESS);
		result.put(MESSAGE, "操作成功");
		try {

			Map<String, String> formMap = new HashMap<String, String>();
			Buyer buyer = getCurrentMember(request);
			String status = request.getParameter("status");
			String title =  request.getParameter("title");
			Criteria criteria = new Criteria();


			if (StringUtils.isNotBlank(status) && !"-1".equals(status)) {
				criteria.add(Restrictions.eq("e.enquiryState", status));
			}
			formMap.put("status", StringUtils.isNotEmpty(status)?status:"-1");

			if (StringUtils.isNotBlank(title)) {
				criteria.add(Restrictions.like("e.title", "%" + title + "%"));
			}else{

				if (StringUtils.isNotBlank(title)) {
					criteria.add(Restrictions.like("e.title", "%" + StringUtil.decode(title) + "%"));
				}
			}
			formMap.put("title", title);
			formMap.put("currtitle", StringUtil.isNotEmpty(title)?StringUtil.encode(title):"");
			String yearS = getParameter(request, "releaseDateTimeS");
			if (StringUtils.isNotBlank(yearS)) {
				criteria.add(Restrictions.ge("e.releaseDateTime", yearS+" 00:00:00 "));//"str_to_date('" +year+" 00:00:00','%Y-%m-%d %H:%i:%s')"));
			}
			formMap.put("releaseDateTimeS", yearS);
			String yearE = getParameter(request, "releaseDateTimeE");

			if (StringUtils.isNotBlank(yearE)) {
				/*
				 * 20151202 董志忠
				 * 需要查询当天时间
				 */
				criteria.add(Restrictions.le("e.releaseDateTime", yearE+" 23:59:59"));//"str_to_date('" +year+" 00:00:00','%Y-%m-%d %H:%i:%s')"));
			}
			formMap.put("releaseDateTimeE", yearE);


			criteria.add(Restrictions.eq("e.buyerId", buyer.getId()));
			criteria.add(Restrictions.eq("e.isDelete", 1));

			Pager pager = new Pager();
			pager.setPageSize(10);
			pager.setPageNumber(Integer.valueOf(request.getParameter("pageNumber")));
			pager.setPageSize(Integer.valueOf(request.getParameter("pageSize")));
			if (StringUtils.isNotEmpty(pager.getOrderBy()) && StringUtils.isNotEmpty(pager.getOrderType())) {
				criteria.add(Restrictions.order(pager.getOrderBy(), pager.getOrderType()));
			}

			pager = this.enquiryService.getPager(getParamMap(), criteria, pager);



			List pagerDataList = pager.getList();

			if (pagerDataList != null && pagerDataList.size() > 0) {
				result.put("data", pagerDataList);
				result.put("pager", pager);
			}
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "操作失败");
		}
		return result;
	}

}
