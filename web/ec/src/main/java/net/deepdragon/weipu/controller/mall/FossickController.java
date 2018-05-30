package net.deepdragon.weipu.controller.mall;

import com.allinpay.ets.client.StringUtil;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.Constant;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.tools.mail.MailSenderInfo;
import net.deepdragon.weipu.tools.mail.MailTools;
import net.deepdragon.weipu.tools.mail.SimpleMailSender;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.util.*;

import static org.springframework.web.util.HtmlUtils.htmlUnescape;

/**
 * 前台主页面
 */
@Controller(Global.APP_SIGN + Global.MALL + "FossickController")
@RequestMapping("/fossick")
public class FossickController extends BaseMallController {

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
    private SMSLogService smsLogService;
    @Resource
    private SystemSetService systemSetService;

    @RequestMapping(value = "list")
    public String index(Model model,HttpServletRequest request) {
        String whichclient = request.getParameter(Global.WHICHCLIENT);
        String info = "农资淘列表页";
        setLogInfo(info);
        logger.debug(info);
        getAllCatelog(model);// 首页类目展示
        setPublicDate2Model( model );
        model.addAttribute("adslides", getAdslides("index"));
        model.addAttribute("notices", getNotice());
        model.addAttribute("carbrandList", getCarBrandList());
//        model.addAttribute("carSeriesList", getCarSeriesList());
//        model.addAttribute("cartypeList", getCartypeList());
        //首页轮播广告下方展示的商品信息(不同标签的)
        //getData4IndexTagGoods(model);
        //品牌旗舰店的数据
        getData4IndexShop(model);
        //getData4Indexbrand(model);
        //楼层展示的数据
        getData4IndexFloor(model);

        // 首页右侧的“爱车档案”和“今日爆款”数据
        getData4IndexSlide(model);


        model.addAttribute("articleComn", getArticlesBySign(getParamMap()));
        model.addAttribute("advertisement", "");//取广告位
        if(Global.WHICH_APP.equals(whichclient)){
            return Global.TEMPLATE_APP + PATH + "/fossick";
        }else{
            return Global.TEMPLATE_MALL + PATH + "/fossick";
        }

        }
    //手机端
    @RequestMapping("/list,{type}")
    public String indexAPP(@PathVariable String type,Model model) {
        String info = "农资淘列表页";
        setLogInfo(info);
        logger.debug(info);
        getAllCatelog(model);// 首页类目展示
        setPublicDate2Model( model );
        model.addAttribute("adslides", getAdslides("index"));
        model.addAttribute("notices", getNotice());
        model.addAttribute("carbrandList", getCarBrandList());
//        model.addAttribute("carSeriesList", getCarSeriesList());
//        model.addAttribute("cartypeList", getCartypeList());
        //首页轮播广告下方展示的商品信息(不同标签的)
        //getData4IndexTagGoods(model);
        //品牌旗舰店的数据
        getData4IndexShop(model);
        //getData4Indexbrand(model);
        //楼层展示的数据
        getData4IndexFloor(model);

        // 首页右侧的“爱车档案”和“今日爆款”数据
        getData4IndexSlide(model);


        model.addAttribute("articleComn", getArticlesBySign(getParamMap()));
        model.addAttribute("advertisement", "");//取广告位
        if(StringUtils.isEmpty(type)){
            return Global.TEMPLATE_MALL + PATH + "/fossick";
        }else{
            return Global.TEMPLATE_APP + PATH + "/fossick";
        }
    }

    //首页轮播广告下方展示的商品信息(不同标签的)
    private void getData4IndexTagGoods(Model model) {
    	List<Map<String, Object>> tagList = new ArrayList<Map<String,Object>>();
    	String[] tagNames = new String[] { "今日特价", "热门商品", "爆款商品", "人气商品" };
		String[] tagSigns = new String[] { "specialoffer", "hot", "explosion", "pop" };
		Map<String, Object> tagMap = null;
		for (int i = 0; i < tagNames.length; i++) {
			tagMap = new HashMap<String, Object>();
			tagMap.put("name", tagNames[i]);
			tagMap.put("sign", tagSigns[i]);
//            List<Map<String, Object>> tagGoodsList = new ArrayList<Map<String, Object>>();
//            Map<String, Object> dataMap;
            List<Goods> goodsList = null;
            for (String sign : tagSigns) {
//                dataMap = new HashMap<String, Object>();
                try {
                    /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
                    goodsList = goodsService.getTagGoods4Index(getParamMap(), sign, 4,getWhichPlat());
                    /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
                } catch (Exception e) {
                    logger.error("IndexController中getData4IndexTagGoods方法，发生异常：", e);
                }

//                tagGoodsList.add(dataMap);
            }
            tagMap.put("goodsList", goodsList);
			tagList.add(tagMap);
		}
		model.addAttribute("tagList", tagList);
    }

