package net.deepdragon.weipu.controller.mall;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.Constant;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 分类查看
 */
@Controller(Global.APP_SIGN + Global.MALL_PATH + "ListController")
@RequestMapping("/list")
public class ListController extends BaseMallController {

    @Resource
    private ArticlesService articlesService;
    @Resource
    private ArticlesCategoryService articlesCategoryService;
    @Resource
    private CacheData cacheData;
    @Resource
    private CatelogService catelogService;
    @Resource
    private GoodsCategoryService categoryService;
    @Resource
    private GoodsBrandService goodsBrandService;
    @Resource
    private GoodsService goodsService;
    @Resource
    private TagService tagService;
    @Resource
    private AdvertisingImageService advertisingImageService;
    @Resource
    private GoodsImagesService goodsImagesService;
    @Resource
    private GoodsReviewService goodsReviewService;

    public final static String HOT = "hot";

    @RequestMapping(value = "")
    public String index(@RequestParam(value = "cat") String catelogPath, Model model,Pager pager,HttpServletRequest request,
                        String merchantId, String shopName, String goodsShortName, String goodsCategory, String barCode,
                        String listStyle, String price, String brand) {
        String info = "商品列表页";
        setLogInfo(info);
        getAllCatelog(model);// 首页类目展示
        logger.error(info);
//        int level = 1;
//        level = StringUtils.split(catelogPath, ",").length;
        String[] cateIds = catelogPath.substring(catelogPath.indexOf(",") + 1).split(",");
        String ids="";
        int index = 1;
        for(String cateId : cateIds){
            if(index < cateIds.length) {
                ids += cateId + "-";
            }else{
                ids += cateId;
            }
            index++;
        }
        pager = getData(catelogPath.substring(catelogPath.indexOf(",") + 1), model, pager,request,merchantId, shopName, goodsShortName, goodsCategory, barCode, price, brand);
//        switch (level) {
//            case 1:
//                getData1(catelogPath, model);
//                break;
//            case 2:
//                getData2(catelogPath, model);
//                break;
//            case 3:
//                getData3(catelogPath, model,pager);
//                break;
//            default:
//                break;
//        }

        List<Goods> goodsLists = (List<Goods>)pager.getList();
        if (goodsLists != null && goodsLists.size() > 0) {
            Map<String,Map<String, List<Map<String, Object>>>> goodsSpList = new HashMap<String,Map<String, List<Map<String, Object>>>>();
            for (int i=0;i<goodsLists.size();i++) {
                //存放商品规格
                goodsSpList.put(goodsLists.get(i).getId(), goodsService.getGoodsSpInfo(getParamMap(), goodsLists.get(i).getId()));
            }
            model.addAttribute("goodsSpList",goodsSpList);
        }


        model.addAttribute("categoryBrandList",getCategoryBrandList(catelogPath));
        model.addAttribute("catelogPath",catelogPath);
        model.addAttribute("ids",ids);


        List<Catelog> catelogList = catelogService.getAllParents(getParamMap());
        model.addAttribute("catelogs",catelogList );

        model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
        model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
        model.addAttribute("services", cacheData.getServices(getParamMap()));

        String strUrl = "/list_3";
        //listStyle: detailList 详情列表页面
        if ("detailList".equals(listStyle)) {
            strUrl = "/list_3_detail";
            model.addAttribute("listStyle","detailList");
        }
        if(catelogPath.contains(Global.WHICH_APP)){
            return Global.TEMPLATE_APP + PATH + "/goods_list";
        }else{
//            return Global.TEMPLATE_MALL + PATH + "/list_3";
            return Global.TEMPLATE_MALL + PATH + strUrl;
        }

    }

    /**
     * ajax加载商品信息
     */
    @RequestMapping(value = "/getGoodsList")
    @ResponseBody
    public Object getGoodsList(@RequestParam(value = "cat") String catelogPath,Pager pager,Model model,HttpServletRequest request,String merchantId, String shopName, String goodsShortName, String goodsCategory, String barCode,
                               String price, String brand){
        Map<String, Object> result = new HashMap<String, Object>();
        String info = "商品列表页-批发模式Ajax获取商品列表";
        setLogInfo(info);
        logger.error(info);

        /**获取Session中是否有登录信息 没有则加标识 首页商品价格不可见*/
        Buyer buyer = getCurrentMember(request);
        if(!net.deepdragon.util.StringUtil.isNotEmpty(buyer)){
            result.put("priceHide", "hide");
        }


        try{
            pager = getData(catelogPath.substring(catelogPath.indexOf(",") + 1), model, pager,request,merchantId, shopName, goodsShortName, goodsCategory, barCode, price, brand);
            result.put("pager", pager);
            result.put("total", pager.getTotalCount());

            List<Goods> goodsLists = (List<Goods>)pager.getList();
            if (goodsLists != null && goodsLists.size() > 0) {
                Map<String,Map<String, List<Map<String, Object>>>> goodsSpList = new HashMap<String,Map<String, List<Map<String, Object>>>>();
                for (int i=0;i<goodsLists.size();i++) {
                    //存放商品规格
                    goodsSpList.put(goodsLists.get(i).getId(), goodsService.getGoodsSpInfo(getParamMap(), goodsLists.get(i).getId()));
                }
                result.put("goodsSpList", goodsSpList);
            }else{
                result.put("goodslist",pager.getList());
            }


            result.put(STATUS, SUCCESS);
        }catch (Exception e) {
            logger.error("获取3级分类页面数据时发生异常", e);
            e.printStackTrace();
            result.put(STATUS, ERROR);
            result.put(MESSAGE,"获取商品列表信息失败！");
        }
        return  result;
    }




