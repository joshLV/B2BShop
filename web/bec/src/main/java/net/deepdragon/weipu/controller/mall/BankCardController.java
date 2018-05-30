package net.deepdragon.weipu.controller.mall;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.BankCard;
import net.deepdragon.entity.weipu.Buyer;
import net.deepdragon.entity.weipu.BuyerOperator;
import net.deepdragon.entity.weipu.Catelog;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.service.weipu.BankCardService;
import net.deepdragon.service.weipu.SMSLogService;
import net.deepdragon.util.DateUtil;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * author :乐昌海
 */
@Controller(Global.APP_SIGN + Global.MALL + "BankCardController")
@RequestMapping(Global.MALL_PATH + "/bankCard")
public class BankCardController extends BaseMallController{
    @Resource
    private BankCardService bankCardService;
    @Resource
    private CacheData cacheData;
    @Resource
    private SMSLogService smsLogService;
    @Resource
    private SystemSetService systemSetService;

    @RequestMapping(value = "list")
    public String list(Pager pager, Model model, HttpServletRequest request) {
        String info = "银行卡列表页面";
        setLogInfo(info);
        logger.debug(info);
        Buyer currentMember = getCurrentMember(request);
        Criteria criteria = new Criteria();
        criteria.add(Restrictions.eq("re.buyerId", currentMember.getId()));
        pager.setPageSize(10);
        try {
            //------------------根据条件查询  begin -------------------
            String accountName = request.getParameter("accountName");//开户名
            if (StringUtil.isNotEmpty(accountName)) {
                criteria.add(Restrictions.likeTwo("re.accountName", "'%"+accountName+"%'"));
                //criteria.add(Restrictions.eq("re.accountName", accountName));
                model.addAttribute("accountName", accountName);
            }

            String bankName = request.getParameter("bankName");//bankName
            if (StringUtil.isNotEmpty(bankName)) {
                criteria.add(Restrictions.likeTwo("re.bankName", "'%"+bankName+"%'"));
                //criteria.add(Restrictions.eq("re.bankName", bankName));
                model.addAttribute("bankName", bankName);
            }
            String bankCardcode = request.getParameter("bankcardcode");//银行卡号
            if (StringUtil.isNotEmpty(bankCardcode)) {
                criteria.add(Restrictions.likeTwo("re.bankcardcode", "'%"+bankCardcode+"%'"));
               // criteria.add(Restrictions.eq("re.bankcardcode", bankCardcode));
                model.addAttribute("bankcardcode", bankCardcode);
            }
            //----------------end---------------------------------
            criteria.add(Restrictions.order("re.createDate","desc"));
            pager = bankCardService.getPager(getParamMap(), criteria, pager);
            List bankCardList = pager.getList();
            model.addAttribute("bankCardList", bankCardList);
            model.addAttribute("pager", pager);
            setPublicDate2Model(model);
            getAllCatelog(model);
            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
            LoginType loginType = getLoginType(request);
            model.addAttribute("loginType", loginType);
            String operatorRole = getOperatorRole(request);
            BuyerOperator buyerOperator = getCurrentOperator(request);
            Buyer mb = getCurrentMember(request);
            if (LoginType.operator.equals(loginType)) {
                model.addAttribute("mp", buyerOperator);
                model.addAttribute("mb", mb);
                model.addAttribute("role", operatorRole);
            }
            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/
        } catch (Exception e) {
            logger.error("执行" + info + "时，发生异常", e);
        }
        return Global.TEMPLATE_MALL + PATH + "/member/bankcard_list";
    }
    @RequestMapping(value = "/save", method = { RequestMethod.POST })
    public @ResponseBody
    Object save(BankCard bankCard, HttpServletRequest request) {
        String info = "保存银行卡信息(" + bankCard + ")";
        setLogInfo(info);
        logger.debug(info);
        Map<String, Object> result = new HashMap<>();
        try {
            bankCard.setCreateDate(new Date());
            bankCard.setCreateUser(getCurrentMember(request).getUserName());
            bankCard.setTenantId(getTenantId());
            bankCard.setBuyerId(getCurrentMember(request).getId());
            String cardId = bankCard.getId();
            if(StringUtil.isNotEmpty(cardId)){//如果id不为空,更新当前信息，否则新增信息
                bankCard.setModifyUser(getCurrentMember(request).getUserName());
                bankCard.setModifyDate(new Date());
                bankCardService.update(getParamMap(), bankCard);
            }else{
                bankCardService.save(getParamMap(), bankCard);
            }
            result.put(STATUS, SUCCESS);
            result.put("bankCard", bankCard);
            result.put(MESSAGE, "");
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "保存失败，请联系管理员。");
        }

