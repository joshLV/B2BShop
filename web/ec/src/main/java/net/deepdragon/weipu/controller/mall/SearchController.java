package net.deepdragon.weipu.controller.mall;

import com.alibaba.fastjson.JSON;
import com.unionpay.acp.sdk.HttpClient;
import net.deepdragon.bean.Pager;
import net.deepdragon.bean.SystemSetKey;
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
import net.deepdragon.weipu.tools.CrossborderUtil;
import net.deepdragon.weipu.tools.mail.KeywordsLogThread;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringUtils;
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
    @Resource
    private KeywordsLogService keywordsLogService;


    @RequestMapping(value = "s/{keyword}")
    public String search(@PathVariable String keyword, Pager pager, Model model,HttpServletRequest request,String orderBy,String order,String pageNumber) {
        String info = "全站搜索";
        setLogInfo(info);
        logger.debug(info);


        try {
            if( StringUtil.isNotEmpty(keyword) ){
                keyword = URLDecoder.decode(keyword, "UTF-8").replaceAll("址达司点号", ".").replaceAll("址达司杠", "/").replaceAll("址达司加号", "+");
            }

            pager.setPageNumber( StringUtil.isNotEmpty(pageNumber)?Integer.parseInt(pageNumber):1 );
            orderBy =  StringUtil.isNotEmpty(orderBy)?orderBy:"sales";
            pager.setOrderBy(orderBy);
            order =  StringUtil.isNotEmpty(order)?order:"asc";
            pager.setOrderType( order );

            Map paramMap = getParamMap();
            paramMap.put("keyword",keyword);

            if("true".equals( getSystemSetByKey(SystemSetKey.singleProductUnique) )){
                paramMap.put("gb", "GROUP BY productId");
            }

            pager = this.goodsService.getSearchPager4EC(paramMap, new Criteria(), pager);

            model.addAttribute("totalResult", pager.getTotalCount());
            model.addAttribute("totalPage", pager.getPageCount());
            model.addAttribute("pageNumber", pager.getPageNumber());
            model.addAttribute("orderBy", orderBy);
            model.addAttribute("order", order);


            List<Map<String, Object>> mapList = (List<Map<String, Object>>)pager.getList();
            List<Goods> list = new ArrayList<Goods>();

            if( mapList !=null && mapList.size() > 0 ){
                for(Map<String, Object> map : mapList){
                    Goods goods = new Goods();
                    MyBeanUtils.copyMap2Bean(goods, map);
                    list.add( goods );
                }

                //判断跨境商品 开关 是否打开
                if(CrossborderUtil.isCrossborder()){
                    list = getIfCrossborder(list);
                }

            }



            model.addAttribute("pager", pager);
            model.addAttribute("list", list);
//        	model.addAttribute("total", pager.getTotalCount());
            setPublicDate2Model( model );
            List<AdvertisingImage> advertisingImages = advertisingImageService.getNewAds(getParamMap(), "%_01%", 4);
            model.addAttribute("advertisingImages", advertisingImages);

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

        setPublicDate2Model( model );
        getAllCatelog(model);// 类目展示


        /**** 保存搜索关键字  TianYu  2016-1-5 16:32:45 Start  ***/
        Member member = getCurrentMember(request);
        KeywordsLogThread keywordsLogThread = new KeywordsLogThread(keyword , member==null?"casualUser":member.getUserName(), getParamMap());
        keywordsLogThread.start();
        /**** 保存搜索关键字  TianYu  2016-1-5 16:32:45 End  ***/


        if(Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))){
            return Global.TEMPLATE_APP + PATH + "/search_result";
        }
        return Global.TEMPLATE_MALL + PATH + "/search_result";
    }

	/*@RequestMapping(value = "s/{keyword}")
	public String search(@PathVariable String keyword, Pager pager, Model model,HttpServletRequest request,String orderBy,String order,String pageNumber) {
        String info = "全站搜索";
        setLogInfo(info);
        logger.debug(info);


        Map<String,Object> resData = new HashMap<String,Object>();
        Map<String, String> data = new HashMap<String, String>();
        List<Goods> list = new ArrayList<Goods>();
        String urlStr = "search/searchGoods_EC.sh";
        int totalGoods = 0;
        int totalPage = 0;
        try {
            if( StringUtil.isNotEmpty(keyword) ){
                keyword = URLDecoder.decode(keyword, "UTF-8").replaceAll("址达司点号", ".").replaceAll("址达司杠", "/");
            }

            SystemSet systemSet = systemSetService.find(getParamMap(),"setKey","mcmUrl");
            if(systemSet!=null){
                if (StringUtil.isNotEmpty(systemSet.getSetvalue())) {
                    urlStr = systemSet.getSetvalue() +urlStr;
//                    urlStr = "http://192.168.1.198:8080/" +urlStr;
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
                        pager.setOrderType(order);
                    }else{
                        data.put("order","asc");
                        pager.setOrderType("asc");
                    }

                    resData = searchTools(urlStr,data);
                    if (resData != null && resData.size()>0) {
                        if (StringUtil.isNotEmpty(resData.get("goodsList"))) {
                            JSONArray jsonArray = JSONArray.fromObject(resData.get("goodsList"));
                            List<Map<String, Object>> listJson = JSON.parseObject(JSON.toJSONString(jsonArray), List.class);

                            for(Map<String, Object> map : listJson ){
                                Goods goods = new Goods();
                                MyBeanUtils.copyMap2Bean(goods, map);
                                list.add(goods);
                            }
                        }

                        if (StringUtil.isNotEmpty(resData.get("page"))) {
                            Map<String,Object> map = (Map<String,Object>)resData.get("page");
                            if (StringUtil.isNotEmpty(map.get("totalResult"))) {
                                model.addAttribute("totalResult", map.get("totalResult"));
                                totalGoods = Integer.parseInt(map.get("totalResult")+"");
                                model.addAttribute("totalResult", totalGoods);
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

//        	Criteria criteria = new Criteria();
//        	criteria.add(Restrictions.like("name", "%" + keyword + "%"));
//        	criteria.add(Restrictions.eq("isMarketable", "1"));
//        	criteria.add(Restrictions.eq("status", 5));
//            *//**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **//*
//            criteria.add(Restrictions.lt("platform",3));
//            *//**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **//*
//        	pager.setPageSize(20);
//        	if (StringUtils.isNotEmpty(pager.getOrderBy()) && StringUtils.isNotEmpty(pager.getOrderType())) {
//				criteria.add(Restrictions.order(pager.getOrderBy(), pager.getOrderType().toUpperCase()));
//			}
//        	pager= goodsService.getPager(getParamMap(), criteria, pager);
            pager.setTotalCount(totalGoods);
            pager.setPageSize(20);

            pager.setPageCount(totalPage);

            //判断跨境商品 开关 是否打开
            if(CrossborderUtil.isCrossborder()){
                if(list.size() > 0 && list != null){
                    model.addAttribute("list",getIfCrossborder(list));
                }
            }else{
                model.addAttribute("list", list);
            }

            pager.setList(list);
        	model.addAttribute("pager", pager);
//        	model.addAttribute("total", pager.getTotalCount());
        	model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
        	List<AdvertisingImage> advertisingImages = advertisingImageService.getNewAds(getParamMap(), "%_01%", 4);
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
        getAllCatelog(model);// 类目展示


        *//**** 保存搜索关键字  TianYu  2016-1-5 16:32:45 Start  ***//*
        Member member = getCurrentMember(request);
        if(!net.deepdragon.util.StringUtil.isNotEmpty(member)){
            model.addAttribute("priceHide", "hide");
        }
        KeywordsLogThread keywordsLogThread = new KeywordsLogThread(keyword , member==null?"casualUser":member.getUserName(), getParamMap());
        keywordsLogThread.run();
        *//**** 保存搜索关键字  TianYu  2016-1-5 16:32:45 End  ***//*


        if(Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))){
            return Global.TEMPLATE_APP + PATH + "/search_result";
        }
        return Global.TEMPLATE_MALL + PATH + "/search_result";
    }*/

    /**
     * Desc:判断是否为跨境商品
     * Auth:zhangqiang
     * Time:2016-01-29 14:53:25
     * @param goodsList
     * @return
     */
    public List<Goods> getIfCrossborder(List<Goods> goodsList){
        String info = "获取商品是否为跨境商品";
        setLogInfo(info);
        List<Goods> goodsCrossBorderList = new ArrayList<Goods>();
        try{
            if (goodsList.size() > 0 && goodsList != null) {
                for (int i=0;i<goodsList.size();i++) {
                    Goods goods = goodsList.get(i);
                    if(StringUtil.isNotEmpty(goods.getShopId()) && StringUtil.isNotEmpty(goods.getCategoryId())){
                        if(CrossborderUtil.isShopCatelog(goods.getShopId(),goods.getCategoryId())){
                            //1表示 为跨境商品
                            goods.setCrossBorder("1");
                        }else{
                            goods.setCrossBorder("0");
                        }
                    }
                    goodsCrossBorderList.add(goods);
                }
            }
        }catch (Exception e) {
            logger.error(info+"发生异常", e);
            e.printStackTrace();
        }
        return goodsCrossBorderList;
    }

    /**
     * 刷单页面
     * @param pager
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/sacb")
    public String searchAllCrossBorderGoods(Pager pager, Model model,HttpServletRequest request) {
        Member member = getCurrentMember(request);
        if (!CrossborderUtil.isCrossborderMember(member)) {
            return "";
        }
        String keyword=urlDecoder(request.getParameter("keyword"));
        String info = "全站搜索";
        setLogInfo(info);
        logger.debug(info);
        try {
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.like("name", "%" + keyword + "%"));
            criteria.add(Restrictions.eq("isMarketable", "0"));
            /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
            criteria.add(Restrictions.eq("predictDay", "刷单商品"));
            /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
            pager.setPageSize(100000);
            if (StringUtils.isNotEmpty(pager.getOrderBy()) && StringUtils.isNotEmpty(pager.getOrderType())) {
                criteria.add(Restrictions.order(pager.getOrderBy(), pager.getOrderType().toUpperCase()));
            }
            pager= goodsService.getPager(getParamMap(), criteria, pager);
            model.addAttribute("list", pager.getList());
            model.addAttribute("pager", pager);
            model.addAttribute("total", pager.getTotalCount());
            setPublicDate2Model( model );
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
            /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
            hotsList = goodsService.getTagGoods4Index(getParamMap(), "hot", 6, getWhichPlat());
            /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
        } catch (Exception e) {
            logger.error("IndexController中getData4IndexTagGoods方法，发生异常：", e);
        }
        model.addAttribute("hotsList", hotsList);

        setPublicDate2Model( model );
        if(StringUtil.isNotEmpty(request.getParameter("from"))){
            model.addAttribute("from", request.getParameter("from"));
        }else{
            model.addAttribute("from", "default");
        }
        return Global.TEMPLATE_MALL + PATH + "/search_result_crossborder";
    }


    /**
     * appd端商品检索
     * @param pager
     * @param model
     * @param request
     * @return
     */
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
            criteria.add(Restrictions.lt("platform",3));
            /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
            pager.setPageSize(20);
            if (StringUtils.isNotEmpty(pager.getOrderBy()) && StringUtils.isNotEmpty(pager.getOrderType())) {
                criteria.add(Restrictions.order(pager.getOrderBy(), pager.getOrderType().toUpperCase()));
            }
            pager= goodsService.getPager(getParamMap(), criteria, pager);
            model.addAttribute("list", pager.getList());
            model.addAttribute("pager", pager);
            model.addAttribute("total", pager.getTotalCount());
            setPublicDate2Model( model );
            List<AdvertisingImage> advertisingImages = advertisingImageService.getNewAds(getParamMap(), "%_01%", 4);
            model.addAttribute("advertisingImages", advertisingImages);
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

        setPublicDate2Model( model );
        if(StringUtil.isNotEmpty(request.getParameter("from"))){
            model.addAttribute("from", request.getParameter("from"));
        }else{
            model.addAttribute("from", "default");
        }
        return Global.TEMPLATE_APP + PATH + "/search_result";
    }


    /**
     * app端加载数据方法
     * @param keyword
     * @param orderBy
     * @param orderType
     * @param pageNumber
     * @param request
     * @param pager
     * @return
     */
    @RequestMapping(value = "/getPageDateForJson")
    public  @ResponseBody
    Object getPageDateForJson(Pager pager, HttpServletRequest request) {

        String info = "app端加载搜索数据";
        setLogInfo(info);
        logger.debug(info);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(STATUS, SUCCESS);
        result.put(MESSAGE, "操作成功");

        try {
            String keyword = request.getParameter("keyword");
            if( StringUtil.isNotEmpty(keyword) ){
                keyword = URLDecoder.decode(keyword, "UTF-8").replaceAll("址达司点号", ".").replaceAll("址达司杠", "/");
            }

            String pageNumber = request.getParameter("pageNumber");
            pager.setPageNumber( StringUtil.isNotEmpty(pageNumber)?Integer.parseInt(pageNumber):1 );
            String orderBy = request.getParameter("orderBy");
            orderBy =  StringUtil.isNotEmpty(orderBy)?orderBy:"sales";
            pager.setOrderBy(orderBy);
            String orderType = request.getParameter("orderType");
            orderType =  StringUtil.isNotEmpty(orderType)?orderType:"asc";
            pager.setOrderType( orderType );

            Map paramMap = getParamMap();
            paramMap.put("keyword",keyword);

            if("true".equals( getSystemSetByKey(SystemSetKey.singleProductUnique) )){
                paramMap.put("gb", "GROUP BY productId");
            }

            pager = this.goodsService.getSearchPager4EC(paramMap, new Criteria(), pager);
            List<Map<String, Object>> mapList = (List<Map<String, Object>>)pager.getList();
            List<Goods> list = new ArrayList<Goods>();

            if( mapList !=null && mapList.size() > 0 ){
                for(Map<String, Object> map : mapList){
                    Goods goods = new Goods();
                    MyBeanUtils.copyMap2Bean(goods, map);
                    list.add( goods );
                }

                //判断跨境商品 开关 是否打开
                if(CrossborderUtil.isCrossborder()){
                    list = getIfCrossborder(list);
                }

            }
            pager.setList(list);
            result.put(DATA, pager.getList());
            result.put("pager", pager);


        } catch (Exception e) {
            logger.error("app端加载搜索数据", e);
            e.printStackTrace();
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "操作失败");
        }
        return result;
    }
    /*
    @RequestMapping(value = "/getPageDateForJson",  method = { RequestMethod.POST })
    public  @ResponseBody
    Object getPageDateForJson(String catelogPath, Model model, Pager pager,HttpServletRequest request) {
        String keyword = request.getParameter("key");
        String info = "app端加载搜索数据";
        setLogInfo(info);
        logger.debug(info);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(STATUS, SUCCESS);
        result.put(MESSAGE, "操作成功");

        Map<String,Object> resData = new HashMap<String,Object>();
        Map<String, String> data = new HashMap<String, String>();
        List<Goods> list = new ArrayList<Goods>();
        String urlStr = "search/searchGoods_EC.sh";
        int totalGoods = 0;
        int totalPage = 0;
        try {
            if( StringUtil.isNotEmpty(keyword) ){
                keyword = URLDecoder.decode(keyword, "UTF-8").replaceAll("址达司点号", ".").replaceAll("址达司杠", "/");
            }
            SystemSet systemSet = systemSetService.find(getParamMap(),"setKey","mcmUrl");
            if(systemSet!=null){
                if (StringUtil.isNotEmpty(systemSet.getSetvalue())) {
                    urlStr = systemSet.getSetvalue() +urlStr;
//                    urlStr = "http://192.168.1.198:8080/" +urlStr;
                    data.put("keyWords",keyword);
                    Integer pageNumber = pager.getPageNumber();
                    if (pageNumber != null) {
                        data.put("currentPage",pageNumber.toString());
                    }else{
                        data.put("currentPage","1");
                    }
                    data.put("showCount","20");
                    String orderBy = pager.getOrderBy();
                    if (StringUtils.isNotEmpty(orderBy)) {
                        if("createDate".equals(orderBy)){
                            data.put("orderColumn", "");
                        }else{
                            data.put("orderColumn", orderBy);
                        }

                    }
                    String order = pager.getOrderType();
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
                                MyBeanUtils.copyMap2Bean(goods, map);
                                list.add(goods);
                            }
                        }

                        if (StringUtil.isNotEmpty(resData.get("page"))) {
                            Map<String,Object> map = (Map<String,Object>)resData.get("page");
                            if (StringUtil.isNotEmpty(map.get("totalResult"))) {
                                result.put("totalResult", map.get("totalResult"));
                                totalGoods = Integer.parseInt(map.get("totalResult")+"");
                                result.put("totalResult", totalGoods);
                            }
                            if (StringUtil.isNotEmpty(map.get("totalPage"))) {
                                result.put("totalPage", map.get("totalPage"));
                                totalPage = Integer.parseInt(map.get("totalPage")+"");
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
            pager.setPageSize(20);
            pager.setPageCount(totalPage);
            if(CrossborderUtil.isCrossborder()){
                getIfCrossborder(list)  ;

            }
            pager.setList(list);
            result.put(DATA, pager.getList());
            result.put("pager", pager);
        } catch (Exception e) {
            logger.error("app端加载搜索数据", e);
            e.printStackTrace();
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "操作失败");
        }
        return result;
    }
*/


    @RequestMapping(value = "cartype/{cartypeId}")
    public String getGoodsByCartype(@PathVariable String cartypeId, Pager pager, Model model) {
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
            setPublicDate2Model( model );
            List<AdvertisingImage> advertisingImages = advertisingImageService
                    .getNewAds(getParamMap(), "%_01%", 4);
            model.addAttribute("advertisingImages", advertisingImages);
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
                JSONObject jasonObject = JSONObject.fromObject(resultString);
                resData = (Map)jasonObject;
            }

        } catch (Exception e) {
            logger.error("搜索调取远程接口时发生异常", e);
            e.printStackTrace();
        }
        return resData;
    }


}
