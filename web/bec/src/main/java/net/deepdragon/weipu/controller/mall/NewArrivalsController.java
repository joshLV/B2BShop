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
import net.deepdragon.weipu.staticize.Staticize;
import net.deepdragon.weipu.tools.UploadTools;
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
import sun.misc.BASE64Decoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import static org.springframework.web.util.HtmlUtils.htmlUnescape;

/**
 * 前台主页面
 */
@Controller(Global.APP_SIGN + Global.MALL + "NewArrivalsController")
@RequestMapping(Global.MALL_PATH + "/newArrivals")
public class NewArrivalsController extends BaseMallController {
    @Resource
    private CacheData cacheData;
    @Resource
    private GoodsService goodsService;
    @Resource
    private MerchantService shopService;

    @Resource
    private SystemSetService systemSetService;
    @Resource
    private CatelogService catelogService;


    /**
     * 获取所有的商品，首次加载
     * @param mid 商家ID
     * @param mn 商家名称
     * @param sn 商品简称
     * @param cl 分类
     * @param bc 条码
     * @param vt 视图类型，不传值为默认视图，传值为表格视图
     * @param model
     * @param pager
     * @param request
     * @return
     */
    @RequestMapping(value = "list")
    public String allG(String mid,String mn,String sn, String cl,String bc,String vt,Model model,Pager pager,HttpServletRequest request) {
        String info = "商品列表页";
        setLogInfo(info);
        logger.error(info);
        getAllCatelog(model);
        try {
            if (net.deepdragon.util.StringUtil.isNotEmpty(mn)) {
                mn = URLDecoder.decode(mn, "UTF-8");
            }
            if (net.deepdragon.util.StringUtil.isNotEmpty(sn)) {
                sn = URLDecoder.decode(sn, "UTF-8");
            }
            if (net.deepdragon.util.StringUtil.isNotEmpty(cl)) {
                cl = URLDecoder.decode(cl, "UTF-8");
            }
            if (net.deepdragon.util.StringUtil.isNotEmpty(bc)) {
                bc = URLDecoder.decode(bc, "UTF-8");
            }

            pager = getData(mid, mn, sn, cl, bc, pager);

            model.addAttribute("mid", mid);

            if(net.deepdragon.util.StringUtil.isNotEmpty( mid ) && net.deepdragon.util.StringUtil.isEmpty( mn )){
                Merchant shop = this.shopService.get(getParamMap(), mid);
                mn = shop == null ? "" : shop.getName();
            }

            model.addAttribute("mn", mn);
            model.addAttribute("sn", sn);
            model.addAttribute("cl", cl);
            model.addAttribute("bc", bc);
            model.addAttribute("pager", pager);
            model.addAttribute("total", pager.getTotalCount());
            model.addAttribute("imageUrl", systemSetService.find(getParamMap(), "setkey", "imageUrl").getSetvalue());


            List<Goods> goodsList = (List<Goods>)pager.getList();
            if(goodsList != null && goodsList.size() > 0) {
                Map<String,Map<String, List<Map<String, Object>>>> goodsSpList = new HashMap<String,Map<String, List<Map<String, Object>>>>();
                for (Goods goods : goodsList) {
                    goodsSpList.put(goods.getId(), goodsService.getGoodsSpInfo(getParamMap(), goods.getId()));
                }
                model.addAttribute("goodsSpList", goodsSpList);
            }
            model.addAttribute("goodslist", goodsList);

            //价格是否隐藏
            Buyer buyer = getCurrentMember(request);
            if (!net.deepdragon.util.StringUtil.isNotEmpty(buyer)) {
                model.addAttribute("priceHide", "hide");
            }

            setPublicDate2Model(model);

            List<Catelog> catelogList = catelogService.getAllParents(getParamMap());
            model.addAttribute("catelogs",catelogList );

        }catch (Exception e){
            logger.error("获取所有商品时，发生异常", e);
            e.printStackTrace();
        }

        if("list".equals(vt)){
            return Global.TEMPLATE_MALL + PATH + "/new_arrivals_list";
        }
        return Global.TEMPLATE_MALL + PATH + "/new_arrivals";
    }


