package net.deepdragon.weipu.controller.mall;

import com.alibaba.fastjson.JSON;
import com.alipay.config.AlipayConfig;
import com.alipay.util.AlipayCore;
import com.alipay.util.AlipayNotify;
import com.alipay.util.AlipaySubmit;
import com.alipay.util.httpClient.HttpRequest;
import com.unionpay.acp.UnionpayUtil;
import com.unionpay.acp.sdk.LogUtil;
import com.weixin.common.Configure;
import com.weixin.common.Signature;
import com.weixin.common.WXUtil;
import com.weixin.common.XStreamUtil;
import com.weixin.protocol.AsynNotifyReqData;
import com.weixin.protocol.AsynNotifyResData;
import com.weixin.protocol.UnifiedorderReqData;
import com.weixin.protocol.UnifiedorderResData;
import com.weixin.service.UnifiedorderService;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.service.weipu.AccountCashService;
import net.deepdragon.service.weipu.AccountLogService;
import net.deepdragon.service.weipu.AccountService;
import net.deepdragon.service.weipu.SMSLogService;
import net.deepdragon.util.*;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.tools.PropertiesUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.*;

/**
 * 账户管理
 */
@Controller(Global.APP_SIGN + Global.MALL + "AccountController")
@RequestMapping(Global.MALL_PATH + "/account")
public class AccountController extends BaseMallController {
    @Resource
    private AccountService accountService;
    @Resource
    private AccountLogService accountlogService;
    @Resource
    private AccountCashService accountCashService;
    @Resource
    private CacheData cacheData;
    @Resource
    private SMSLogService smsLogService;
    @Resource
    private SystemSetService systemSetService;
    private static Object lock = new Object();
    /**
     * 账户充值
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "recharge")
    public String recharge(Model model, HttpServletRequest request) {
        String whichclient = request.getParameter(Global.WHICHCLIENT);
        String info = "采购商充值页面";
        setLogInfo(info);
        logger.debug(info);
        try {
            //更具当前登录用户获取账户信息
            Buyer mb = getCurrentMember(request);
            Map<String,Object> mp=getParamMap();
            mp.put("userId",mb.getId());
            mp.put("userName",mb.getUserName());
            Account account=accountService.findAccountByUser(mp);
            model.addAttribute("mb", mb);
            model.addAttribute("account", account);

            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
            LoginType loginType = getLoginType(request);
            model.addAttribute("loginType", loginType);
            String operatorRole = getOperatorRole(request);
            BuyerOperator buyerOperator = getCurrentOperator(request);
            if (LoginType.operator.equals(loginType)) {
                model.addAttribute("mp", buyerOperator);
                model.addAttribute("role", operatorRole);
            }
            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/
            setPublicDate2Model(model);
            getAllCatelog(model);
        } catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }
        //判断是app端还是 pc端访问  2016-02-16 yuech  begin
        String resultPath =   Global.TEMPLATE_MALL + PATH + "/member/account_recharge";
        if("whichapp".equals(whichclient)){               //跳转到手机端
            resultPath = Global.TEMPLATE_APP + PATH + "/member/account_recharge";
        }
        //--------------------yuech-------------   end
        return resultPath;
    }
    /**
     * 账户充值
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "rechargeCheck")
    public String rechargeCheck(Model model, HttpServletRequest request) {
        String whichclient = request.getParameter(Global.WHICHCLIENT);
        String prepaymentFee = request.getParameter("prepaymentFee");
        String info = "采购商充值页面";
        setLogInfo(info);
        logger.debug(info);

        try {
            //更具当前登录用户获取账户信息
            Buyer mb = getCurrentMember(request);
            Map<String,Object> mp=getParamMap();
            mp.put("userId",mb.getId());
            mp.put("userName",mb.getUserName());
            Account account=accountService.findAccountByUser(mp);
            /**支付方式更具平台 2016-04-18 lxb*********************************************************************start***/
            String projectName = PropertiesUtil.getValue(Constant.PROJECTCONF,"project.name");
            List<Map<String, Object>> payTypeList = new ArrayList<Map<String, Object>>();//PC支付方式
            List<Map<String, Object>> payTypeListForWechat = new ArrayList<Map<String, Object>>();//微信商城支付方式
            List<Map<String, Object>> payTypeListForHybridApp = new ArrayList<Map<String, Object>>();//APP应用支付方式
            Map<String, Object> allinpay = new HashMap<String, Object>();
            allinpay.put("sign", "allinpay");
            allinpay.put("name", "通联支付");
            allinpay.put("logo", "allinpay.gif");


            Map<String, Object> chinaumspay = new HashMap<String, Object>();
            chinaumspay.put("sign", "chinaumspay");
            chinaumspay.put("name", "全民付");// 银联商务-全民付
            chinaumspay.put("logo", "chinaumspay.png");;

            Map<String, Object> alipay = new HashMap<String, Object>();
            alipay.put("sign", "alipay");
            alipay.put("name", "支付宝");
            alipay.put("logo", "alipay.gif");

            Map<String, Object> unionpay = new HashMap<String, Object>();
            unionpay.put("sign", "unionpay");
            unionpay.put("name", "银联在线支付");
            unionpay.put("logo", "unionpay.jpg");

