package net.deepdragon.weipu.controller.mall;

import java.net.URLDecoder;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.bean.CartItemCookie;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.erp.yunji.api.YunJiErpApiUtil;
import net.deepdragon.weipu.Global;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

/**
 * 购物车页面
 */
@Controller(Global.APP_SIGN + Global.MALL + "CartController")
@RequestMapping("/cart")
public class CartController extends BaseMallController {
    @Resource
    private CacheData cacheData;
    @Resource
    private CartItemService cartItemService;
    @Resource
    private GoodsImagesService goodsImagesService;
    @Resource
    private GoodsService goodsService;
    @Resource
    private MerchantService merchantService;
    @Resource
    private BuyerOperatorService buyerOperatorService;

    @Resource
    private OrderService orderService;
    @Resource
    private OrderItemService orderItemService;


    @RequestMapping(value = "/ajaxAddCart")
    public
    @ResponseBody
    Object ajaxAddCart(HttpServletRequest request) {
        String info = "购物车添加商品";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String memberId = request.getParameter("memberId");
            String goodsId = request.getParameter("gid");
            String quantity = request.getParameter("cnt");
            int count = Integer.parseInt(quantity);

            /** 保存购物车时保存商品所属商家信息 TianYu 2015-8-19  */
            Goods goods = goodsService.get(getParamMap(), goodsId);
            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录Start--------*/
            LoginType loginType = getLoginType(request);
            BuyerOperator buyerOperator = getCurrentOperator(request);
            if (LoginType.operator.equals(loginType)){
                if(StringUtil.isNotEmpty(buyerOperator.getId())){
                    buyerOperator = buyerOperatorService.get(getParamMap(),buyerOperator.getId());
                }
            }
            boolean flag =false;
            //采购商操作员
            if (LoginType.operator.equals(loginType)) {
                flag = cartItemService.saveCartItemValues4B2B(getParamMap(),buyerOperator.getId(),memberId, goodsId, goods.getShopId(), count, "");
            }else{
                flag = cartItemService.saveCartItemValues4B2B(getParamMap(),memberId ,null, goodsId, goods.getShopId(), count, "");
            }

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

    /**
     * Desc:批量加入购物车
     * Auth:zhangqiang
     * Time:2016-01-27 11:25:33
     *
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/addBatch")
    public String addBatch(Model model, HttpServletRequest request, HttpServletResponse response, String goodsIds, String backurl) {
        String info = "批量加入购物车";
        getAllCatelog(model);
        setLogInfo(info);

        setPublicDate2Model(model);
        try {
            if (StringUtil.isNotEmpty(goodsIds)) {
                String[] goodsIdsNums = goodsIds.split("--");
                if (StringUtil.isNotEmpty(goodsIdsNums) && goodsIdsNums.length > 0) {
                    for (int i = 0; i < goodsIdsNums.length; i++) {
                        String[] goodsIdNum = goodsIdsNums[i].split("_");
                        //规格值
                        String sp = null;
                        if (StringUtil.isNotEmpty(goodsIdNum) && goodsIdNum.length > 0) {
                            if (StringUtil.isNotEmpty(goodsIdNum[0]) && Integer.parseInt(goodsIdNum[1]) > 0) {

                                //获取规格值,如果页面已组装，保存页面的，如果页面未组装，取默认值
                                sp = goodsIdNum.length == 3 ? goodsIdNum[2] : getGoodsSp(goodsIdNum[0]);

                                // 查询库存
                                int stock = -1;
                                //如果使用了云极ERP，与ERP进行库存查询
                                if (isUseErpApi(getParamMap())) {
                                    Goods goods = goodsService.get(getParamMap(), goodsIdNum[0]);
                                    if (StringUtils.isNotEmpty(goods.getShopId())) {
                                        Merchant merchant = merchantService.get(getParamMap(), goods.getShopId());
                                        String result = YunJiErpApiUtil.erpWareHouseListQuery(merchant.getSign(), goods.getSn());
                                        JSONObject json = JSONObject.parseObject(result);
                                        if (json.getBoolean("isSuccessed")) {
                                            stock = json.getInteger("stock");
                                        }
                                    }
                                }
                                //如果使用云极ERP，且购买数量 > 实际库存，且此商品存在，不能加入购物车
                                if (isUseErpApi(getParamMap()) && Integer.parseInt(goodsIdNum[1]) > stock && stock != -1) {
                                    model.addAttribute("message", "库存不足,加入购物车失败！");
                                    model.addAttribute("backurl", backurl);
                                    break;
                                } else {
                                    Goods goods = goodsService.get(getParamMap(), goodsIdNum[0]);
                                    if (goods != null) {
                                        int count = Integer.parseInt(goodsIdNum[1]);
                                        Buyer mb = getCurrentMember(request);

                                        /**-------------------Desc:判断登录方式 采购商登录还是操作员登录Start--------*/
                                        LoginType loginType = getLoginType(request);
                                        model.addAttribute("loginType", loginType);
                                        BuyerOperator buyerOperator = getCurrentOperator(request);
                                        if (LoginType.operator.equals(loginType)){
                                            if(StringUtil.isNotEmpty(buyerOperator.getId())){
                                                buyerOperator = buyerOperatorService.get(getParamMap(),buyerOperator.getId());
                                            }
                                        }
                                        //用户登录时
                                        if (mb != null && mb.getId() != null) {
                                            try {
                                                boolean flag =false;
                                                //保存数据到购物车
                                                if (LoginType.operator.equals(loginType)){
                                                    flag = cartItemService.saveCartItemValues4B2B(getParamMap(),buyerOperator.getId(),mb.getId(),goodsIdNum[0], goods.getShopId(), count, sp);
                                                }else{
                                                    flag = cartItemService.saveCartItemValues4B2B(getParamMap(), mb.getId(),null,goodsIdNum[0], goods.getShopId(), count, sp);
                                                }
                                                if (flag) {
                                                    model.addAttribute("message", "success");
                                                } else {
                                                    model.addAttribute("message", "商品加入购物车失败！");
                                                }
                                            } catch (Exception e) {
                                                model.addAttribute("message", "商品加入购物车失败！");
                                            }
                                        }
                                    }
                                }


                            }
                        }
                    }
                }
            }
            model.addAttribute("backurl", backurl);
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
        }
        return Global.TEMPLATE_MALL + PATH + "/cart";
    }

    /**
     * Desc:ajax加入购物车 采购单立即购买 先加入购物车然后立即购买
     * @param request
     * @return
     */
