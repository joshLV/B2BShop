package net.deepdragon.weipu.controller.mall;

import static org.springframework.web.util.HtmlUtils.htmlUnescape;

import java.text.DateFormat;
import java.util.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.allinpay.ets.client.StringUtil;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.cuxiao.Promotions;
import net.deepdragon.entity.cuxiao.PromotionsGoods;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.service.cuxiao.PromotionsGoodsService;
import net.deepdragon.service.cuxiao.PromotionsService;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.Constant;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.staticize.Staticize;
import net.deepdragon.weipu.tools.CrossborderUtil;
import net.deepdragon.weipu.tools.UploadTools;
import net.deepdragon.weipu.tools.mail.MailTools;
import net.deepdragon.weipu.tools.mail.SimpleMailSender;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.tools.mail.MailSenderInfo;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;
import sun.misc.BASE64Decoder;

/**
 * 前台主页面
 */
@Controller(Global.APP_SIGN + Global.MALL + "IndexController")
@RequestMapping("")
public class IndexController extends BaseMallController {
    @Resource
    private NavigationService navigationService;
    @Resource
    private ArticlesCategoryService articlesCategoryService;
    @Resource
    private ArticlesService articlesService;
    @Resource
    private CarouselAdvertisingService carouselAdvertisingService;
    @Resource
    private CacheData cacheData;
    @Resource
    private MemberService memberService;
    @Resource
    private GoodsCategoryService goodsCategoryService;
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
    private WonderfulShowService wonderfulShowService;
    @Resource
    private CatelogIndexService catelogIndexService;
    @Resource
	private IndexShopService indexShopService;
    @Resource
	private TodayCommendService tcService;
    @Resource
    private CarBrandService carBrandService;
    @Resource
    private CarSeriesService carSeriesService;
    @Resource
    private CartypeService  cartypeService;
    @Resource
    private OrderService orderService;
    @Resource
    private SMSLogService smsLogService;
    @Resource
    private FriendlyLinkService friendlyLinkService;
    @Resource
    private SystemSetService systemSetService;
    @Resource
    private PromotionsService promotionsService;
    @Resource
    private PromotionsGoodsService promotionsGoodsService;
    //定义允许上传的文件扩展名
    private static HashMap<String, String> extMap = new HashMap<String, String>();
    static {
        extMap.put("image", "gif,jpg,jpeg,png,bmp");
        extMap.put("flash", "swf,flv");
        extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
        extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
    }
    @RequestMapping(value = "index")
    @Staticize(name = "index")
    public String index(Model model, HttpServletRequest request) {
        String info = "进入前台主页面";
        setLogInfo(info);
        logger.debug(info);
        getAllCatelog(model);// 首页类目展示
        setPublicDate2Model( model );
        model.addAttribute("adslides", getAdslides("index"));
        model.addAttribute("notices", getNotice("notice"));
        model.addAttribute("activity",getNotice("mthd"));
        model.addAttribute("carbrandList", getCarBrandList());
//        model.addAttribute("carSeriesList", getCarSeriesList());
//        model.addAttribute("cartypeList", getCartypeList());
        //首页轮播广告下方展示的商品信息(不同标签的)
        getData4IndexTagGoods(model);
        //品牌旗舰店的数据
        getData4IndexShop(model);
        //getData4Indexbrand(model);
        //楼层展示的数据
        getData4IndexFloor(model);
        // 首页右侧的“爱车档案”和“今日爆款”数据
        getData4IndexSlide(model,"6");
        /** 首页展示会员信息 addBy hks 2015-10-28  start **/

        //获取ULife头条（港务区微信商场）
        getTopNews(model);

        //获取秒杀、团购广告位图片
        getMTAdvertisingImg(model);

        //获取头部广告
        AdvertisingImage topAd=getNewsAd("top_1",1);
        if( topAd != null) {
            model.addAttribute("topad", topAd);
        }
        //获取Session中是否有登录信息 没有则加标识 首页商品价格不可见
        Member member = getCurrentMember(request);
        if(!net.deepdragon.util.StringUtil.isNotEmpty(member)){
            model.addAttribute("memberLogin", "hide");
        }else{
            model.addAttribute("member",member);
            getConvenientTips(model,request);
        }
        /** 首页展示会员信息 addBy hks 2015-10-28  end **/

        model.addAttribute("articleComn", getArticlesBySign(getTenantId()));
        return Global.TEMPLATE_MALL + PATH + "/index";
    }

    /**
     * 获取秒杀、团购广告位图片
     * @param model
     */
    private void getMTAdvertisingImg(Model model) {
        try {

            //团购
            List<AdvertisingImage> tgList = advertisingImageService.getAds(getParamMap(), "cx_group", 1);
            if (tgList != null && tgList.size() > 0) {
                AdvertisingImage tgImg = tgList.get(0);
                model.addAttribute("tgImge", tgImg.getPic());
            }

            //秒杀
            List<AdvertisingImage> msList = advertisingImageService.getAds(getParamMap(), "cx_seckill", 1);
            if (msList != null && msList.size() > 0) {
                AdvertisingImage msImg = msList.get(0);
                model.addAttribute("msImge", msImg.getPic());
            }

        }catch (Exception e){
            logger.error("查询团购秒杀广告图片时出错:", e.getMessage());
        }

    }

    /**
     * 便利提醒统计数量
     */
    private void getConvenientTips(Model model, HttpServletRequest request) {
        String memberId = getCurrentMember(request).getId();
        try {
            Criteria c1 = new Criteria();
            c1.add(Restrictions.eq("memberId", memberId));
            c1.add(Restrictions.eq("orderStatus", Order.OrderStatus.wait_buyer_pay.toString()));
            c1.add(Restrictions.eq("paymentStatus", Order.PaymentStatus.unpaid.toString()));
            List<Order> orderFuKuanCountList = orderService.getList(getParamMap(), c1);
            model.addAttribute("orderFuKuanCount", orderFuKuanCountList != null ? orderFuKuanCountList.size() : 0); // 待付款
            Criteria c2 = new Criteria();
            c2.add(Restrictions.eq("memberId", memberId));
            c2.add(Restrictions.eq("orderStatus", Order.OrderStatus.wait_seller_send_goods.toString()));
//            c2.add(Restrictions.eq("paymentStatus", Order.PaymentStatus.paid.toString()));
            c2.add(Restrictions.eq("shippingStatus", Order.ShippingStatus.unshipped.toString()));
            List<Order> orderFaHuoCountList = orderService.getList(getParamMap(), c2);
            model.addAttribute("orderFaHuoCount", orderFaHuoCountList != null ? orderFaHuoCountList.size() : 0); // 待发货
            Criteria c3 = new Criteria();
            c3.add(Restrictions.eq("memberId", memberId));
            c3.add(Restrictions.eq("orderStatus", Order.OrderStatus.wait_buyer_confirm_goods.toString()));
//            c3.add(Restrictions.eq("paymentStatus", Order.PaymentStatus.paid.toString()));
            c3.add(Restrictions.eq("shippingStatus", Order.ShippingStatus.shipped.toString()));
            List<Order> orderConfirmCountList = orderService.getList(getParamMap(), c3);
            model.addAttribute("orderConfirmCount", orderConfirmCountList != null ? orderConfirmCountList.size() : 0); // 待确认收货
        } catch (Exception e) {
            logger.error("统计订单快捷页的便利提醒时出错:", e.getMessage());
        }
    }


