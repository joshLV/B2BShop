package net.deepdragon.weipu.controller.mall;

import net.deepdragon.bean.Pager;
import net.deepdragon.bean.SystemSetKey;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.Constant;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.tools.CrossborderUtil;
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
    @Resource
    private HistoryService historyService;

    public final static String HOT = "hot";

    @RequestMapping(value = "")
    public String index(@RequestParam(value = "cat") String catelogPath,String goodsShortName, String goodsCategory, Model model,Pager pager,HttpServletRequest request) {
        String info = "商品列表页";
        setLogInfo(info);
        getAllCatelog(model);// 首页类目展示
        logger.info(info);
//        int level = 1;
//        level = StringUtils.split(catelogPath, ",").length;

        getData(catelogPath.substring(catelogPath.indexOf(",") + 1), model, pager,request, goodsShortName,goodsCategory,catelogPath.contains(Global.WHICH_APP));
//        switch (level) {
//            case 1:
//                getData1(catelogPath, model);
//                break;
//            case 2:
//                getData2(catelogPath, model);
//                getData2(catelogPath, model);
//                break;
//            case 3:
//                getData3(catelogPath, model,pager);
//                break;
//            default:
//                break;
//        }
        String[] catids = StringUtils.split(catelogPath, ",");
        String catid = catids[catids.length-1];
        AdvertisingImage classAd = getNewsAd("class_ad_"+catid,1);
        if(classAd != null){
            model.addAttribute("classad",classAd);
        }
        model.addAttribute("brandMore",request.getParameter("brandMore"));
        setPublicDate2Model( model );
        model.addAttribute("categoryBrandList",getCategoryBrandList(catelogPath));
        model.addAttribute("catelogPath",catelogPath);
        //大家还买了
        getMaxSalesCountGoods(model, request,catelogPath);
        List<Catelog> catelogList = catelogService.getAllParents(getParamMap());
        model.addAttribute("catelogs",catelogList);
        if(catelogPath.contains(Global.WHICH_APP)){
            return Global.TEMPLATE_APP + PATH + "/goods_list";
        }else{
            return Global.TEMPLATE_MALL + PATH + "/list_3";
        }
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
    private void getData(String catelogPath, Model model, Pager pager,HttpServletRequest request,String goodsShortName, String goodsCategory, boolean isAppClient){
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
                categoryLikeId = categoryPath[2];
            }

            if(categoryPath.length == 2){
                categoryLikeId = categoryPath[1];
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
            String price = request.getParameter("price");

            if(StringUtil.isNotEmpty(price)){
                model.addAttribute("priceFlag", price); // 将查询条件价格返回给页面 Auth:zhangqiang Time:2015-09-28 13:37:35 Start
                //M2400L3799
                String[] priceArr = price.replace("M","").split("L");

                if( priceArr.length == 1 && StringUtil.isNotEmpty(priceArr[0])){
                    int priS = Integer.parseInt(priceArr[0]);

                    criteria.add(Restrictions.ge("price", priS));

                    model.addAttribute("priS", priS);
                    model.addAttribute("priE", "");
                }else if( StringUtil.isEmpty(priceArr[0]) &&  StringUtil.isNotEmpty(priceArr[1])){
                    int priE = Integer.parseInt(priceArr[1]);

                    criteria.add(Restrictions.le("price", priE));

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
                    criteria.add(Restrictions.between("price", priS, priE));

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
            String brandId = request.getParameter("brand");
            if(StringUtil.isNotEmpty(brandId)){
                model.addAttribute("brandFlag", brandId); //将查询条件品牌返回给页面 Auth:zhangqiang Time:2015-09-28 13:37:35 Start
                criteria.add(Restrictions.eq("brandId", brandId));
            }

            /*
             *页面选择排序查询条件时 查询商品sql加排序条件 Auth:zhangqiang Time:2015-09-30 15:48:35 Start
             */
            String orderBy = request.getParameter("orderBy");
            if(StringUtil.isNotEmpty(orderBy)){
                model.addAttribute("orderByFlag", orderBy);
                model.addAttribute("orderByType", pager.getOrderType());
            }


            if (StringUtils.isNotEmpty(pager.getOrderBy())
                    && StringUtils.isNotEmpty(pager.getOrderType())) {


                //APP端或微信端按人气排序规则：先按销量排序然后再按照评价排序
                if(isAppClient && "scoreCount".equals(pager.getOrderBy())){
                    criteria.add(Restrictions.order("sales", pager.getOrderType().toUpperCase()));
                    criteria.add(Restrictions.order(pager.getOrderBy(), pager.getOrderType().toUpperCase()));
                }else{
                    criteria.add(Restrictions.order(pager.getOrderBy(), pager.getOrderType().toUpperCase()));
                }
            }


            criteria.add(Restrictions.lt("platform", 3)); //添加所属平台参数  hks 2015-11-10 18:09:58 modify  start
            if(StringUtil.isNotEmpty(goodsShortName)){
                goodsShortName = URLDecoder.decode(goodsShortName, "UTF-8");
                criteria.add(Restrictions.or(Restrictions.like("shortName", "%" + goodsShortName + "%"), Restrictions.like("name", "%" + goodsShortName + "%")));
                model.addAttribute("goodsShortName",goodsShortName);
            }
            if( StringUtils.isNotEmpty(goodsCategory) ) { //商品分类
                goodsCategory = URLDecoder.decode(goodsCategory, "UTF-8");
//                criteria.add(Restrictions.like("clName", "%" + goodsCategory + "%"));
                model.addAttribute("goodsCategory",goodsCategory);
            }
            pager.setPageSize(12);

            if("true".equals( getSystemSetByKey(SystemSetKey.singleProductUnique) )){
                criteria.add(Restrictions.group( "productId" ));
            }

            pager= goodsService.getPager4BEC(getParamMap(), criteria, pager);
            /*
             *商品评论现在通过数据库触发器自动增加到商品表中，不需要在去评论表查数据 Auth:zhangqiang Time:2015-09-24 17:17:25 Start
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

            //判断跨境商品 开关 是否打开
            if(CrossborderUtil.isCrossborder()){//打开
                if(pager.getList().size() > 0 && pager.getList() != null){
                    List<Goods> gList = (List<Goods>) pager.getList();
                    model.addAttribute("goodslist",getIfCrossborder(gList));
                }
            }else{
                model.addAttribute("goodslist", pager.getList());
            }

            model.addAttribute("pager", pager);
            model.addAttribute("total", pager.getTotalCount());

            //获取Session中是否有登录信息 没有则加标识 首页商品价格不可见
            Member member = getCurrentMember(request);
            if(!net.deepdragon.util.StringUtil.isNotEmpty(member)){
                model.addAttribute("priceHide", "hide");
            }

            //add by zx 20150630 hotCommodity
            List<Goods> hotsList = null;
            try {
                hotsList = goodsService.getTagGoods4Index(getParamMap(), HOT, 6, getWhichPlat()); // 添加所属平台参数  hks 2015-11-10 18:09:58 modify  start
            } catch (Exception e) {
                logger.error("IndexController中getData4IndexTagGoods方法，发生异常：", e);
            }
            model.addAttribute("hotsList", hotsList);
        } catch (Exception e) {
            logger.error("获取3级分类页面数据时发生异常", e);
            e.printStackTrace();
        }
    }

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

            if(categoryPath.length == 3){
                // 三级分类
                //catelogPath = categoryPath[0]+","+categoryPath[2];
                Catelog catelog = catelogService.get(getParamMap(), categoryPath[2]);
                model.addAttribute("catelog", catelog);
                /**查询商品分类下的品牌 从分类最父级的iD查询 Auth:zhangqiang Time:2015-09-24 15:32:35 Start */
//                model.addAttribute("brandList", getCategoryBrandList(categoryPath[2]));
                /**查询商品分类下的品牌 从分类最父级的iD查询 Auth:zhangqiang Time:2015-09-24 15:32:35 End */
                List<AdvertisingImage> advertisingImages = advertisingImageService
                        .getNewAds(getParamMap(), categoryPath[2] + "_01%", 4);
                model.addAttribute("advertisingImages", advertisingImages);
//                categoryLikeId = categoryPath[0]+","+categoryPath[2];

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
//                categoryLikeId = catelogPath;

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
            List<Catelog> refCatelogList = new ArrayList<Catelog>();
            List<GoodsBrand> brandRefList = new ArrayList<GoodsBrand>();
            Catelog catelogType = catelogService.getCatelogByGategory(getParamMap(), categoryPath[categoryPath.length-1]);
            if(!catelogType.getPath().contains(",")) {
                Map<String,Object> catelogs=new HashMap<String, Object>();
                catelogs.put("l1_id",catelogType.getId());
                catelogs.put("l1_name",catelogType.getName());
                catelogs.put("l2_id",null);
                catelogs.put("l2_name",null);
                catelogs.put("l3_id",null);
                catelogs.put("l3_name",null);
                catelogs.put("l4_id",catelogType.getGrandfather());
                breadcrumbCatList.add(catelogs);
            }else {
                if (catelogType.getPath().split(",").length == 2) {
                    Map<String, Object> catelogs = new HashMap<String, Object>();
                    if (categoryPath.length == 3) {
                        Catelog parentCatelog = catelogService.getCatelogByGategory(getParamMap(), catelogType.getParentId());
                        Catelog rootCatelog = catelogService.getCatelogByGategory(getParamMap(), parentCatelog.getParentId());
//					catelogs.put("l1_id",parentCatelog.getId());
                        catelogs.put("l1_id", rootCatelog.getId());
                        catelogs.put("l1_name", rootCatelog.getName());
                        catelogs.put("l2_id", parentCatelog.getId());
                        catelogs.put("l2_name", parentCatelog.getName());
                        catelogs.put("l3_id", catelogType.getId());
                        catelogs.put("l3_name", catelogType.getName());
                        catelogs.put("l4_id", catelogType.getGrandfather());
                    }
                    if (categoryPath.length == 2) {
                        Catelog rootCatelog = catelogService.getCatelogByGategory(getParamMap(), catelogType.getParentId());
                        catelogs.put("l1_id", rootCatelog.getId());
                        catelogs.put("l1_name", rootCatelog.getName());
                        catelogs.put("l2_id", catelogType.getId());
                        catelogs.put("l2_name", catelogType.getName());
                    }

                    breadcrumbCatList.add(catelogs);
                } else {
                    breadcrumbCatList = goodsService.getGoods4Category(getParamMap(), catelogType.getId());
                }
            }

            // 加载当前商品的前台分类的相关分类(兄弟分类)
            Criteria criteriaType = new Criteria();
            criteriaType.add(Restrictions.eq("parentId", catelogType.getParentId()));
            refCatelogList = catelogService.getList(getParamMap(), criteriaType);
            // 加载同类其他品牌
            if(categoryPath.length==3) {//只有商品存在子集目录时才会有同类其他品牌
                brandRefList = goodsService.getBrandListByGoodsCatId(getParamMap(), categoryPath[categoryPath.length-1]);
            }

            model.addAttribute("refCatelogList", refCatelogList);
            model.addAttribute("brandRefList", brandRefList);
            model.addAttribute("breadcrumbCatList", breadcrumbCatList);

            /******************** #20151116 dzz **********************/

            model.addAttribute("brandList", getCategoryBrandList(categoryPath[0])); //查询商品分类下的品牌 从分类最父级的iD查询 Auth:zhangqiang Time:2015-09-24 15:32:35 Start
            Criteria criteria = new Criteria();
            String price = request.getParameter("price");

            if(StringUtil.isNotEmpty(price)){
                model.addAttribute("priceFlag", price); //将查询条件价格返回给页面 Auth:zhangqiang Time:2015-09-28 13:37:35 Start
                //M2400L3799
                String[] priceArr = price.replace("M","").split("L");
                criteria.add(Restrictions.gt("price", Integer.parseInt( priceArr[0] )));
                criteria.add(Restrictions.le("price", Integer.parseInt( priceArr[1] )));
            }

            criteria.add(Restrictions.eq("isMarketable", 1));
            criteria.add(Restrictions.eq("status", 5));
            criteria.add(Restrictions.like("categoryPath", catelogPath + "%")); //查询商品分类下的品牌 从分类最父级的iD查询 Auth:zhangqiang Time:2015-09-24 15:32:35 Start
            //criteria.add(Restrictions.like("categoryPath", categoryLikeId + "%"));

            /*
             *页面选择品牌查询条件时 查询商品sql加品牌条件 Auth:zhangqiang Time:2015-09-24 15:34:35 Start
             */
            String brandId = request.getParameter("brand");
            if(StringUtil.isNotEmpty(brandId)){
                model.addAttribute("brandFlag", brandId); //将查询条件品牌返回给页面 Auth:zhangqiang Time:2015-09-28 13:37:35 Start
                criteria.add(Restrictions.eq("brandId", brandId));
            }

            /*
             *页面选择排序查询条件时 查询商品sql加排序条件 Auth:zhangqiang Time:2015-09-30 15:48:35 Start
             */
            String orderBy = request.getParameter("orderBy");
            if(StringUtil.isNotEmpty(orderBy)){
                model.addAttribute("orderByFlag", orderBy);
            }

            //APP端或微信端按人气排序规则：先按销量排序然后再按照评价排序
            if (StringUtils.isNotEmpty(pager.getOrderBy())
                    && StringUtils.isNotEmpty(pager.getOrderType())) {
                if( Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT)) && "scoreCount".equals(pager.getOrderBy())){
                    criteria.add(Restrictions.order("sales", pager
                            .getOrderType().toUpperCase()));
                    criteria.add(Restrictions.order(pager.getOrderBy(), pager
                            .getOrderType().toUpperCase()));
                }else{
                    criteria.add(Restrictions.order(pager.getOrderBy(), pager
                            .getOrderType().toUpperCase()));
                }

            }

            criteria.add(Restrictions.lt("platform", 3)); //添加所属平台参数  hks 2015-11-10 18:09:58 modify  start

            pager.setPageSize(12);
            pager= goodsService.getPager(getParamMap(), criteria, pager);
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
            criteria2.add(Restrictions.eq("parentId", parentCatelog.getParentId()));
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
        /*List<String> BrandIds = categoryService.getBrandIds(getParamMap(), goodsCategory.getId() + "%", 7);
        List<GoodsBrand> goodsBrandList = new ArrayList<GoodsBrand>();
        for (String id : BrandIds) {
            try {
                GoodsBrand goodsBrand = goodsBrandService.get(getParamMap(), id);
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
            criteria.add(Restrictions.lt("platform",3));
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
    /**
     * @desc 获取当前商品分类下销量靠前的数据
     * @Auth zhangqiang
     * @Time 2015-11-19 16:52:35
     * @param model
     * @param request
     * @throws Exception
     */
    public void getMaxSalesCountGoods(Model model, HttpServletRequest request,String catelogId){
        List<Goods> goodsCatelogCountList = null;
        catelogId = catelogId.substring(1,catelogId.length())+",%";
        try {
            if (StringUtil.isNotEmpty(catelogId)) {
                /*Criteria criteria = new Criteria();
                criteria.add(Restrictions.eq("isMarketable", 1));
                criteria.add(Restrictions.eq("status", 5));
                criteria.add(Restrictions.ge("platform",2));
                criteria.add(Restrictions.like("categoryPath",catelogId));
                criteria.add(Restrictions.order("sales", "DESC"));
                criteria.add(Restrictions.group("a.id"));
                criteria.add(Restrictions.limit("0", "3"));
                goodsCatelogCountList = goodsService.getGoodsCatelogCountList(getParamMap(), criteria);
                model.addAttribute("goodsFirstList", goodsCatelogCountList);*/

                goodsCatelogCountList = historyService.getGoodsByCatelog4ViewCount(getParamMap(), catelogId);
                model.addAttribute("goodsFirstList", goodsCatelogCountList);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
