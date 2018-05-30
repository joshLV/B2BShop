package net.deepdragon.weipu.controller.mall;

import com.alibaba.fastjson.JSON;
import com.google.common.reflect.TypeToken;
import com.unionpay.acp.sdk.HttpClient;
import com.unionpay.acp.sdk.SDKUtil;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.SystemSet;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.Constant;
import net.deepdragon.util.MyBeanUtils;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.tools.mail.KeywordsLogThread;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.util.*;

/**
 * 搜索相关页面
 */
@Controller(Global.APP_SIGN + Global.MALL + "SearchController")
@RequestMapping(Global.MALL_PATH + "/search")
public class SearchController extends BaseMallController {
	@Resource
    private OrderService orderService;
    @Resource
    private OrderItemService orderItemService;
    @Resource
    private OrderLogService orderLogService;
    @Resource
	private MenuService menuService;
    @Resource
	private CacheData cacheData;
    @Resource
    private MemberRankService memberRankService;
    @Resource
    private GoodsImagesService goodsImagesService;
    @Resource
    private GoodsService goodsService;
    @Resource
	private AdvertisingImageService advertisingImageService;
    @Resource
    private GoodsCartypeService goodsCartypeService;
    @Resource
    private SystemSetService systemSetService;


    @RequestMapping(value = "s/{keyword}")
    public String search(@PathVariable String keyword, Pager pager, Model model,HttpServletRequest request,String orderBy,String order,String pageNumber) {
        String info = "全站搜索";
        setLogInfo(info);
        logger.debug(info);
        getAllCatelog(model);
        try {
            model.addAttribute("keywordASCII", keyword);

            if( StringUtil.isNotEmpty(keyword) ){
                keyword = URLDecoder.decode(keyword, "UTF-8").replaceAll("址达司点号", ".").replaceAll("址达司杠","/").replaceAll("址达司加号","+");
            }

            pager.setPageNumber( StringUtil.isNotEmpty(pageNumber)?Integer.parseInt(pageNumber):1 );
            orderBy =  StringUtil.isNotEmpty(orderBy)?orderBy:"sales";
            pager.setOrderBy( orderBy );
            order =  StringUtil.isNotEmpty(order)?order:"asc";
            pager.setOrderType( order );
            pager = getSearchPager(keyword, pager);

            if( pager.getList() != null && pager.getList().size() > 0 ){
                Criteria criteria1 = new Criteria();
                for(Map<String, Object> goods : (List<Map<String, Object>>)pager.getList()){
                    criteria1 = new Criteria();
                    criteria1.add(Restrictions.eq("goodsId", goods.get("id")));
                    criteria1.add(Restrictions.order("createDate", "desc"));
                    List<GoodsImages> goodsImages = this.goodsImagesService.getList(getParamMap(), criteria1);
                    if( goodsImages != null && goodsImages.size() > 0 ){
                        goods.put("pic", goodsImages.get(0).getPic() );
                    }
                }
            }

            model.addAttribute("pager", pager);
            model.addAttribute("totalResult", pager.getTotalCount());
            model.addAttribute("totalPage", pager.getPageCount());
            model.addAttribute("pageNumber", pager.getPageNumber());
            model.addAttribute("orderBy", orderBy);
            model.addAttribute("order", order);

            model.addAttribute("imageUrl",systemSetService.find(getParamMap(), "setkey", "imageUrl").getSetvalue());
            model.addAttribute("list", pager.getList());
            model.addAttribute("keyword", keyword);
            List<AdvertisingImage> advertisingImages = advertisingImageService.getNewAds(getParamMap(), "%_01%", 4);
            model.addAttribute("advertisingImages", advertisingImages);
        } catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }



        List<Goods> hotsList = null;
        try {
            /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
            hotsList = goodsService.getTagGoods4Index(getParamMap(), "hot", 6, getWhichPlat());
            /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
        } catch (Exception e) {
            logger.error("IndexController中getData4IndexTagGoods方法，发生异常：", e);
        }
        model.addAttribute("hotsList", hotsList);

        setPublicDate2Model(model);

        /**
         * Desc:获取Session中是否有登录信息 没有则加标识 首页商品价格不可见
         * Auth:zhangqiang
         * Time:2015-11-27 16:44:25
         */
        Buyer buyer = getCurrentMember(request);
        if(!net.deepdragon.util.StringUtil.isNotEmpty(buyer)){
            model.addAttribute("priceHide", "hide");
        }
        //------------------------------------------------------End-------------

        /**** 保存搜索关键字  TianYu  2016-1-5 16:32:45 Start  ***/
        Buyer member = getCurrentMember(request);
        KeywordsLogThread keywordsLogThread = new KeywordsLogThread(keyword , member==null?"casualUser":member.getUserName(), getParamMap());
        keywordsLogThread.start();
        /**** 保存搜索关键字  TianYu  2016-1-5 16:32:45 End  ***/