    //移动端入口
    @RequestMapping(value ="app_index")
    @Staticize(name = "index", isApp = true)
    public String mobileIndex(Model model, HttpServletRequest request) {
        String info = "进入移动前台主页面";
        setLogInfo(info);
        logger.debug(info);
        getAllCatelog(model);// 首页类目展示
        setPublicDate2Model( model );
        model.addAttribute("adslides", getAdslides("index"));
        model.addAttribute("notices", getNotice("notice"));
        model.addAttribute("activity", getNotice("mthd"));
        model.addAttribute("carbrandList", getCarBrandList());
        model.addAttribute("cls","app_index");
//      model.addAttribute("carSeriesList", getCarSeriesList());
//      model.addAttribute("cartypeList", getCartypeList());
        //首页轮播广告下方展示的商品信息(不同标签的)
        getData4IndexTagGoods(model);
        //品牌旗舰店的数据
//        getData4IndexShop(model);
        //getData4Indexbrand(model);
        //楼层展示的数据
        getData4IndexFloor(model);
        // 首页右侧的“爱车档案”和“今日爆款”数据
//        getData4IndexSlide(model);

        //获取一级分类（港务区微信商场）
        getAllParentsCateLog(model);
        //获取ULife头条（港务区微信商场）
        getTopNews(model);

        //获取秒杀、团购广告位图片
        getMTAdvertisingImg(model);


        model.addAttribute("articleComn", getArticlesBySign(getTenantId()));
        model.addAttribute("first",request.getParameter("first")==null?"false":request.getParameter("first"));
        return Global.TEMPLATE_APP + PATH + "/index";
    }

    //商品类别
    @RequestMapping(value ="app_classify")
    public String get(Model model) {
        //类别展示的数据
        getAllCatelog(model);
        return Global.TEMPLATE_APP + PATH + "/classify";
    }
    //app 新闻中心首页
    @RequestMapping(value ="newsIndex")
    public String newsIndex(Model model) {
        // 首页右侧的“爱车档案”和“今日爆款”数据
        model.addAttribute("articleComn", getData4IndexFloorPlus(getTenantId()));
        return Global.TEMPLATE_APP + PATH + "/news_index";
    }