    /**
     * 获取所有的商品，首次加载
     * @param mid 商家ID
     * @param mn 商家名称
     * @param sn 商品简称
     * @param cl 分类
     * @param bc 条码
     * @param vt 视图类型，不传值为默认视图，传值为表格视图
     * @param model
     * @param pager
     * @param request
     * @return
     */
    @RequestMapping(value = "list_app")
    public String list_app(String mid,String mn,String sn, String cl,String bc,String vt,Model model,Pager pager,HttpServletRequest request) {
        String info = "商品列表页";
        setLogInfo(info);
        logger.error(info);
        getAllCatelog(model);
        try {
            if (net.deepdragon.util.StringUtil.isNotEmpty(mn)) {
                mn = URLDecoder.decode(mn, "UTF-8");
            }
            if (net.deepdragon.util.StringUtil.isNotEmpty(sn)) {
                sn = URLDecoder.decode(sn, "UTF-8");
            }
            if (net.deepdragon.util.StringUtil.isNotEmpty(cl)) {
                cl = URLDecoder.decode(cl, "UTF-8");
            }
            if (net.deepdragon.util.StringUtil.isNotEmpty(bc)) {
                bc = URLDecoder.decode(bc, "UTF-8");
            }

            pager = getData(mid, mn, sn, cl, bc, pager);

            model.addAttribute("mid", mid);

            if(net.deepdragon.util.StringUtil.isNotEmpty( mid ) && net.deepdragon.util.StringUtil.isEmpty( mn )){
                Merchant shop = this.shopService.get(getParamMap(), mid);
                mn = shop == null ? "" : shop.getName();
            }

            model.addAttribute("mn", mn);
            model.addAttribute("sn", sn);
            model.addAttribute("cl", cl);
            model.addAttribute("bc", bc);
            model.addAttribute("pager", pager);
            model.addAttribute("total", pager.getTotalCount());
            model.addAttribute("imageUrl", systemSetService.find(getParamMap(), "setkey", "imageUrl").getSetvalue());


            List<Goods> goodsList = (List<Goods>)pager.getList();
            if(goodsList != null && goodsList.size() > 0) {
                Map<String,Map<String, List<Map<String, Object>>>> goodsSpList = new HashMap<String,Map<String, List<Map<String, Object>>>>();
                for (Goods goods : goodsList) {
                    goodsSpList.put(goods.getId(), goodsService.getGoodsSpInfo(getParamMap(), goods.getId()));
                }
                model.addAttribute("goodsSpList", goodsSpList);
            }
            model.addAttribute("goodslist", goodsList);

            //价格是否隐藏
            Buyer buyer = getCurrentMember(request);
            if (!net.deepdragon.util.StringUtil.isNotEmpty(buyer)) {
                model.addAttribute("priceHide", "hide");
            }

            setPublicDate2Model(model);

            List<Catelog> catelogList = catelogService.getAllParents(getParamMap());
            model.addAttribute("catelogs",catelogList );

        }catch (Exception e){
            logger.error("获取所有商品时，发生异常", e);
            e.printStackTrace();
        }

        return Global.TEMPLATE_APP+ PATH + "/goods_xptj_list";
    }