        String strUrl = "/search_result";
        String listStyle = request.getParameter("listStyle");
        //listStyle: detailList 详情列表页面
        if ("detailList".equals(listStyle)) {
            strUrl = "/search_result_detail";
            model.addAttribute("listStyle","detailList");
        }
        String whichclient=request.getParameter("whichclient");
        if(whichclient!=null && whichclient.contains(Global.WHICH_APP)){
            return Global.TEMPLATE_APP + PATH + strUrl;
        }else{
          return Global.TEMPLATE_MALL + PATH + strUrl;
        }

    }

	/*@RequestMapping(value = "s/{keyword}")
	public String search(@PathVariable String keyword, Pager pager, Model model,HttpServletRequest request,String orderBy,String order,String pageNumber) {
        String info = "全站搜索";
        setLogInfo(info);
        logger.debug(info);
        Map<String,Object> resData = new HashMap<String,Object>();
        Map<String, String> data = new HashMap<String, String>();
        List<Goods> list = new ArrayList<Goods>();
        String urlStr = "search/searchGoods_BEC.sh";
        int totalGoods = 0;
        int totalPage = 0;
        getAllCatelog(model);
        try {
            if( StringUtil.isNotEmpty(keyword) ){
                keyword = URLDecoder.decode(keyword, "UTF-8").replaceAll("址达司点号", ".").replaceAll("址达司杠","/");
            }

            SystemSet systemSet = systemSetService.find(getParamMap(),"setKey","mcmUrl");
            if(systemSet!=null){
                if (StringUtil.isNotEmpty(systemSet.getSetvalue())) {
                    urlStr = systemSet.getSetvalue() +urlStr;
                //    urlStr = "http://127.0.0.1:8082/mcm/" +urlStr;
                    data.put("keyWords",keyword);
                    if (StringUtils.isNotEmpty(pageNumber)) {
                        data.put("currentPage",pageNumber);
                    }else{
                        data.put("currentPage","1");
                    }
                    data.put("showCount","20");
                    if (StringUtils.isNotEmpty(orderBy)) {
                        if("createDate".equals(orderBy)){
                            data.put("orderColumn", "");
                        }else{
                            data.put("orderColumn", orderBy);
                        }

                    }
                    if (StringUtils.isNotEmpty(order)) {
                        data.put("order",order);
                    }else{
                        data.put("order","asc");
                    }

                    resData = searchTools(urlStr,data);
                    if (resData != null && resData.size()>0) {
                        if (StringUtil.isNotEmpty(resData.get("goodsList"))) {
                            JSONArray jsonArray = JSONArray.fromObject(resData.get("goodsList"));
                            List<Map<String, Object>> listJson = JSON.parseObject(JSON.toJSONString(jsonArray), List.class);

                            for(Map<String, Object> map : listJson ){
                                Goods goods = new Goods();
                                MyBeanUtils.copyMap2Bean(goods,map);
                                list.add(goods);
                            }
                        }

                        if (StringUtil.isNotEmpty(resData.get("page"))) {
                            Map<String,Object> map = (Map<String,Object>)resData.get("page");
                            if (StringUtil.isNotEmpty(map.get("totalResult"))) {
                                model.addAttribute("totalResult", map.get("totalResult"));
                                totalGoods = Integer.parseInt(map.get("totalResult")+"");
                            }
                            if (StringUtil.isNotEmpty(map.get("totalPage"))) {
                                model.addAttribute("totalPage", map.get("totalPage"));
                                totalPage = Integer.parseInt(map.get("totalPage")+"");
                            }
                            if (StringUtil.isNotEmpty(map.get("currentPage"))) {
                                model.addAttribute("pageNumber", map.get("currentPage"));
                            }else{
                                model.addAttribute("pageNumber", "1");
                            }
                            if (StringUtil.isNotEmpty(map.get("orderColumn"))) {
                                model.addAttribute("orderBy", map.get("orderColumn"));
                            }
                            if (StringUtil.isNotEmpty(map.get("order"))) {
                                model.addAttribute("order", map.get("order"));
                            }else{
                                model.addAttribute("order", "asc");
                            }
                        }
                    }else{
                        model.addAttribute("pageNumber", "1");
                    }
                }
            }

            //获取Session中是否有登录信息 没有则加标识 首页商品价格不可见
            Buyer buyer = getCurrentMember(request);
            if(!net.deepdragon.util.StringUtil.isNotEmpty(buyer)){
                model.addAttribute("priceHide", "hide");
            }
            pager.setTotalCount(totalGoods);
            pager.setPageSize(20);

            pager.setPageCount(totalPage);

//            pager.setList(list);
//        	model.addAttribute("pager", pager);
//        	model.addAttribute("total", pager.getTotalCount());
        	model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
        	List<AdvertisingImage> advertisingImages = advertisingImageService
					.getNewAds(getParamMap(), "%_01%", 4);
			model.addAttribute("advertisingImages", advertisingImages);
		} catch (Exception ex) {
			logger.error("访问" + info + "时，发生异常", ex);
			ex.printStackTrace();
		}

        model.addAttribute("keyword", keyword);

        List<Goods> hotsList = null;
        try {
            *//**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **//*
            hotsList = goodsService.getTagGoods4Index(getParamMap(), "hot", 6, getWhichPlat());
            *//**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **//*
        } catch (Exception e) {
            logger.error("IndexController中getData4IndexTagGoods方法，发生异常：", e);
        }
        model.addAttribute("hotsList", hotsList);

        model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
        model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
        model.addAttribute("services", cacheData.getServices(getParamMap()));

        *//**
         * Desc:获取Session中是否有登录信息 没有则加标识 首页商品价格不可见
         * Auth:zhangqiang
         * Time:2015-11-27 16:44:25
         *//*
        Buyer buyer = getCurrentMember(request);
        if(!net.deepdragon.util.StringUtil.isNotEmpty(buyer)){
            model.addAttribute("priceHide", "hide");
        }
        //------------------------------------------------------End-------------

        *//**
         * Desc:获取商品的阶梯价
         * Auth:zhangqiang
         * Time:2015-11-27 16:45:35
         *//*
        if (list != null && list.size() > 0) {
            List<Goods> lists = getGoodsBatchPrice(model,request, list, true);
            pager.setList(lists);
            model.addAttribute("list",lists);
        }else {
            model.addAttribute("list", null);
        }
        model.addAttribute("pager", pager);
        //------------------------------------------------------End-------------

        *//**** 保存搜索关键字  TianYu  2016-1-5 16:32:45 Start  ***//*
        Buyer member = getCurrentMember(request);
        KeywordsLogThread keywordsLogThread = new KeywordsLogThread(keyword , member==null?"casualUser":member.getUserName(), getParamMap());
        keywordsLogThread.run();
        *//**** 保存搜索关键字  TianYu  2016-1-5 16:32:45 End  ***//*

        String strUrl = "/search_result";
        String listStyle = request.getParameter("listStyle");
        //listStyle: detailList 详情列表页面
        if ("detailList".equals(listStyle)) {
            strUrl = "/search_result_detail";
            model.addAttribute("listStyle","detailList");
        }

//        return Global.TEMPLATE_MALL + PATH + "/search_result";
        return Global.TEMPLATE_MALL + PATH + strUrl;
    }*/


    @RequestMapping(value = "detaillist/{keyword}")
    public String search(@PathVariable String keyword,Model model,String orderBy,String order,HttpServletRequest request) {
        String info = "全站搜索-批发模式";
        setLogInfo(info);
        logger.debug(info);
        getAllCatelog(model);
        model.addAttribute("keywordASCII", keyword);
        try {
            if (StringUtil.isNotEmpty(keyword)) {
                keyword = URLDecoder.decode(keyword, "UTF-8").replaceAll("址达司点号", ".").replaceAll("址达司杠", "/");
            }
        }catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }
        model.addAttribute("listStyle","detailList");
        setPublicDate2Model(model);
        model.addAttribute("keyword", keyword);
        orderBy = StringUtil.isNotEmpty(orderBy)?orderBy:"sales";
        model.addAttribute("orderBy", orderBy);
        order = StringUtil.isNotEmpty(order)?order:"desc";
        model.addAttribute("order", order);
        model.addAttribute("pageNumber",1);

        Pager pager = new Pager();
        pager.setOrderBy( orderBy );
        pager.setOrderType( order );
        model.addAttribute("pager",pager);

        //获取Session中是否有登录信息 没有则加标识 首页商品价格不可见
        Buyer buyer = getCurrentMember(request);
        if(!net.deepdragon.util.StringUtil.isNotEmpty(buyer)){
            model.addAttribute("priceHide", "hide");
        }
        return Global.TEMPLATE_MALL + PATH + "/search_result_detail";
    }

    /**
     * Ajax获取搜索结果
     * @param keyword
     * @param pager
     * @param request
     * @param orderBy
     * @param order
     * @param pageNumber
     * @return
     */
    @RequestMapping(value = "getSearchResult/{keyword}")
    @ResponseBody
    public Object getSearchResult(@PathVariable String keyword, Pager pager, HttpServletRequest request,String orderBy,String order,String pageNumber){
        Map<String, Object> result = new HashMap<String, Object>();
        String info = "搜索结果列表";
        setLogInfo(info);
        logger.debug(info);

        //获取Session中是否有登录信息 没有则加标识 首页商品价格不可见
        Buyer buyer = getCurrentMember(request);
        if(!net.deepdragon.util.StringUtil.isNotEmpty(buyer)){
            result.put("priceHide", "hide");
        }

        try{
            if( StringUtil.isNotEmpty(keyword) ){
                keyword = URLDecoder.decode(keyword, "UTF-8").replaceAll("址达司点号", ".").replaceAll("址达司杠","/");
            }
            pager.setPageNumber( StringUtil.isNotEmpty(pageNumber)?Integer.parseInt(pageNumber):1 );
            pager.setOrderBy( StringUtil.isNotEmpty(orderBy)?orderBy:"sales" );
            pager.setOrderType( StringUtil.isNotEmpty(order)?order:"desc" );

            pager = getSearchPager(keyword, pager);
            if( pager.getList() != null && pager.getList().size() > 0 ){
                Criteria criteria1 = new Criteria();
                for(Map<String, Object> goods : (List<Map<String, Object>>)pager.getList()){
                    criteria1 = new Criteria();
                    criteria1.add(Restrictions.eq("goodsId", goods.get("id")));
                    criteria1.add(Restrictions.order("createDate", "desc"));
                    List<GoodsImages> goodsImages = this.goodsImagesService.getList(getParamMap(), criteria1);
                    if( goodsImages != null && goodsImages.size() > 0 ){
                        goods.put("pic", goodsImages.get(0).getPic() );
                    }
                }
            }

            result.put("totalResult", pager.getTotalCount());

            List<Map<String,Object>> list = (List<Map<String,Object>>)pager.getList();
            pager.setList(null);
            result.put("pager", pager);

            if(list != null && list.size() > 0) {
                Map<String,Map<String, List<Map<String, Object>>>> goodsSpList = new HashMap<String,Map<String, List<Map<String, Object>>>>();
                for (Map<String,Object> goods : list) {
                    goodsSpList.put(goods.get("id")+"", goodsService.getGoodsSpInfo(getParamMap(), goods.get("id")+""));
                }
                result.put("goodsSpList", goodsSpList);
            }

            result.put("list", list);

            result.put(STATUS, SUCCESS);
        }catch (Exception e){
            logger.error("获取所有商品时，发生异常", e);
            e.printStackTrace();
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "获取所有商品时，发生异常");
        }
        result.put("keyword", keyword);

        /**** 保存搜索关键字  TianYu  2016-1-5 16:32:45 Start  ***/
        Buyer member = getCurrentMember(request);
        KeywordsLogThread keywordsLogThread = new KeywordsLogThread(keyword , member==null?"casualUser":member.getUserName(), getParamMap());
        keywordsLogThread.start();
        /**** 保存搜索关键字  TianYu  2016-1-5 16:32:45 End  ***/
        return result;
    }

    /**
     * Ajax获取搜索结果
     * @param keyword
     * @param pager
     * @param request
     * @param orderBy
     * @param order
     * @param pageNumber
     * @return
     *//*
    @RequestMapping(value = "getSearchResult/{keyword}")
    @ResponseBody
    public Object getSearchResult(@PathVariable String keyword, Pager pager, HttpServletRequest request,String orderBy,String order,String pageNumber){
        Map<String, Object> result = new HashMap<String, Object>();
        String info = "搜索结果列表";
        setLogInfo(info);
        logger.debug(info);
        Map<String,Object> resData = new HashMap<String,Object>();
        Map<String, String> data = new HashMap<String, String>();
        List<Goods> list = new ArrayList<Goods>();
        String urlStr = "search/searchGoods_BEC.sh";
        int totalGoods = 0;
        int totalPage = 0;


        //获取Session中是否有登录信息 没有则加标识 首页商品价格不可见
        Buyer buyer = getCurrentMember(request);
        if(!net.deepdragon.util.StringUtil.isNotEmpty(buyer)){
            result.put("priceHide", "hide");
            result.put(STATUS, SUCCESS);

            return  result;
        }

        try{
            if( StringUtil.isNotEmpty(keyword) ){
                keyword = URLDecoder.decode(keyword, "UTF-8").replaceAll("址达司点号", ".").replaceAll("址达司杠","/");
            }
            SystemSet systemSet = systemSetService.find(getParamMap(),"setKey","mcmUrl");
            if(systemSet!=null){
                if (StringUtil.isNotEmpty(systemSet.getSetvalue())) {
                    urlStr = systemSet.getSetvalue() +urlStr;
                    //    urlStr = "http://127.0.0.1:8082/mcm/" +urlStr;
                    data.put("keyWords",keyword);
                    if (StringUtils.isNotEmpty(pageNumber)) {
                        data.put("currentPage",pageNumber);
                    }else{
                        data.put("currentPage","1");
                    }
                    data.put("showCount","10");
                    if (StringUtils.isNotEmpty(orderBy)) {
                        if("createDate".equals(orderBy)){
                            data.put("orderColumn", "");
                        }else{
                            data.put("orderColumn", orderBy);
                        }

                    }
                    if (StringUtils.isNotEmpty(order)) {
                        data.put("order",order);
                    }else{
                        data.put("order","asc");
                    }

                    resData = searchTools(urlStr,data);
                    if (resData != null && resData.size()>0) {
                        if (StringUtil.isNotEmpty(resData.get("goodsList"))) {
                            JSONArray jsonArray = JSONArray.fromObject(resData.get("goodsList"));
                            List<Map<String, Object>> listJson = JSON.parseObject(JSON.toJSONString(jsonArray), List.class);

                            for(Map<String, Object> map : listJson ){
                                Goods goods = new Goods();
                                MyBeanUtils.copyMap2Bean(goods,map);
                                list.add(goods);
                            }
                        }
                        if (StringUtil.isNotEmpty(resData.get("page"))) {
                            Map<String,Object> map = (Map<String,Object>)resData.get("page");
                            if (StringUtil.isNotEmpty(map.get("totalResult"))) {
                                result.put("totalResult", map.get("totalResult"));
                                totalGoods = Integer.parseInt(map.get("totalResult")+"");
                            }
                            if (StringUtil.isNotEmpty(map.get("totalPage"))) {
                                result.put("totalPage", map.get("totalPage"));
                                totalPage = Integer.parseInt(map.get("totalPage")+"");   ;
                            }
                            if (StringUtil.isNotEmpty(map.get("currentPage"))) {
                                result.put("pageNumber", map.get("currentPage"));
                            }else{
                                result.put("pageNumber", "1");
                            }
                            if (StringUtil.isNotEmpty(map.get("orderColumn"))) {
                                result.put("orderBy", map.get("orderColumn"));
                            }
                            if (StringUtil.isNotEmpty(map.get("order"))) {
                                result.put("order", map.get("order"));
                            }else{
                                result.put("order", "asc");
                            }
                        }
                    }else{
                        result.put("pageNumber", "1");
                    }
                }
            }

            pager.setTotalCount(totalGoods);
            pager.setPageSize(10);
            result.put(STATUS, SUCCESS);
        }catch (Exception e){
            logger.error("获取所有商品时，发生异常", e);
            e.printStackTrace();
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "获取所有商品时，发生异常");
        }
        result.put("keyword", keyword);
        *//**
         * Desc:获取商品的阶梯价
         * Auth:zhangqiang
         * Time:2015-11-27 16:45:35
         *//*
        if (list != null && list.size() > 0) {
            List<Goods> lists = getGoodsBatchPrice(result,request, list);
            pager.setList(lists);
            result.put("list",lists);
        }else {
            result.put("list", null);
        }
        result.put("pager", pager);
        //------------------------------------------------------End-------------
        *//**** 保存搜索关键字  TianYu  2016-1-5 16:32:45 Start  ***//*
        Buyer member = getCurrentMember(request);
        KeywordsLogThread keywordsLogThread = new KeywordsLogThread(keyword , member==null?"casualUser":member.getUserName(), getParamMap());
        keywordsLogThread.run();
        *//**** 保存搜索关键字  TianYu  2016-1-5 16:32:45 End  ***//*
        return result;
    }*/
    /**
     * Desc:获取商品的阶梯价
     * Auth:zhangqiang
     * Time:2015-11-26 11:44:35
     * @param goodsList
     * @return
     */
    private List<Goods> getGoodsBatchPrice(Model model,HttpServletRequest request,List<Goods> goodsList, boolean reloadGoods){
        String info = "查看商品的阶梯价";
        setLogInfo(info);
        logger.debug(info);
        List<Goods> goodsBatchList = new ArrayList<Goods>();
        StringBuffer sb = new StringBuffer();
        Map<String,Map<String, List<Map<String, Object>>>> goodsSpList = new HashMap<String,Map<String, List<Map<String, Object>>>>();

        /**
         * Desc:列表页面搜索内容 Auth:zhangqiang Time:2016-01-30 17:28:35 Start
         */
        Criteria criteria = new Criteria();
        String goodsShortName = request.getParameter("goodsShortName");
        if(StringUtil.isNotEmpty(goodsShortName)){
            criteria.add(Restrictions.like("shortName", "%"+goodsShortName+"%"));
        }

        String shopName = request.getParameter("shopName");
        if(StringUtil.isNotEmpty(shopName)){
            criteria.add(Restrictions.like("shopName", "%"+shopName+"%"));
        }
        criteria.add(Restrictions.eq("isDelete", 1));
        criteria.add(Restrictions.eq("STATUS", 5));
        criteria.add(Restrictions.eq("isMarketable", 1));
        /**
         * Desc:列表页面搜索内容 Auth:zhangqiang Time:2016-01-30 17:28:35 End
         */
        try {
            for (int i=0;i<goodsList.size();i++) {
//                Goods goods = goodsList.get(i);
                Goods goods = goodsList.get(i);
                if(reloadGoods && StringUtil.isNotEmpty(goods.getId())){
                    goods = goodsService.findConditionGoods(getParamMap(),criteria,goodsList.get(i).getId());
                }
                if(goods != null){
                    List<Map<String, Object>> goodsBatchsList = goodsService.getGoodsBatchPriceList(getParamMap(),"g.id", goods.getId());
                    if (goodsBatchsList != null && goodsBatchsList.size() > 0) {
                        for(Map<String, Object> map : goodsBatchsList){
                            for(String k : map.keySet()){
                                if(!"total".equals(k) && !"ypice".equals(k) && !"stock".equals(k)){
                                    sb.append(map.get(k));
                                }
                            }

                            if(StringUtil.isNotEmpty(map.get("total"))){
                                goods.setTotal(map.get("total").toString());
                            }

                            if(StringUtil.isNotEmpty(map.get("ypice"))){
                                goods.setYpice(map.get("ypice").toString());
                            }

                            if(StringUtil.isNotEmpty(map.get("stock"))){
                                goods.setStock(Double.parseDouble(map.get("stock").toString()));
                            }
                        }
                        goods.setBatchPrice(sb.toString());
                        sb.setLength(0);
                    }
                    //存放商品规格
                    goodsSpList.put(goods.getId(), goodsService.getGoodsSpInfo(getParamMap(), goods.getId()));
                }
                goodsBatchList.add(goods);

            }
            model.addAttribute("goodsSpList", goodsSpList);
        }catch (Exception ex) {
            logger.error("查看商品的阶梯价时，发生异常。", ex);
            ex.printStackTrace();
        }
        return goodsBatchList;
    }

    /**
     * Desc:获取商品的阶梯价
     * Auth:zhangqiang
     * Time:2015-11-26 11:44:35
     * @param goodsList
     * @return
     */
    private List<Goods> getGoodsBatchPrice(Map<String,Object> result,HttpServletRequest request,List<Goods> goodsList){
        String info = "查看商品的阶梯价";
        setLogInfo(info);
        logger.debug(info);
        List<Goods> goodsBatchList = new ArrayList<Goods>();
        StringBuffer sb = new StringBuffer();
        Map<String,Map<String, List<Map<String, Object>>>> goodsSpList = new HashMap<String,Map<String, List<Map<String, Object>>>>();

        /**
         * Desc:列表页面搜索内容 Auth:zhangqiang Time:2016-01-30 17:28:35 Start
         */
        Criteria criteria = new Criteria();
        String goodsShortName = request.getParameter("goodsShortName");
        if(StringUtil.isNotEmpty(goodsShortName)){
            criteria.add(Restrictions.like("shortName", "%"+goodsShortName+"%"));
        }

        String shopName = request.getParameter("shopName");
        if(StringUtil.isNotEmpty(shopName)){
            criteria.add(Restrictions.like("shopName", "%"+shopName+"%"));
        }
        criteria.add(Restrictions.eq("isDelete", 1));
        criteria.add(Restrictions.eq("STATUS", 5));
        criteria.add(Restrictions.eq("isMarketable", 1));
        /**
         * Desc:列表页面搜索内容 Auth:zhangqiang Time:2016-01-30 17:28:35 End
         */
        try {
            for (int i=0;i<goodsList.size();i++) {
//                Goods goods = goodsList.get(i);
                Goods goods = null;
                if(StringUtil.isNotEmpty(goodsList.get(i).getId())){
                    goods = goodsService.findConditionGoods(getParamMap(),criteria,goodsList.get(i).getId());
                }
                if(net.deepdragon.util.StringUtil.isNotEmpty(goods)){
                    List<Map<String, Object>> goodsBatchsList = goodsService.getGoodsBatchPriceList(getParamMap(),"g.id", goods.getId());
                    if (goodsBatchsList != null && goodsBatchsList.size() > 0) {
                        for(Map<String, Object> map : goodsBatchsList){
                            for(String k : map.keySet()){
                                if(!"total".equals(k) && !"ypice".equals(k) && !"stock".equals(k)){
                                    sb.append(map.get(k));
                                }
                            }

                            if(StringUtil.isNotEmpty(map.get("total"))){
                                goods.setTotal(map.get("total").toString());
                            }

                            if(StringUtil.isNotEmpty(map.get("ypice"))){
                                goods.setYpice(map.get("ypice").toString());
                            }

                            if(StringUtil.isNotEmpty(map.get("stock"))){
                                goods.setStock(Double.parseDouble(map.get("stock").toString()));
                            }
                        }
                        goods.setBatchPrice(sb.toString());
                        sb.setLength(0);
                    }
                    //存放商品规格
                    goodsSpList.put(goods.getId(), goodsService.getGoodsSpInfo(getParamMap(), goods.getId()));
                    goodsBatchList.add(goods);
                }

            }
            result.put("goodsSpList", goodsSpList);
        }catch (Exception ex) {
            logger.error("查看商品的阶梯价时，发生异常。", ex);
            ex.printStackTrace();
        }
        return goodsBatchList;
    }



    @RequestMapping("sa")
    public String searchSa(Pager pager, Model model,HttpServletRequest request) {
        String keyword=urlDecoder(request.getParameter("keyword"));
        String info = "全站搜索";
        setLogInfo(info);
        logger.debug(info);
        try {
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.like("name", "%" + keyword + "%"));
            criteria.add(Restrictions.eq("isMarketable", "1"));
            criteria.add(Restrictions.eq("status", 5));
            /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
            criteria.add(Restrictions.gt("platform",1));
            criteria.add(Restrictions.eq("type",0));//2016-05-17 liuxiaobing bug:0003592: 建议在首页搜索时和商家店铺页面屏蔽掉众筹商品

            /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
            pager.setPageSize(20);
            if (StringUtils.isNotEmpty(pager.getOrderBy())
                    && StringUtils.isNotEmpty(pager.getOrderType())) {
                criteria.add(Restrictions.order(pager.getOrderBy(), pager
                        .getOrderType().toUpperCase()));
            }
            pager.setPageSize(4);
            pager= goodsService.getPager(getParamMap(), criteria, pager);

            List list = pager.getList();
            //添加商品阶梯价
            if (list != null && list.size() > 0) {
                List<Goods> lists = getGoodsBatchPrice(model,request, list, false);
                pager.setList(lists);
                model.addAttribute("list",lists);
            }else {
                model.addAttribute("list", null);
            }
//            model.addAttribute("list", pager.getList());
            model.addAttribute("goodslist", pager.getList());
            model.addAttribute("pager", pager);
            model.addAttribute("total", pager.getTotalCount());
            model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
            model.addAttribute("key",keyword);
            List<AdvertisingImage> advertisingImages = advertisingImageService.getNewAds(getParamMap(), "%_01%", 4);
            model.addAttribute("advertisingImages", advertisingImages);
            //获取Session中是否有登录信息 没有则加标识 首页商品价格不可见
            Buyer buyer = getCurrentMember(request);
            if(!net.deepdragon.util.StringUtil.isNotEmpty(buyer)){
                model.addAttribute("priceHide", "hide");
            }
        } catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }

        model.addAttribute("keyword", keyword);

        List<Goods> hotsList = null;
        try {
            /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
            hotsList = goodsService.getTagGoods4Index(getParamMap(), "hot", 6, getWhichPlat());
            /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
        } catch (Exception e) {
            logger.error("IndexController中getData4IndexTagGoods方法，发生异常：", e);
        }
        model.addAttribute("hotsList", hotsList);

        model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
        model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
        model.addAttribute("services", cacheData.getServices(getParamMap()));

        return Global.TEMPLATE_APP + PATH + "/search_result";
    }


    /**
     * app端加载数据方法
     * @param catelogPath
     * @param model
     * @param pager
     * @param request
     */
    @RequestMapping(value = "/getPageDateForJson",  method = { RequestMethod.POST })
    public  @ResponseBody
    Object getPageDateForJson(String catelogPath, Model model, Pager pager,HttpServletRequest request) {
        String keyword = request.getParameter("key");
        String orderBy=request.getParameter("orderBy");
        String info = "全站搜索";
        setLogInfo(info);
        logger.debug(info);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(STATUS, SUCCESS);
        result.put(MESSAGE, "操作成功");
        try {
            getAllCatelog(model);
            try {
                model.addAttribute("keywordASCII", keyword);

                if( StringUtil.isNotEmpty(keyword) ){
                    keyword = URLDecoder.decode(keyword, "UTF-8").replaceAll("址达司点号", ".").replaceAll("址达司杠","/").replaceAll("址达司加号","+");
                }
                pager.setPageNumber( StringUtil.isNotEmpty(pager.getPageNumber())?Integer.parseInt(pager.getPageNumber()+""):1 );
                pager.setOrderBy( StringUtil.isNotEmpty(pager.getOrderBy())?pager.getOrderBy():"sales" );
                //pager.setOrderType( StringUtil.isNotEmpty(orderBy)?orderBy:"desc" );
                pager = getSearchPager(keyword, pager);
                if( pager.getList() != null && pager.getList().size() > 0 ){
                    Criteria criteria1 = new Criteria();
                    for(Map<String, Object> goods : (List<Map<String, Object>>)pager.getList()){
                        criteria1 = new Criteria();
                        criteria1.add(Restrictions.eq("goodsId", goods.get("id")));
                        criteria1.add(Restrictions.order("createDate", "desc"));
                        List<GoodsImages> goodsImages = this.goodsImagesService.getList(getParamMap(), criteria1);
                        if( goodsImages != null && goodsImages.size() > 0 ){
                            goods.put("pic", goodsImages.get(0).getPic() );
                        }
                    }
                }
            } catch (Exception ex) {
                logger.error("访问" + info + "时，发生异常", ex);
                ex.printStackTrace();
            }



            List<Goods> hotsList = null;
            try {
                /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
                hotsList = goodsService.getTagGoods4Index(getParamMap(), "hot", 6, getWhichPlat());
                /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
            } catch (Exception e) {
                logger.error("IndexController中getData4IndexTagGoods方法，发生异常：", e);
            }

            /**
             * Desc:获取Session中是否有登录信息 没有则加标识 首页商品价格不可见
             * Auth:zhangqiang
             * Time:2015-11-27 16:44:25
             */
            Buyer buyer = getCurrentMember(request);
            if(!net.deepdragon.util.StringUtil.isNotEmpty(buyer)){
                model.addAttribute("priceHide", "hide");
            }
            //------------------------------------------------------End-------------

            /**** 保存搜索关键字  TianYu  2016-1-5 16:32:45 Start  ***/
            Buyer member = getCurrentMember(request);
            KeywordsLogThread keywordsLogThread = new KeywordsLogThread(keyword , member==null?"casualUser":member.getUserName(), getParamMap());
            keywordsLogThread.start();
            /**** 保存搜索关键字  TianYu  2016-1-5 16:32:45 End  ***/
            result.put(DATA, pager.getList());
            result.put("pager", pager);
        } catch (Exception e) {
            logger.error("获取3级分类页面数据时发生异常", e);
            e.printStackTrace();
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "操作失败");
        }
        return result;
    }



    @RequestMapping(value = "cartype/{cartypeId}")
    public String getGoodsByCartype(@PathVariable String cartypeId, Pager pager, Model model,HttpServletRequest request) {
        String info = "根据车型搜索";
        setLogInfo(info);
        logger.debug(info);
        try {
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("cartypeId",cartypeId));
            criteria.add(Restrictions.eq("isMarketable", "1"));
            pager.setPageSize(20);
            if (StringUtils.isNotEmpty(pager.getOrderBy())
                    && StringUtils.isNotEmpty(pager.getOrderType())) {
                criteria.add(Restrictions.order(pager.getOrderBy(), pager
                        .getOrderType().toUpperCase()));
            }
            criteria.add(Restrictions.group("g.id"));
            pager= goodsCartypeService.getGoodsPager(getParamMap(), criteria, pager);
            model.addAttribute("list", pager.getList());
            model.addAttribute("pager", pager);
            model.addAttribute("total", pager.getTotalCount());
            model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
            List<AdvertisingImage> advertisingImages = advertisingImageService
                    .getNewAds(getParamMap(), "%_01%", 4);
            model.addAttribute("advertisingImages", advertisingImages);
            //获取Session中是否有登录信息 没有则加标识 首页商品价格不可见
            Buyer buyer = getCurrentMember(request);
            if(!net.deepdragon.util.StringUtil.isNotEmpty(buyer)){
                model.addAttribute("priceHide", "hide");
            }
        } catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }

        model.addAttribute("cartypeId", cartypeId);

        return Global.TEMPLATE_MALL + PATH + "/search_cartype";
    }

    /**
     * Desc:调取远程接口进行搜索查询
     * Time:2015-12-23 10:54:26
     * Auth:zhangqiang
     * @param url
     * @param data
     * @return
     */
    private  Map<String,Object> searchTools(String url,Map<String, String> data) {
        String info = "搜索调取远程接口";
        setLogInfo(info);
        logger.debug(info);
        HttpClient hc = new HttpClient(url, 30000, 30000);
        String resultString = "";
        Map<String,Object> resData = new HashMap<String,Object>();
        try {
            int status = hc.send(data, "UTF-8");
            if (200 == status) {
                resultString = hc.getResult();
            }

            if (null != resultString && !"".equals(resultString) && !"null".equals(resultString)) {
                // 将返回结果转换为map
                JSONObject  jasonObject = JSONObject.fromObject(resultString);
                resData = (Map)jasonObject;
            }

        } catch (Exception e) {
            logger.error("搜索调取远程接口时发生异常", e);
            e.printStackTrace();
        }
        return resData;
    }

    /**
     * 全文搜索
     * @param keyword
     * @param pager
     * @return
     */
    private Pager getSearchPager(String keyword, Pager pager) throws Exception{
        try{
            Map paramMap = getParamMap();
            paramMap.put("keyword",keyword);
            pager = this.goodsService.getSearchPager4BEC(paramMap, new Criteria(), pager);
            return pager;
        }catch (Exception e){
            throw e;
        }
    }
}