    //获取Tag和Goods
    private List<Map<String, Object>> getDataIndexTagGoods(Catelog catelog) {
        String[] tagNames = new String[] { "今日特价", "热门商品", "爆款商品", "人气商品" };
        String[] tagSigns = new String[] { "specialoffer", "hot", "explosion", "pop" };
        List<Map<String, Object>> tagList = new ArrayList<Map<String, Object>>();
        Map<String, Object> tagMap = null;
        for (int i = 0; i < tagNames.length; i++) {
            tagMap = new HashMap<String, Object>();
            tagMap.put("name", tagNames[i]);
            tagMap.put("sign", tagSigns[i]);
            List<Goods> goodsList = null;
            try {
                goodsList = goodsService.getTagGoods4IndexbyID(getParamMap(), tagSigns[i], 10,catelog.getId(), getWhichPlat());
            } catch (Exception e) {
                logger.error("IndexController中getTagGoods4IndexbyID方法，发生异常：", e);
            }
            tagMap.put("goodsList", goodsList);
            tagList.add(tagMap);
        }
        return tagList;
    }

    
//    private void getData4Indexbrand(Model model) {
//    	try {
//    		Criteria criteria = new Criteria();
//        	criteria.add(Restrictions.order("createDate", "desc"));
//			List<GoodsBrand> barndList = goodsBrandService.getList(getParamMap(), criteria);
//			model.addAttribute("barndList", barndList);
//		} catch (Exception e) {
//			logger.error("IndexController中getData4Indexbrand方法，发生异常：", e);
//		}
//    }
    
	/**
	 * 获取品牌旗舰店数据
	 * 
	 * @param model
	 */
    private void getData4IndexShop(Model model) {
    	try {
    		Criteria criteria = new Criteria();
        	criteria.add(Restrictions.order("wis.orderNo", "asc"));
        	criteria.add(Restrictions.limit("0", "10"));
            criteria.add(Restrictions.eq("wis."+Constant.TENANTID_KEY,getTenantId()));
            criteria.add(Restrictions.eq("wis."+Constant.PLATFORM_KEY,getPlatform()));
			List<IndexShop> list = indexShopService.getList(getParamMap(), criteria);
			model.addAttribute("indexShopList", list);
		} catch (Exception e) {
			logger.error("IndexController中getData4IndexShop方法，发生异常：", e);
		}
    }
    