    @RequestMapping(value = "/list_app_ajax",  method = { RequestMethod.POST })
    public  @ResponseBody
    Object list_app_ajax(String mid,String mn,String sn, String cl,String bc,String vt,Model model,Pager pager,HttpServletRequest request) {
        String info = "加载更多的商品";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(STATUS, SUCCESS);
        result.put(MESSAGE, "操作成功");
        try {

            if (net.deepdragon.util.StringUtil.isNotEmpty(mn)) {
                mn = URLDecoder.decode(mn, "UTF-8");
            }
            if (net.deepdragon.util.StringUtil.isNotEmpty(sn)) {
                sn = URLDecoder.decode(sn, "UTF-8");
            }
            if (net.deepdragon.util.StringUtil.isNotEmpty(cl)) {
                cl = URLDecoder.decode(cl, "UTF-8");
            }
            if (net.deepdragon.util.StringUtil.isNotEmpty(bc)) {
                bc = URLDecoder.decode(bc, "UTF-8");
            }

            pager = getData(mid, mn, sn, cl, bc, pager);
            result.put(DATA, pager.getList());
            result.put("pager", pager);
        } catch (Exception e) {
            logger.error("ajax获取推荐商品列表时发生异常", e);
            e.printStackTrace();
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "操作失败");
        }
        return result;
    }


    /**
     * 查询所有商品
     * @param merchantId 商家ID
     * @param merchantName 商家名称
     * @param goodsShortName 商品简称
     * @param catelog 分类
     * @param barCode 分类
     * @param pager
     * @return
     */
    private Pager getData(String merchantId,String merchantName, String goodsShortName, String catelog, String barCode, Pager pager) {
        try {

            if( "createDate".equals( pager.getOrderBy() ) ){
                pager.setOrderBy("sales");
                pager.setOrderType("desc");
            }

            Criteria criteria = new Criteria();

            if( StringUtils.isNotEmpty(merchantId) ){
                criteria.add(Restrictions.eq("o.shopId", merchantId));
            }

            if( StringUtils.isNotEmpty(merchantName) ) {
                criteria.add(Restrictions.like("o.shopName", "%" + merchantName + "%"));
            }

            if( StringUtils.isNotEmpty(goodsShortName) ) {
                criteria.add(Restrictions.or(Restrictions.like("o.shortName", "%" + goodsShortName + "%"), Restrictions.like("o.name", "%" + goodsShortName + "%")));
            }

            if( StringUtils.isNotEmpty(catelog) ) {
                criteria.add(Restrictions.like("o.clName", "%" + catelog + "%"));
            }

            //barcode  packageBarCode
            if( StringUtils.isNotEmpty(barCode) ) {
                criteria.add(Restrictions.or(Restrictions.like("o.barcode", "%" + barCode + "%"),Restrictions.like("o.packageBarCode", "%" + barCode + "%")));
            }

            criteria.add(Restrictions.eq("o.tenantId", getTenantId()));
            criteria.add(Restrictions.eq("o.tagSign", "newArrivalsList"));
            criteria.add(Restrictions.ge("o.platform", 2));
            criteria.add(Restrictions.ge("o.type", 0));//过滤众筹
            criteria.add(Restrictions.ge("o.status", 5));//过滤众筹
            criteria.add(Restrictions.ge("o.isMarketable", 1));//过滤众筹
            if (StringUtils.isNotEmpty(pager.getOrderBy())
                    && StringUtils.isNotEmpty(pager.getOrderType())) {
                criteria.add(Restrictions.order("price".equals(pager.getOrderBy()) ? "o.minBatchPrice" : pager.getOrderBy(), pager.getOrderType().toUpperCase()));
            }
            pager.setPageSize(20);
            pager = goodsService.getPagerByTag4BEC2(getParamMap(), criteria, pager);



        }catch (Exception e){
            logger.error("获取所有商品时，发生异常", e);
            e.printStackTrace();
        }

        return pager;
    }


    /**
     * 获取所有的商品，首次加载
     * @param mid 商家ID
     * @param mn 商家名称
     * @param sn 商品简称
     * @param cl 分类
     * @param bc 条码
     * @param pager
     * @param request
     * @return
     */
    @RequestMapping(value = "ajaxList")
    @ResponseBody
    public Map<String, Object> ajaxAllG(String mid,String mn,String sn,String cl,String bc, Pager pager,HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();

        //获取Session中是否有登录信息 没有则加标识 首页商品价格不可见
        Buyer buyer = getCurrentMember(request);
        if(!net.deepdragon.util.StringUtil.isNotEmpty(buyer)){
            result.put("priceHide", "hide");
            result.put(STATUS, SUCCESS);

            return  result;
        }

        try {
            String info = "商品列表页";
            setLogInfo(info);
            logger.error(info);

            pager = getData(mid, mn, sn, cl, bc, pager);

            result.put(STATUS, SUCCESS);
            result.put(MESSAGE, "成功");
            result.put("mid", mid);
            result.put("mn", mn);
            result.put("sn", sn);
            result.put("cl", cl);
            result.put("bc", bc);
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
            logger.error("获取所有商品时，发生异常", e);
            e.printStackTrace();
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "获取所有商品时，发生异常");
        }

        return result;
    }


}
