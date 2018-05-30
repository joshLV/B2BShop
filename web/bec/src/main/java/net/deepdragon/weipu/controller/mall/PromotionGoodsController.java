package net.deepdragon.weipu.controller.mall;

import com.alibaba.dubbo.container.page.Page;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.Constant;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.tools.excel.DownloadExcel;
import net.deepdragon.weipu.tools.excel.ExportExcel;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 促销商品信息
 */
@Controller(Global.APP_SIGN + Global.MALL + "PromotionGoodsController")
@RequestMapping(Global.MALL_PATH + "/promotionGoods")
public class PromotionGoodsController extends BaseMallController {

	@Resource
	private GoodsService goodsService;
	@Resource
	private CacheData cacheData;
	@Resource
	private MerchantService shopService;
	@Resource
	private CatelogIndexService catelogIndexService;
	@Resource
	private CatelogService catelogService;
	@Resource
	private GoodsCategoryService categoryService;
	@Resource
	private SystemSetService systemSetService;

	/**
	 * Desc:获取促销信息
	 * @param pager
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "list")
	public String list(Pager pager,Model model,HttpServletRequest request) {
		String info = "获取促销信息";
		setLogInfo(info);
		logger.debug(info);

		try{
			//获取促销商家
			getPromotionMerchant(model,request,pager);

			//获取促销商品
			getPromotionGoods(model,request,pager);

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

		return Global.TEMPLATE_MALL + PATH + "/promotion";

	}


	/**
	 * 20160510 dzz
	 * 查询商品促销信息(返利商品信息)
	 * 1.根据分类查询商品信息, 以及相关组装条件查询商品信息
	 * 备注: 根据分类查询此分类下的所有返利商品
	 * @param pager
	 * @param model
	 * @param request
	 * @param merchantId 			商家ID
	 * @param merchantName 		商家名称
	 * @param goodsShortName 	商品简称
	 * @param goodsCategory		商品分类信息
	 * @param barCode 			商品条码信息
	 * @param viewType 			返回视图类型
	 * @return
	 */
	@RequestMapping(value = "listPromotion")
	public String listPromotion(Pager pager, Model model, HttpServletRequest request, String merchantId, String merchantName, String goodsShortName, String goodsCategory, String barCode, String viewType) {
//		String mid,String mn,String sn, String cl,String bc,String vt
		String info = "促销商品更多返利商品列表信息";
		setLogInfo(info);
		logger.debug(info);

		getAllCatelog(model);
		try {
			if (net.deepdragon.util.StringUtil.isNotEmpty(merchantName)) { //商家名称
				merchantName = URLDecoder.decode(merchantName, "UTF-8");
			}
			if (net.deepdragon.util.StringUtil.isNotEmpty(goodsShortName)) { //商品简称
				goodsShortName = URLDecoder.decode(goodsShortName, "UTF-8");
			}
			if (net.deepdragon.util.StringUtil.isNotEmpty(goodsCategory)) { //商品分类
				goodsCategory = URLDecoder.decode(goodsCategory, "UTF-8");
			}
			if (net.deepdragon.util.StringUtil.isNotEmpty(barCode)) { //商品条码
				barCode = URLDecoder.decode(barCode, "UTF-8");
			}

			pager = getPromotionData(merchantId, merchantName, goodsShortName, goodsCategory, barCode, pager);

			if(net.deepdragon.util.StringUtil.isNotEmpty(merchantId) && net.deepdragon.util.StringUtil.isEmpty(merchantName)){
				Merchant shop = this.shopService.get(getParamMap(), merchantId);
				merchantName = shop == null ? "" : shop.getName();
			}

			model.addAttribute("merchantName", merchantName);
			model.addAttribute("goodsShortName", goodsShortName);
			model.addAttribute("goodsCategory", goodsCategory);
			model.addAttribute("barCode", barCode);
			model.addAttribute("pager", pager);
			model.addAttribute("total", pager.getTotalCount());
			model.addAttribute("imageUrl", systemSetService.find(getParamMap(), "setkey", "imageUrl").getSetvalue());

			List<Goods> goodsList = (List<Goods>)pager.getList();
			if(goodsList != null && goodsList.size() > 0) {
				Map<String,Map<String, List<Map<String, Object>>>> goodsSpList = new HashMap<String,Map<String, List<Map<String, Object>>>>();
				for(int i=0; i<goodsList.size(); i++) {
					goodsSpList.put(goodsList.get(i).getId(), goodsService.getGoodsSpInfo(getParamMap(), goodsList.get(i).getId()));
				}
				model.addAttribute("goodsSpList", goodsSpList);
			}
			model.addAttribute("goodslist", goodsList);

			//价格是否隐藏
			Buyer buyer = getCurrentMember(request);
			if (!net.deepdragon.util.StringUtil.isNotEmpty(buyer)) {
				model.addAttribute("priceHide", "hide");
			}

			//导航信息
			setPublicDate2Model(model);


		} catch(Exception e) {
			logger.error("获取所有促销返利商品时，发生异常", e);
			e.printStackTrace();
		}

		if("list".equals(viewType)){
			return Global.TEMPLATE_MALL + PATH + "/list_hasRebate_detail";
		}
		return Global.TEMPLATE_MALL + PATH + "/list_hasRebate";
	}