//    @RequestMapping(value = "ajaxAddCars", method = { RequestMethod.POST })
//    public @ResponseBody
//    Object ajaxAddCars(HttpServletRequest request, HttpServletResponse response, String goodsIds) {
//        String info = "ajax加入购物车";
//        setLogInfo(info);
//        logger.debug(info);
//        String carItemIds = "";
//
//        Map<String, Object> result = new HashMap<String, Object>();
//
//        try{
//            if (StringUtil.isNotEmpty(goodsIds)) {
//                String[] goodsIdsNums = goodsIds.split("--");
//                if (StringUtil.isNotEmpty(goodsIdsNums) && goodsIdsNums.length > 0) {
//                    for (int i = 0; i < goodsIdsNums.length; i++) {
//                        String[] goodsIdNum = goodsIdsNums[i].split("_");
//                        //规格值
//                        String sp = null;
//                        if (StringUtil.isNotEmpty(goodsIdNum) && goodsIdNum.length > 0) {
//                            if (StringUtil.isNotEmpty(goodsIdNum[0]) && Integer.parseInt(goodsIdNum[1]) > 0) {
//
//                                //获取规格值,如果页面已组装，保存页面的，如果页面未组装，取默认值
//                                sp = goodsIdNum.length == 3 ? goodsIdNum[2] : getGoodsSp(goodsIdNum[0]);
//
//                                // 查询库存
//                                int stock = -1;
//
//                                Goods goods = goodsService.get(getParamMap(), goodsIdNum[0]);
//                                if (goods != null) {
//                                    int count = Integer.parseInt(goodsIdNum[1]);
//                                    Buyer mb = getCurrentMember(request);
//                                    //用户登录时
//                                    if (mb != null && mb.getId() != null) {
//                                        //保存数据到购物车
//                                        boolean flag = cartItemService.saveCartItemValues4B2B(getParamMap(), mb.getId(), goodsIdNum[0], goods.getShopId(), count, sp);
//                                        if (flag) {
//                                            result.put(STATUS, "SUCCESS");
//                                            result.put(MESSAGE, "成功");
//
//                                            Criteria criteria = new Criteria();
//                                            criteria.add(Restrictions.eq("memberId", mb.getId()));
//                                            criteria.add(Restrictions.eq("goodsId", goodsIdNum[0]));
//                                            criteria.add(Restrictions.order("createDate","Desc"));
//
//                                            List<CartItem> CartItemList = cartItemService.getList(getParamMap(),criteria);
//                                            if(CartItemList != null && CartItemList.size() > 0){
//                                                if(StringUtil.isNotEmpty(CartItemList.get(0).getId())){
//                                                    carItemIds += CartItemList.get(0).getId();
//                                                    if(goodsIdsNums.length -1 != i){
//                                                        carItemIds += ",";
//                                                    }
//                                                }
//                                            }
//                                        } else {
//                                            result.put(STATUS, "ERROR");
//                                            result.put(MESSAGE, "失败");
//                                        }
//                                    }
//                                }
//
//
//                            }
//                        }
//                    }
//                }
//            }
//
//            if(StringUtil.isNotEmpty(carItemIds)){
//                result.put("carItemIds", carItemIds);
//            }
//        }catch (Exception ex) {
//            logger.error(info + "时，发生异常", ex);
//            result.put(STATUS, ERROR);
//            result.put(MESSAGE, "导入采购单失败!");
//        }
//        return result;
//    }

    /**
     * Desc:获取商品的默认规格
     * Auth:zhangqiang
     * Time:2016-01-27 11:25:33
     *
     * @param goodsId
     * @return
     */
    public String getGoodsSp(String goodsId) {
        String info = "获取商品默认规格";
        setLogInfo(info);
        String goodsSpStr = "";
        try {
            if (StringUtil.isNotEmpty(goodsId)) {
                Map<String, List<Map<String, Object>>> goodsSpInfoMap = goodsService.getGoodsSpInfo(getParamMap(), goodsId);
                List<Map<String, Object>> goodsSpList = goodsSpInfoMap.get("goodsSpList");
                List<Map<String, Object>> goodsSpItemList = goodsSpInfoMap.get("goodsSpItemList");
                StringBuilder sb = new StringBuilder();
                if (goodsSpList != null && goodsSpList.size() > 0 && goodsSpItemList != null && goodsSpItemList.size() > 0) {
                    int i = 0;
                    for (Map<String, Object> spm : goodsSpList) {
                        for (Map<String, Object> spi : goodsSpItemList) {
                            if (StringUtil.isNotEmpty(spm.get("id")) && spm.get("id").equals(spi.get("specificationId"))) {
                                if (i > 0) {
                                    sb.append(",");
                                }
                                i++;
                                sb.append(spm.get("name")).append(":").append(spi.get("name"));
                                break;
                            }
                        }
                    }
                }
                goodsSpStr = sb.toString();
            }

        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
        }
        return goodsSpStr;
    }

    @RequestMapping(value = "/settlement")
    public String toSettlement(Model model, HttpServletRequest request, HttpServletResponse response) {
        add(model, request, response, true);
        String type = request.getParameter(Global.WHICHCLIENT);
        if (Global.WHICH_APP.equals(type)) {
            return Global.TEMPLATE_APP + PATH + "/shopping_cart";
        } else {
            return Global.TEMPLATE_MALL + PATH + "/cart_list";
        }
    }

    @RequestMapping(value = "/add")
    public String addToCart(Model model, HttpServletRequest request, HttpServletResponse response) {
        String type = request.getParameter(Global.WHICHCLIENT);
        if (Global.WHICH_APP.equals(type)) {//移动端商品详情页加入购物车
//			cartItemList(model,request,info);

            add(model, request, response, true);
            return "redirect:/cart/list?whichclient=whichapp";
        } else {
            add(model, request, response, false);
            return Global.TEMPLATE_MALL + PATH + "/cart";
        }
    }

    @RequestMapping(value = "/goBuy")
    public String goBuy(Model model, HttpServletRequest request, HttpServletResponse response) {
        String type = request.getParameter(Global.WHICHCLIENT);
        if (Global.WHICH_APP.equals(type)) {//移动端商品详情页加入购物车
//			cartItemList(model,request,info);

            add(model, request, response, true);
            return "redirect:/cart/list?whichclient=whichapp";
        } else {
            add(model, request, response, false);
            return "redirect:/cart/list";
        }
    }

    /**
     * 保存购物车数据
     * 1、判断是否启用ERP，启用，进行库存校验；
     * 2、判断用户登录状态：
     * 登录，调用CartItemService.saveCartItemValues直接更新或保存商品信息到购物车表（wp_cart_item）；
     * 未登录：
     * 如果 Cookie中存在商品数据，CartItemService.saveCartItemValuesByUserKey直更新或保存商品数据到购物车表；
     * 如果Cookie中不存在，添加商品信息到Cookie，同时保存购物信息到购物车
     * <p/>
     * 更新：TianYu 2015-8-19 同时保存商品所属商家的ID到购物车表
     *
     * @param model
     * @param request
     * @param response
     * @param isAddList true 手机端， false PC端
     */
    private void add(Model model, HttpServletRequest request, HttpServletResponse response, Boolean isAddList) {
        String info = "加入购物车";
        setLogInfo(info);
        logger.debug(info);
        String goodsId = request.getParameter("gid");
        String quantity = request.getParameter("cnt");
        String backurl = request.getParameter("backurl");
        String sp = request.getParameter("sp");//规格
        getAllCatelog(model);
        try {

            if (StringUtil.isNotEmpty(sp)) {
                sp = URLDecoder.decode(sp, "utf-8");
            }//规格

            /** 在搜索列表页点击加入购物车时，添加默认的规格型号（默认第一个）  TianYu  2015-9-29 Start */
            if (StringUtil.isEmpty(sp)) {
                Map<String, List<Map<String, Object>>> goodsSpInfoMap = goodsService.getGoodsSpInfo(getParamMap(), goodsId);
//				result.put("goodsSpList", goodsSpList);
//				result.put("goodsSpItemList", goodsSpItemList);
                List<Map<String, Object>> goodsSpList = goodsSpInfoMap.get("goodsSpList");
                List<Map<String, Object>> goodsSpItemList = goodsSpInfoMap.get("goodsSpItemList");
                StringBuilder sb = new StringBuilder();
                if (goodsSpList != null && goodsSpList.size() > 0 && goodsSpItemList != null && goodsSpItemList.size() > 0) {
                    int i = 0;
                    for (Map<String, Object> spm : goodsSpList) {
                        for (Map<String, Object> spi : goodsSpItemList) {
                            if (StringUtil.isNotEmpty(spm.get("id")) && spm.get("id").equals(spi.get("specificationId"))) {
                                if (i > 0) {
                                    sb.append(",");
                                }
                                i++;
                                sb.append(spm.get("name")).append(":").append(spi.get("name"));
                                break;
                            }
                        }
                    }
                }

                sp = sb.toString();
            }
            /** 在搜索列表页点击加入购物车时，添加默认的规格型号  TianYu  2015-9-29 End */

            // 查询库存
            int stock = -1;
            try {
                //如果使用了云极ERP，与ERP进行库存查询
                if (isUseErpApi(getParamMap())) {
                    Goods goods = goodsService.get(getParamMap(), goodsId);
                    if (StringUtils.isNotEmpty(goods.getShopId())) {
                        Merchant merchant = merchantService.get(getParamMap(), goods.getShopId());
                        String result = YunJiErpApiUtil.erpWareHouseListQuery(merchant.getSign(), goods.getSn());
//						String result = YunJiErpApiUtil.erpWareHouseListQuery(merchant.getSign(), goods.getProductId());
                        JSONObject json = JSONObject.parseObject(result);
                        if (json.getBoolean("isSuccessed")) {
                            stock = json.getInteger("stock");
                        }
                    }// end if goods.getShopId()
                }// end if isUseErpApi
            } catch (Exception e) {
                e.printStackTrace();
            }
            //如果使用云极ERP，且购买数量 > 实际库存，且此商品存在，不能加入购物车
            if (isUseErpApi(getParamMap()) && Integer.parseInt(quantity) > stock && stock != -1) {
                model.addAttribute("message", "库存不足,加入购物车失败！");
                model.addAttribute("backurl", backurl);
                setPublicDate2Model(model);

            } else {
                //使用云极ERP且库存充足或者未使用云极ERP
                Goods goods = goodsService.get(getParamMap(), goodsId);
                if (goods != null) {
                    int count = Integer.parseInt(quantity);
                    Buyer mb = getCurrentMember(request);

                    /**-------------------Desc:判断登录方式 采购商登录还是操作员登录Start--------*/
                    LoginType loginType = getLoginType(request);
                    model.addAttribute("loginType", loginType);
                    BuyerOperator buyerOperator = getCurrentOperator(request);
                    if (LoginType.operator.equals(loginType)){
                        if(StringUtil.isNotEmpty(buyerOperator.getId())){
                            buyerOperator = buyerOperatorService.get(getParamMap(),buyerOperator.getId());
                        }
                    }
                    //用户登录时
                    if (mb != null && mb.getId() != null) {
                        try {
                            //保存数据到购物车
                            boolean flag = false;
                            //采购商操作员
                            if (LoginType.operator.equals(loginType)) {
                                flag = cartItemService.saveCartItemValues4B2B(getParamMap(),buyerOperator.getId(),mb.getId(), goodsId, goods.getShopId(), count, sp);
                            }else{
                                flag = cartItemService.saveCartItemValues4B2B(getParamMap(),mb.getId() ,null, goodsId, goods.getShopId(), count, sp);
                            }
                            if (flag) {
                                model.addAttribute("message", "success");
                            } else {
                                model.addAttribute("message", "商品加入购物车失败！");
                            }
                            //没有中转页面，所以需要直接读取商品数据
                            if (isAddList) {//APP端
                                model.addAttribute("isLogin", "1");
                                model.addAttribute("cartItemList", cartItemService.getListByBuyerId(getParamMap(), mb.getId()));
                            }
                        } catch (Exception e) {
                            model.addAttribute("message", "商品加入购物车失败！");
                        }
                    } else { //未登陆时
                        boolean isExist = false;
                        Cookie[] cookies = request.getCookies();
                        //判断是否存在Cookie
                        if (cookies != null && cookies.length > 0) {
                            for (Cookie cookie : cookies) {
                                //判断Cookie中是否存在购物信息
                                if (StringUtils.equalsIgnoreCase(cookie.getName(), CartItemCookie.USERKEY_COOKIE_NAME)) {
                                    if (StringUtils.isNotEmpty(cookie.getValue())) {
                                        String userkey = cookie.getValue();
                                        try {
                                            //保存数据到购物车
                                            boolean flag = cartItemService.saveCartItemValuesByUserKey(getParamMap(), userkey, goodsId, goods.getShopId(), count, sp);
                                            if (flag) {
                                                model.addAttribute("message", "success");
                                            } else {
                                                model.addAttribute("message", "商品加入购物车失败！");
                                            }
                                            //没有中转页面，所以需要直接读取商品数据
                                            if (isAddList) {
                                                model.addAttribute("cartItemList", cartItemService.getListByUserKey(getParamMap(), userkey));
                                            }
                                        } catch (Exception e) {
                                            model.addAttribute("message", "商品加入购物车失败！");
                                        }
                                        isExist = true;
                                    }
                                }//end if 是否存在购物信息
                            }
                        }
                        //如果没有购物信息，保存购物信息到Cookie和购物车表
                        if (!isExist) {
                            String userkey = request.getSession().getId();
                            try {
                                Cookie cookie = new Cookie(CartItemCookie.USERKEY_COOKIE_NAME, userkey);
                                cookie.setPath(request.getContextPath() + "/");
                                cookie.setMaxAge(CartItemCookie.USERKEY_COOKIE_MAX_AGE);
                                response.addCookie(cookie);
                                boolean flag = cartItemService.saveCartItemValuesByUserKey(getParamMap(), userkey, goodsId, goods.getShopId(), count, sp);
                                if (flag) {
                                    model.addAttribute("message", "success");
                                } else {
                                    model.addAttribute("message", "商品加入购物车失败！");
                                }
                                //没有中转页面，所以需要直接读取商品数据
                                if (isAddList) {
                                    model.addAttribute("cartItemList", cartItemService.getListByUserKey(getParamMap(), userkey));
                                }
                            } catch (Exception e) {
                                model.addAttribute("message", "商品加入购物车失败！");
                            }
                        }
                    }//end if 是否登录
                    model.addAttribute("message", "商品已成功加入购物车！");
                    model.addAttribute("backurl", backurl);
                    setPublicDate2Model(model);
                }// end if 商品存在
            }// end else 未使用云极ERP

        } catch (RuntimeException e) {
            throw e;
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
        }
    }

    /**
     * 点击“我的购物车”按钮调用方法，组装购物车数据到购物车页面
     *
     * @param backurl
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/list")
    public String list(String backurl, Model model, HttpServletRequest request) {
        String info = "购物车结算";
        setLogInfo(info);
        logger.debug(info);
        Buyer currentMember = getCurrentMember(request);
        String type = request.getParameter(Global.WHICHCLIENT);
        try {
            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录Start--------*/
            LoginType loginType = getLoginType(request);
            BuyerOperator buyerOperator = getCurrentOperator(request);
            if (LoginType.operator.equals(loginType)){
                if(StringUtil.isNotEmpty(buyerOperator.getId())){
                    buyerOperator = buyerOperatorService.get(getParamMap(),buyerOperator.getId());
                }
            }
            if (currentMember != null && currentMember.getId() != null) {//会员登录
                List<CartItem> listCartItem =null;
                //根据会员ID查询所有的购物车信息
                if (LoginType.operator.equals(loginType)){
                    listCartItem = cartItemService.getListByBuyerId(getParamMap(), buyerOperator.getId());
                }else{
                    listCartItem = cartItemService.getListByBuyerId(getParamMap(), currentMember.getId());
                }
                List<CartItem> list = new ArrayList<>();

                installCartItem(listCartItem, list);

                /** 修改购物车数据的数据结构，按商家拆分 TianYu  2015-8-19 OLD  Start */
//								model.addAttribute("cartItemList", list);
                /** 修改购物车数据的数据结构，按商家拆分 TianYu  2015-8-19 OLD  End */

                /** 修改购物车数据的数据结构，按商家拆分 TianYu  2015-8-19 NEW  Start */
                if (Global.WHICH_APP.equals(type)) {
                    model.addAttribute("cartItemList",groupCartItemByShop(list));
                }else{
                    model.addAttribute("cartItemList", groupCartItemByShop(list));
                }

                /** 修改购物车数据的数据结构，. TianYu  2015-8-19 NEW  End */
            } else {
                Cookie[] cookies = request.getCookies();
                if (cookies != null && cookies.length > 0) {
                    for (Cookie cookie : cookies) {
                        if (StringUtils.equalsIgnoreCase(cookie.getName(), CartItemCookie.USERKEY_COOKIE_NAME)) {
                            if (StringUtils.isNotEmpty(cookie.getValue())) {
                                String userkey = cookie.getValue();
                                List<CartItem> listCartItem = cartItemService.getListByUserKey(getParamMap(), userkey);
                                List<CartItem> list = new ArrayList<>();
                                /*for (CartItem ci : listCartItem) {
                                    //start  添加商品批发价  hks 2015-10-19
                                    List<B2BGoodsPrice> batchPrice = cartItemService.getGoodsTradePrice(getParamMap(), ci.getGoodsId(), ci.getQuantity());
                                    if (batchPrice != null && batchPrice.size() > 0) {
                                        ci.setBatchPrice(batchPrice.get(0).getBatchPrice());
                                    }
                                    list.add(ci);
                                    //end  添加商品批发价  hks 2015-10-19
                                    Criteria criteria = new Criteria();
                                    criteria.add(Restrictions.eq("goodsId", ci.getGoodsId()));
                                    criteria.add(Restrictions.limit("0", "1"));
                                    try {
                                        if (isUseErpApi(getParamMap())) {
                                            ci.setStock(-1);
                                            Goods goods = goodsService.get(getParamMap(), ci.getGoodsId());
                                            if (StringUtils.isNotEmpty(goods.getShopId())) {
                                                Merchant merchant = merchantService.get(getParamMap(), goods.getShopId());
                                                String result = YunJiErpApiUtil.erpWareHouseListQuery(merchant.getSign(), goods.getSn());
                                                JSONObject json = JSONObject.parseObject(result);
                                                if (json.getBoolean("isSuccessed")) {
                                                    ci.setStock(json.getInteger("stock"));
                                                }
                                                ci.setShortName(goods.getShortName());
                                            }
                                        } else{
                                            Goods goods = goodsService.get(getParamMap(), ci.getGoodsId());
                                            ci.setShortName(goods.getShortName());
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                }*/

                                installCartItem(listCartItem, list);

                                /** 修改购物车数据的数据结构，按商家拆分 TianYu  2015-8-19 OLD  Start */
//								model.addAttribute("cartItemList", list);
                                /** 修改购物车数据的数据结构，按商家拆分 TianYu  2015-8-19 OLD  End */

                                /** 修改购物车数据的数据结构，按商家拆分 TianYu  2015-8-19 NEW  Start */
                                if (Global.WHICH_APP.equals(type)) {
                                    model.addAttribute("cartItemList", groupCartItemByShop(list));
                                }else{
                                    model.addAttribute("cartItemList", groupCartItemByShop(list));
                                }
                                /** 修改购物车数据的数据结构，按商家拆分 TianYu  2015-8-19 NEW  End */
                            }
                        }
                    }
                }
            }

            model.addAttribute("isLogin", currentMember == null ? "0" : "1");
            model.addAttribute("backurl", backurl);

            model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
            model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
            model.addAttribute("services", cacheData.getServices(getParamMap()));
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
        }
        if (Global.WHICH_APP.equals(type)) {
            return Global.TEMPLATE_APP + PATH + "/shopping_cart";
        } else {
            if("menu".equals(request.getParameter("cartType"))) {
                return Global.TEMPLATE_MALL + PATH + "/cart_menu_list";
            }
            return Global.TEMPLATE_MALL + PATH + "/cart_list";
        }
    }


    /**
     * 解析组装购物车数据
     * @param listCartItem
     * @param list
     */
    private void installCartItem( List<CartItem> listCartItem, List<CartItem> list) throws Exception{
        for (CartItem ci : listCartItem) {
            //start 添加商品批发价  hks 2015-10-19
            List<B2BGoodsPrice> batchPrice = cartItemService.getGoodsTradePrice(getParamMap(), ci.getGoodsId(), ci.getQuantity());
            if (batchPrice != null && batchPrice.size() > 0) {
                ci.setBatchPrice(batchPrice.get(0).getBatchPrice());
            }
            //end  添加商品批发价  hks 2015-10-19
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("goodsId", ci.getGoodsId()));
            criteria.add(Restrictions.limit("0", "1"));
            if (isUseErpApi(getParamMap())) {
                ci.setStock(-1d);
                Goods goods = goodsService.get(getParamMap(), ci.getGoodsId());
                if (StringUtils.isNotEmpty(goods.getShopId())) {
                    Merchant merchant = merchantService.get(getParamMap(), goods.getShopId());
                    String result = YunJiErpApiUtil.erpWareHouseListQuery(merchant.getSign(), goods.getSn());
                    JSONObject json = JSONObject.parseObject(result);
                    if (json.getBoolean("isSuccessed")) {
                        ci.setStock(Double.parseDouble(json.getInteger("stock")+""));
                    }
                    ci.setShortName(goods.getShortName());
                }
            } else{
                Goods goods = goodsService.get(getParamMap(), ci.getGoodsId());
                ci.setShortName(goods.getShortName());
            }

            if(list != null){
                list.add(ci);
            }
        }
    }

    /**
     * * 添加方法，list()中调用
     * 按照商品所属商家对商品进行分组
     * 返回Map的key：
     * 1、shopId:String
     * 2、shopName:String
     * 3、shopUrl:String
     * 4、items：List<CartItem>
     *
     * @param cartItems
     * @return
     */
    private List<Map<String, Object>> groupCartItemByShop(List<CartItem> cartItems) {
        if (cartItems == null || cartItems.size() == 0) {
            return null;
        }
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

        //获取所有的商家ID
        Set<String> merchants = new HashSet<String>();
        for (CartItem ci : cartItems) {
            merchants.add(ci.getMerchantId());
        }

        //组装数据
        for (String mid : merchants) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("shopId", mid);

            Iterator<CartItem> it = cartItems.iterator();
            List<CartItem> items = new ArrayList<CartItem>(0);
            while (it.hasNext()) {
                CartItem ci = it.next();
                if (mid.equals(ci.getMerchantId())) {
                    if (!map.containsKey("shopName") && !map.containsKey("shopUrl")) {
                        map.put("shopName", ci.getMerchantShortName());
                        map.put("shopUrl", ci.getMerchantUrlAddress());
                    }
                    items.add(ci);
                    it.remove();
                }
            }

            map.put("items", items);
            list.add(map);
        }
        return list;
    }

    public void cartItemList(Model model, HttpServletRequest request, String info) {
        Buyer currentMember = getCurrentMember(request);
        //type=request.getParameter("type");
        try {
            if (currentMember != null && currentMember.getId() != null) {
                List<CartItem> list = cartItemService.getListByBuyerId(getParamMap(), currentMember.getId());
                /*for (CartItem ci : list) {
                    Criteria criteria = new Criteria();
                    criteria.add(Restrictions.eq("goodsId", ci.getGoodsId()));
                    criteria.add(Restrictions.limit("0", "1"));
                    try {
                        if (isUseErpApi(getParamMap())) {
                            ci.setStock(-1);
                            Goods goods = goodsService.get(getParamMap(), ci.getGoodsId());
                            if (StringUtils.isNotEmpty(goods.getShopId())) {
                                Merchant merchant = merchantService.get(getParamMap(), goods.getShopId());
                                String result = YunJiErpApiUtil.erpWareHouseListQuery(merchant.getSign(), goods.getSn());
                                JSONObject json = JSONObject.parseObject(result);
                                if (json.getBoolean("isSuccessed")) {
                                    ci.setStock(json.getInteger("stock"));
                                }
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }*/

                installCartItem(list, null);
                model.addAttribute("cartItemList", list);
            } else {
                Cookie[] cookies = request.getCookies();
                if (cookies != null && cookies.length > 0) {
                    for (Cookie cookie : cookies) {
                        if (StringUtils.equalsIgnoreCase(cookie.getName(), CartItemCookie.USERKEY_COOKIE_NAME)) {
                            if (StringUtils.isNotEmpty(cookie.getValue())) {
                                String userkey = cookie.getValue();
                                List<CartItem> list = cartItemService.getListByUserKey(getParamMap(), userkey);
                                /*for (CartItem ci : list) {

                                    Criteria criteria = new Criteria();
                                    criteria.add(Restrictions.eq("goodsId", ci.getGoodsId()));
                                    criteria.add(Restrictions.limit("0", "1"));
                                    try {
                                        if (isUseErpApi(getParamMap())) {
                                            ci.setStock(-1);
                                            Goods goods = goodsService.get(getParamMap(), ci.getGoodsId());
                                            if (StringUtils.isNotEmpty(goods.getShopId())) {
                                                Merchant merchant = merchantService.get(getParamMap(), goods.getShopId());
                                                String result = YunJiErpApiUtil.erpWareHouseListQuery(merchant.getSign(), goods.getSn());
                                                JSONObject json = JSONObject.parseObject(result);
                                                if (json.getBoolean("isSuccessed")) {
                                                    ci.setStock(json.getInteger("stock"));
                                                }
                                            }
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                }*/

                                installCartItem(list, null);
                                model.addAttribute("cartItemList", list);
                            }
                        }
                    }
                }
            }

            model.addAttribute("isLogin", currentMember == null ? "0" : "1");
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
        }
    }

    @RequestMapping(value = "/ajaxCartList")
    public
    @ResponseBody
    Object ajaxCartList(HttpServletRequest request) {
        String info = "ajax方式购物车列表";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        Buyer currentMember = getCurrentMember(request);
        try {
            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录Start--------*/
            LoginType loginType = getLoginType(request);
            BuyerOperator buyerOperator = getCurrentOperator(request);
            if (LoginType.operator.equals(loginType)){
                if(StringUtil.isNotEmpty(buyerOperator.getId())){
                    buyerOperator = buyerOperatorService.get(getParamMap(),buyerOperator.getId());
                }
            }
            List<CartItem> listCartItem = new ArrayList<CartItem>();
            if (currentMember != null && currentMember.getId() != null) {
                List<CartItem> list = null;
                /**-------------------Desc:采购商登录--------*/
                if (LoginType.operator.equals(loginType)){
                    list = cartItemService.getListByBuyerId(getParamMap(), buyerOperator.getId());
                }else{
                    list = cartItemService.getListByBuyerId(getParamMap(), currentMember.getId());
                }
                /*for (CartItem ci : list) {
                    //start 添加商品批发价   hks 2015-10-19
                    List<B2BGoodsPrice> batchPrice = cartItemService.getGoodsTradePrice(getParamMap(), ci.getGoodsId(), ci.getQuantity());
                    if (batchPrice != null && batchPrice.size() > 0) {
                        ci.setBatchPrice(batchPrice.get(0).getBatchPrice());
                    }
                    listCartItem.add(ci);
                    //end  添加商品批发价   hks 2015-10-19
                    Criteria criteria = new Criteria();
                    criteria.add(Restrictions.eq("goodsId", ci.getGoodsId()));
                    criteria.add(Restrictions.limit("0", "1"));
                }*/
                installCartItem(list, listCartItem);
            } else {
                Cookie[] cookies = request.getCookies();
                if (cookies != null && cookies.length > 0) {
                    for (Cookie cookie : cookies) {
                        if (StringUtils.equalsIgnoreCase(cookie.getName(), CartItemCookie.USERKEY_COOKIE_NAME)) {
                            if (StringUtils.isNotEmpty(cookie.getValue())) {
                                String userkey = cookie.getValue();
                                List<CartItem> list = cartItemService.getListByUserKey(getParamMap(), userkey);
                                /*for (CartItem ci : list) {
                                    //start  添加商品批发价   hks 2015-10-19
                                    List<B2BGoodsPrice> batchPrice = cartItemService.getGoodsTradePrice(getParamMap(), ci.getGoodsId(), ci.getQuantity());
                                    if (batchPrice != null && batchPrice.size() > 0) {
                                        ci.setBatchPrice(batchPrice.get(0).getBatchPrice());
                                    }
                                    listCartItem.add(ci);
                                    //end  添加商品批发价   hks 2015-10-19
                                    Criteria criteria = new Criteria();
                                    criteria.add(Restrictions.eq("goodsId", ci.getGoodsId()));
                                    criteria.add(Restrictions.limit("0", "1"));
                                }*/
                                installCartItem(list, listCartItem);
                            }
                        }
                    }
                }
            }
            result.put(STATUS, SUCCESS);
            result.put(MESSAGE, "操作成功");
            result.put(DATA, listCartItem);
            return result;
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "操作失败");
            return result;
        }
    }

    @RequestMapping(value = "/ajaxMemberCartList")
    public
    @ResponseBody
    Object ajaxMemberCartList(HttpServletRequest request) {
        String info = "根据会员ID查询购物车商品列表";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String memberId = request.getParameter("memberId");

            List<CartItem> list = cartItemService.getListByBuyerId(getParamMap(), memberId);
            /*for (CartItem ci : list) {

                Criteria criteria = new Criteria();
                criteria.add(Restrictions.eq("goodsId", ci.getGoodsId()));
                criteria.add(Restrictions.limit("0", "1"));
            }*/
            installCartItem(list, null);
            result.put(STATUS, SUCCESS);
            result.put(MESSAGE, "操作成功");
            result.put(DATA, list);
            return result;
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "操作失败");
            return result;
        }
    }

    @RequestMapping(value = "/ajaxGetGoodsBatchPrice")
    public
    @ResponseBody
    Object ajaxGetGoodsBatchPrice(HttpServletRequest request) {
        String info = "根据商品ID与数量获取商品阶梯价";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String id = request.getParameter("id");
            String quantity = request.getParameter("quantity");
            List<B2BGoodsPrice> batchPrice = cartItemService.getGoodsTradePrice(getParamMap(), id, Integer.parseInt(quantity));
            if (batchPrice != null && batchPrice.size() > 0) {
                result.put("batchPrices", batchPrice.get(batchPrice.size() - 1).getBatchPrice());
            }else{
                //超出阶梯价范围，取最便宜的价格
                batchPrice = cartItemService.getGoodsTradePrice(getParamMap(), id, null);
                if (batchPrice != null && batchPrice.size() > 0) {
                    result.put("batchPrices", batchPrice.get(batchPrice.size() - 1).getBatchPrice());
                }else {
                    Goods goods = goodsService.get(getParamMap(), id);
                    result.put("batchPrices", goods!=null?goods.getPrice():0.00);
                }
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

    @RequestMapping(value = "/ajaxUpdateCartId")
    public
    @ResponseBody
    Object ajaxUpdateCartId(HttpServletRequest request) {
        String info = "根据购物车ID更新";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String id = request.getParameter("id");
            String quantity = request.getParameter("quantity");
            CartItem entity = new CartItem();
            entity.setId(id);
            entity.setQuantity(Integer.parseInt(quantity));
            /** 更新规格 TianYu 2015-9-14 Start */
            CartItem entityOld = this.cartItemService.get(getParamMap(), id);
            if (entity.getQuantity() < entityOld.getQuantity()) {
                entity.setSpecification(entityOld.getSpecification());
                installSp(entity);
            }
            /** 更新规格 TianYu 2015-9-14 End */

            cartItemService.update(getParamMap(), entity);
            //Desc:增加根据数量显示阶梯价 Auth:zhangqiang Time:2015-11-24 17:59:35 Start
            List<B2BGoodsPrice> batchPrice = cartItemService.getGoodsTradePrice(getParamMap(), entityOld.getGoodsId(), Integer.parseInt(quantity));
            if (batchPrice != null && batchPrice.size() > 0) {
                result.put("batchPrices", batchPrice.get(batchPrice.size() - 1).getBatchPrice());
            }
            //Desc:增加根据数量显示阶梯价 Auth:zhangqiang Time:2015-11-24 17:59:35 End
            result.put(STATUS, SUCCESS);
            result.put("sp", entity.getSpecification());
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
     * 组装商品规格
     *
     * @param ci TianYu
     *           2015-9-14
     */
    private void installSp(CartItem ci) {
        if (StringUtil.isNotEmpty(ci.getSpecification())) {
            if (ci.getSpecification().indexOf(")X") > 0) {
                int count = 0;
                String[] sps = ci.getSpecification().split(";");
                StringBuilder specifucation = new StringBuilder();
                for (int i = 0; i < sps.length; i++) {
                    String sp = sps[i];
                    if (i != 0) {
                        specifucation.append(";");
                    }
                    if (i < sps.length - 1) {
                        count += Integer.parseInt(sp.substring(sp.lastIndexOf("X") + 1));
                        if (ci.getQuantity() > count) {
                            specifucation.append(sp);
                        } else {
                            specifucation.append(sp.substring(0, sp.lastIndexOf("X")));
                            break;
                        }
                    } else {
                        specifucation.append(sp);
                    }
                }
                ci.setSpecification(specifucation.toString());
            } else {
                ci.setSpecification(ci.getSpecification());
            }

            if (ci.getSpecification().indexOf(")X") < 0 && ci.getSpecification().indexOf(")") > 0) {
                ci.setSpecification(ci.getSpecification().substring(1, ci.getSpecification().length() - 1));
            }
        }
    }

    @RequestMapping(value = "/ajaxDeleteCartId")
    public
    @ResponseBody
    Object ajaxDeleteCartId(HttpServletRequest request) {
        String info = "根据购物车ID删除";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String id = request.getParameter("id");
            cartItemService.delete(getParamMap(), id);
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

    @RequestMapping(value = "/ajaxDeleteCartIds")
    public
    @ResponseBody
    Object ajaxDeleteCartIds(HttpServletRequest request) {
        String info = "根据购物车ID删除";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String ids[] = request.getParameterValues("cartId");
            if (ids != null && ids.length > 0) {
                cartItemService.delete(getParamMap(), Arrays.asList(ids));
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
     * 20160727 dzz
     * 订单列表: 再次购买功能
     * 备注: 订单添加“再次购买功能”，点击后，查询订单详情表，把所有商品加入到购物车，数量取下订单时的数量
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/goBuyOnceMore")
    public String goBuyOnceMore(Model model, HttpServletRequest request, HttpServletResponse response) {
        String type = request.getParameter(Global.WHICHCLIENT);
        if (Global.WHICH_APP.equals(type)) {//移动端商品详情页加入购物车
//			cartItemList(model,request,info);

            add(model, request, response, true);
            return "redirect:/cart/list?whichclient=whichapp";
        } else {
//            add(model, request, response, false);
            addOnceMore(model, request, response, false);
            return "redirect:/cart/list";
        }
    }


    /**
     * 20160727 dzz
     * 订单列表: 再次购买功能
     * @param model
     * @param request
     * @param response
     * @param isAddList true 手机端， false PC端
     */
    private void addOnceMore(Model model, HttpServletRequest request, HttpServletResponse response, Boolean isAddList) {
        String info = "再次购买, 加入购物车";
        setLogInfo(info);
        logger.debug(info);

        String orderId = request.getParameter("orderId");

        String backurl = request.getParameter("backurl");
        String sp = request.getParameter("sp");//规格

        try {
            Order order = orderService.get(getParamMap(), orderId);//获取订单信息
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("orderSn", order.getOrderSn()));
            //获取订单以及订单明细等信息, 查询出订单原始数量信息(原始下单数量: oldQuantity)
            List<Order> listOrder = orderService.queryOrderGoodsAbnormal(getParamMap(), criteria);
            for(int k=0; k<listOrder.size(); k++) {
                Order tmp = listOrder.get(k);

                if (StringUtil.isNotEmpty(sp)) {
                    sp = URLDecoder.decode(sp, "utf-8");
                }//规格

                /** 在搜索列表页点击加入购物车时，添加默认的规格型号（默认第一个）  TianYu  2015-9-29 Start */
                if (StringUtil.isEmpty(sp)) {
                    Map<String, List<Map<String, Object>>> goodsSpInfoMap = goodsService.getGoodsSpInfo(getParamMap(), tmp.getGoodsId());
                    List<Map<String, Object>> goodsSpList = goodsSpInfoMap.get("goodsSpList");
                    List<Map<String, Object>> goodsSpItemList = goodsSpInfoMap.get("goodsSpItemList");
                    StringBuilder sb = new StringBuilder();
                    if (goodsSpList != null && goodsSpList.size() > 0 && goodsSpItemList != null && goodsSpItemList.size() > 0) {
                        int i = 0;
                        for (Map<String, Object> spm : goodsSpList) {
                            for (Map<String, Object> spi : goodsSpItemList) {
                                if (StringUtil.isNotEmpty(spm.get("id")) && spm.get("id").equals(spi.get("specificationId"))) {
                                    if (i > 0) {
                                        sb.append(",");
                                    }
                                    i++;
                                    sb.append(spm.get("name")).append(":").append(spi.get("name"));
                                    break;
                                }
                            }
                        }
                    }

                    sp = sb.toString();
                }
                /** 在搜索列表页点击加入购物车时，添加默认的规格型号  TianYu  2015-9-29 End */


                // 查询库存
                int stock = -1;
                try {
                    //如果使用了云极ERP，与ERP进行库存查询
                    if (isUseErpApi(getParamMap())) {
                        Goods goods = goodsService.get(getParamMap(), tmp.getGoodsId());
                        if (StringUtils.isNotEmpty(goods.getShopId())) {
                            Merchant merchant = merchantService.get(getParamMap(), goods.getShopId());
                            String result = YunJiErpApiUtil.erpWareHouseListQuery(merchant.getSign(), goods.getSn());
                            JSONObject json = JSONObject.parseObject(result);
                            if (json.getBoolean("isSuccessed")) {
                                stock = json.getInteger("stock");
                            }
                        }// end if goods.getShopId()
                    }// end if isUseErpApi
                } catch (Exception e) {
                    e.printStackTrace();
                }




                //如果使用云极ERP，且购买数量 > 实际库存，且此商品存在，不能加入购物车
                if (isUseErpApi(getParamMap()) && tmp.getOldQuantity() > stock && stock != -1) {
                    model.addAttribute("message", "库存不足,加入购物车失败！");
                    model.addAttribute("backurl", backurl);
                    model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
                    model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
                    model.addAttribute("services", cacheData.getServices(getParamMap()));

                } else {
                    //使用云极ERP且库存充足或者未使用云极ERP
                    Goods goods = goodsService.get(getParamMap(), tmp.getGoodsId());
                    if (goods != null) {
                        int count = tmp.getOldQuantity();
                        Buyer mb = getCurrentMember(request);

                        /**-------------------Desc:判断登录方式 采购商登录还是操作员登录Start--------*/
                        LoginType loginType = getLoginType(request);
                        model.addAttribute("loginType", loginType);
                        BuyerOperator buyerOperator = getCurrentOperator(request);
                        if (LoginType.operator.equals(loginType)){
                            if(StringUtil.isNotEmpty(buyerOperator.getId())){
                                buyerOperator = buyerOperatorService.get(getParamMap(),buyerOperator.getId());
                            }
                        }
                        //用户登录时
                        if (mb != null && mb.getId() != null) {
                            try {
                                //保存数据到购物车
                                boolean flag = false;
                                //采购商操作员
                                if (LoginType.operator.equals(loginType)) {
                                    flag = cartItemService.saveCartItemValues4B2B(getParamMap(),buyerOperator.getId(),mb.getId(), tmp.getGoodsId(), goods.getShopId(), count, sp);
                                }else{
                                    flag = cartItemService.saveCartItemValues4B2B(getParamMap(),mb.getId() ,null, tmp.getGoodsId(), goods.getShopId(), count, sp);
                                }
                                if (flag) {
                                    model.addAttribute("message", "success");
                                } else {
                                    model.addAttribute("message", "商品加入购物车失败！");
                                }
                                //没有中转页面，所以需要直接读取商品数据
                                if (isAddList) {//APP端
                                    model.addAttribute("isLogin", "1");
                                    model.addAttribute("cartItemList", cartItemService.getListByBuyerId(getParamMap(), mb.getId()));
                                }
                            } catch (Exception e) {
                                model.addAttribute("message", "商品加入购物车失败！");
                            }
                        } else { //未登陆时
                            boolean isExist = false;
                            Cookie[] cookies = request.getCookies();
                            //判断是否存在Cookie
                            if (cookies != null && cookies.length > 0) {
                                for (Cookie cookie : cookies) {
                                    //判断Cookie中是否存在购物信息
                                    if (StringUtils.equalsIgnoreCase(cookie.getName(), CartItemCookie.USERKEY_COOKIE_NAME)) {
                                        if (StringUtils.isNotEmpty(cookie.getValue())) {
                                            String userkey = cookie.getValue();
                                            try {
                                                //保存数据到购物车
                                                boolean flag = cartItemService.saveCartItemValuesByUserKey(getParamMap(), userkey, tmp.getGoodsId(), goods.getShopId(), count, sp);
                                                if (flag) {
                                                    model.addAttribute("message", "success");
                                                } else {
                                                    model.addAttribute("message", "商品加入购物车失败！");
                                                }
                                                //没有中转页面，所以需要直接读取商品数据
                                                if (isAddList) {
                                                    model.addAttribute("cartItemList", cartItemService.getListByUserKey(getParamMap(), userkey));
                                                }
                                            } catch (Exception e) {
                                                model.addAttribute("message", "商品加入购物车失败！");
                                            }
                                            isExist = true;
                                        }
                                    }//end if 是否存在购物信息
                                }
                            }
                            //如果没有购物信息，保存购物信息到Cookie和购物车表
                            if (!isExist) {
                                String userkey = request.getSession().getId();
                                try {
                                    Cookie cookie = new Cookie(CartItemCookie.USERKEY_COOKIE_NAME, userkey);
                                    cookie.setPath(request.getContextPath() + "/");
                                    cookie.setMaxAge(CartItemCookie.USERKEY_COOKIE_MAX_AGE);
                                    response.addCookie(cookie);
                                    boolean flag = cartItemService.saveCartItemValuesByUserKey(getParamMap(), userkey, tmp.getGoodsId(), goods.getShopId(), count, sp);
                                    if (flag) {
                                        model.addAttribute("message", "success");
                                    } else {
                                        model.addAttribute("message", "商品加入购物车失败！");
                                    }
                                    //没有中转页面，所以需要直接读取商品数据
                                    if (isAddList) {
                                        model.addAttribute("cartItemList", cartItemService.getListByUserKey(getParamMap(), userkey));
                                    }
                                } catch (Exception e) {
                                    model.addAttribute("message", "商品加入购物车失败！");
                                }
                            }
                        }//end if 是否登录
                        model.addAttribute("message", "商品已成功加入购物车！");
                        model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
                        model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
                        model.addAttribute("services", cacheData.getServices(getParamMap()));
                    }// end if 商品存在
                }// end else 未使用云极ERP

            }
            model.addAttribute("backurl", backurl);
        } catch(RuntimeException e) {
            throw e;
        } catch(Exception e) {
            logger.error(info + "时，发生异常", e);
        }
    }

}