    //获取ULife头条
    private void getTopNews(Model model){

        try {
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("categoryId", "1603301055088871591"));
            criteria.add(Restrictions.eq("isPublication", "1"));
            criteria.add(Restrictions.order("createDate", "desc"));
            List<Articles> topNewsList = articlesService.getList(getParamMap(), criteria);
            model.addAttribute("topNewsList", topNewsList);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    //首页轮播广告下方展示的商品信息(不同标签的)
    private void getData4IndexTagGoods(Model model) {
    	List<Map<String, String>> tagList = new ArrayList<Map<String,String>>();
    	String[] tagNames = new String[] { "今日特价", "热门商品", "爆款商品", "人气商品" };
		String[] tagSigns = new String[] { "specialoffer", "hot", "explosion", "pop"};
		Map<String, String> tagMap = null;
		for (int i = 0; i < tagNames.length; i++) {
			tagMap = new HashMap<String, String>();
			tagMap.put("name", tagNames[i]);
			tagMap.put("sign", tagSigns[i]);
			tagList.add(tagMap);
		}
        //tagList存放的是map map对应的是name 今日特价 sign specialoffer
		model.addAttribute("tagList", tagList);

		List<Map<String, Object>> tagGoodsList = new ArrayList<Map<String, Object>>();
		Map<String, Object> dataMap = null;
		List<Goods> goodsList = null;
		for (String sign : tagSigns) {
			dataMap = new HashMap<String, Object>();
			dataMap.put("sign", sign);
			try {
                /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
				goodsList = goodsService.getTagGoods4Index(getParamMap(), sign, 6,getWhichPlat());
                /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
			} catch (Exception e) {
				logger.error("IndexController中getData4IndexTagGoods方法，发生异常：", e);
			}
			dataMap.put("goodsList", goodsList);
			tagGoodsList.add(dataMap);
		}
		model.addAttribute("tagGoodsList", tagGoodsList);
    }
    
//    private void getData4Indexbrand(Model model) {
//    	try {
//    		Criteria criteria = new Criteria();
//        	criteria.add(Restrictions.order("createDate", "desc"));
//			List<GoodsBrand> barndList = goodsBrandService.getList(getTenantId(), criteria);
//			model.addAttribute("barndList", barndList);
//		} catch (Exception e) {
//			logger.error("IndexController中getData4Indexbrand方法，发生异常：", e);
//		}
//    }

    private void getAllParentsCateLog(Model model){
        try {
            List<Catelog> parent_catelogs_list = catelogService.getAllParents(getParamMap());
            model.addAttribute("parent_catelogs_list", parent_catelogs_list);
            Map<String, Catelog> parent_catelogs_map = new HashMap<String, Catelog>();
            for(Catelog cateLog: parent_catelogs_list){
                parent_catelogs_map.put(cateLog.getSign(), cateLog);
            }
            model.addAttribute("parent_catelogs_map", parent_catelogs_map);
        } catch (Exception e) {
            logger.error("IndexController中getAllParentsCateLog方法，发生异常：", e);
        }
    }

	/**
	 * 获取品牌旗舰店数据
	 * 
	 * @param model
	 */
    private void getData4IndexShop(Model model) {
    	try {
    		Criteria criteria = new Criteria();
        	criteria.add(Restrictions.order("wis.orderNo", "asc"));
        	criteria.add(Restrictions.limit("0", "27"));
            criteria.add(Restrictions.eq("wis."+Constant.TENANTID_KEY,getTenantId()));
            criteria.add(Restrictions.eq("wis."+Constant.PLATFORM_KEY,getPlatform()));
			List<IndexShop> list = indexShopService.getList(getParamMap(), criteria);
			model.addAttribute("indexShopList", list);
		} catch (Exception e) {
			logger.error("IndexController中getData4IndexShop方法，发生异常：", e);
		}
    }
    //获取楼层
    private void getData4IndexFloor(Model model) {
    	List<Catelog> indexCatelogList = getIndexCatelogList();
    	List<Map<String, Object>> typeList = new ArrayList<Map<String, Object>>();
        int i = 0;
        for (Catelog catelog : indexCatelogList) {
            Map<String, Object> data = new HashMap<String, Object>();
            i = i + 1;
            data.put("floor_left_" + i + "_1", getNewsAd("floor_left_" + i + "_1", 1));
            data.put("floor_bottom_" + i + "_1", getNewsAd("floor_bottom_" + i + "_1", 1));
            data.put("floor_top_" + i , getNewsAd("floor_top_" + i, 1));
            data.put("catelog", catelog);
            if( catelog != null && StringUtils.isNotEmpty( catelog.getId() ) ){
                data.put("categrandList", getChildrenList(catelog.getId()));
                data.put("brandchildList", getCategoryBrandList(catelog.getId()));
                data.put("goodschildList", getGoodsList(catelog));
            }else{
                data.put("categrandList", null);
                data.put("brandchildList", null);
                data.put("goodschildList", null);
            }
            typeList.add(data);
        }
        model.addAttribute("typeList", typeList);
    }
    //根据后台设置的首页分类，来展示楼层
	private List<Catelog> getIndexCatelogList() {
		List<Catelog> indexCatelogList = new ArrayList<Catelog>();
		try {
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.order("rowno", "asc"));
            criteria.add(Restrictions.eq(Constant.TENANTID_KEY, getTenantId()));
            criteria.add(Restrictions.eq(Constant.PLATFORM_KEY, getPlatform()));
			List<CatelogIndex> catelogIndexList = catelogIndexService.getList(getParamMap(), criteria);

            for (CatelogIndex catelogIndex : catelogIndexList) {
				Catelog catelog = catelogService.get(getParamMap(), catelogIndex.getCatelogId());
				indexCatelogList.add(catelog);
			}
		} catch (Exception e) {
			logger.error("IndexController中getIndexCatelogList方法，发生异常：", e);
		}
		return indexCatelogList;
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

    // 轮播图片
    private List<CarouselAdvertising> getAdslides(String sign) {
        List<CarouselAdvertising> adslideImages = null;
        try {
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq(Constant.TENANTID_KEY,getTenantId()));
            criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,getPlatform()));
            criteria.add(Restrictions.eq("enabled",0));
            criteria.add(Restrictions.order("orderNo","asc"));
            adslideImages = carouselAdvertisingService.getList(getParamMap(), criteria);
        } catch (Exception e) {
            logger.error("获取首页中间轮播图片时发生异常", e);
            e.printStackTrace();
        }
        return adslideImages;
    }
    
    // 爱车档案品牌
    private List<CarBrand> getCarBrandList() {
        List<CarBrand> carBrandList = null;
        try {
            carBrandList = carBrandService.getAll(getParamMap());
        } catch (Exception e) {
            logger.error("获取首页爱车档案品牌时发生异常", e);
            e.printStackTrace();
        }
        return carBrandList;
    }
    @RequestMapping(value = "/getSeriesList/{id}", method = { RequestMethod.POST })
    // 站内公告、活动
    private List<Articles> getNotice(String type) {
        List<Articles> notices = null;
        try {
            notices = articlesService.getArticles(getParamMap(), type, 12, "isTop", "desc");
        } catch (Exception e) {
            logger.error("获取首页站内公告时发生异常", e);
            e.printStackTrace();
        }
        return notices;
    }
    @RequestMapping(value = "/allSort")
    public String allSort(Model model,HttpServletRequest request) {
        String info = "获取所有商品分类";
        setLogInfo(info);
        logger.debug(info);

        String type=request.getParameter(Global.WHICHCLIENT);

        getAllCatelog(model);// 全部商品分类

        setPublicDate2Model( model );
        if(Global.WHICH_APP.equals(type)){
            return Global.TEMPLATE_APP + PATH + "/allSort";
        }else{
            return Global.TEMPLATE_MALL + PATH + "/allSort";
        }

    }

    @RequestMapping(value = "khfw")
    @ResponseBody
    public String khfw(Model model, HttpServletResponse response) {
        String info = "获取客户服务数据";
        setLogInfo(info);
        logger.debug(info);
        StringBuffer html = new StringBuffer("$(\"#khfw .dd\").html(\"");
        html.append("<div><a href='" + getServletContext().getContextPath() + "/help/question/254774992435150848.html' target='_blank'>联系客服</a></div>");// #/contact/service.html
        // 客服邮箱
        html.append("<div><a href='" + getServletContext().getContextPath() + "/help/question/254774863888121856.html' target='_blank'>常见问题</a></div>");// #help.com/index.html
        // 帮助中心
        html.append("\");");

		return ajaxHtml(html.toString(), response);
    }
    
    @RequestMapping(value = "/play/{id}")
    public String artcleDetail(@PathVariable String id, Model model,HttpServletRequest request) throws Exception {
        String info = "文章详细信息(" + id + ")";
        DateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        setLogInfo(info);
        logger.debug(info);
        Articles articles = articlesService.get(getParamMap(), id);
        ArticlesCategory articlesCategory = articlesCategoryService.find(getParamMap(),"id",articles.getCategoryId());
        model.addAttribute("articles", articles);
        Date date = articles.getCreateDate();
        if (null != date) {
            model.addAttribute("date", format.format(articles.getCreateDate()));
        }

        //2016-06-2 liuxiaobing 手机端新闻内容是否开启开始-----------------------------------------
        String isEnable="NO";
        try {
            isEnable = systemSetService.find(getParamMap(), "setkey", "isEnable").getSetvalue();
        } catch (Exception e) {
            logger.error("获取系统配置参数isEnable" + "时，发生异常", e);
        }
        model.addAttribute("isEnable", isEnable);
        //2016-06-2 liuxiaobing 手机端新闻内容是否开启结束-----------------------------------------




        model.addAttribute("content", htmlUnescape(articles.getContent()));
        model.addAttribute("phoneContent", htmlUnescape(articles.getPhoneContent()));
        model.addAttribute("articlesCategory", articlesCategory);
        setPublicDate2Model( model );
        String type=request.getParameter(Global.WHICHCLIENT);
        if(Global.WHICH_APP.equals(type)){
            return Global.TEMPLATE_APP + PATH + "/news_detail";
        }else{
            return Global.TEMPLATE_MALL + PATH + "/article_detail";
        }
//        return Global.TEMPLATE_MALL + PATH + "/article_detail";
    }

    @RequestMapping(value = "findPwd")
     public String findPwd(Model model) {
        String info = "会员找回密码";
        setLogInfo(info);
        logger.debug(info);
        getAllCatelog(model);// 首页类目展示
        setPublicDate2Model( model );
        return Global.TEMPLATE_MALL + PATH + "/findpwd";
    }
    @RequestMapping("/findPwdAPP")
    public String findPwdAPP(Model model) {
        String info = "会员找回密码";
        setLogInfo(info);
        logger.debug(info);
        return Global.TEMPLATE_APP + PATH + "/findpwd";
    }


    @RequestMapping(value = "/ajaxCheckUser")
    public
    @ResponseBody
    Object ajaxCheckUser(HttpServletRequest request) {
        String info = "验证用户名是否存在";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String username = request.getParameter("username");
            boolean flag = memberService.isExist(getParamMap(), "userName", username);
            result.put(STATUS, SUCCESS);
            result.put(MESSAGE, "操作成功");
            result.put(DATA, flag);
            return result;
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "操作失败");
            return result;
        }
    }

    @RequestMapping(value = "/ajaxCheckUserMail")
    public
    @ResponseBody
    Object ajaxCheckUserMail(HttpServletRequest request) {
        String info = "验证用户名邮箱是否正确";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("username", username));
            criteria.add(Restrictions.eq("email", email));
            List<Member> list = memberService.getList(getParamMap(), criteria);
            if (list != null && list.size() > 0) {
                result.put(DATA, true);
            } else {
                result.put(STATUS, SUCCESS);
                result.put(MESSAGE, "操作成功");
                result.put(DATA, false);
            }
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

    @RequestMapping(value = "/ajaxSendMail")
    public
    @ResponseBody
    Object ajaxSendMail(HttpServletRequest request) {
        String info = "发送邮件";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = MailTools.getRandString(6);
            MailSenderInfo mailInfo = new MailSenderInfo();
            mailInfo.setMailServerHost("smtp.163.com");
            mailInfo.setMailServerPort("25");
            mailInfo.setValidate(true);
            mailInfo.setUserName("wepunet@163.com");
            mailInfo.setPassword("weipeng163");// 您的邮箱密码
            mailInfo.setFromAddress("wepunet@163.com");
            mailInfo.setToAddress(email);
            mailInfo.setSubject(getMessage("project_name", null, request));
            mailInfo.setContent("尊敬的会员,您的密码被重置为：" + password + ",您可以在登录后进行密码修改");
            // 这个类主要来发送邮件
            SimpleMailSender sms = new SimpleMailSender();
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("username", username));
            criteria.add(Restrictions.eq("email", email));
            List<Member> list = memberService.getList(getParamMap(), criteria);
            if (list != null && list.size() > 0) {
                Member member = list.get(0);
                String passwordMd5 = new Md5Hash(password).toHex();
                member.setPasswd(passwordMd5);
                memberService.update(getParamMap(), member);
                sms.sendTextMail(mailInfo);// 发送文体格式
            }
            result.put(STATUS, SUCCESS);
            result.put(MESSAGE, "操作成功");
            result.put(DATA, true);
            return result;
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "操作失败");
            return result;
        }
    }

    public List<Catelog> getGoodsCategories() {
        List<Catelog> goodsCategories = null;
        Criteria criteria = new Criteria();
        criteria.add(Restrictions.isNull("parentId"));
        try {
            goodsCategories = catelogService.getList(getParamMap(), criteria);
        } catch (Exception e) {
            logger.error("首页查询商品类别时");
            e.printStackTrace();
        }
        return goodsCategories;
    }

    private List<Catelog> getChildrenList(String parentId) {
        Criteria criteria = new Criteria();
        if (StringUtil.isEmpty(parentId)) {
            criteria.add(Restrictions.isNull("parentId"));
        } else {
            criteria.add(Restrictions.eq("parentId", parentId));
        }
        criteria.add(Restrictions.eq("enabled", 1));
        criteria.add(Restrictions.order("orderNo", "ASC"));
        List<Catelog> childList = null;
        try {
            childList = catelogService.getList(getParamMap(), criteria);
        } catch (Exception e) {
            logger.error("getChildrenList方法发生异常", e);
            e.printStackTrace();
        }
        return childList;
    }

    // 商品品牌
    private List<GoodsBrand> getCategoryBrandList(String categoryId) {
        GoodsCategory goodsCategory = categoryService.getGategoryByCatelog(getParamMap(), categoryId);
		/* 如果找不到对应的商品分类，直接返回-2014-08-02 张书祥- */
        if (goodsCategory == null) {
            return null;
        }
        List<GoodsBrand> goodsBrandList = null;
        try {
            goodsBrandList = categoryService.getGoodsBrandByCatelogId(getParamMap(), goodsCategory.getId(), 30);
        } catch (Exception e) {
            logger.error("查询商品品牌时");
            e.printStackTrace();
        }
        return goodsBrandList;
    }

    // 商品信息
    private List<Goods> getGoodsList(Catelog catelog) {
    	List<Goods> goodsList = null;
        try {
        	GoodsCategory goodsCategory = categoryService.getGategoryByCatelog(getParamMap(), catelog.getId());
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.like("categoryPath", goodsCategory.getId()+",%"));
            criteria.add(Restrictions.eq("isMarketable", 1));
            criteria.add(Restrictions.eq("isIndex",1));
            criteria.add(Restrictions.eq("status", 5));
            /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
            criteria.add(Restrictions.lt("platform",3));
            /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/

            //微信商城首页中相关各楼层展示出来的商品按照由低到高价格排序（目前是由高到低）
            criteria.add(Restrictions.order("indexOrder", "ASC"));
            criteria.add(Restrictions.limit("0", "10"));
            goodsList = goodsService.getList(getParamMap(), criteria);

            //判断跨境商品 开关 是否打开
            if(CrossborderUtil.isCrossborder()){//打开
                if(goodsList.size() > 0 && goodsList != null){
                    goodsList = getIfCrossborder(goodsList);
                }
            }
        } catch (Exception e) {
			logger.error("查询商品信息时,发生异常：", e);
		}
        return goodsList;
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
                    if(net.deepdragon.util.StringUtil.isNotEmpty(goods.getShopId()) && net.deepdragon.util.StringUtil.isNotEmpty(goods.getCategoryId())){
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
    
    public List<Map<String, Object>> getArticlesBySign(String tenantId) {
        List<Map<String, Object>> services = null;
        services = new ArrayList<Map<String, Object>>();
        // 保养秘籍-main,轮胎须知-send,电瓶常识-battery,服务园地-saleservice
        String[] signs = new String[]{"main", "tire", "battery", "service",};
        try {
            for (String sign : signs) {
                ArticlesCategory category = articlesCategoryService.find(
                        getParamMap(), "sign", sign);
                if (category != null) {
                    Map<String, Object> data = new HashMap<String, Object>();
                    data.put("category", category);
                    data.put("articles", articlesService.getArticles(
                            getParamMap(), sign, null, null, null));
                    services.add(data);
                }
            }
        } catch (Exception ex) {
            logger.error("获取汽车常识信息时，发生异常。", ex);
            ex.printStackTrace();
        }
        return services;
    }
    
    @RequestMapping(value = "comn/{id}", method = { RequestMethod.GET })
    public String getComn(@PathVariable String id,Model model,Pager pager) {
        String info = "查看相关常识[id:" + id + "]";
        setLogInfo(info);
        logger.debug(info);
        try {
        	ArticlesCategory articlesCategory = articlesCategoryService.get(getParamMap(),id);
        	
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("categoryId", id));
            criteria.add(Restrictions.eq("isPublication", 1));
			criteria.add(Restrictions.order("isTop", "desc"));
			criteria.add(Restrictions.order("orderNo", "asc"));
            if (StringUtils.isNotEmpty(pager.getOrderBy()) && StringUtils.isNotEmpty(pager.getOrderType())) {
                criteria.add(Restrictions.order(pager.getOrderBy(), pager.getOrderType().toUpperCase()));
            }
//			criteria.add(Restrictions.order("createDate", "desc"));
            criteria.add(Restrictions.eq(Constant.TENANTID_KEY,getTenantId()));
            criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,getPlatform()));
            pager.setPageSize(10);
            pager= articlesService.getPager(getParamMap(), criteria, pager);
            if(pager.getList()!=null){
				for(Object data : pager.getList()){
					Articles articles = (Articles) data;
					String content = HtmlUtils.htmlUnescape(articles.getContent());
					articles.setContent(content);
				}
			}
            model.addAttribute("pager", pager);
            model.addAttribute("id", id);
            model.addAttribute("total", pager.getTotalCount());
            model.addAttribute("articlesCategory",articlesCategory);
		} catch (Exception e) {
			logger.error(info + "时，发生异常。", e);
			e.printStackTrace();
		}
        getLeftMenu(model);
        setPublicDate2Model( model );
        return Global.MALL+ PATH + "/car_comn";
    }
    
    private void getLeftMenu(Model model) {
        try {
            String parentSign = "common";
            ArticlesCategory parent = articlesCategoryService.find(getParamMap(), "sign", parentSign);
            if (parent == null) {
                logger.error("获取帮助中心左侧菜单父级分类[sign"+parentSign+"]数据为空。");
                return;
            }
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("parentId", parent.getId()));
            criteria.add(Restrictions.order("orderNo", "ASC"));
            criteria.add(Restrictions.eq(Constant.TENANTID_KEY,getTenantId()));
            criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,getPlatform()));
            List<ArticlesCategory> parentList = null;
            parentList = articlesCategoryService.getList(getParamMap(), criteria);
            criteria = new Criteria();
            criteria.add(Restrictions.isNotNull("categoryId"));
            criteria.add(Restrictions.eq("isPublication", "1"));
            criteria.add(Restrictions.order("isTop", "DESC"));
            criteria.add(Restrictions.order("orderNo", "ASC"));
            criteria.add(Restrictions.eq(Constant.TENANTID_KEY,getTenantId()));
            criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,getPlatform()));
            List<Articles> childList = articlesService.getList(getParamMap(), criteria);
            model.addAttribute("parentList", parentList);
            model.addAttribute("childList", childList);

        } catch (Exception e) {
            logger.error("获取帮助中心左侧菜单数据时，发生异常",e);
            e.printStackTrace();
        }

    }

    public void getData4IndexSlide(Model model) {
        try {
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.order("createDate", "desc"));
            criteria.add(Restrictions.eq("status", "1"));
            criteria.add(Restrictions.limit("0", "1"));
            criteria.add(Restrictions.eq("t.status", "1"));
            criteria.add(Restrictions.eq(Constant.TENANTID_KEY,getTenantId()));
            criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,getPlatform()));
            List<TodayCommend> tcList = tcService.getList(getParamMap(), criteria);
            if (tcList != null && tcList.size() > 0) {
                Goods goods = goodsService.get(getParamMap(), tcList.get(0).getGoodsId());
                if (goods != null) {
                    Criteria c = new Criteria();
                    c.add(Restrictions.eq("goodsId", goods.getId()));
                    List<GoodsImages> goodsImgList = goodsImagesService.getList(getParamMap(), c);
                    if (goodsImgList != null && goodsImgList.size() > 0) {
                        goods.setPic(goodsImgList.get(0).getPic());
                    }
                    model.addAttribute("tcGoods", goods);
                }
            }
        } catch (Exception e) {
            logger.error("获取今日爆款时,发生异常：", e);
        }
    }

    /**
     * 获取新闻
     * @param tenantId
     * @return
     */
    public List<Map<String, Object>> getData4IndexFloorPlus(String tenantId) {
        List<Map<String, Object>> services = null;
        services = new ArrayList<Map<String, Object>>();
        // 保养秘籍-main,轮胎须知-send,电瓶常识-battery,服务园地-saleservice
        String[] signs = new String[]{"main", "tire", "battery", "service",};
        try {
            for (String sign : signs) {
                ArticlesCategory category = articlesCategoryService.find(
                        getParamMap(), "sign", sign);
                if (category != null) {
                    Map<String, Object> data = new HashMap<String, Object>();
                    data.put("category", category);
                    data.put("articles", articlesService.getArticles(
                            getParamMap(), sign, null, null, null));
                    services.add(data);
                }
            }
        } catch (Exception ex) {
            logger.error("获取获取新闻时，发生异常。", ex);
            ex.printStackTrace();
        }
        return services;
    }

    public void getData4IndexSlide(Model model,String size){
        try {
            List<Goods> tcGoodsList=new ArrayList<Goods>();
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.order("t.createDate", "desc"));
            criteria.add(Restrictions.le("g.platform", 2));
            criteria.add(Restrictions.eq("g.isMarketable", "1"));
            criteria.add(Restrictions.eq("g.status", "5"));
            criteria.add(Restrictions.limit("0", size));
            criteria.add(Restrictions.eq("t.status", 1));
            criteria.add(Restrictions.eq("t."+Constant.TENANTID_KEY, getTenantId()));
            criteria.add(Restrictions.eq("t." + Constant.PLATFORM_KEY, getPlatform()));
            List<Goods> tcList = tcService.getTodayCommendGoods(getParamMap(), criteria);
            if (tcList != null && tcList.size() > 0) {
                for(int i=0;i<tcList.size();i++){
                    Goods goods = tcList.get(i);
                    if (goods != null) {
                        Criteria c = new Criteria();
                        c.add(Restrictions.eq("goodsId", goods.getId()));
                        List<GoodsImages> goodsImgList = goodsImagesService.getList(getParamMap(), c);
                        if (goodsImgList != null && goodsImgList.size() > 0) {
                            goods.setPic(goodsImgList.get(0).getPic());
//                            tcGoodsList.add(goods);
                        }
                        tcGoodsList.add(goods);
                    }
                }
            }
            model.addAttribute("tcGoodsList", tcGoodsList);
        }catch (Exception e) {
            logger.error("获取今日爆款时,发生异常：", e);
        }
    }

    @RequestMapping(value = "/getSeriesList")
    private @ResponseBody
    Object  getSeriesListBybrandId(HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();
        List<CarSeries> carSeriesList = null;
        try {
            String brandId = request.getParameter("brandId");
            carSeriesList = carSeriesService.findList(getParamMap(),"brandId",brandId);
            result.put("carSeriesList",carSeriesList);
        } catch (Exception e) {
            logger.error("获取首页爱车档案车系时发生异常", e);
            e.printStackTrace();
        }
        return result;
    }
    @RequestMapping(value = "/getCartypeList")
    private @ResponseBody
    Object  getCartypeListBySeriesId(HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();
        List<Cartype> cartypeList = null;
        try {
            String seriesId = request.getParameter("seriesId");
            cartypeList = cartypeService.findList(getParamMap(),"seriesId",seriesId);
            result.put("cartypeList",cartypeList);
        } catch (Exception e) {
            logger.error("获取首页爱车档案车系时发生异常", e);
            e.printStackTrace();
        }
        return result;
    }


    @RequestMapping(value = "/ajaxSendSMS")
    public
    @ResponseBody
    Object ajaxSendSMS(HttpServletRequest request) {
        String info = "验证帐号和手机号是否对应，重置密码，发送短信";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            //验证帐号和手机号是否对应
            String username = request.getParameter("username");
            String mobile = request.getParameter("mobile");
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("username", username));
            criteria.add(Restrictions.eq("mobile", mobile));
            List<Member> list = memberService.getList(getParamMap(), criteria);
            if (list != null && list.size() > 0) {
                //重置密码
                String password = MailTools.getRandString(6);
                String smsContent = "尊敬的会员【" + mobile + "】,您的密码被重置为：" + password + ",您可以登录系统后进行密码修改";
                Member member = list.get(0);
                String passwordMd5 = new Md5Hash(password).toHex();
                member.setPasswd(passwordMd5);
                memberService.update(getParamMap(), member);

                //发送短信
                Map<String, Object> sendResult = smsLogService.sendSMS(getParamMap(),mobile, smsContent, systemSetService.getAll(getParamMap()));
                if (!SUCCESS.equals(sendResult.get(STATUS))) {
                    result.put(STATUS, SUCCESS);
                    result.put(MESSAGE, "短信发送失败，请稍后再试");
                    return result;
                }
                this.orderService.insertOne(getParamMap(), sendResult.get( "smslogSql" )+"");

            } else {
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "帐号和手机号码不匹配");
                return result;
            }

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

    /**
     * 获取友情链接
     * @param pager
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "friendLinkList")
    public String list(Pager pager, Model model, HttpServletRequest request) {
        String whichclient = request.getParameter(Global.WHICHCLIENT);
        String info = "友情链接";
        setLogInfo(info);
        logger.debug(info);
        try {
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.order("orderNo","asc"));
            criteria.add(Restrictions.eq(Constant.TENANTID_KEY, getTenantId()));
            criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,getPlatform()));
            pager.setPageSize(10);

            pager = friendlyLinkService.getPager(getParamMap(), criteria, pager);
            model.addAttribute("friendlyLinkList", pager.getList());

            setPublicDate2Model( model );

            getAllCatelog(model);// 类目展示

        }catch (Exception e) {
            logger.error(info + "时，发生异常", e);
        }
        if(Global.WHICH_APP.equals(whichclient)){
            return Global.TEMPLATE_APP + PATH + "/friendly_link";
        }else{
            return Global.TEMPLATE_MALL + PATH + "/friendly_link";
        }
    }

    /**
     * 获取品牌旗舰店
     * @param pager
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "brandFlagshipStore")
    public String brandFlagshipStore(Pager pager, Model model, HttpServletRequest request) {
        String whichclient = request.getParameter(Global.WHICHCLIENT);
        String info = "获取品牌旗舰店";
        setLogInfo(info);
        logger.debug(info);
        getAllCatelog(model);// 首页类目展示
        try {
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.order("wis.orderNo", "asc"));
//            criteria.add(Restrictions.limit("0", "10"));
            criteria.add(Restrictions.eq("wis."+Constant.TENANTID_KEY,getTenantId()));
            criteria.add(Restrictions.eq("wis."+Constant.PLATFORM_KEY,getPlatform()));
            List<IndexShop> list = indexShopService.getList(getParamMap(), criteria);
            model.addAttribute("indexShopList", list);

            setPublicDate2Model( model );

        }catch (Exception e) {
            logger.error(info + "时，发生异常", e);
        }
        if(Global.WHICH_APP.equals(whichclient)){
            return Global.TEMPLATE_APP + PATH + "/brand_shop_link";
        }else{
            return Global.TEMPLATE_MALL + PATH + "/brand_shop_link";
        }
    }

    /**
     * Desc:获取搜索热词
     * Auth:zhangqiang
     * Time:2015-12-31 10:53:25
     * @param request
     * @return
     */
    @RequestMapping(value = "/ajaxGetKeywords")
    public
    @ResponseBody
    Object ajaxGetKeywords(HttpServletRequest request) {
        String info = "获取搜索热词";
        setLogInfo(info);
        logger.debug(info);
        List<Keywords> listkeywords = null;
        try {
            listkeywords = cacheData.getKeywords(getParamMap());
            return listkeywords;
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
            return listkeywords;
        }
    }
    @RequestMapping(value = "/ajaxUploadFiles",method = { RequestMethod.POST })
    public
    @ResponseBody
    Object ajaxUploadFiles(HttpServletRequest request) {
        String info = "ajaxUploadFiles";
        setLogInfo(info);
        logger.debug(info);
        Map<String, Object> result = new HashMap<String, Object>();
        try {

            String fileData = request.getParameter("base64");
            String fileLength = request.getParameter("size");
            String fileName = request.getParameter("name");

            if(StringUtils.isBlank(fileData) || StringUtils.isBlank(fileLength)){// 上传数据
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "上传文件为空");
                return result;
            }
            if (Integer.parseInt(fileLength) != fileData.length()) {
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "上传文件错误");
                return result;
            }

            String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
            if(!Arrays.<String>asList(extMap.get("image").split(",")).contains(fileExt)){
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get("image") + "格式。");
                return result;
            }

            //使用BASE64对图片文件数据进行解码操作
            BASE64Decoder decoder = new BASE64Decoder();
            //通过Base64解密，将图片数据解密成字节数组
            fileData = fileData.substring(fileData.indexOf(",")  + 1);
            byte[] bytes = decoder.decodeBuffer(fileData);

            List<String[]> uploadResults = UploadTools.upUpload(fileName, bytes);
            if( uploadResults == null ){
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "上传失败");
                return result;
            }
            String imgSrvAddr = UploadTools.getImageServerAddress();

            Map<String, String> uploadResultMap = new HashMap<String, String>();
            uploadResultMap.put("imgSrvAddr", imgSrvAddr);
            uploadResultMap.put("projectName", uploadResults.get(0)[0]);
            uploadResultMap.put("path", uploadResults.get(0)[1]);
            uploadResultMap.put("width", uploadResults.get(0)[2]);
            uploadResultMap.put("height", uploadResults.get(0)[3]);
            result.put(DATA, uploadResultMap);


            /*
            //构造字节数组输入流
            //ByteArrayInputStream bais = new ByteArrayInputStream(bytes);
            //读取输入流的数据
            BufferedImage bi = ImageIO.read(bais);
            //将数据信息写进图片文件中
            SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
            String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
            String savePath = System.getProperty("java.io.tmpdir");
            File f = new File(savePath, newFileName);
            ImageIO.write(bi, "jpg", f);// 不管输出什么格式图片，此处不需改动
            bais.close();
            */
            result.put(STATUS, SUCCESS);
            result.put(MESSAGE, "上传成功");
            return result;
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "上传失败");
            return result;
        }
    }

    //首页导航
    @RequestMapping(value = "/getAllParentsCateLog",method = { RequestMethod.POST })
    public
    @ResponseBody
    Object getAllParentsCateLog(HttpServletRequest request,HttpServletResponse response) {
        String info = "ajaxGetSilder";
        setLogInfo(info);
        logger.debug(info);
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            List<Catelog> parent_catelogs_list = catelogService.getAllParents(getParamMap());
            Map<String, Catelog> parent_catelogs_map = new HashMap<String, Catelog>();
            for(Catelog cateLog: parent_catelogs_list){
                parent_catelogs_map.put(cateLog.getSign(), cateLog);
            }
            result.put(DATA, parent_catelogs_map);
            result.put(STATUS, SUCCESS);
            return result;
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "获取失败");
            return result;
        }
    }

    //获取ULife头条（港务区微信商场）
    @RequestMapping(value = "/getTopNews",method = { RequestMethod.POST })
    public
    @ResponseBody
    Object getTopNews(HttpServletRequest request,HttpServletResponse response) {
        String info = "ajaxGetSilder";
        setLogInfo(info);
        logger.debug(info);
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("categoryId", "1603301055088871591"));
            criteria.add(Restrictions.eq("isPublication", "1"));
            criteria.add(Restrictions.order("createDate", "desc"));
            List<Articles> topNewsList = articlesService.getList(getParamMap(), criteria);

            //获取头条的时候顺便获取一下团购秒杀商品图片地址
            try {
                //团购
                List<AdvertisingImage> tgList = advertisingImageService.getAds(getParamMap(), "cx_group", 1);
                if (tgList != null && tgList.size() > 0) {
                    AdvertisingImage tgImg = tgList.get(0);
                    result.put("tgImge", tgImg.getPic());
                }

                //秒杀
                List<AdvertisingImage> msList = advertisingImageService.getAds(getParamMap(), "cx_seckill", 1);
                if (msList != null && msList.size() > 0) {
                    AdvertisingImage msImg = msList.get(0);
                    result.put("msImge", msImg.getPic());
                }
            }catch (Exception e){
                logger.error("查询团购秒杀广告图片时出错:", e.getMessage());
            }
            result.put(DATA, topNewsList);
            result.put(STATUS, SUCCESS);
            return result;
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "获取失败");
            return result;
        }
    }


    @RequestMapping(value = "/ajaxGetSilder",method = { RequestMethod.POST })
    public
    @ResponseBody
    Object ajaxGetSilder(HttpServletRequest request,HttpServletResponse response) {
        String info = "ajaxGetSilder";
        setLogInfo(info);
        logger.debug(info);
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String callback = request.getParameter("callback");
            List<CarouselAdvertising> adslideImages = getAdslides("index");
            result.put(DATA, adslideImages);
            result.put(STATUS, SUCCESS);
            return result;
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "获取失败");
            return result;
        }
    }


    //首页轮播广告下方展示的商品信息(不同标签的)
    @RequestMapping(value = "/ajaxGetIndexTagGoods", method = {RequestMethod.POST})
    public
    @ResponseBody
    Object ajaxGetIndexTagGoods(HttpServletRequest request, HttpServletResponse response) {
        String info = "ajaxGetIndexTagGoods";
        setLogInfo(info);
        logger.debug(info);
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            List<Map<String, String>> tagList = new ArrayList<Map<String, String>>();
            String[] tagNames = new String[]{"今日特价", "热门商品", "爆款商品", "人气商品"};
            String[] tagSigns = new String[]{"specialoffer", "hot", "explosion", "pop"};
            Map<String, String> tagMap = null;
            for (int i = 0; i < tagNames.length; i++) {
                tagMap = new HashMap<String, String>();
                tagMap.put("name", tagNames[i]);
                tagMap.put("sign", tagSigns[i]);
                tagList.add(tagMap);
            }
            //tagList存放的是map map对应的是name 今日特价 sign specialoffer
            result.put("tagList", tagList);
            List<Map<String, Object>> tagGoodsList = new ArrayList<Map<String, Object>>();
            List<Goods> goodsList = null;
            for (String sign : tagSigns) {
                Map<String, Object> dataMap = new HashMap<String, Object>();
                dataMap.put("sign", sign);
                goodsList = goodsService.getTagGoods4Index(getParamMap(), sign, 6, getWhichPlat());
                dataMap.put("goodsList", goodsList);
                tagGoodsList.add(dataMap);
            }
            result.put("tagGoodsList", tagGoodsList);
            result.put(STATUS, SUCCESS);
            return result;
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "获取失败");
            return result;
        }
    }

    //获取楼层
    @RequestMapping(value = "/ajaxGetIndexFloorGoods", method = {RequestMethod.POST})
    public
    @ResponseBody
    Object ajaxGetIndexFloorGoods(HttpServletRequest request, HttpServletResponse response) {
        String info = "ajaxGetIndexFloorGoods";
        setLogInfo(info);
        logger.debug(info);
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            List<Catelog> indexCatelogList = getIndexCatelogList();
            List<Map<String, Object>> typeList = new ArrayList<Map<String, Object>>();
            int i = 0;
            for (Catelog catelog : indexCatelogList) {
                Map<String, Object> data = new HashMap<String, Object>();
                i = i + 1;
                data.put("floor_left_" + i + "_1", getNewsAd("floor_left_" + i + "_1", 1));
                data.put("floor_bottom_" + i + "_1", getNewsAd("floor_bottom_" + i + "_1", 1));
                data.put("floor_top_" + i , getNewsAd("floor_top_" + i, 1));
                data.put("catelog", catelog);
                if (catelog != null && StringUtils.isNotEmpty(catelog.getId())) {
                    data.put("categrandList", getChildrenList(catelog.getId()));
                    data.put("brandchildList", getCategoryBrandList(catelog.getId()));
                    data.put("goodschildList", getGoodsList(catelog));
                } else {
                    data.put("categrandList", null);
                    data.put("brandchildList", null);
                    data.put("goodschildList", null);
                }
                typeList.add(data);
            }
            result.put("typeList", typeList);
            result.put(STATUS, SUCCESS);
            return result;
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "获取失败");
            return result;
        }
    }

    //促销商品
    @RequestMapping(value = "/huodongdata/{promotionsId}")
    @ResponseBody
    public Object cuxiao(@PathVariable String promotionsId,Pager pager,HttpServletRequest request){
        String info = "加载更多的促销商品";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(STATUS, SUCCESS);
        result.put(MESSAGE, "操作成功");
        try{
            Map<String,Object> param = new HashMap<String, Object>();
            param = getParamMap();
            pager.setPageSize(20);
            pager = promotionsGoodsService.getPromotionsGoodsPager(param,promotionsId,pager);
            result.put(DATA, pager.getList());
            result.put("pager", pager);
        }catch (Exception e) {
            logger.error("获取促销商品时发生异常", e);
            e.printStackTrace();
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "操作失败");
        }
        return result;
    }

    //专题页面
    @RequestMapping("/zt/{flag}")
    public String zhuantiPage(@PathVariable String flag,Pager pager,Model model, HttpServletRequest request){
        String info = "专题页面";
        String type=request.getParameter(Global.WHICHCLIENT);
        setLogInfo(info);
        logger.debug(info);
        getAllCatelog(model);// 首页类目展示
        setPublicDate2Model( model );
        model.addAttribute("adslides", getAdslides("index"));
        if(Global.WHICH_APP.equals(type)){
            return Global.TEMPLATE_APP + PATH + "/zhuanti/"+flag;
        }else{
            return Global.TEMPLATE_MALL + PATH + "/zhuanti/"+flag;
        }
    }

    //专题活动
    @RequestMapping("/huodong/{flag}")
    public String cuxiaoPage(@PathVariable String flag,Pager pager,Model model, HttpServletRequest request){
        String info = "专题活动";
        String url="";
        setLogInfo(info);
        logger.debug(info);
        getAllCatelog(model);// 首页类目展示
       /* Map<String,String> flags= new HashMap<String,String>();
        flags.put("1","奢侈品");
        flags.put("2","母婴");
        flags.put("3","日化家居");*/
        setPublicDate2Model( model );
        /*model.addAttribute("flags",flags);
        model.addAttribute("flag",flag);*/
        Promotions promotions=null,promotions0=null,promotions1=null;
        String type=request.getParameter(Global.WHICHCLIENT);
        try {
            promotions0 = promotionsService.getPromotionsByFlag(getParamMap(),flag);
            promotions1 = promotionsService.getPromotions(getParamMap(),flag);
            if(promotions0 == null && promotions1 == null) {
                if(Global.WHICH_APP.equals(type)) {
                    url = "redirect:/app_index";
                }else{
                    url = "redirect:/index";
                }
            }else{
                Map<String,Object> param = new HashMap<String, Object>();
                param = getParamMap();
                if(promotions0 !=null){
                   promotions = promotions0;
                }
                if(promotions1 !=null){
                    promotions = promotions1;
                }
                Long start = promotions.getStartTime().getTime();
                Long end = promotions.getEndTime().getTime();
                Long now = System.currentTimeMillis();
                if(now > start && end > now && (promotions.getIsOpen().equals(Promotions.END) || promotions.getIsOpen().equals(Promotions.CREATE))){
                    promotionsService.updateIsOpen(getParamMap(),promotions.getId(),Promotions.START);
                    promotions.setIsOpen(Promotions.START);
                    startPromotions(promotions.getId());
                }else if(end < now && promotions.getIsOpen().equals(Promotions.START)){
                    promotionsService.updateIsOpen(getParamMap(),promotions.getId(),Promotions.END);
                    endtPromotions(promotions.getId());
                    promotions.setIsOpen(Promotions.END);
                }
                if(promotions.getIsOpen().equals(Promotions.START)) {
                    pager.setPageSize(20);
                    pager = promotionsGoodsService.getPromotionsGoodsPager(param, promotions.getId(), pager);
                    model.addAttribute("promotions", promotions);
                    model.addAttribute("pager", pager);
                }
                if(start>now){
                    model.addAttribute("flag",false);
                    model.addAttribute("message","活动还未开始，敬请期待！");
                }else if(now>end){
                    model.addAttribute("flag",false);
                    model.addAttribute("message","活动已经结束，请你参与其他活动！");
                }else{
                    model.addAttribute("flag",true);
                }
            }
        }catch(Exception e){
            logger.error(info + "时，发生异常", e);
        }
        if(Global.WHICH_APP.equals(type) && url== ""){
            return Global.TEMPLATE_APP + PATH + "/cuxiao";
        }else if(url== ""){
            return Global.TEMPLATE_MALL + PATH + "/cuxiao";
        }else{
            return url;
        }
    }

    //开启专题活动
    private void startPromotions(String promotionsId) throws Exception{
        Criteria criteria = new Criteria();
        criteria.add(Restrictions.eq("promotionsId",promotionsId));
        List<PromotionsGoods> promotionsGoodsList = promotionsGoodsService.getList(getParamMap(),criteria);
        List<Goods> goodsList=new ArrayList<Goods>();
        for(PromotionsGoods promotionsGoods:promotionsGoodsList){
            Goods goods = new Goods();
            goods.setId(promotionsGoods.getGoodsId());
            goods.setPrice(promotionsGoods.getPromotionsPrice());
            goods.setDescription(promotionsGoods.getDescription());
            goodsList.add(goods);
        }
        goodsService.update(getParamMap(),goodsList);
    }

    //关闭专题活动
    private void endtPromotions(String promotionsId)throws Exception{
        Criteria criteria = new Criteria();
        criteria.add(Restrictions.eq("promotionsId",promotionsId));
        List<PromotionsGoods> promotionsGoodsList = promotionsGoodsService.getList(getParamMap(),criteria);
        List<Goods> goodsList=new ArrayList<Goods>();
        for(PromotionsGoods promotionsGoods:promotionsGoodsList){
            Goods goods = new Goods();
            goods.setId(promotionsGoods.getGoodsId());
            goods.setPrice(promotionsGoods.getGoodsPrice());
            goods.setDescription("");
            goodsList.add(goods);
        }
        goodsService.update(getParamMap(),goodsList);
    }



    //首页轮播广告下方展示的商品信息(不同标签的)
    @RequestMapping(value = "/ajaxGetIndexGoodsByTag", method = {RequestMethod.POST})
    public
    @ResponseBody
    Object ajaxGetIndexGoodsByTag(String tag, Pager pager,HttpServletRequest request, HttpServletResponse response) {
        String info = "ajaxGetIndexGoodsByTag";
        setLogInfo(info);
        logger.debug(info);
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            if(net.deepdragon.util.StringUtil.isEmpty(tag)){
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "标签不能为空");

                return result;
            }