	/**
	 * 20160511 dz
	 * 查询所有商家信息
	 * @param merchantId			商家Id
	 * @param merchantName		商家名称
	 * @param goodsShortName		商品简称
	 * @param goodsCategory		商品分类
	 * @param barCode				条码信息
	 * @param pager
	 * @return
	 */
	public Pager getPromotionData(String merchantId, String merchantName, String goodsShortName, String goodsCategory, String barCode, Pager pager) {
		try {
			if( "createDate".equals( pager.getOrderBy() ) ){
				pager.setOrderBy("sales");
				pager.setOrderType("asc");
			}

			Criteria criteria = new Criteria();

			if( StringUtils.isNotEmpty(merchantId) ){ //店铺Id
				criteria.add(Restrictions.eq("o.shopId", merchantId));
			}
			if( StringUtils.isNotEmpty(merchantName) ) { //店铺名称
				criteria.add(Restrictions.like("o.shopName", "%" + merchantName + "%"));
			}
			if( StringUtils.isNotEmpty(goodsShortName) ) { //商品简称
				/*criteria.add(Restrictions.like("o.shortName", "%" + goodsShortName + "%"));
				criteria.add(Restrictions.like("o.name", "%" + goodsShortName + "%"));*/

				criteria.add(Restrictions.or(Restrictions.like("o.shortName", "%" + goodsShortName + "%"), Restrictions.like("o.name", "%" + goodsShortName + "%")));
			}
			if( StringUtils.isNotEmpty(goodsCategory) ) { //商品分类
				criteria.add(Restrictions.like("o.clName", "%" + goodsCategory + "%"));
			}

			//barcode  packageBarCode
			if( StringUtils.isNotEmpty(barCode) ) {
				criteria.add(Restrictions.or(Restrictions.like("o.barcode", "%" + barCode + "%"),Restrictions.like("o.packageBarCode", "%" + barCode + "%")));
			}

			criteria.add(Restrictions.eq("o.tenantId", getTenantId()));	//租户信息
			criteria.add(Restrictions.ge("o.platform", 2));				//广货街B2B平台限制
			criteria.add(Restrictions.ge("o.type", 0));					//过滤众筹
			criteria.add(Restrictions.eq("o.hasRebate", "yes"));			//是否返利 (yes返利 no不返利)
			criteria.add(Restrictions.eq("o.isMarketable", 1));			//过来选择已上架返利商品--商品是否上架(0: 未上架, 1: 已上架)
			criteria.add(Restrictions.eq("o.status", 5));					//选择已审核通过的返利商品

			if (StringUtils.isNotEmpty(pager.getOrderBy())
					&& StringUtils.isNotEmpty(pager.getOrderType())) {
				criteria.add(Restrictions.order("price".equals(pager.getOrderBy()) ? "o.minBatchPrice" : pager.getOrderBy(), pager.getOrderType().toUpperCase()));
			}
			pager.setPageSize(20);

			pager = goodsService.queryListPromotionOfHasRebate(getParamMap(), criteria, pager);



		}catch (Exception e){
			logger.error("获取所有促销返利商品时，发生异常", e);
			e.printStackTrace();
		}

		return pager;
	}