    /**
     20151204 dzz modify
     * action: 添加注释
     *         查询相关分类,同类其他产品等
     *         层级标签展现
     * @param catelogPath
     * @param model
     * @param pager
     * @param request
     */
    private Pager getData(String catelogPath, Model model, Pager pager,HttpServletRequest request,
                         String merchantId, String shopName, String goodsShortName, String goodsCategory, String barCode,
                         String price, String brand){
        try {

            if( "createDate".equals( pager.getOrderBy() ) ){
                pager.setOrderBy("sales");
                pager.setOrderType("desc");
            }

            int position = catelogPath.lastIndexOf(",");
            String[] categoryPath = StringUtils.split(catelogPath, ",");
            String categoryLikeId = catelogPath;

            if(categoryPath.length == 3){
                // 三级分类
                Catelog catelog = catelogService.get(getParamMap(), categoryPath[2]);
                model.addAttribute("catelog", catelog);

                List<AdvertisingImage> advertisingImages = advertisingImageService
                        .getNewAds(getParamMap(), categoryPath[2] + "_01%", 4);
                model.addAttribute("advertisingImages", advertisingImages);

                //20151116 dzz 添加父级,顶级节点对象
                Catelog parentCatelog = catelogService.getCatelogByGategory(getParamMap(), catelog.getParentId());//父级节点
                Catelog grandCatelog = catelogService.getCatelogByGategory(getParamMap(), parentCatelog.getParentId());//顶级节点
                model.addAttribute("parentCatelog", parentCatelog);
                model.addAttribute("grandCatelog", grandCatelog);
            }

            if(categoryPath.length >= 2){
                // 二级分类
                Catelog parentCatelog = getParement(categoryPath[1]);
                model.addAttribute("parentCatelog", parentCatelog);

                //20151116 dzz 添加父级,顶级节点对象
                Catelog grandCatelog = catelogService.getCatelogByGategory(getParamMap(), parentCatelog.getParentId());//顶级节点对象
                model.addAttribute("grandCatelog", grandCatelog);
            }

            if(categoryPath.length >= 1){
                Catelog grandCatelog = getParement(categoryPath[0]);
                model.addAttribute("grandCatelog", grandCatelog);
            }


            /******************** 20151116 dzz **********************/
            // 加载商品对应的所有分类（L1/L2/L3三级分类）
            List<Map<String, Object>> breadcrumbCatList = new ArrayList<Map<String, Object>>();
            List<Catelog> refCatelogList = new ArrayList<Catelog>(); //查询当前产品相关分类
            Catelog catelog = catelogService.getCatelogByGategory(getParamMap(), categoryPath[categoryPath.length-1]);


            // 加载当前商品的前台分类的相关分类(兄弟分类)
            List<GoodsBrand> brandRefList = new ArrayList<GoodsBrand>();
            Criteria criteriaType = new Criteria();

            if(!catelog.getPath().contains(",")) {
                Map<String,Object> catelogs=new HashMap<String, Object>();
                catelogs.put("l1_id",catelog.getId());
                catelogs.put("l1_name",catelog.getName());
                catelogs.put("l2_id",null);
                catelogs.put("l2_name",null);
                catelogs.put("l3_id",null);
                catelogs.put("l3_name",null);
                catelogs.put("l4_id",catelog.getGrandfather());
                breadcrumbCatList.add(catelogs);

                criteriaType.add(Restrictions.eq("parentId", catelog.getId()));//(顶级)加载当前商品的前台分类的相关分类(兄弟分类)
            }else if(catelog.getPath().split(",").length==2){
                Catelog parentCatelog = catelogService.getCatelogByGategory(getParamMap(), catelog.getParentId());
                Map<String,Object> catelogs=new HashMap<String, Object>();

                /*
                 * dzz 20151127
                 * 因商品只有三级结构;1Lev-3Lev生成时与2Lev-3Lev生成有特殊情况,故此处采用特殊方法处理
                 */
                // 档商品ID的父级categoryID与自己本身的path第一位相等时
                if(catelog.getParentId().equals(catelog.getPath().split(",")[0])) {
                    catelogs.put("l1_id",parentCatelog.getId());
                    catelogs.put("l1_name",parentCatelog.getName());
                    catelogs.put("l2_id",catelog.getId());
                    catelogs.put("l2_name",catelog.getName());
                    catelogs.put("l4_id",catelog.getGrandfather());

                    criteriaType.add(Restrictions.eq("parentId", catelog.getParentId())); // (二级)加载当前商品的前台分类的相关分类(兄弟分类)
                } else {
                    Catelog rootCatelog = catelogService.getCatelogByGategory(getParamMap(), parentCatelog.getParentId());
                    catelogs.put("l1_id",rootCatelog.getId());
                    catelogs.put("l1_name",rootCatelog.getName());
                    catelogs.put("l2_id",parentCatelog.getId());
                    catelogs.put("l2_name",parentCatelog.getName());
                    catelogs.put("l3_id",catelog.getId());
                    catelogs.put("l3_name",catelog.getName());
                    catelogs.put("l4_id",catelog.getGrandfather());

                    criteriaType.add(Restrictions.eq("parentId", rootCatelog.getId())); // (三级)加载当前商品的前台分类的相关分类(兄弟分类)
                }

                breadcrumbCatList.add(catelogs);
            }else {
                breadcrumbCatList = goodsService.getGoods4Category(getParamMap(), catelog.getId());

                criteriaType.add(Restrictions.eq("parentId", catelog.getParentId()));
            }

            //加载当前商品的前台分类的相关分类(兄弟分类)
            criteriaType.add(Restrictions.eq("enabled", "1"));
            criteriaType.add(Restrictions.notEq("id", categoryPath[categoryPath.length-1]));
            refCatelogList = catelogService.getList(getParamMap(), criteriaType);

            // 加载同类其他品牌
            brandRefList = goodsService.queryBrandListByRootId(getParamMap(), categoryPath[0]);


            model.addAttribute("refCatelogList", refCatelogList);
            model.addAttribute("brandRefList", brandRefList);
            model.addAttribute("breadcrumbCatList", breadcrumbCatList);

            /******************** #20151116 dzz **********************/


            model.addAttribute("brandList", getCategoryBrandList(categoryPath[0])); //查询商品分类下的品牌 从分类最父级的iD查询 Auth:zhangqiang Time:2015-09-24 15:32:35 Start

            Criteria criteria = new Criteria();

            if(StringUtil.isNotEmpty(price)){
                model.addAttribute("priceFlag", price); // 将查询条件价格返回给页面 Auth:zhangqiang Time:2015-09-28 13:37:35 Start
                //M2400L3799
                String[] priceArr = price.replace("M","").split("L");

                /*
                 * 20151011 dzz 设置自定义区间
                 * 替换价格区间首位大于后位的情况
                 * 最大值 maxBatchPrice， 最小值 minBatchPrice
                 */
                if( priceArr.length == 1 && StringUtil.isNotEmpty(priceArr[0])){
                    int priS = Integer.parseInt(priceArr[0]);

                    criteria.add(Restrictions.or(Restrictions.ge("minBatchPrice", priS), Restrictions.ge("maxBatchPrice", priS)));

                    model.addAttribute("priS", priS);
                    model.addAttribute("priE", "");
                }else if( StringUtil.isEmpty(priceArr[0]) &&  StringUtil.isNotEmpty(priceArr[1])){
                    int priE = Integer.parseInt(priceArr[1]);

                    criteria.add(Restrictions.or(Restrictions.le("minBatchPrice", priE), Restrictions.le("maxBatchPrice", priE)));

                    model.addAttribute("priS", "");
                    model.addAttribute("priE", priE);
                }else if( StringUtil.isNotEmpty(priceArr[0]) &&  StringUtil.isNotEmpty(priceArr[1])){
                    int priS = Integer.parseInt(priceArr[0]);
                    int priE = Integer.parseInt(priceArr[1]);
                    if(priS>priE) {
                        int tempPri = priS;
                        priS = priE;
                        priE = tempPri;
                    }
                    //Restrictions.ge("minBatchPrice", priS), Restrictions.le("minBatchPrice", priE)
                    //Restrictions.ge("maxBatchPrice", priS), Restrictions.le("maxBatchPrice", priE)
                    criteria.add(Restrictions.or( Restrictions.between("minBatchPrice", priS, priE) ,Restrictions.between("maxBatchPrice", priS, priE)));

                    model.addAttribute("priS", priS);
                    model.addAttribute("priE", priE);
                }
            }


            criteria.add(Restrictions.eq("isMarketable", 1));
            criteria.add(Restrictions.eq("status", 5));
            if(catelogPath.contains(",")){
                String[] path = catelogPath.split(",");
                if( path.length < 3 ){
                    catelogPath += ",";
                }
            }else{
                catelogPath += ",";
            }
            criteria.add(Restrictions.likeTwo("CONCAT(CONCAT(',',categoryPath, ','))", "'%," + categoryLikeId + ",%'"));// 查询商品分类下的品牌 从分类最父级的iD查询 Auth:zhangqiang Time:2015-09-24 15:32:35 Start

            /*
             *页面选择品牌查询条件时 查询商品sql加品牌条件 Auth:zhangqiang Time:2015-09-24 15:34:35 Start
             */
            if(StringUtil.isNotEmpty(brand)){
                model.addAttribute("brandFlag", brand); //将查询条件品牌返回给页面 Auth:zhangqiang Time:2015-09-28 13:37:35 Start
                criteria.add(Restrictions.eq("brandId", brand));
            }

            /*
             *页面选择排序查询条件时 查询商品sql加排序条件 Auth:zhangqiang Time:2015-09-30 15:48:35 Start
             */
            String orderBy = request.getParameter("orderBy");
            if(StringUtil.isNotEmpty(orderBy)){
                model.addAttribute("orderByFlag", "price".equals(orderBy)?"minBatchPrice":orderBy);
                model.addAttribute("orderBy",orderBy);
            }


            if (StringUtils.isNotEmpty(pager.getOrderBy())
                    && StringUtils.isNotEmpty(pager.getOrderType())) {
                criteria.add(Restrictions.order("price".equals(pager.getOrderBy())?"minBatchPrice":pager.getOrderBy(), pager.getOrderType().toUpperCase()));
                model.addAttribute("orderBy",orderBy);
                model.addAttribute("order",pager.getOrderType());
            }
            criteria.add(Restrictions.ge("platform",2));//添加所属平台参数  hks 2015-11-10 18:09:58 modify  start

            /**
             * Desc:列表页面搜索内容 Auth:zhangqiang Time:2016-01-30 17:28:35 Start
             */


            if( StringUtils.isNotEmpty(merchantId) ){
                criteria.add(Restrictions.eq("o.shopId", merchantId));
            }

            if(StringUtil.isNotEmpty(goodsShortName)){
                goodsShortName = URLDecoder.decode(goodsShortName, "UTF-8");
                criteria.add(Restrictions.or(Restrictions.like("shortName", "%" + goodsShortName + "%"), Restrictions.like("name", "%" + goodsShortName + "%")));
                model.addAttribute("goodsShortName",goodsShortName);
            }

            if(StringUtil.isNotEmpty(shopName)){
                shopName = URLDecoder.decode(shopName, "UTF-8");
                criteria.add(Restrictions.like("shopName", "%"+shopName+"%"));
                model.addAttribute("shopName",shopName);
            }

            if( StringUtils.isNotEmpty(goodsCategory) ) { //商品分类
                goodsCategory = URLDecoder.decode(goodsCategory, "UTF-8");
                criteria.add(Restrictions.like("clName", "%" + goodsCategory + "%"));
                model.addAttribute("goodsCategory",goodsCategory);
            }
            //barcode  packageBarCode
            if( StringUtils.isNotEmpty(barCode) ) {
                barCode = URLDecoder.decode(barCode, "UTF-8");
                criteria.add(Restrictions.or(Restrictions.like("barcode", "%" + barCode + "%"), Restrictions.like("packageBarCode", "%" + barCode + "%")));
                model.addAttribute("barCode",barCode);
            }

            /**
             * Desc:列表页面搜索内容 Auth:zhangqiang Time:2016-01-30 17:28:35 End
             */
            criteria.add(Restrictions.eq("type", 0));//过滤众筹
            pager.setPageSize(20);
            pager= goodsService.getPager4BEC(getParamMap(), criteria, pager);


            /*
             * 商品评论现在通过数据库触发器自动增加到商品表中，不需要在去评论表查数据 Auth:zhangqiang Time:2015-09-24 17:17:25 Start
             */
            // 重新计算商品评论
            /*List<Goods> goodsList = (List<Goods>) pager.getList();
            if (goodsList != null && goodsList.size() > 0) {
                List<String> goodsIds = new ArrayList<String>();
                for (Goods goods : goodsList) {
                    goodsIds.add(goods.getId());
                }
                Map<String, Integer> countGoodsReviewMap = new HashMap<String, Integer>();
                Criteria criteriaGoodsReview = new Criteria();
                criteriaGoodsReview.add(Restrictions.in("goodsId", goodsIds));
                List<GoodsReview> goodsReviewList = goodsReviewService.getList(getParamMap(), criteriaGoodsReview);
                if (goodsReviewList != null && goodsReviewList.size() > 0) {
                    for (GoodsReview review : goodsReviewList) {
                        countGoodsReviewMap.put(review.getGoodsId(), countGoodsReviewMap.get(review.getGoodsId()) != null ? countGoodsReviewMap.get(review.getGoodsId()) + 1 : 1);
                    }
                }
                // 重新赋值商品的评论次数
                for (Goods goods : goodsList) {
                    goods.setScoreCount(countGoodsReviewMap.get(goods.getId()));
                }
            }*/

            model.addAttribute("pager", pager);
            model.addAttribute("total", pager.getTotalCount());

            //获取Session中是否有登录信息 没有则加标识 首页商品价格不可见
            Buyer buyer = getCurrentMember(request);
            if(!net.deepdragon.util.StringUtil.isNotEmpty(buyer)){
                model.addAttribute("priceHide", "hide");
            }

            //add by zx 20150630 hotCommodity
            List<Goods> hotsList = null;
            try {
                // hotsList = (List<Goods>) pager.getList();
                /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
                hotsList = goodsService.getTagGoods4Index(getParamMap(), HOT, 6, getWhichPlat());
                /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
            } catch (Exception e) {
                logger.error("IndexController中getData4IndexTagGoods方法，发生异常：", e);
            }
            model.addAttribute("hotsList", hotsList);

            //获取商品的阶梯价
            /*List<Goods> goodsLists = (List<Goods>)pager.getList();
            if (goodsLists != null && goodsLists.size() > 0) {
//                getGoodsBatchPrice(goodsLists);
                model.addAttribute("goodslist",getGoodsBatchPrice(model,goodsLists));
            }else {
                model.addAttribute("goodslist",pager.getList());
            }*/
                model.addAttribute("goodslist",pager.getList());
        } catch (Exception e) {
            logger.error("获取3级分类页面数据时发生异常", e);
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
    private List<Goods> getGoodsBatchPrice(Model model,List<Goods> goodsList){
        String info = "查看商品的阶梯价";
        setLogInfo(info);
        logger.debug(info);
        List<Goods> goodsBatchList = new ArrayList<Goods>();
        StringBuffer sb = new StringBuffer();
        Map<String,Map<String, List<Map<String, Object>>>> goodsSpList = new HashMap<String,Map<String, List<Map<String, Object>>>>();
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

                            if(StringUtil.isNotEmpty(map.get("total"))){
                                goods.setTotal(map.get("total").toString());
                            }

                            if(StringUtil.isNotEmpty(map.get("ypice"))){
                                goods.setYpice(map.get("ypice").toString());
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
            model.addAttribute("goodsSpList", goodsSpList);
        }catch (Exception ex) {
            logger.error("查看商品的阶梯价时，发生异常。", ex);
            ex.printStackTrace();
        }
        return goodsBatchList;
    }
   /**
     * app端加载数据方法(lxb2015-11-16)
     * @param catelogPath
     * @param model
     * @param pager
     * @param request
     */
    @RequestMapping(value = "/getPageDateForJson",  method = { RequestMethod.POST })
    public  @ResponseBody
    Object getPageDateForJson(String catelogPath, Model model, Pager pager,HttpServletRequest request) {
        String info = "加载更多的商品";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(STATUS, SUCCESS);
        result.put(MESSAGE, "操作成功");
        try {

            int position = catelogPath.lastIndexOf(",");
            String[] categoryPath = StringUtils.split(catelogPath, ",");
            String categoryLikeId = "";


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

    private void getData1(String catelogPath, Model model) {
        try {
            // 一级分类
            String id = catelogPath;
            Catelog catelog = catelogService.get(getParamMap(), id);
            model.addAttribute("catelog", catelog);
            // 二级分类
            List<Catelog> childList = getChildrenList(catelog.getId());
            model.addAttribute("childList", childList);
            // 三级分类
            Map<String, List<Catelog>> grandsonMap = new HashMap<String, List<Catelog>>();
            for (Catelog child : childList) {
                grandsonMap.put(child.getId(), getChildrenList(child.getId()));
            }
            List<Catelog> catelogchildList = getChildrenList(catelogPath);
            List<Map<String, Object>> typeList = new ArrayList<Map<String, Object>>();
            //查询楼层广告 品牌 商品
            int i = 0;
            for (Catelog catelogs : catelogchildList) {
                Map<String, Object> data = new HashMap<String, Object>();
                i = i + 1;
                data.put("catlog1_floor_left_" + i + "_1", getNewsAd("catlog1_floor_left_" + i + "_1", 1));
                data.put("catelog", catelogs);
                data.put("categrandList", getChildrenList(catelogs.getId()));
                data.put("brandchildList", getCategoryBrandList(catelogPath));
                List<Catelog> catelogchildList1 = getChildrenList(catelogs.getId());
                if (catelogchildList1 != null && catelogchildList1.size() > 0) {
                    try {
                        data.put("goodschildList", getGoodsList(catelogchildList1.get(0).getId()));
                    } catch (Exception e) {
                        logger.error("查询时");
                    }
                }
                typeList.add(data);
            }
            model.addAttribute("typeList", typeList);
            //轮播广告
            String[] signArray = new String[] { "slide_1", "slide_2"};
            List<AdvertisingImage> advertisingImageList = new ArrayList<AdvertisingImage>
                    ();
            for (String sign : signArray) {
                List<AdvertisingImage> advertisingImage = advertisingImageService.getAds
                        (getParamMap(), sign, 1);
                if(advertisingImage!=null&&advertisingImage.size()>0){
                    advertisingImageList.add(advertisingImage.get(0));
                }
            }
            model.addAttribute("adslides", advertisingImageList);
            model.addAttribute("grandsonMap", grandsonMap);
            model.addAttribute("articlesList", getArticleList("Information"));
            model.addAttribute("articlesCategory",
                    getArtCategory("Information"));

        } catch (Exception e) {
            logger.error("获取1级分类页面数据时发生异常", e);
            e.printStackTrace();
        }
        //标签 商品
        List<Map<String, Object>> tagGoodsList = new ArrayList<Map<String, Object>>();
        String[] signArray = new String[] { "recommend", "pop", "best",
                "explosion", "onsale" };
        try {
            for (String sign : signArray) {
                Map<String, Object> data = new HashMap<String, Object>();
                Criteria criteria = new Criteria();
                criteria.add(Restrictions.eq("sign",sign));
                criteria.add(Restrictions.eq(Constant.TENANTID_KEY,getTenantId()));
                criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,getPlatform()));
                List<Tag>  tagList= tagService.getList(getParamMap(),criteria);
                if(tagList!=null&&tagList.size()>0){
                    data.put("tag", tagList.get(0));
                    data.put("tagGoodsList", getGoodsByTagId(catelogPath,tagList.get(0).getId(), 5));
                    tagGoodsList.add(data);
                }
            }
        } catch (Exception e) {
            logger.error("获取页面中部标签以及其对应的商品信息时发生异常", e);
            e.printStackTrace();
        }
        model.addAttribute("tagGoodsList", tagGoodsList);
    }

    private void getData2(String catelogPath, Model model) {
        try {
            // 二级分类
            String id = catelogPath.split(",")[1];
            Catelog catelog = catelogService.get(getParamMap(), id);
            model.addAttribute("catelog", catelog);
            // 三级分类
            List<Catelog> childList = getChildrenList(catelog.getId());
            model.addAttribute("childList", childList);
            // 一级分类，即当前分类的父分类
            Catelog parent = catelogService.get(getParamMap(),
                    catelog.getParentId());
            model.addAttribute("parent", parent);
            //轮播广告
            String[] signArray = new String[] { "slide_3", "slide_4"};
            List<AdvertisingImage> advertisingImageList = new ArrayList<AdvertisingImage>
                    ();
            for (String sign : signArray) {
                List<AdvertisingImage> advertisingImage = advertisingImageService.getAds
                        (getParamMap(), sign, 1);
                if(advertisingImage!=null&&advertisingImage.size()>0){
                    advertisingImageList.add(advertisingImage.get(0));
                }
            }
            model.addAttribute("adslides", advertisingImageList);
            // 分类资讯
            model.addAttribute("articlesList", getArticleList("Information"));
            model.addAttribute("articlesCategory",
                    getArtCategory("Information"));
            model.addAttribute("leftAdImages",
                    getAdImages(getParamMap(), id + "\\_01\\_%"));
            model.addAttribute("rightAdImages",
                    getAdImages(getParamMap(), id + "\\_02\\_%"));
            model.addAttribute("leftGoodsList",
                    getCategoryOfGoods(getParamMap(), id, 6));
            // 热卖
            // 1、先确定[热卖]的sign
            Tag tagBest = tagService.find(getParamMap(), "sign", "best");
            List<Goods> goodsList = null;
            if (tagBest != null) {
                goodsList = getGoodsByTagId(id,tagBest.getId(), 6);
            }
            // 推荐
            // 1、先确定[推荐]的sign
            Tag tagRecommend = tagService.find(getParamMap(), "sign", "recommend");
            List<Goods> goodsRecommendList = null;
            if (tagRecommend != null) {
                goodsRecommendList = getGoodsByTagId(id,tagRecommend.getId(), 6);
                for (Goods goods : goodsRecommendList) {
                    Criteria criteria1 = new Criteria();
                    criteria1.add(Restrictions.eq("goodsId", goods.getId()));
                    List<GoodsImages> imageslist = goodsImagesService.getList(
                            getParamMap(), criteria1);
                    if (imageslist != null&& imageslist.size()>0) {
                        goods.setImage(imageslist.get(0).getPic());
                    }
                }
            }
            processGoodsList(goodsList);
            model.addAttribute("tag", tagBest);
            model.addAttribute("specialPriceGoodsList", goodsList);
            model.addAttribute("tagRecommend", tagRecommend);
            model.addAttribute("goodsRecommendList", goodsRecommendList);
        } catch (Exception e) {
            logger.error("获取2级分类页面数据时发生异常", e);
            e.printStackTrace();
        }
    }

    private void getData3(String catelogPath, Model model,Pager pager) {
        try {
            int position = catelogPath.lastIndexOf(",");
            String id = catelogPath.substring(position + 1,catelogPath.length());
            // 三级分类
            Catelog catelog = catelogService.get(getParamMap(), id);
            model.addAttribute("catelog", catelog);
            // 二级分类
            Catelog parentCatelog = getParement(catelog.getParentId());
            model.addAttribute("parentCatelog", parentCatelog);
            // 一级分类
            Catelog grandCatelog = getParement(parentCatelog.getParentId());
            model.addAttribute("grandCatelog", grandCatelog);
            model.addAttribute("brandList", getCategoryBrandList(id));
            List<AdvertisingImage> advertisingImages = advertisingImageService
                    .getNewAds(getParamMap(), id + "_01%", 4);
            model.addAttribute("advertisingImages", advertisingImages);
            GoodsCategory goodsCategory=categoryService.getGategoryByCatelog(getParamMap(), catelog.getId());
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("isMarketable", 1));
            criteria.add(Restrictions.eq("status", 5));
            criteria.add(Restrictions.eq("categoryId", goodsCategory.getId()));
            if (StringUtils.isNotEmpty(pager.getOrderBy())
                    && StringUtils.isNotEmpty(pager.getOrderType())) {
                criteria.add(Restrictions.order(pager.getOrderBy(), pager
                        .getOrderType().toUpperCase()));
            }
            pager.setPageSize(10);
            pager= goodsService.getPager(getParamMap(), criteria, pager);

            // 重新计算商品评论
            List<Goods> goodsList = (List<Goods>) pager.getList();
            if (goodsList != null && goodsList.size() > 0) {
                List<String> goodsIds = new ArrayList<String>();
                for (Goods goods : goodsList) {
                    goodsIds.add(goods.getId());
                }
                Map<String, Integer> countGoodsReviewMap = new HashMap<String, Integer>();
                Criteria criteriaGoodsReview = new Criteria();
                criteriaGoodsReview.add(Restrictions.in("goodsId", goodsIds));
                List<GoodsReview> goodsReviewList = goodsReviewService.getList(getParamMap(), criteriaGoodsReview);
                if (goodsReviewList != null && goodsReviewList.size() > 0) {
                    for (GoodsReview review : goodsReviewList) {
                        countGoodsReviewMap.put(review.getGoodsId(), countGoodsReviewMap.get(review.getGoodsId()) != null ? countGoodsReviewMap.get(review.getGoodsId()) + 1 : 1);
                    }
                }
                // 重新赋值商品的评论次数
                for (Goods goods : goodsList) {
                    goods.setScoreCount(countGoodsReviewMap.get(goods.getId()));
                }
            }

            model.addAttribute("goodslist", pager.getList());
            model.addAttribute("pager", pager);
            model.addAttribute("total", pager.getTotalCount());

            Criteria criteria2 = new Criteria();
            criteria2.add(Restrictions.eq("parentId",
                    parentCatelog.getParentId()));
            List<Catelog> list3 = catelogService.getList(getParamMap(),
                    criteria2);
            criteria2 = new Criteria();
            List<Catelog> list4 = catelogService.getList(getParamMap(),
                    criteria2);
            model.addAttribute("list3", list3);
            model.addAttribute("list4", list4);

            //add by zx 20150630 hotCommodity
            List<Goods> hotsList = null;
            try {
               // hotsList = (List<Goods>) pager.getList();
                /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
                hotsList = goodsService.getTagGoods4Index(getParamMap(), HOT, 6, getWhichPlat());
                /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
            } catch (Exception e) {
                logger.error("IndexController中getData4IndexTagGoods方法，发生异常：", e);
            }
            model.addAttribute("hotsList", hotsList);
        } catch (Exception e) {
            logger.error("获取3级分类页面数据时发生异常", e);
            e.printStackTrace();
        }
    }

    private List<Catelog> getChildrenList(String parentId) {
        Criteria criteria = new Criteria();
        criteria.add(Restrictions.eq("parentId", parentId));
        List<Catelog> childList = null;
        try {
            childList = catelogService.getList(getParamMap(), criteria);
        } catch (Exception e) {
            logger.error("getChildrenList方法发生异常", e);
            e.printStackTrace();
        }
        return childList;
    }

    private List<Articles> getArticleList(String sign) {
        Criteria criteria = new Criteria();
        criteria.add(Restrictions.eq("sign", sign));
        try {
            List<Articles> articlesList = articlesService.getArticles(
                    getParamMap(), sign, 5, null, null);
            return articlesList;
        } catch (Exception e) {
            logger.error("查询文章列表时");
            e.printStackTrace();
        }
        return null;
    }

    private ArticlesCategory getArtCategory(String sign) {
        Criteria criteria = new Criteria();
        criteria.add(Restrictions.eq("sign", sign));
        criteria.add(Restrictions.eq(Constant.TENANTID_KEY,getTenantId()));
        criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,getPlatform()));
        try {
            List<ArticlesCategory> articlesCategoryList = articlesCategoryService
                    .getList(getParamMap(), criteria);
            return articlesCategoryList.get(0);
        } catch (Exception e) {
            logger.error("查询文章类别时");
            e.printStackTrace();
        }
        return null;
    }

    private Catelog getParement(String parentId) {
        Criteria criteria = new Criteria();
        criteria.add(Restrictions.eq("id", parentId));
        List<Catelog> childList = null;
        try {
            childList = catelogService.getList(getParamMap(), criteria);
        } catch (Exception e) {
            logger.error("getChildrenList方法发生异常", e);
            e.printStackTrace();
        }
        return childList==null?null:childList.get(0);
    }

    // 商品品牌
    private List<GoodsBrand> getCategoryBrandList(String categoryId) {
        GoodsCategory goodsCategory=categoryService.getGategoryByCatelog(getParamMap(), categoryId);
        /*如果找不到对应的商品分类，直接返回-2014-08-02 张书祥-*/
        if(goodsCategory==null){
            return null;
        }
        List<GoodsBrand> goodsBrandList = null;
        try {
            goodsBrandList =  goodsBrandService.getListByGoodsCategoryPath(getParamMap(), goodsCategory.getId() + "%", true);
        }catch (Exception e) {
            logger.error("查询商品品牌时");
            e.printStackTrace();
        }
        /*List<String> BrandIds = categoryService.getBrandIds(getParamMap(),
                goodsCategory.getId() + "%", 7);
        List<GoodsBrand> goodsBrandList = new ArrayList<GoodsBrand>();
        for (String id : BrandIds) {
            try {
                GoodsBrand goodsBrand = goodsBrandService
                        .get(getParamMap(), id);
                goodsBrandList.add(goodsBrand);
            } catch (Exception e) {
                logger.error("查询商品品牌时");
                e.printStackTrace();
            }
        }*/
        return goodsBrandList;
    }

    // 商品信息
    private List<Goods> getGoodsList(String categoryId) {
     //   Catelog catelog = getChildrenList(categoryId).get(0);
     //   GoodsCategory goodsCategory=categoryService.getGategoryByCatelog(getParamMap(), catelog.getId());

        List<Goods> goodsList = null;
        try {
            GoodsCategory goodsCategory = categoryService.getGategoryByCatelog(getParamMap(), categoryId);
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.like("categoryPath", "%"+goodsCategory.getId()+"%"));
            criteria.add(Restrictions.eq("isMarketable", 1));
            criteria.add(Restrictions.eq("status", 5));
            /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
            criteria.add(Restrictions.gt("platform",1));
            /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
            criteria.add(Restrictions.order("isTop", "DESC"));
            criteria.add(Restrictions.order("createDate", "DESC"));
            criteria.add(Restrictions.limit("0", "8"));
            goodsList = goodsService.getList(getParamMap(), criteria);
            for (Goods goods : goodsList)
                for (int i = 0; i < goodsList.size(); i++) {
                    Criteria criteria1 = new Criteria();
                    criteria1.add(Restrictions.eq("goodsId", goods.getId()));
                    List<GoodsImages> imageslist = goodsImagesService.getList(
                            getParamMap(), criteria1);
                    if (imageslist != null&& imageslist.size()>0) {
                        goods.setImage(imageslist.get(0).getPic());
                    }
                }
        } catch (Exception e) {
            logger.error("查询商品信息时");
            e.printStackTrace();
        }
        return goodsList;
    }

    // 根据标签获取商品信息
    private List<Goods> getGoodsByTagId( String catelogId,String tagId, int size) {
        List<Goods> goodsList = null;
        try {
            GoodsCategory goodsCategory = categoryService.getGategoryByCatelog(getParamMap(),catelogId);
            /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
            goodsList = goodsService.getGoodsByTagId(getParamMap(),catelogId, tagId, size, getWhichPlat());
            /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
            for (Goods goods : goodsList) {
                Criteria criteria1 = new Criteria();
                criteria1.add(Restrictions.eq("goodsId", goods.getId()));
                List<GoodsImages> imageslist = goodsImagesService.getList(getParamMap(), criteria1);
                if (imageslist != null && imageslist.size() > 0) {
                    goods.setImage(imageslist.get(0).getPic());
                }
            }
        } catch (Exception e) {
            logger.error("根据标签获取商品信息时发生异常", e);
            e.printStackTrace();
        }
        return goodsList;
    }

    private List<AdvertisingImage> getAdImages(Map<String, Object> paramMap, String sign)
            throws Exception {
        return advertisingImageService.getNewAds(getParamMap(), sign, 3);
    }

    private List<Map<String, Object>> getCategoryOfGoods(Map<String, Object> paramMap, String catelogId, Integer nums) throws Exception {
        GoodsCategory category = categoryService.getGategoryByCatelog(getParamMap(), catelogId);
        return (List<Map<String, Object>>) categoryService.getCategoryOfGoods(getParamMap(), category.getId(), nums);
    }

    private void processGoodsList(List<Goods> goodsList) throws Exception {
        if (goodsList != null && goodsList.size() > 0) {
            for (Goods goods : goodsList) {
                Criteria criteria1 = new Criteria();
                criteria1.add(Restrictions.eq("goodsId", goods.getId()));
                List<GoodsImages> imageslist = goodsImagesService.getList(
                        getParamMap(), criteria1);
                if (imageslist != null&& imageslist.size()>0) {
                    goods.setImage(imageslist.get(0).getPic());
                }
            }
        }
    }
    // 首页公告下方广告图片
    private AdvertisingImage getNewsAd(String sign, int size) {
        AdvertisingImage newsAd = null;
        try {
            List<AdvertisingImage> newsAdList = advertisingImageService.getAds(getParamMap(), sign, size);
            if (newsAdList != null && newsAdList.size() > 0) {
                newsAd = newsAdList.get(0);
            }
        } catch (Exception e) {
            logger.error("获取 首页公告下方广告图片时发生异常", e);
            e.printStackTrace();
        }
        return newsAd;
    }
}