//            String[] tagNames = new String[]{"今日特价", "热门商品", "爆款商品", "人气商品","今日爆款"};
            String[] tagSigns = new String[]{"specialoffer", "hot", "explosion", "pop", "todayCommend"};

            boolean flag = true;
            for(String tagSign : tagSigns){
                if( tag.equals(tagSign) ){
                    flag = false;
                    break;
                }
            }

            if(flag){
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "不存在的标签");

                return result;
            }

            /*Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("o.tenantId", getTenantId()));
            criteria.add(Restrictions.eq("o.tagSign", tag));
            criteria.add(Restrictions.eq("o.isIndex", 1));
            pager = goodsService.getPagerByTag4EC(getParamMap(), criteria, pager);
            List<Goods> list = (List<Goods>)pager.getList();*/

            pager = cacheData.getIndexTagGoodsMap(getParamMap(), tag, pager);
            List<Goods> list = (List<Goods>)pager.getList();

            /*//判断跨境商品 开关 是否打开
            if(CrossborderUtil.isCrossborder()){//打开
                if(list.size() > 0 && list != null){
                    list = getIfCrossborder(list);
                }
            }*/

//            tcService.getPager()


            result.put("pageNumber", pager.getPageNumber());
            result.put("pageCount", pager.getPageCount());
            result.put("list", list);
            result.put(STATUS, SUCCESS);
            return result;
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "获取失败");
            return result;
        }
    }
    //正在建设中
    @RequestMapping("/inconstruction")
    public String inConstruction(HttpServletRequest request,Model model){
        String url="";
        String type=request.getParameter(Global.WHICHCLIENT);
        getAllCatelog(model);// 首页类目展示
        setPublicDate2Model( model );
        if(Global.WHICH_APP.equals(type) && url== ""){
            return Global.TEMPLATE_APP + PATH + "/inconstruction";
        }else if(url== ""){
            return Global.TEMPLATE_MALL + PATH + "/inconstruction";
        }else{
            return url;
        }
    }
    @RequestMapping(value = "/getSons")
    @ResponseBody
    public Object getSons(HttpServletRequest request){
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", "failed");
        String id = request.getParameter("id");
        if(id == null || id.equals("")){
            result.put("status","exception");
            result.put("message","父级id不能为空！");
        }else{
            List<Catelog> sons = catelogService.getSons(getParamMap(),id);
            if(!sons.isEmpty() && sons.size()>0){
                result.put("status","success");
                result.put("sons",sons);
            }
        }
        return result;
    }
}