	/**
	 * 20160512 dzz
	 * 获取批发模式商品信息
	 * @param merchantId 			商家ID
	 * @param merchantName 		商家名称
	 * @param goodsShortName 	商品简称
	 * @param goodsCategory 		分类
	 * @param barCode 			条码
	 * @param pager
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "ajaxListPromotion")
	@ResponseBody
	public Map<String, Object> ajaxAllG(String merchantId, String merchantName, String goodsShortName, String goodsCategory, String barCode, Pager pager, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();

		//获取Session中是否有登录信息 没有则加标识 首页商品价格不可见
		Buyer buyer = getCurrentMember(request);
		if(!net.deepdragon.util.StringUtil.isNotEmpty(buyer)){
			result.put("priceHide", "hide");
			result.put(STATUS, SUCCESS);

			return  result;
		}

		try {
			String info = "促销返利商品列表页";
			setLogInfo(info);
			logger.error(info);

			pager = getPromotionData(merchantId, merchantName, goodsShortName, goodsCategory, barCode, pager);

			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "成功");
			result.put("merchantId", merchantId);
			result.put("merchantName", merchantName);
			result.put("goodsShortName", goodsShortName);
			result.put("goodsCategory", goodsCategory);
			result.put("barCode", barCode);
			result.put("pager", pager);
			result.put("total", pager.getTotalCount());

			List<Goods> goodsList = (List<Goods>)pager.getList();
			if(goodsList != null && goodsList.size() > 0) {
				Map<String,Map<String, List<Map<String, Object>>>> goodsSpList = new HashMap<String,Map<String, List<Map<String, Object>>>>();
				for (Goods goods : goodsList) {
					goodsSpList.put(goods.getId(), goodsService.getGoodsSpInfo(getParamMap(), goods.getId()));
				}
				result.put("goodsSpList", goodsSpList);
			}

			result.put("goodslist", goodsList);
		}catch (Exception e){
			logger.error("获取所有促销返利商品时，发生异常", e);
			e.printStackTrace();
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "获取所有促销商品时，发生异常");
		}

		return result;
	}


	/**
	 * Desc:获取促销商家 @param model
	 * @param request
	 * @param pager
	 */
	public void getPromotionMerchant(Model model,HttpServletRequest request,Pager pager){
		String info = "获取促销商家";
		setLogInfo(info);
		logger.debug(info);

		try{
			pager = getData(request,pager,"1","");
			model.addAttribute("promotionMerchantList", pager.getList());
		}catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
		}
	}

	/**
	 * Desc:获取促销商品(按楼层)
	 * @param model
	 * @param request
	 * @param pager
	 */
	public void getPromotionGoods(Model model,HttpServletRequest request,Pager pager){
		String info = "获取促销商品";
		setLogInfo(info);
		logger.debug(info);

		try{
			List<Catelog> indexCatelogList = getIndexCatelogList(request,pager);
			List<Map<String, Object>> typeList = new ArrayList<Map<String, Object>>();
			int i = 0;
			for (Catelog catelog : indexCatelogList) {
				Map<String, Object> data = new HashMap<String, Object>();
				i = i + 1;
//				data.put("floor_right_" + i +"", getNewsAds("floor_right_" + i + "_%", 3));
//				data.put("floor_bottom_" + i + "_1", getNewsAd("floor_bottom_" + i + "_1", 1));
				//商品分类对象
				data.put("catelog", catelog);
				if( catelog != null && StringUtils.isNotEmpty(catelog.getId()) ){
//					data.put("categrandList", getChildrenList(catelog.getId()));
//					data.put("brandchildList", getCategoryBrandList(catelog.getId()));
					//商品分类下的商品
					data.put("goodschildList", getGoodsList(request,pager,catelog));
				}else{
//					data.put("categrandList", null);
//					data.put("brandchildList", null);
					data.put("goodschildList", null);
				}
				typeList.add(data);
			}
			model.addAttribute("typeList", typeList);
		}catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
		}
	}

	/**
	 * Desc:获取楼层信息
	 * @param request
	 * @param pager
	 */
	private List<Catelog> getIndexCatelogList(HttpServletRequest request,Pager pager) {
		String info = "获取楼层信息";
		setLogInfo(info);
		logger.debug(info);

		List<Catelog> indexCatelogList = new ArrayList<Catelog>();

		try {
			pager = getData(request,pager,"3","");

			List<CatelogIndex> catelogIndexList = (List<CatelogIndex>) pager.getList();

			for (CatelogIndex catelogIndex : catelogIndexList) {
				Catelog catelog = catelogService.get(getParamMap(), catelogIndex.getCatelogId());
				indexCatelogList.add(catelog);
			}
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}
		return indexCatelogList;
	}

	/**
	 * Desc:获取楼层商品
	 * @param request
	 * @param pager
	 * @param catelog 商品分类对象
	 */
	private List<Goods> getGoodsList(HttpServletRequest request,Pager pager,Catelog catelog) {
		String info = "获取楼层商品";
		setLogInfo(info);
		logger.debug(info);

		List<Goods> goodsList = null;
		List<Goods> goodsLists = null;
		try {
			GoodsCategory goodsCategory = categoryService.getGategoryByCatelog(getParamMap(), catelog.getId());

			pager = getData(request, pager, "2", goodsCategory.getId());

			goodsList = (List<Goods>) pager.getList();

			if (goodsList != null && goodsList.size() > 0) {
				goodsLists = getGoodsBatchPrice(goodsList);
				return goodsLists;
			}
		} catch (Exception e) {
			logger.error(info+"时,发生异常：", e);
		}
		return goodsList;
	}

	/**
	 * Desc:根据条件查询促销商家与商品
	 * @param pager
	 * @param type 查询类型 1:商家  2:商品 3:商品分类
	 * @param goodsCategoryId 商品分类ID
	 * @return
	 */
	private Pager getData(HttpServletRequest request,Pager pager,String type,String goodsCategoryId) {
		try {
			Criteria criteria = new Criteria();
			//设置页面默认为18条数据
			pager.setPageSize(18);

			if (StringUtil.isNotEmpty(type)) {
				if("1".equals(type)){
					//启用
					criteria.add(Restrictions.eq("status", 3));
                    //促销商品
					criteria.add(Restrictions.eq("hasRebate", "yes"));
					//按修改时间倒序排序
					criteria.add(Restrictions.order("modifyDate", "DESC"));

					pager = shopService.getPager(getParamMap(), criteria, pager);
				}else if("2".equals(type)){
					//商品分类
					criteria.add(Restrictions.like("categoryPath", goodsCategoryId+",%"));
					//商品启用
					criteria.add(Restrictions.eq("isMarketable", 1));
					//审核通过
					criteria.add(Restrictions.eq("status", 5));
					//返利商品
					criteria.add(Restrictions.eq("hasRebate", "yes"));
					//平台类型 B2B
					criteria.add(Restrictions.gt("platform",1));
					//首页显示顺序
					criteria.add(Restrictions.order("indexOrder", "DESC"));

					pager = goodsService.getPager(getParamMap(), criteria, pager);

				}else if("3".equals(type)){
					criteria.add(Restrictions.order("rowno", "asc"));
					criteria.add(Restrictions.eq(Constant.TENANTID_KEY, getTenantId()));
					criteria.add(Restrictions.eq(Constant.PLATFORM_KEY, getPlatform()));

					pager = catelogIndexService.getPager(getParamMap(), criteria,pager);
				}
			}
		}catch (Exception e){
			logger.error("根据条件查询促销商家与商品时，发生异常", e);
			e.printStackTrace();
		}

		return pager;
	}


	/**
	 * Desc:获取商品的阶梯价
	 * Auth:zhangqiang
	 * Time:2015-11-26 11:44:35
	 * @param goodsList
	 * @return
	 */
	private List<Goods> getGoodsBatchPrice(List<Goods> goodsList){
		String info = "查看商品的阶梯价";
		setLogInfo(info);
		logger.debug(info);

		List<Goods> goodsBatchList = new ArrayList<Goods>();
		StringBuffer sb = new StringBuffer();
		try {
			for (int i=0;i<goodsList.size();i++) {
				Goods goods = goodsList.get(i);
				if(net.deepdragon.util.StringUtil.isNotEmpty(goods)){
					List<Map<String, Object>> goodsBatchsList = goodsService.getGoodsBatchPriceList(getParamMap(),"g.id", goods.getId());
					if (goodsBatchsList != null && goodsBatchsList.size() > 0) {
						for(Map<String, Object> map : goodsBatchsList){
							for(String k : map.keySet()){
								if(!"total".equals(k) && !"ypice".equals(k) && !"stock".equals(k)){
									sb.append(map.get(k));
								}
							}
						}
						goods.setBatchPrice(sb.toString());
						sb.setLength(0);
					}
				}
				goodsBatchList.add(goods);
			}
		}catch (Exception ex) {
			logger.error("查看商品的阶梯价时，发生异常。", ex);
			ex.printStackTrace();
		}
		return goodsBatchList;
	}


}