            Map<String, Object> wxpay = new HashMap<String, Object>();
            wxpay.put("sign", "wxpay");
            wxpay.put("name", "微信支付");
            wxpay.put("logo", "wxpay.png");
            switch (projectName){
                case "gwq":
                    //pc
                    payTypeList.add(unionpay);
                    payTypeList.add(wxpay);
                    //wx
                    payTypeListForWechat.add(unionpay);
                    payTypeListForWechat.add(wxpay);
                    //app
                    payTypeListForHybridApp.add(unionpay);
                    payTypeListForHybridApp.add(wxpay);
                    break;
                case "jp":
                    //pc
                    payTypeList.add(unionpay);
                    payTypeList.add(alipay);
                    payTypeList.add(wxpay);
                    //wx
                    payTypeListForWechat.add(unionpay);
                    payTypeListForWechat.add(wxpay);
                    //app
                    payTypeListForHybridApp.add(unionpay);
                    payTypeListForHybridApp.add(wxpay);
                    payTypeListForHybridApp.add(alipay);
                    break;
                case "ghj":
                    //pc
                    payTypeList.add(unionpay);
                    //wx
                    payTypeListForWechat.add(unionpay);
                    //app
                    payTypeListForHybridApp.add(unionpay);
                    //payTypeListForHybridApp.add(wxpay);
                   // payTypeListForHybridApp.add(alipay);
                    break;
                default:
                    //pc
                    payTypeList.add(unionpay);
                    //wx
                    payTypeListForWechat.add(unionpay);
                    //app
                    payTypeListForHybridApp.add(unionpay);
                    break;
            }
            if(Global.HYBRIDAPP.equals(request.getParameter(Global.WHICHCLIENT))){//APP应用
                model.addAttribute("payTypeList", payTypeListForHybridApp);
            }else if(Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))){//微信商城
                model.addAttribute("payTypeList", payTypeListForWechat);
            }else{
                model.addAttribute("payTypeList", payTypeList);
            }
            /**支付方式更具平台 2016-04-18 lxb*********************************************************************end***/
            model.addAttribute("mb", mb);
            model.addAttribute("mb", mb);
            model.addAttribute("prepaymentFee", prepaymentFee);
        } catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }
        //判断是app端还是 pc端访问  2016-02-16 yuech  begin
        String resultPath =   Global.TEMPLATE_MALL + PATH + "/member/account_recharge_check";
        if("whichapp".equals(whichclient)){               //跳转到手机端
            resultPath = Global.TEMPLATE_APP + PATH + "/member/account_recharge_check";
        }
        //--------------------yuech-------------   end
        return resultPath;
    }

    @RequestMapping(value = "saveAccountLog")
    public
    @ResponseBody
    Object saveAccountLog(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String info = "账户充值插入充哦之记录";
        setLogInfo(info);
        logger.debug(info);

        Map<String, Object> result = new HashMap<String, Object>();
        result.put(STATUS, ERROR);
        try {
            String accountD = request.getParameter("account");//充值金额
            String payType = request.getParameter("payType");//支付类型
            Buyer mb = getCurrentMember(request);
            Map<String, Object> mp = getParamMap();
            mp.put("userId", mb.getId());
            mp.put("userName", mb.getUserName());
            Account account = accountService.findAccountByUser(mp);
            //插入充值流水
            AccountLog accountlog = new AccountLog();

            accountlog.setTenantId(getTenantId());
            accountlog.setPlatform(getPlatform());

            accountlog.setUserId(mb.getId());
            accountlog.setBuyUsername(mb.getUserName());
            accountlog.setBuyRealname(mb.getRealName());

            accountlog.setPayMethod(0);//交易类型(0:充值 1:冻结 2：解冻 3：提现)
            accountlog.setAccountId(account.getId());//账户ID
            accountlog.setAccount(Double.parseDouble(accountD));//交易金额
            accountlog.setFeeAccount(0.00);//手续费
            accountlog.setStatus(0);//状态（0：失败 1：成功）
            accountlog.setOldAccountBlock(account.getAccountBlock());
            accountlog.setOldAccountTotal(account.getAccountTotal());

            accountlog.setCreateUser(mb.getUserName());
            accountlog.setCreateDate(new Date());
            accountlog = accountlogService.save(this.getParamMap(), accountlog);
            result.put(STATUS, SUCCESS);
            result.put("accountlog", accountlog);
        }catch (Exception ex){
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }
        return result;
    }

    /**
     * 账户充值
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "rechargeInto")
    public String rechargeInto(Model model, HttpServletRequest request,HttpServletResponse response) {
        String whichclient = request.getParameter(Global.WHICHCLIENT);

        String info = "采购商充值页面";
        setLogInfo(info);
        logger.debug(info);
        try {
            String accountD=request.getParameter("account");
            String payType=request.getParameter("payType");//支付方式

            //更具当前登录用户获取账户信息
            Buyer mb = getCurrentMember(request);
            Map<String,Object> mp=getParamMap();
            mp.put("userId",mb.getId());
            mp.put("userName",mb.getUserName());
            Account account=accountService.findAccountByUser(mp);
            //插入充值流水
            AccountLog accountlog=new AccountLog();

            //accountlog.setId();//ID
            accountlog.setTenantId(getTenantId());
            accountlog.setPlatform(getPlatform());

            accountlog.setUserId(mb.getId());
            accountlog.setBuyUsername(mb.getUserName());
            accountlog.setBuyRealname(mb.getRealName());

            accountlog.setPayMethod(0);//交易类型(0:充值 1:冻结 2：解冻 3：提现)
            accountlog.setAccountId(account.getId());//账户ID
            accountlog.setAccount(Double.parseDouble(accountD));//交易金额
            accountlog.setFeeAccount(0.00);//手续费
            accountlog.setStatus(0);//状态（0：失败 1：成功）
            accountlog.setOldAccountBlock(account.getAccountBlock());
            accountlog.setOldAccountTotal(account.getAccountTotal());

            accountlog.setCreateUser(mb.getUserName());
            accountlog.setCreateDate(new Date());
            accountlog=accountlogService.save(this.getParamMap(), accountlog);

            //调取支付接口
            if(payType.equals("alipay")){//支付宝支付
                getPayData4alipay(accountlog,mb,request,response);
            }else if(payType.equals("unionpay")) {//银联支付
                getPayData4unionpay(accountlog, mb, model,request);

                if(Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT)) && StringUtils.equalsIgnoreCase("unionpay", payType)){
                    return Global.TEMPLATE_APP + PATH + "/payment_" + payType;
                }
                return Global.TEMPLATE_MALL + PATH + "/member/payment_" + payType;
            }

        } catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }
        //判断是app端还是 pc端访问  2016-02-16 yuech  begin
        String resultPath =   Global.TEMPLATE_MALL + PATH + "/member/index_account";
        if("whichapp".equals(whichclient)){               //跳转到手机端
            resultPath = Global.TEMPLATE_APP + PATH + "/member/index_account";
        }
        //--------------------yuech-------------   end
        return resultPath;
    }



    @RequestMapping(value = "indexAccount")
    public String indexAccount(Model model, HttpServletRequest request) {
        String whichclient = request.getParameter(Global.WHICHCLIENT);
        String info = "采购商充值页面";
        setLogInfo(info);
        logger.debug(info);
        try {
        } catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }
        return Global.TEMPLATE_APP + PATH + "/member/index_account";
    }

    /**
     * 账户充值列表
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "rechargeList")
    public String rechargeList(Pager pager,Model model, HttpServletRequest request) {
        String whichclient = request.getParameter(Global.WHICHCLIENT);
        String info = "采购商充值记录页面";
        setLogInfo(info);
        logger.debug(info);
        String resultPath = "";
        try {
            //更具当前登录用户获取账户信息
            Buyer mb = getCurrentMember(request);
            Map<String,Object> mp=getParamMap();
            mp.put("userId",mb.getId());
            mp.put("userName",mb.getUserName());
            Account account=accountService.findAccountByUser(mp);

            //pc端账户充值记录  2016-02-16  yuech  begin

            if("whichapp".equals(whichclient)){
                if(account!=null){
                    mp=getParamMap();
                    mp.put("accountId",account.getId());
                    mp.put("payMethod","0");
                    List<AccountLog> accountLogList= accountlogService.getList(mp,processCriteria(pager, mb, request));//accountlogService.getAll(mp);

                    if(accountLogList!=null){
                        model.addAttribute("accountLogList", accountLogList);
                    }
                }
                resultPath = Global.TEMPLATE_APP + PATH + "/member/account_recharge_list";
            }else{
                pager.setPageSize(15);
                if(account!=null){
                    mp=getParamMap();
                    mp.put("accountId",account.getId());
                    mp.put("payMethod","0");
                    Criteria criteria = processCriteria(pager, mb, request);
                    criteria.add(Restrictions.eq("payMethod", "0"));
                    pager = accountlogService.getPager(mp,criteria,pager);//accountlogService.getAll(mp);
                    List<AccountLog> accountLogList = (List<AccountLog>)pager.getList();
                    if(accountLogList!=null){
                        model.addAttribute("accountLogList", accountLogList);
                    }
                }
                resultPath =   Global.TEMPLATE_MALL + PATH + "/member/account_recharge_list";
            }
            model.addAttribute("pager", pager);

            setPublicDate2Model(model);
            getAllCatelog(model);
            //-------------------yuech---------------end--------
            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
            LoginType loginType = getLoginType(request);
            model.addAttribute("loginType", loginType);
            String operatorRole = getOperatorRole(request);
            BuyerOperator buyerOperator = getCurrentOperator(request);
            if (LoginType.operator.equals(loginType)) {
                model.addAttribute("mp", buyerOperator);
                model.addAttribute("role", operatorRole);
            }
            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/

        } catch (Exception ex) {

            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }

        return resultPath;
    }

    /**
     * 账户提现
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "cash")
    public String cash(Model model, HttpServletRequest request) {
        String whichclient = request.getParameter(Global.WHICHCLIENT);
        String info = "采购商提现记录页面";
        setLogInfo(info);
        logger.debug(info);
        try {
            //更具当前登录用户获取账户信息
            Buyer mb = getCurrentMember(request);
            Map<String,Object> mp=getParamMap();
            mp.put("userId",mb.getId());
            mp.put("userName",mb.getUserName());
            Account account=accountService.findAccountByUser(mp);
            model.addAttribute("account", account);
        } catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }
        return Global.TEMPLATE_APP + PATH + "/member/account_cash";
    }
    @RequestMapping(value = "cashCheck")
    public String cashCheck(Model model, HttpServletRequest request) {
        String whichclient = request.getParameter(Global.WHICHCLIENT);
        String info = "采购商提现页面";
        setLogInfo(info);
        logger.debug(info);
        try {
            //更具当前登录用户获取账户信息
            Buyer mb = getCurrentMember(request);
            Map<String,Object> mp=getParamMap();
            mp.put("userId",mb.getId());
            mp.put("userName",mb.getUserName());
            Account account=accountService.findAccountByUser(mp);

            List<Map<String, Object>> payTypeList = new ArrayList<Map<String, Object>>();
            Map<String, Object> alipay = new HashMap<String, Object>();
            alipay.put("sign", "alipay");
            alipay.put("name", "支付宝");
            alipay.put("logo", "alipay.gif");
            payTypeList.add(alipay);
            Map<String, Object> unionpay = new HashMap<String, Object>();
            unionpay.put("sign", "unionpay");
            unionpay.put("name", "银联在线支付");
            unionpay.put("logo", "unionpay.jpg");
            payTypeList.add(unionpay);

            model.addAttribute("payTypeList", payTypeList);
            model.addAttribute("mb", mb);
            model.addAttribute("account", account);
        } catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }
        //判断是app端还是 pc端访问  2016-02-16 yuech  begin
        String resultPath =   Global.TEMPLATE_MALL + PATH + "/member/account_cash_check";
        if("whichapp".equals(whichclient)){               //跳转到手机端
            resultPath = Global.TEMPLATE_APP + PATH + "/member/account_cash_check";
        }
        //--------------------yuech-------------   end
        return resultPath;
    }

    @RequestMapping(value = "cashInto")
    public String cashInto(Model model,AccountCash accountCash, HttpServletRequest request,HttpServletResponse response) {
        String whichclient = request.getParameter(Global.WHICHCLIENT);
        String info = "采购商提现页面";
        setLogInfo(info);
        logger.debug(info);
        try {
            String payType=request.getParameter("payTypeS");

            //更具当前登录用户获取账户信息
            Buyer mb = getCurrentMember(request);
            Map<String,Object> mp=getParamMap();
            mp.put("userId",mb.getId());
            mp.put("userName",mb.getUserName());
            Account account=accountService.findAccountByUser(mp);
            //插入提现申请
            accountCash.setTenantId(this.getTenantId());
            accountCash.setPlatform(this.getPlatform());
            accountCash.setUserId(mb.getId());
            accountCash.setUserName(mb.getUserName());
            accountCash.setStatus(0);//状态(0:未审核 1.审核通过 2.未审核通过 3转账中 4.已转账)
            accountCash.setCashType(payType.equals("alipay") ? 0 : 1);//提现方式(0:支付宝 1:银联)
            accountCash.setOperator(mb.getUserName());
            accountCash.setOperatorDate(new Date());
            accountCash.setApplyDate(new Date());
            accountCash.setCreateUser(mb.getUserName());
            accountCash.setCreateDate(new Date());
            accountCash.setFeeAccount(0.00);//手续费
            accountCash.setActualAccount(accountCash.getCashAccount());//到账金额
            if(account.getAccountTotal()-account.getAccountBlock()>=accountCash.getCashAccount()){
                accountCash=accountCashService.save(this.getParamMap(),accountCash);
                //冻结提现金额
                account.setAccountTotal(0.00);//总金额
                account.setAccountBlock(accountCash.getCashAccount());//冻结资金加
                accountService.update(this.getParamMap(),account);
            }

        } catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }
        //判断是app端还是 pc端访问  2016-02-17 yuech  begin

        String resultPath =   "redirect:/account/recharge";
        if("whichapp".equals(whichclient)){               //跳转到手机端
            resultPath = Global.TEMPLATE_APP + PATH + "/member/index_account";
        }
        //--------------------yuech-------------   end
        return resultPath;
    }
    /**
     * 账户提现列表
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "cashList")
    public String cashList(Pager pager, Model model, HttpServletRequest request) {
        String whichclient = request.getParameter(Global.WHICHCLIENT);
        String info = "采购商提现记录页面";
        setLogInfo(info);
        logger.debug(info);
        try {
            //更具当前登录用户获取账户信息
            Buyer mb = getCurrentMember(request);
            Map<String,Object> mp=getParamMap();
            mp.put("userId",mb.getId());
            mp.put("userName",mb.getUserName());
            Account account=accountService.findAccountByUser(mp);
            if(account!=null){
                mp=getParamMap();
                request.setAttribute("userId",mb.getId());
                List<AccountCash> accountCashList= accountCashService.getList(mp,processCriteria(pager, mb, request));
                if(accountCashList!=null){
                    model.addAttribute("accountCashList", accountCashList);
                }
            }

        } catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }

        //pc端账户充值记录  2016-02-16  yuech  begin
        String resultPath =   Global.TEMPLATE_MALL + PATH + "/member/account_cash_list";
        if("whichapp".equals(whichclient)){
            resultPath =Global.TEMPLATE_APP + PATH + "/member/account_cash_list";
        }
        //-------------------yuech---------------end--------
        return resultPath;
    }

    private Criteria processCriteria(Pager pager, Buyer mb, HttpServletRequest request) {
        //where platform=#{platform} and tenantId=#{tenantId} and accountId=#{accountId} and payMethod=#{payMethod}
        Criteria criteria = new Criteria();
        String accountId = getParameter(request, "accountId");
        if (StringUtils.isNotBlank(accountId)) {
            criteria.add(Restrictions.eq("accountId", accountId));
        }
        String payMethod = getParameter(request, "payMethod");
        if (StringUtils.isNotBlank(payMethod)) {
            criteria.add(Restrictions.eq("payMethod", payMethod));
        }
        String userId = getParameter(request, "userId");
        if (StringUtils.isNotBlank(userId)) {
            criteria.add(Restrictions.eq("userId", userId));
        }else{
            if(mb!=null){
                if (StringUtils.isNotBlank(mb.getId())) {
                    criteria.add(Restrictions.eq("userId", mb.getId()));
                }
            }
        }
        criteria.add(Restrictions.eq("platform", getPlatform()));//所属平台
        criteria.add(Restrictions.eq("tenantId", getTenantId()));
        if (StringUtils.isNotEmpty(pager.getOrderBy()) && StringUtils.isNotEmpty(pager.getOrderType())) {
            criteria.add(Restrictions.order(pager.getOrderBy(), pager.getOrderType()));
        }
        return criteria;
    }



    //--支付宝支付-------------------------------------------------------------------------------------------------------
    private void getPayData4alipay(AccountLog accountLog, Buyer member,  HttpServletRequest request,HttpServletResponse response)throws Exception {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");

        String becShopUrl = null;
        try {
            becShopUrl = systemSetService.find(getParamMap(), "setkey", "becShopUrl").getSetvalue();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (StringUtils.isEmpty(becShopUrl)) {
                throw new Exception("获取系统配置[becShopUrl]失败，请检查系统配置项！");
            }
        }
        String whichclient=request.getParameter("whichclient")==null?"":request.getParameter("whichclient");
        String service="";
        String show_url="";
        //判断是移动端支付还是PC端支付
        if(request.getParameter("whichclient").equals("whichapp")){
            service="alipay.wap.create.direct.pay.by.user";//移动端支付地址
        }else{
            service="create_direct_pay_by_user";//PC端支付地址
        }
        PrintWriter writer = response.getWriter();

        String orderNo = accountLog.getId();			//订单编号
        //支付宝支付开始
        ////////////////////////////////////请求参数//////////////////////////////////////
        Map<String, String> sParaTemp = new HashMap<String, String>();
        sParaTemp.put("service", service);		//服务地址
        sParaTemp.put("partner", AlipayConfig.partner);				// 合作身份者ID，以2088开头由16位纯数字组成的字符串
        sParaTemp.put("_input_charset", "utf-8");					// 字符编码格式 目前支持 gbk 或 utf-8
        sParaTemp.put("payment_type", "1");							// 支付类型
        sParaTemp.put("notify_url", becShopUrl+"account/alipayAsynchronousAccount");// 服务器异步通知页面路径
        sParaTemp.put("return_url", becShopUrl+"account/alipayAccount");		// 页面跳转同步通知页面路径
        sParaTemp.put("seller_email", AlipayConfig.seller_id);	    //商家支付宝账号
        sParaTemp.put("out_trade_no", orderNo);						//订单编号
        sParaTemp.put("subject", "");								// 订单名称
        sParaTemp.put("total_fee", accountLog.getAccount()+"");		//付款金额
        sParaTemp.put("body", "账户充值");		                    // 订单描述
        sParaTemp.put("show_url", show_url);						// 商品展示地址(强烈建议必传，该参数影响支付过程中左上角的“返回”按钮的出现。)
        sParaTemp.put("anti_phishing_key", "");						// 防钓鱼时间戳
        sParaTemp.put("exter_invoke_ip","");						// 客户端的IP地址
        sParaTemp.put("whichclient",whichclient);					//用于区分是移动端支付还是PC端支付
        String sHtmlText = AlipaySubmit.buildRequest(sParaTemp, "post", "确认");
        System.out.println("支付post数据开始-----------------------------------------------------------");
        System.out.println(sHtmlText);
        System.out.println("支付post数据结束-----------------------------------------------------------");
        writer.println(sHtmlText);//输出到页面自动提交
    }

    //获取支付宝返回的参数
    public Map<String, String> getParamsReback(Map requestParams)
            throws Exception {
        Map<String, String> params = new HashMap<String, String>();
        // Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {

            String name = (String) iter.next();

            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";

            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            params.put(name, valueStr);
        }
        return params;
    }

    /**
     * 支付宝支付 - 同步通知（页面跳转通知）
     */
    @RequestMapping("alipayAccount")
    public String alipay(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String orderId="";
        String orderSn=request.getParameter("out_trade_no");//获取支付宝返回的订单编号
        String whichclient=request.getParameter("whichclient")==null?"":request.getParameter("whichclient");

        String info = "支付宝支付，支付成功之后。同步通知(页面跳转)，处理支付宝返回的支付结果，订单号[" + orderSn + "]";
        setLogInfo(info);
        logger.error(info);

        //验证支付成功还是失败
        if (AlipayNotify.verify(getParamsReback(request.getParameterMap()))) {
            String out_trade_no =request.getParameter("out_trade_no");
            String trade_no = request.getParameter("trade_no");
            String trade_status =request.getParameter("trade_status");
            //更新订单状态
            orderSn = out_trade_no;
            AccountLog accountlog=accountlogService.get(getParamMap(),orderSn);
            Account account=accountService.get(getParamMap(),accountlog.getAccountId());
            logger.error("orderSn:" + orderSn + ",accountlog:" + accountlog);
            if (accountlog != null) {
                orderId = accountlog.getId();
            }
            if ( accountlog != null && accountlog.getStatus()==0 && account!=null) {
                accountlog.setStatus(1);
                accountlog.setModifyUser(accountlog.getCreateUser());
                accountlog.setModifyDate(new Date());
                accountlogService.update(this.getParamMap(), accountlog);
                //修改账户金额
                account.setAccountTotal(accountlog.getAccount());
                account.setAccountBlock(0.00);
                accountService.update(this.getParamMap(), account);

                setLogInfo("充值【" + orderId + "】支付成功");
                logger.error("充值【" + orderId + "】支付成功");
            }

        } else {
            //支付失败
            info = "账户充值[" + orderSn + "] 支付失败";
            setLogInfo(info);
            logger.error(info);
        }
        String redirectURL = "";
        if(request.getParameter("whichclient").equals("whichapp")){
            redirectURL = "redirect:/account/rechargeList?whichclient=whichapp&payMethod=0";
        }else{
            redirectURL = "redirect:/account/rechargeList?whichclient=whichapp&payMethod=0";
        }
        if (StringUtils.isEmpty(orderId)) {
            redirectURL = "redirect:/order/error/" + orderSn;
        }
        return redirectURL;
    }

    /**
     * 支付宝支付 支付成功之后-->后台通知处理，异步通知
     */
    @RequestMapping("alipayAsynchronousAccount")
    @ResponseBody
    public String alipayAsynchronous(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String orderId="";
        String orderSn=request.getParameter("out_trade_no");//获取支付宝返回的订单编号
        String info = "支付宝支付，支付成功之后。异步通知，处理支付宝返回的支付结果";
        setLogInfo(info);
        logger.error(info);
        Boolean paySuccess=false;
        if (AlipayNotify.verify(getParamsReback(request.getParameterMap()))) {
            paySuccess=true;
            // 商户订单处理（订单状态：wait_seller_send_goods; 支付状态：paid;
            // 配送状态：unshipped）

            AccountLog accountlog=accountlogService.get(getParamMap(),orderSn);
            Account account=accountService.get(getParamMap(),accountlog.getAccountId());
            logger.error("orderSn:" + orderSn + ",accountlog:" + accountlog);
            if (accountlog != null) {
                orderId = accountlog.getId();
            }
            if ( accountlog != null && accountlog.getStatus()==0 && account!=null) {//valideData.get("queryId"),
                accountlog.setStatus(1);
                accountlog.setModifyUser(accountlog.getCreateUser());
                accountlog.setModifyDate(new Date());
                accountlogService.update(this.getParamMap(), accountlog);
                //修改账户金额
                account.setAccountTotal(accountlog.getAccount());
                account.setAccountBlock(0.00);
                accountService.update(this.getParamMap(), account);

                setLogInfo("充值【" + orderId + "】支付成功");
                logger.error("充值【" + orderId + "】支付成功");
            }
        }else{
            paySuccess=false;
        }
        return ajaxText("" + paySuccess, response);
    }
    //----------------------------------------------------------------------------------------------------------
    //银联支付---------------------------------------------------------------------------------------------------
    private void getPayData4unionpay(AccountLog accountLog, Buyer member, Model model,HttpServletRequest request) throws Exception {
        String becShopUrl = null;
        try {
            becShopUrl = systemSetService.find(getParamMap(), "setkey", "becShopUrl").getSetvalue();
//            becShopUrl = "http://localhost:8080/bec/";
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (StringUtils.isEmpty(becShopUrl)) {
                throw new Exception("获取系统配置[becShopUrl]失败，请检查系统配置项！");
            }
        }
        //becShopUrl="http://192.168.1.198:8080/bec/";
        String frontUrl = becShopUrl + "account/unionpayFront?whichclient="+request.getParameter(Global.WHICHCLIENT);// 页面通知地址
        String backUrl = becShopUrl + "account/unionpayBack?whichclient="+request.getParameter(Global.WHICHCLIENT);// 后台通知地址

        /*if(Global.WHICH_APP.equals(model.asMap().get(Global.WHICHCLIENT))){
            frontUrl += "?whichclient=whichapp&payMethod=0";// 页面通知地址
            backUrl += "?whichclient=whichapp&payMethod=0";// 后台通知地址
        }*/

        UnionpayUtil.pay(accountLog.getId(), Math.round(accountLog.getAccount() * 100) + "", frontUrl, backUrl, model);
    }

    /**
     * 银联支付
     * 后台通知地址
     */
    @RequestMapping("unionpayBack")
    @ResponseBody
    public String unionpayBack(HttpServletRequest request, HttpServletResponse response) {
        String info = "银联支付，支付成功之后。异步通知，处理支付网管返回的支付结果";
        setLogInfo(info);
        logger.error(info);

        boolean paySuccess = false;
        try {
            Map<String, String> respData = UnionpayUtil.resp2Map(request);
            paySuccess = UnionpayUtil.validateResposon( respData );
            if (paySuccess) {
                // 商户订单处理（订单状态：wait_seller_send_goods; 支付状态：paid;
                // 配送状态：unshipped）valideData.get("queryId"),
                AccountLog accountlog=accountlogService.get(getParamMap(), respData.get("orderId"));
                Account account=accountService.get(getParamMap(),accountlog.getAccountId());
                if ( accountlog != null && accountlog.getStatus()==0 && account!=null) {//valideData.get("queryId"),
                    accountlog.setStatus(1);
                    accountlog.setModifyUser(accountlog.getCreateUser());
                    accountlog.setModifyDate(new Date());
                    accountlogService.update(this.getParamMap(), accountlog);
                    //修改账户金额
                    account.setAccountTotal(accountlog.getAccount());
                    account.setAccountBlock(0.00);
                    accountService.update(this.getParamMap(), account);

                    setLogInfo("充值【" + respData.get("orderId") + "】支付成功");
                    logger.error("充值【" + respData.get("orderId") + "】支付成功");
                }

            }
        } catch (Exception e) {
            paySuccess = false;
            logger.error(info + "时，发生异常", e);
            response.setStatus(250);//仅当POST返回码为200时，才认为商户已经成功收到并且能正确解析后台通知
        }

        return ajaxText("" + paySuccess, response);
    }

    /**
     * 银联支付 - 页面通知地址
     */
    @RequestMapping("unionpayFront")
    public String unionpayFront(HttpServletRequest request, HttpServletResponse response) {
        String info = "通联支付，支付成功之后。同步通知(页面跳转)，处理支付网管返回的支付结果，订单号[" + request.getParameter("orderId") + "]";
        setLogInfo(info);
        logger.error(info);
        String orderId = null;
        String orderSn = null;
        AccountLog accountlog = null;
        String type = request.getParameter(Global.WHICHCLIENT);
        try {

            Map<String, String> valideData = UnionpayUtil.resp2Map(request);
            if (!UnionpayUtil.validateResposon( valideData)) {
                LogUtil.writeLog("验证签名结果[失败].");
            } else {
                //验证成功
                orderSn = valideData.get("orderId");

                accountlog=accountlogService.get(getParamMap(), orderSn);
                Account account=accountService.get(getParamMap(),accountlog.getAccountId());
                logger.error("orderSn:" + orderSn + ",accountlog:" + accountlog);
                if (accountlog != null) {
                    orderId = accountlog.getId();
                }
                if ( accountlog != null && accountlog.getStatus()==0 && account!=null) {//valideData.get("queryId"),
                    accountlog.setStatus(1);
                    //accountlog.setModifyUser(accountlog.getCreateUser());本次充值是一个整体操作，因此此处不保存修改的时间和修改人
                   // accountlog.setModifyDate(new Date());
                    accountlogService.update(this.getParamMap(), accountlog);
                    //修改账户金额
                    account.setAccountTotal(accountlog.getAccount());
                    account.setAccountBlock(0.00);
                    accountService.update(this.getParamMap(), account);

                    setLogInfo("充值【" + valideData.get("orderId") + "】支付成功");
                    logger.error("充值【" + valideData.get("orderId") + "】支付成功");
                }
            }

        } catch (Exception e) {
            logger.error(info + "时，发生异常", e);
        }

        String redirectURL = "redirect:/account/rechargeList";
        if (StringUtils.isEmpty(orderId)) {
            redirectURL = "redirect:/account/rechargeList";
        }
        String whichApp = Global.WHICH_WEB;
        if(StringUtil.isNotEmpty(type) && Global.WHICH_APP.equals(type)){
            whichApp = Global.WHICH_APP;
        }
        redirectURL += "?" + Global.WHICHCLIENT + "=" + whichApp+"&payMethod=0";
        return redirectURL;
    }

    /**
     * 发送短信验证码
     * @param request
     * @return
     */
    @RequestMapping("sendSMSVerificationCode")
    @ResponseBody
    public Object sendSMSVerificationCode(HttpServletRequest request){
        String info = "发送短信验证码";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(STATUS, SUCCESS);
        result.put(MESSAGE, "");
        try {
            String acctId = request.getParameter("acctId");
            if( StringUtil.isEmpty(acctId) ){
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "账户ID不能为空！");
                return result;
            }
            Account acct = accountService.get(getParamMap(), acctId);
            if (acct == null ){
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "账户不存在！");
                return result;
            }
            String numRandom = StringUtil.numRandom(6);
            //发送短信
            String mobile = acct.getUserName();
            String smsContent = "尊敬的会员【" + mobile + "】,您申请的提现验证码为：" + numRandom + ",注意保密哦！有效期5分钟";
            Map<String, Object> sendResult = smsLogService.sendSMS(getParamMap(),mobile, smsContent, systemSetService.getAll(getParamMap()));


            if (!SUCCESS.equals(sendResult.get(STATUS))) {
                result.put(STATUS, SUCCESS);
                result.put(MESSAGE, "短信发送失败，请稍后再试");
                return result;
            }else{
                this.accountCashService.insertOne(getParamMap(), (String)sendResult.get("smslogSql"));
            }
            HttpSession session = request.getSession();
            List<Map<String, Object>> list = (List<Map<String, Object>>)session.getAttribute("SMSVerificationCode");
            if(  list == null){
                list = new ArrayList<Map<String, Object>>();
            }
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("SMSVerificationCode", numRandom);
            map.put("SendTime", DateUtil.getCalendar().getTime());
            map.put("Validity", 5 * 60 * 1000);//有效期5分钟
            list.add(map);
            session.setAttribute("SMSVerificationCode", list);
        } catch (Exception e) {
            logger.error(info + "时，发生异常", e);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "程序异常，请联系管理员。");
        }

        return result;
    }


    /**
     * Check短信验证码
     * @param request
     * @return
     */
    @RequestMapping("checkSMSVerificationCode")
    @ResponseBody
    public Object checkSMSVerificationCode(HttpServletRequest request){
        String info = "Check短信验证码";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(STATUS, SUCCESS);
        result.put(MESSAGE, "");
        try {
            Date now = DateUtil.getCalendar().getTime();
            String code = request.getParameter("SMSVerificationCode");
            if( StringUtil.isEmpty(code) ){
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "验证码不能为空！");
                return result;
            }
            boolean check = false;
            HttpSession session = request.getSession();
            List<Map<String, Object>> list = (List<Map<String, Object>>)session.getAttribute("SMSVerificationCode");
            if(  list == null){
                list = new ArrayList<Map<String, Object>>();
            }else{
                for(int i=list.size()-1; i >= 0; --i){
                    Map<String, Object> map = list.get(i);
                    if(code.equals(map.get("SMSVerificationCode").toString())){
                        Date sendTime = (Date)map.get("SendTime");
                        long Validity = Long.valueOf(map.get("Validity").toString());
                        if( Validity < (now.getTime() - sendTime.getTime()) ){
                            list.remove(i);//移除失效验证码
                            result.put(STATUS, ERROR);
                            result.put(MESSAGE, "验证码已过期！");
                            return result;
                        }else{
                            check = true;
                            break;
                        }
                    }
                }
            }
            if( check ){
                session.removeAttribute("SMSVerificationCode");//校验成功，从session中删除缓存的验证码
            }else{
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "验证码错误！");
                session.setAttribute("SMSVerificationCode", list);
            }
            return result;
        } catch (Exception e) {
            logger.error(info + "时，发生异常", e);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "程序异常，请联系管理员。");
        }

        return result;
    }

    //----------------------------------------------------------------------------------------------------------

    /**
     * 账户充值支付宝下单接口
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/app/alipay")
    public
    @ResponseBody
    Object appAlipay(HttpServletRequest request, HttpServletResponse response) {
        String info = "支付宝APP支付";
        setLogInfo(info);
        Map map = new HashMap();
        try {
            String becShopUrl = getShopUrl();
            String notify_url = becShopUrl+"account/alipayAsynchronousAccount"; // 服务器异步通知页面路径
            String return_url = becShopUrl+"account/alipayAccount";		        // 页面跳转同步通知页面路径
            String orderSn = request.getParameter("orderSn");

            String total_fee = request.getParameter("total");//付款金额

            //金额转化为分为单位
            //total_fee = String.format("%.2f", Float.parseFloat(total_fee));
            String orderInfo = AlipayCore.getOrderInfo("订单："+orderSn,"用于支付订单："+orderSn, orderSn, total_fee, notify_url, return_url);

            String sign = AlipayCore.sign(orderInfo, AlipayConfig.private_key);
            // 仅需对sign 做URL编码
            sign = URLEncoder.encode(sign, "UTF-8");

            String linkString = orderInfo + "&sign=\"" + sign + "\"&"
                    + AlipayCore.getSignType();
            map.put("success",Boolean.TRUE);
            map.put("data",linkString);

        } catch (Exception e) {
            map.put("success",Boolean.FALSE);
            map.put("data",e);
            logger.error(info + "时，发生异常", e);
        }
        return map;
    }

    /**
     * 账户充值微信下单接口
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/app/wxpay")
    public
    @ResponseBody
    Object appWXpay(HttpServletRequest request, HttpServletResponse response) {
        String info = "微信APP支付";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(SUCCESS, Boolean.TRUE);
        result.put(MESSAGE, "微信统一下单成功");
        try {

            Buyer member = getCurrentMember(request);
//            String open_id = "";
            String open_id = member.getOpenId();

            String shopUrl = null;
            try {
                shopUrl = systemSetService.find(getParamMap(), "setkey", "shopUrl").getSetvalue();
            }catch (Exception e) {
                result.put(SUCCESS, Boolean.FALSE);
                result.put(DATA, "获取系统配置[shopUrl]失败，请检查系统配置项！");
                e.printStackTrace();
                return result;
            }
            String orderSn = request.getParameter("orderSn");
            if (StringUtil.isEmpty(orderSn)) {
                result.put(SUCCESS, Boolean.FALSE);
                result.put(DATA, "订单编号不能为空");
                return result;
            }
            String total_fee = request.getParameter("total");
            if (StringUtil.isEmpty(total_fee)) {
                result.put(SUCCESS, Boolean.FALSE);
                result.put(DATA, "订单金额不能为空");
                return result;
            }
            String finalmoney = String.format("%.2f", Float.parseFloat(total_fee)).replace(".", "");//金额转化为分为单位

            String nonceStr = WXUtil.getRandomStringByLength(16);
            UnifiedorderReqData unifiedorderReqData = new UnifiedorderReqData()
                    .buildAppid(Configure.getAppid_app())
                    .buildMch_id(Configure.getMchid_app())
                    .buildNonce_str(nonceStr)
                    .buildBody("goods description")
                    .buildOut_trade_no(orderSn)
                    .buildFee_type(Configure.FEE_TYPE_CNY)
                    .buildTotal_fee(Integer.valueOf(finalmoney).intValue())
                    .buildSpbill_create_ip(getIpAddr(request))
                    .buildNotify_url(shopUrl + "/account/unifieorder/notify")
                    .buildTrade_type(Configure.WX_TRADE_TYPE.APP.toString());
            logger.info("--------------------------------unifiedorderReqData-----------------------------------------");
            UnifiedorderResData unifiedorderResData = new UnifiedorderService().sendRequest(unifiedorderReqData);
            logger.info("--------------------------------UnifiedorderResData-----------------------------------------");
            if (unifiedorderReqData != null) {
                if (SUCCESS.equalsIgnoreCase(unifiedorderResData.getReturn_code())) {
                    if (SUCCESS.equalsIgnoreCase(unifiedorderResData.getResult_code())) {
                        result.put(DATA, unifiedorderResData);
                    } else {
                        result.put(SUCCESS, Boolean.FALSE);
                        result.put(DATA, "微信统一下单失败: err_code: " + unifiedorderResData.getErr_code()
                                + ", err_msg: " + unifiedorderResData.getErr_code_des());
                        return result;
                    }
                } else {
                    result.put(SUCCESS, Boolean.FALSE);
                    result.put(DATA, "微信统一下单失败:" + unifiedorderResData.getReturn_msg());
                    return result;
                }
            } else {
                result.put(SUCCESS, Boolean.FALSE);
                result.put(DATA, "微信统一下单失败");
                return result;
            }

            //设置待加密支付参数并加密gt
            Map<String, Object> paySignMap = new HashMap<String, Object>();
            paySignMap.put("appid", Configure.getAppid_app());
            paySignMap.put("noncestr", nonceStr);
            paySignMap.put("package", "Sign=WXPay");
            paySignMap.put("prepayid", unifiedorderResData.getPrepay_id());
            paySignMap.put("partnerid", Configure.getMchid_app());
            String timeStamp = new Date().getTime()/1000 + "";
            paySignMap.put("timestamp", timeStamp);
            String paySign = Signature.getSignForAPP(paySignMap);
            paySignMap.put("sign", paySign);
            logger.info("--------------------------------paySignMap-----------------------------------------");
            logger.info(JSON.toJSONString(paySignMap));
            result.put(DATA, JSON.toJSONString(paySignMap));
        } catch (Exception e) {
            result.put(SUCCESS, Boolean.FALSE);
            result.put(DATA, "微信统一下单失败q");
            logger.error(info + "时，发生异常", e);
        }
        return result;
    }

    @RequestMapping(value = "/app/unionpay")
    public
    @ResponseBody
    Object appUnionpay(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String info = "银联APP支付";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(SUCCESS, Boolean.TRUE);
        result.put(MESSAGE, "银联统一下单成功");
        try {
            Buyer member = getCurrentMember(request);
            String shopUrl = null;
            try {
                shopUrl = systemSetService.find(getParamMap(), "setkey", "shopUrl").getSetvalue();
            }catch (Exception e) {
                result.put(SUCCESS, Boolean.FALSE);
                result.put(DATA, "获取系统配置[shopUrl]失败，请检查系统配置项！");
                e.printStackTrace();
                return result;
            }
            String orderSn = request.getParameter("orderSn");
            if (StringUtil.isEmpty(orderSn)) {
                result.put(SUCCESS, Boolean.FALSE);
                result.put(DATA, "订单编号不能为空");
                return result;
            }
            String total_fee = request.getParameter("total");
            if (StringUtil.isEmpty(total_fee)) {
                result.put(SUCCESS, Boolean.FALSE);
                result.put(DATA, "订单金额不能为空");
                return result;
            }

            String frontUrl = shopUrl + "/html/paysuccess.html";// 页面通知地址
            String backUrl = shopUrl + "/account/unionpayBack";// 后台通知地址
            // 构造订单请求对象，生成signMsg。
            com.unionpay.acp.RequestOrder requestOrder = new com.unionpay.acp.RequestOrder();
            requestOrder.setFrontUrl(frontUrl);
            requestOrder.setBackUrl(backUrl);
            requestOrder.setOrderId(orderSn);
            requestOrder.setTxnAmt( Math.round(Double.parseDouble(total_fee) * 100) + "" );
            requestOrder.setTxnTime(DateUtils.dateToString( new Date(),"yyyyMMddHHmmss"));
            Map signedMap = UnionpayUtil.signData(requestOrder);
            logger.info(signedMap.toString());

            String actionUrl = requestOrder.getRequestUrl();

            Map params = net.deepdragon.util.StringUtil.beanToMap(requestOrder);
            params.remove("requestUrl");
            String html = UnionpayUtil.createHtml(actionUrl, params);

            logger.info(html);

            result.put(SUCCESS,Boolean.TRUE);
            result.put("html",html);

        } catch (Exception e) {
            result.put(SUCCESS,Boolean.FALSE);
            result.put(DATA,e);
            logger.error(info + "时，发生异常", e);
        }
        return result;

    }



    /**
     * 账户充值微信支付异步通知接口
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/unifieorder/notify")
    @ResponseBody
    public String wxpayNotify(HttpServletRequest request, HttpServletResponse response) {
        String info = "微信统一下单，异步通知接口";
        setLogInfo(info);
        logger.error(info);

        try {

            String resXml = WXUtil.streamToString(request.getInputStream());
            boolean isSignValid = Signature.checkIsSignValidFromResponseString(resXml);

            //如果微信收到商户的应答不是成功或超时，微信认为通知失败，微信会通过一定的策略定期重新发起通知
            //通知频率为15/15/30/180/1800/1800/1800/1800/3600，单位：秒
            //所以在对业务数据进行状态检查和处理之前，要采用数据锁进行并发控制，以避免函数重入造成的数据混乱。
            synchronized (lock) {
                if (isSignValid) {
                    AsynNotifyReqData reqData = (AsynNotifyReqData) XStreamUtil.getObjectFromXML(resXml, AsynNotifyReqData.class);
                    // 商户订单处理（订单状态：wait_seller_send_goods; 支付状态：paid;
                    // 配送状态：unshipped）valideData.get("queryId"),
                    String orderSn= reqData.getOut_trade_no();

                    AccountLog accountlog=accountlogService.get(getParamMap(),orderSn);
                    Account account=accountService.get(getParamMap(),accountlog.getAccountId());
                    if (accountlog != null && account!=null ) {
                        if ( accountlog != null && accountlog.getStatus()==0 && account!=null) {
                            accountlog.setStatus(1);
                            accountlog.setModifyUser(accountlog.getCreateUser());
                            accountlog.setModifyDate(new Date());
                            accountlogService.update(this.getParamMap(), accountlog);
                            //修改账户金额
                            account.setAccountTotal(accountlog.getAccount());
                            account.setAccountBlock(0.00);
                            accountService.update(this.getParamMap(), account);

                            setLogInfo("充值【" + accountlog.getId() + "】支付成功");
                            logger.error("充值【" + accountlog.getId() + "】支付成功");

                            AsynNotifyResData resData = new AsynNotifyResData();
                            resData.buildReturn_code("SUCCESS");
                            return ajaxText(XStreamUtil.objectToXml(resData, new Class[]{AsynNotifyResData.class}), response);
                        } else {
                            AsynNotifyResData resData = new AsynNotifyResData();
                            resData.buildReturn_code("SUCCESS");
                            return ajaxText(XStreamUtil.objectToXml(resData, new Class[]{AsynNotifyResData.class}), response);
                        }

                    } else {
                        AsynNotifyResData resData = new AsynNotifyResData();
                        resData.buildReturn_code("FAIL")
                                .buildReturn_msg("该订单[" + reqData.getOut_trade_no() + "]不存在");

                        return ajaxText(XStreamUtil.objectToXml(resData, new Class[]{AsynNotifyResData.class}), response);
                    }

                } else {
                    AsynNotifyResData resData = new AsynNotifyResData();
                    resData.buildReturn_code("FAIL")
                            .buildReturn_msg("签名验证失败");
                    return ajaxText(XStreamUtil.objectToXml(resData, new Class[]{AsynNotifyResData.class}), response);
                }
            }

        } catch (Exception e) {
            logger.error(info + "时，发生异常", e);
        }

        AsynNotifyResData resData = new AsynNotifyResData();
        resData.buildReturn_code("FAIL");
        return ajaxText(XStreamUtil.objectToXml(resData, new Class[]{AsynNotifyResData.class}), response);
    }

    private String getShopUrl() throws Exception {
        String shopUrl = null;
        try {
            shopUrl = systemSetService.find(getParamMap(), "setkey", "becShopUrl").getSetvalue();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (StringUtils.isEmpty(shopUrl)) {
                throw new Exception("获取系统配置[becShopUrl]失败，请检查系统配置项！");
            }
        }
        return shopUrl;
    }
}