        return result;
    }
    @RequestMapping(value = "/edit", method = { RequestMethod.POST })
    public @ResponseBody
    Object edit(String bankCardId, HttpServletRequest request) {
        String info = "修改银行卡信息(" + bankCardId + ")";
        setLogInfo(info);
        logger.debug(info);
        Map<String, Object> result = new HashMap<>();
        try {
            BankCard bankCard = bankCardService.get(getParamMap(), bankCardId);
            result.put("bankCard", bankCard);
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "删除失败，请联系管理员。");
        }
        return result;
    }
    @RequestMapping(value = "/delete", method = { RequestMethod.POST })
    public @ResponseBody
    Object delete(String bankCardId, HttpServletRequest request) {
        String info = "银行卡信息(" + bankCardId + ")";
        setLogInfo(info);
        logger.debug(info);
        Map<String, Object> result = new HashMap<>();
        try {
            bankCardService.delete(getParamMap(), bankCardId);
            result.put(STATUS, SUCCESS);
            result.put(MESSAGE, "");
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "删除失败，请联系管理员。");
        }
        return result;
    }
    /**
     * 发送短信验证码
     * @param request
     * @return
     */
    @RequestMapping("sendSMSVerificationCode")
    @ResponseBody
    public Object sendSMSVerificationCode(String mobile,HttpServletRequest request){
        String info = "发送短信验证码";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<>();
        result.put(STATUS, SUCCESS);
        result.put(MESSAGE, "");
        try {
            String numRandom = StringUtil.numRandom(6);
            //发送短信
            String smsContent = "尊敬的会员：" + mobile + ",您的验证码为：" + numRandom + ",注意保密哦！有效期5分钟";
//            Map<String, Object> sendResult = SmsUtil.sendSms(getParamMap(),mobile, smsContent);
            Map<String, Object> sendResult = smsLogService.sendSMS(getParamMap(),mobile, smsContent, systemSetService.getAll(getParamMap()));
            if (!SUCCESS.equals(sendResult.get(STATUS))) {
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "短信发送失败，请稍后再试");
                return result;
            }else{
                //保存短信日志
                this.bankCardService.insertOne(getParamMap(), (String)sendResult.get("smslogSql"));
            }
            HttpSession session = request.getSession();
            List<Map<String, Object>> list = (List<Map<String, Object>>)session.getAttribute("SMSVerificationCode");
            if(  list == null){
                list = new ArrayList<>();
            }
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("SMSVerificationCode", numRandom);
            map.put("SendTime", DateUtil.getCalendar().getTime());
            map.put("Validity", 5 * 60 * 1000);//有效期5分钟
            list.add(map);
            session.removeAttribute("SMSVerificationCode");
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
                list = new ArrayList<>();
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



    /**
     * ajax查询下一页银行卡信息
     * @param request
     * @return
     */
    @RequestMapping(value="loadmore")
    @ResponseBody
    Object ajaxLoadmore(HttpServletRequest request){
        String info="银行卡列表页";
        setLogInfo(info);

        Map<String,Object> result=new HashMap<String,Object>();
        try{
          Criteria criteria=new Criteria();
            criteria.add(Restrictions.eq("re.buyerId", getCurrentMember(request).getId()));
            criteria.add(Restrictions.order("re.createDate","desc"));
            Pager pager=new Pager();
            pager.setPageSize(10);
            pager.setPageNumber(Integer.valueOf(request.getParameter("pageNumber")));
            pager=bankCardService.getPager(getParamMap(),criteria,pager);
            List list=pager.getList();
            result.put(DATA,list);
            result.put("pager",pager);
            result.put(STATUS,SUCCESS);
            result.put(MESSAGE,"操作成功");
            return result;
        }catch(Exception ex){
            logger.error(info+"时，发生异常",ex);
            result.put(STATUS,ERROR);
            result.put(MESSAGE,"操作失败");
            return result;
        }
    }



    /**
     * ajax根据银行卡查询信息
     * @param request
     * @return
     */
    @RequestMapping(value="isExist")
    @ResponseBody
    Object isExist(HttpServletRequest request,String bankcardcode){
        String info="根据银行卡号获取银行卡信息";
        setLogInfo(info);
        Map<String,Object> result=new HashMap<String,Object>();
        try{
            if(StringUtil.isEmpty(bankcardcode)){
                bankcardcode = request.getParameter("param");
            }

            boolean isExist = bankCardService.isExist(getParamMap(),"bankcardcode",bankcardcode);
            result.put(STATUS,isExist);
            result.put(MESSAGE,"操作成功");
            return result;
        }catch(Exception ex){
            logger.error(info+"时，发生异常",ex);
            result.put(STATUS,false);
            result.put(MESSAGE,"操作失败");
            result.put("info","操作失败");
            return result;
        }
    }

    /**
     * ajax根据银行卡查询信息
     * @param request
     * @return
     */
    @RequestMapping(value="judgeCardExist")
    @ResponseBody
    Object judgeCardExist(HttpServletRequest request,String param,String id){
        String info="根据银行卡号获取银行卡信息";
        setLogInfo(info);
        Map<String,Object> result=new HashMap<String,Object>();
        try{

            if( StringUtil.isNotEmpty( id )){
                BankCard bankCard = this.bankCardService.get(getParamMap(), id);
                if( bankCard.getBankcardcode().equals( param ) ){
                    result.put(STATUS,"y");
                    result.put("info","通过信息验证!");
                }else{
                    boolean isExist = bankCardService.isExist(getParamMap(),"bankcardcode",param);
                    result.put(STATUS,isExist?"n":"y");
                    result.put("info",isExist?"银行卡已存在":"可用银行卡");
                }
            }else{
                boolean isExist = bankCardService.isExist(getParamMap(),"bankcardcode",param);
                result.put(STATUS,isExist?"n":"y");
                result.put("info",isExist?"银行卡已存在":"可用银行卡");
            }
            return result;
        }catch(Exception ex){
            logger.error(info+"时，发生异常",ex);
            result.put(STATUS,"n");
            result.put("info","操作失败");
            return result;
        }
    }

    /**
     * ajax根据银行卡查询信息
     * @param request
     * @return
     */
    @RequestMapping(value="judgeSMSVC")
    @ResponseBody
    Object judgeSMSVerificationCode(HttpServletRequest request,String param){
        String info = "Check短信验证码";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            Date now = DateUtil.getCalendar().getTime();
            if( StringUtil.isEmpty(param) ){
                result.put(STATUS, 'n');
                result.put("info", "验证码不能为空！");
                return result;
            }
            boolean check = false;
            HttpSession session = request.getSession();
            List<Map<String, Object>> list = (List<Map<String, Object>>)session.getAttribute("SMSVerificationCode");
            if(  list != null && list.size() > 0 ){
                for(int i=list.size()-1; i >= 0; --i){
                    Map<String, Object> map = list.get(i);
                    if(param.equals(map.get("SMSVerificationCode").toString())){
                        Date sendTime = (Date)map.get("SendTime");
                        long Validity = Long.valueOf(map.get("Validity").toString());
                        if( Validity < (now.getTime() - sendTime.getTime()) ){
                            list.remove(i);//移除失效验证码
                            result.put(STATUS, "n");
                            result.put("info", "验证码已过期！");
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
                result.put(STATUS, "y");
                result.put("info", "通过信息验证！");
            }else{
                result.put(STATUS, "n");
                result.put("info", "验证码错误！");
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
}