    private void getData4IndexFloor(Model model) {
    	List<Catelog> indexCatelogList = getIndexCatelogList();
    	List<Map<String, Object>> typeList = new ArrayList<Map<String, Object>>();
        int i = 0;
        int n = 1;
        for (Catelog catelog : indexCatelogList) {
            Map<String, Object> data = new HashMap<String, Object>();
            i = i + 1;
            data.put("floor_left_" + i + "_1", getNewsAd("floor_left_" + i + "_1", 1));
            data.put("floor_bottom_" + i + "_1", getNewsAd("floor_bottom_" + i + "_1", 1));
            if(i % 2 == 0){
                data.put("fossick_floor_" + n + "_1", getNewsAd("fossick_floor_" + n + "_1", 1));
                n++;
            }
            data.put("catelog", catelog);
            data.put("categrandList", getChildrenList(catelog.getId()));
//            data.put("brandchildList", getCategoryBrandList(catelog.getId()));

            List<Map<String, Object>> dataTagGoods = getDataIndexTagGoods(catelog);
            data.put("tagList", dataTagGoods);
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
            criteria.add(Restrictions.eq(Constant.TENANTID_KEY,getTenantId()));
            criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,getPlatform()));
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
    // 站内公告
    private List<Articles> getNotice() {
        List<Articles> notices = null;
        try {
            notices = articlesService.getArticles(getParamMap(), "notice", 4, "isTop", "desc");
        } catch (Exception e) {
            logger.error("获取首页站内公告时发生异常", e);
            e.printStackTrace();
        }
        return notices;
    }
    @RequestMapping(value = "/allSort")
    public String allSort(Model model) {
        String info = "获取所有商品分类";
        setLogInfo(info);
        logger.debug(info);

        getAllCatelog(model);// 全部商品分类

        setPublicDate2Model( model );
        return Global.TEMPLATE_MALL + PATH + "/allSort";
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
    public String artcleDetail(@PathVariable String id, Model model) throws Exception {
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
        model.addAttribute("content", htmlUnescape(articles.getContent()));
        model.addAttribute("articlesCategory", articlesCategory);
        setPublicDate2Model( model );
        return Global.TEMPLATE_MALL + PATH + "/article_detail";
    }

    @RequestMapping(value = "findPwd")
    public String findPwd(Model model) {
        String info = "会员找回密码";
        setLogInfo(info);
        logger.debug(info);
        model.addAttribute("services", cacheData.getServices(getParamMap()));
        return Global.TEMPLATE_MALL + PATH + "/findpwd";
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
            result.put("mob", username);
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

    @RequestMapping(value = "/ajaxSendSms")
    public
    @ResponseBody
    Object ajaxSendSms(HttpServletRequest request) {
        String info = "发送短信";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String,Object> resultSms = null;
        String flags = "false";
        try {
            String mobileo = request.getParameter("mobileo");
            String password = MailTools.getRandString(6);

            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("userName", mobileo));

            List<Member> list = memberService.getList(getParamMap(), criteria);

            if (list != null && list.size() > 0) {
                Member member = list.get(0);

                String passwordMd5 = new Md5Hash(password).toHex();
                member.setPasswd(passwordMd5);

                memberService.update(getParamMap(), member);

                //发送短信 SmsUtil.sendSms 传手机号码 以及短信内容
                resultSms = smsLogService.sendSMS(getParamMap(),mobileo, "尊敬的会员" + mobileo + ",您的密码被重置为：" + password + ",您可以登录系统后进行密码修改", systemSetService.getAll(getParamMap()));

                if("success".equals(resultSms.get("status"))){
                    flags = SUCCESS;
                }
                //保存日志
                this.articlesService.insertOne(getParamMap(), resultSms.get( "smslogSql" )+"");
            }
            result.put(STATUS, flags);
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
        List<String> BrandIds = categoryService.getBrandIds(getParamMap(), goodsCategory.getId() + "%", 7);
        List<GoodsBrand> goodsBrandList = new ArrayList<GoodsBrand>();
        for (String id : BrandIds) {
            try {
                GoodsBrand goodsBrand = goodsBrandService.get(getParamMap(), id);
                goodsBrandList.add(goodsBrand);
            } catch (Exception e) {
                logger.error("查询商品品牌时");
                e.printStackTrace();
            }
        }
        return goodsBrandList;
    }

    // 商品信息
    private List<Goods> getGoodsList(Catelog catelog) {
    	List<Goods> goodsList = null;
        try {
        	GoodsCategory goodsCategory = categoryService.getGategoryByCatelog(getParamMap(), catelog.getId());
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.like("categoryPath", goodsCategory.getId()+"%"));
            criteria.add(Restrictions.eq("isMarketable", 1));
            criteria.add(Restrictions.eq("status", 5));
            /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
            criteria.add(Restrictions.lt("platform",3));
            /**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
            criteria.add(Restrictions.eq("isIndex",1));
            criteria.add(Restrictions.order("indexOrder", "ASC"));
            criteria.add(Restrictions.limit("0", "8"));
            goodsList = goodsService.getList(getParamMap(), criteria);
        } catch (Exception e) {
			logger.error("查询商品信息时,发生异常：", e);
		}
        return goodsList;
    }
    
    public List<Map<String, Object>> getArticlesBySign(Map<String, Object> paramMap) {
        List<Map<String, Object>> services = null;
        services = new ArrayList<Map<String, Object>>();
        // 保养秘籍-main,轮胎须知-send,电瓶常识-battery,服务园地-saleservice
        String[] signs = new String[]{"main", "tire", "battery", "service",};
        try {
            for (String sign : signs) {
                ArticlesCategory category = articlesCategoryService.find(
                        paramMap, "sign", sign);
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
        String info = "查看汽车相关常识[id:" + id + "]";
        setLogInfo(info);
        logger.debug(info);
        try {
        	ArticlesCategory articlesCategory = articlesCategoryService.get(getParamMap(),id);
        	
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("categoryId", id));
            if (StringUtils.isNotEmpty(pager.getOrderBy())
                    && StringUtils.isNotEmpty(pager.getOrderType())) {
                criteria.add(Restrictions.order(pager.getOrderBy(), pager
                        .getOrderType().toUpperCase()));
            }
            criteria.add(Restrictions.eq("isPublication", 1));
			criteria.add(Restrictions.order("isTop", "desc"));
			criteria.add(Restrictions.order("createDate", "desc"));
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
        return Global.MALL + "/car_comn";
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
            criteria.add(Restrictions.limit("0", "1"));
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
}
