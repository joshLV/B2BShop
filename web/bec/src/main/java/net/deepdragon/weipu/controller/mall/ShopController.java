package net.deepdragon.weipu.controller.mall;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.weipu.*;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.service.AreaService;
import net.deepdragon.util.Constant;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.net.URLDecoder;
import java.util.*;

/**
 * 店铺相关
 */
@Controller(Global.APP_SIGN + Global.MALL + "ShopController")
@RequestMapping(Global.MALL_PATH + "/shopExtend")
public class ShopController extends BaseMallController {
	@Resource
	private CacheData cacheData;
	@Resource
	private MerchantService shopService;
    @Resource
    private MerchantUserService merchantUserService;
    @Resource
    private AreaService areaService;
    @Resource
    private TagService tagService;
    @Resource
    private GoodsImagesService goodsImagesService;
    @Resource
    private GoodsService goodsService;
    @Resource
    private CarouselAdvertisingService carouselAdvertisingService;
    @Resource
    private AdvertisingImageService advertisingImageService;
    @Resource
    private GoodsCategoryService goodsCategoryService;
    @Resource
    private IndexShopService indexShopService;
    /**
     * 店铺访问入口
     *
     * @param urlAddress  店铺地址
     */
    @RequestMapping(value = "/detail/{urlAddress}")
	public String index(@PathVariable String urlAddress, Model model) {
        String info = "店铺[" + urlAddress + "]";
        setLogInfo(info);
		logger.error(info);


        try {
            Merchant shop = shopService.find(getParamMap(), "urlAddress", urlAddress);
            if (shop.getStatus() == 3) {
                logger.error("店铺" + shop);

                model.addAttribute("shop", shop);

                // 获取商品标签
                List<String> signList = new ArrayList<String>();
                signList.add("highRecommended");   // 掌柜推荐
                signList.add("specialoffer");   // 排行
                signList.add("explosion");      // 推荐
                signList.add("best");           // 热销
                signList.add("hot");            // 新品上架
                Criteria criteria = new Criteria();
                criteria.add(Restrictions.in("sign", signList));
                criteria.add(Restrictions.eq(Constant.TENANTID_KEY,getTenantId()));
                criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,getPlatform()));
                List<Tag> tagList = tagService.getList(getParamMap(), criteria);
                Map<String, String> tagMap = new HashMap<String, String>();
                if (tagList != null && tagList.size() > 0) {
                    for (Tag tag : tagList) {
                        tagMap.put(tag.getSign(), tag.getId());
                    }
                }

                model.addAttribute("otherGoodsList", getGoodsByShopId(shop.getId()));
                model.addAttribute("currWeekGoodsList", getGoodsByTagIdInShop(shop.getId(), tagMap.get("highRecommended"), 6));  // 本周排行
                model.addAttribute("recommendGoodsList", getGoodsByTagIdInShop(shop.getId(), tagMap.get("explosion"), 6));    // 店长推荐
                model.addAttribute("hotSaleGoodsList", getGoodsByTagIdInShop(shop.getId(), tagMap.get("best"), 3));            // 热销商品
                model.addAttribute("newGoodsList", getGoodsByTagIdInShop(shop.getId(), tagMap.get("hot"), 4));                  // 新品上架
            }
        } catch (Exception e) {
            logger.error("访问" + info + "时，发生异常", e);
        }
        model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
		model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
		model.addAttribute("services", cacheData.getServices(getParamMap()));

		return Global.TEMPLATE_MALL + PATH + "/shop/default";
	}

    /**
     * 获取店铺的标签(wp_tag下的id)商品列表
     * criteria 必须要有的条件：tagId、isMarketable、shopId、size(取多少条数据)
     *
     * @param shopId 店铺Id
     * @param tagId  商品标签
     * @param size   取多少条数据
     */
    private List<Goods> getGoodsByTagIdInShop(String shopId, String tagId, int size) throws Exception {
        Map<String , Object> selectParamMap = new HashMap<String, Object>();
        selectParamMap.put("tagId", tagId);
        selectParamMap.put("isMarketable", 1);
        selectParamMap.put("shopId", shopId);
        selectParamMap.put("size", size);
        /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
        selectParamMap.put("platform", getWhichPlat());
        /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
        List<Goods> goodsList = goodsService.getGoodsByTagIdInShop(getParamMap(), selectParamMap);
        for (Goods goods : goodsList) {
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("goodsId", goods.getId()));
            List<GoodsImages> imageslist = goodsImagesService.getList(getParamMap(), criteria);
            if (imageslist != null && imageslist.size() > 0) {
                goods.setPic(imageslist.get(0).getPic());
            }
        }

        return goodsList;
    }
    /**
     * 获取店铺的所有商品
     *
     * @param shopId 店铺Id
     */
    private List<Goods> getGoodsByShopId(String shopId){
        Criteria criteria = new Criteria();
        criteria.add(Restrictions.eq("shopId", shopId));
        criteria.add(Restrictions.eq("isMarketable", 1));
        criteria.add(Restrictions.eq("status", 5));
        /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
        criteria.add(Restrictions.gt("platform", 1));
        /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
        List<Goods> goodsList=null;
        try {
            goodsList = goodsService.getList(getParamMap(),criteria);
            for (Goods goods : goodsList) {
                Criteria criteriaPic = new Criteria();
                criteriaPic.add(Restrictions.eq("goodsId", goods.getId()));
                List<GoodsImages> imageslist = goodsImagesService.getList(getParamMap(), criteriaPic);
                if (imageslist != null && imageslist.size() > 0) {
                    goods.setPic(imageslist.get(0).getPic());
                }
            }
        } catch (Exception e) {
            logger.error("根据店铺查询所有商品时");
            e.printStackTrace();
        }
        return goodsList;
    }

    @RequestMapping(value = "search")
    public String search(Model model,HttpServletRequest request,Pager pager) {
        String info = "全站搜索";
        setLogInfo(info);
        logger.debug(info);
        List<Goods> goodsList=null;
        String shopId = request.getParameter("shopId");
        String keyword= request.getParameter("keyword");
        Criteria criteria = new Criteria();
        criteria.add(Restrictions.like("name", "%"+keyword+"%"));
        criteria.add(Restrictions.eq("shopId",shopId));
        criteria.add(Restrictions.eq("status",5));
        /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
        criteria.add(Restrictions.gt("platform",1));
        /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
        try {
            int size = getGoodsByShopId(shopId).size();
            model.addAttribute("size", size);
            if (StringUtils.isNotEmpty(pager.getOrderBy())
                    && StringUtils.isNotEmpty(pager.getOrderType())) {
                criteria.add(Restrictions.order(pager.getOrderBy(), pager
                        .getOrderType().toUpperCase()));
            }
            pager= goodsService.getPager(getParamMap(), criteria, pager);
        } catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }
        model.addAttribute("shop_index", getNewsAd("shop_index", 1));
        model.addAttribute("goodsList", pager.getList());

        return Global.TEMPLATE_MALL + PATH + "/shop/shop_result";
    }
    @RequestMapping(value = "shopGoods/{shopId}")
    public String getshopGoods(@PathVariable String shopId, Model model) {
        String info = "店铺所有商品";
        setLogInfo(info);
        logger.debug(info);
        List<Goods> goodsList=null;
        Merchant merchant=null;
        try {
            merchant = shopService.get(getParamMap(),shopId);
            int size = getGoodsByShopId(shopId).size();
            model.addAttribute("size", size);
            model.addAttribute("shop_index", getNewsAd("shop_index", 1));
            goodsList=getGoodsByShopId(shopId);
        } catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }
        model.addAttribute("merchant", merchant);
        model.addAttribute("goodsList", goodsList);

        return Global.TEMPLATE_MALL + PATH + "/shop/shop_goods";
    }
    // 上方广告图片
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

    // 轮播图片
    private List<CarouselAdvertising> getAdslides(String sign) {
        List<CarouselAdvertising> adslideImages = null;
        try {
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq(Constant.TENANTID_KEY,getTenantId()));
            criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,getPlatform()));
            adslideImages = carouselAdvertisingService.getList(getParamMap(), criteria);
        } catch (Exception e) {
            logger.error("获取首页中间轮播图片时发生异常", e);
            e.printStackTrace();
        }
        return adslideImages;
    }

    @RequestMapping(value = "list")
    public String list(Merchant merchant,Model model,Pager pager,HttpServletRequest request) {
        String info = "供应商列表页";
        setLogInfo(info);
        logger.error(info);
        getAllCatelog(model);// 首页类目展示

        try {
            Criteria criteria = new Criteria();

            model.addAttribute("s_name", merchant.getName());
            if (net.deepdragon.util.StringUtil.isNotEmpty(merchant.getName())) {
                merchant.setName(URLDecoder.decode(merchant.getName(), "UTF-8"));

                criteria.add(Restrictions.or(Restrictions.like("name", "%" + merchant.getName() + "%"),Restrictions.like("name", "%"+merchant.getName()+"%")));

                //查询来自于顶部搜索栏
                if( "top".equals( request.getParameter("s"))){
                    model.addAttribute("keyword", merchant.getName());
                }
            }

            criteria.add(Restrictions.eq("status", 3));//启用的
            criteria.add(Restrictions.order("name", "desc"));

            pager.setPageSize(12);
            pager = this.shopService.getPager(getParamMap(), criteria, pager );

            model.addAttribute("shop", merchant);
            model.addAttribute("pager", pager);
            model.addAttribute("total", pager.getTotalCount());

            //价格是否隐藏
            Buyer buyer = getCurrentMember(request);
            if (!net.deepdragon.util.StringUtil.isNotEmpty(buyer)) {
                model.addAttribute("priceHide", "hide");
            }

            setPublicDate2Model(model);
        }catch (Exception e){
            logger.error("获取所有商品时，发生异常", e);
            e.printStackTrace();
        }

        return Global.TEMPLATE_MALL + PATH + "/shop_list";
    }

    /**
     * 附近商家列表
     * @param merchant
     * @param model
     * @param pager
     * @param request
     * @return
     */
    @RequestMapping(value = "list4Mob")
    public String list4Mob(Merchant merchant,Model model,Pager pager,HttpServletRequest request) {
        String info = "附近供应商列表页";
        setLogInfo(info);
        logger.error(info);

        Double atitude=0.00;
        Double longitude=0.00;
        try {
            if(request.getParameter("atitude")!=null && !request.getParameter("atitude").equals("") && request.getParameter("longitude")!=null && !request.getParameter("longitude").equals("")){
                atitude= Double.parseDouble(request.getParameter("atitude"));
                longitude= Double.parseDouble(request.getParameter("longitude"));
                Criteria criteria = new Criteria();
                Map<String,Object> map=getParamMap();

                map.put("atitude",atitude+"");
                map.put("longitude",longitude+"");

                //距离过滤
                if(request.getParameter("filterType")!=null && request.getParameter("filterType").equals("km")){
                    map.put("filterType","km");
                    if(request.getParameter("km_GT")!=null && !request.getParameter("km_GT").equals("") && request.getParameter("km_LT")!=null && !request.getParameter("km_LT").equals("")){
                        map.put("filter","GT_LT");
                        map.put("km_GT",Integer.parseInt(request.getParameter("km_GT")));
                        map.put("km_LT",Integer.parseInt(request.getParameter("km_LT")));

                        model.addAttribute("filter", "filter");
                        model.addAttribute("km_GT",Integer.parseInt(request.getParameter("km_GT")));
                        model.addAttribute("km_LT",Integer.parseInt(request.getParameter("km_LT")));
                    }
                    if(request.getParameter("km_GT")!=null && !request.getParameter("km_GT").equals("") && (request.getParameter("km_LT")==null || request.getParameter("km_LT").equals(""))){
                        map.put("filter","GT");
                        map.put("km_GT",Integer.parseInt(request.getParameter("km_GT")));

                        model.addAttribute("filter", "GT");
                        model.addAttribute("km_GT",Integer.parseInt(request.getParameter("km_GT")));
                    }
                    if((request.getParameter("km_GT")==null || request.getParameter("km_GT").equals("")) && request.getParameter("km_LT")!=null && !request.getParameter("km_LT").equals("")){
                        map.put("filter","LT");
                        map.put("km_LT",Integer.parseInt(request.getParameter("km_LT")));

                        model.addAttribute("filter", "LT");
                        model.addAttribute("km_LT",Integer.parseInt(request.getParameter("km_LT")));
                    }
                }


                //销量过滤
                if(request.getParameter("filterType")!=null && request.getParameter("filterType").equals("sile")){
                    map.put("filterType","sile");

                    model.addAttribute("filterType", "sile");
                    if(request.getParameter("sile_GT")!=null && !request.getParameter("sile_GT").equals("") && request.getParameter("sile_LT")!=null && !request.getParameter("sile_LT").equals("")){
                        map.put("filter","GT_LT");
                        map.put("sile_GT",Integer.parseInt(request.getParameter("sile_GT")));
                        map.put("sile_LT",Integer.parseInt(request.getParameter("sile_LT")));

                        model.addAttribute("filter", "GT_LT");
                        model.addAttribute("sile_GT", Integer.parseInt(request.getParameter("sile_GT")));
                        model.addAttribute("sile_LT", Integer.parseInt(request.getParameter("sile_LT")));

                    }
                    if(request.getParameter("sile_GT")!=null && !request.getParameter("sile_GT").equals("") && (request.getParameter("sile_LT")==null || request.getParameter("sile_LT").equals(""))){
                        map.put("filter","GT");
                        map.put("sile_GT",Integer.parseInt(request.getParameter("sile_GT")));

                        model.addAttribute("filter", "GT");
                        model.addAttribute("sile_GT", Integer.parseInt(request.getParameter("sile_GT")));

                    }
                    if((request.getParameter("sile_GT")==null || request.getParameter("sile_GT").equals("")) && request.getParameter("sile_LT")!=null && !request.getParameter("sile_LT").equals("")){
                        map.put("filter","LT");
                        map.put("sile_LT",Integer.parseInt(request.getParameter("sile_LT")));

                        model.addAttribute("filter", "LT");
                        model.addAttribute("sile_LT",Integer.parseInt(request.getParameter("sile_LT")));
                    }
                }




                //pager.setPageSize(3);
                pager=indexShopService.getPagerJl(map, criteria, pager);
                model.addAttribute("pager", pager);
            }
        }catch (Exception e){
            logger.error("附近供应商列表页，发生异常", e);
            e.printStackTrace();
        }

        return Global.TEMPLATE_APP + PATH + "/shop_list";
    }

    @RequestMapping(value = "list4MobMap")
    public String list4MobMap(Merchant merchant,Model model,Pager pager,HttpServletRequest request) {
        try {
            model.addAttribute("atitude", request.getParameter("atitude"));
            model.addAttribute("longitude",request.getParameter("longitude"));
            model.addAttribute("address",request.getParameter("address"));
        }catch (Exception e){
            logger.error("附近供应商列表页，发生异常", e);
            e.printStackTrace();
        }

        return Global.TEMPLATE_APP + PATH + "/shop_map";
    }
}
