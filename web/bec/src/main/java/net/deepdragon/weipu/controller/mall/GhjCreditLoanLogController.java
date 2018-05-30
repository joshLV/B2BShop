package net.deepdragon.weipu.controller.mall;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.weipu.GhjCreditLoanLogService;
import net.deepdragon.service.weipu.GhjCreditReplyService;
import net.deepdragon.util.DateUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * author :乐昌海
 */
@Controller(Global.APP_SIGN + Global.MALL + "GhjCreditLoanLog")
@RequestMapping(Global.MALL_PATH + "/creditLoanLog")
public class GhjCreditLoanLogController extends BaseMallController{
    @Resource
    private GhjCreditLoanLogService creditLoanLogService;
    @Resource
    private CacheData cacheData;
    @Resource
    private GhjCreditReplyService creditReplyService;

    /**
     * 保存
     * @param creditLoanLog
     * @param request
     * @return
     */
    @RequestMapping(value = "/save", method = { RequestMethod.POST })
    public @ResponseBody
    Object save(GhjCreditLoanLog creditLoanLog, HttpServletRequest request) {
        String info = "保存申请放款记录";
        setLogInfo(info);
        logger.debug(info);
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            creditLoanLog.setCreateDate(new Date());
            creditLoanLog.setApplyLoanTime(new Date());
            LoginType op=getLoginType(request);
            if(LoginType.operator.equals(op)){//操作员
                creditLoanLog.setCreateUser(getCurrentOperator(request).getUserName());
               // creditLoanLog.setBuyerId(getCurrentOperator(request).getUserName());
            }else if(LoginType.buyer.equals(op)){//供应商
                creditLoanLog.setCreateUser(getCurrentMember(request).getUserName());
               // creditLoanLog.setBuyerId(getCurrentMember(request).getUserName());
            }
            creditLoanLog.setBuyerId(getCurrentMember(request).getId());
            creditLoanLog.setLoanStatus("apply_loaning");//申请放款时候，更新放款记录表中的【放款状态】为【apply_loaning: 申请放款中】
            creditLoanLog.setTenantId(getTenantId());
            result.put(STATUS, SUCCESS);
            result.put("credit", creditLoanLogService.save(getParamMap(),creditLoanLog));
            result.put(MESSAGE, "申请放款成功");
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "申请放款失败，请联系管理员。");
        }
        return result;
    }
    /**
     * 获取回复信息
     * @param replyId
     * @return
     */
    @RequestMapping(value = "/getCreditReply", method = { RequestMethod.GET })
    public @ResponseBody
    Object getCreditReply(String replyId){
        String info = "获取回复信息";
        setLogInfo(info);
        logger.debug(info);
        Map<String, Object> result = new HashMap<>();
        try {
            result.put(STATUS, SUCCESS);
            result.put(MESSAGE, "");
            GhjCreditReply creditReply = creditReplyService.get(getParamMap(), replyId);
            creditReply.setCreditStart(DateUtil.dateToString(creditReply.getCreditStartDate(),"yyyy-MM-dd"));
            creditReply.setCreditEnd(DateUtil.dateToString(creditReply.getCreditEndDate(),"yyyy-MM-dd"));
            result.put("creditReply", creditReply);
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "获取数据失败，请联系管理员。");
        }
        return result;
    }
    @RequestMapping(value = "getCreditReplyList")
    public String getCreditReplyList(Pager pager,HttpServletRequest request,Model model) {
        String info = "查询授信回复信息";
        setLogInfo(info);
        logger.debug(info);

        try {
            Criteria criteria=new Criteria();
            criteria.add(Restrictions.eq("cr.buyerId",  getCurrentMember(request).getId()));
            if(request.getParameter("creditId")!=null && !request.getParameter("creditId").equals("")){
                criteria.add(Restrictions.eq("cr.creditId", request.getParameter("creditId")));
            }
           /* String currentDate = DateUtil.dateToString(new Date(), "yyyy-MM-dd");
            criteria.add(Restrictions.le("DATE_FORMAT(creditStartDate, '%Y-%m-%d')", currentDate));
            criteria.add(Restrictions.gt("DATE_FORMAT(creditEndDate, '%Y-%m-%d')", currentDate));*/
            criteria.add(Restrictions.order("cr.createDate","desc"));
            pager.setPageSize(15);
            pager = creditReplyService.getPager(getParamMap(), criteria, pager);
            //-----begin---- 判断页面是否申请放款是否在授信有效期内-------
            List<GhjCreditReply> list = (List<GhjCreditReply>) pager.getList();
            String currentDate = DateUtil.dateToString(new Date(), "yyyy-MM-dd");
            for(int i=0;i<list.size();i++){
                GhjCreditReply entry = list.get(i);
                Date creditStartDate = entry.getCreditStartDate();
                Date creditEndDate = entry.getCreditEndDate();
                boolean creditStartDateFlag = DateUtil.compareDate(currentDate,DateUtil.dateToString(creditStartDate,"yyyy-MM-dd"));//当前时间要大于授信起始日期
                boolean creditEndDateDateFlag = DateUtil.compareDate(DateUtil.dateToString(creditEndDate,"yyyy-MM-dd"),currentDate);//授信结束日期要大于当前时间
                entry.setIsValid((creditStartDateFlag&&creditEndDateDateFlag)+"");
            }
            //-----end---- 判断页面是否申请放款是否在授信有效期内-------
            model.addAttribute("creditReplyList",list);
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
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
        }
        return Global.TEMPLATE_MALL + PATH + "/member/creditReply_list";
    }
    @RequestMapping(value = "getLoanHistory")
    public String getLoanHistory(String replyId,Model model,HttpServletRequest request,Pager pager) {
        String info = "回复信息查询放款记录...";
        setLogInfo(info);
        try {
            Criteria criteria=new Criteria();
            LoginType op=getLoginType(request);
            criteria.add(Restrictions.eq("replyId", replyId));
            pager.setPageSize(10);
            if(LoginType.operator.equals( op )){//操作员
                criteria.add(Restrictions.eq("buyerId", getCurrentOperator(request).getId()));
            }else if(LoginType.buyer.equals( op )){//供应商
                criteria.add(Restrictions.eq("buyerId", getCurrentMember(request).getId()));
            }
            pager = creditLoanLogService.getPager(getParamMap(), criteria,pager);
            model.addAttribute("creditLoanLog", pager.getList());
        } catch (Exception e) {
            logger.error("根据授信申请回复信息编号查询放款记录发生异常, replyId=" + replyId, e);
        }
        return Global.TEMPLATE_MALL + PATH + "/member/creditLoanLog";
    }


}
