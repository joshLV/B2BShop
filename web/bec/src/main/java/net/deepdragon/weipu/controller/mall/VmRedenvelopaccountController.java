package net.deepdragon.weipu.controller.mall;


import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.Buyer;
import net.deepdragon.entity.weipu.Catelog;
import net.deepdragon.service.weipu.GhjRedenvelopAccesslogService;
import net.deepdragon.service.weipu.GhjVmRedenvelopaccountService;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 红包相关
 */
@Controller(Global.APP_SIGN + Global.MALL + "VmRedenvelopaccountController")
@RequestMapping(Global.MALL_PATH + "/vmredenvelopaccount")
public class VmRedenvelopaccountController  extends BaseMallController{
    @Resource
    private CacheData cacheData;
    @Resource
    private GhjVmRedenvelopaccountService vmRedenvelopaccountService;
    @Resource
    private GhjRedenvelopAccesslogService redenvelopAccesslogService;


    /**
     * 红包记录查询
     * @param pager
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "list")
    public String list(Pager pager, Model model, HttpServletRequest request) {
        String info = "红包记录";
        setLogInfo(info);
        logger.debug(info);
        Buyer currentMember = getCurrentMember(request);
        Criteria criteria = new Criteria();
        criteria.add(Restrictions.eq("vr.buyerId", currentMember.getId()));
        pager.setPageSize(10);
        try {
            pager.setList(vmRedenvelopaccountService.getRedenvelopList(getParamMap(), criteria));
            List vmRedenvelopaccountList = pager.getList();
            model.addAttribute("vmRedenvelopaccountList", vmRedenvelopaccountList);
            model.addAttribute("pager", pager);
        } catch (Exception e) {
            logger.error("执行" + info + "时，发生异常", e);
        }
        return Global.TEMPLATE_MALL + PATH + "/member/vmRedenvelopaccount_list";
    }


    /**
     * 红包使用记录查询
     * @param pager
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/listlog", method = { RequestMethod.POST })
    public @ResponseBody
    Object listlog(Pager pager, Model model, HttpServletRequest request) {
        String redEnvelopId=request.getParameter("redEnvelopId");
        String info = "红包使用记录";
        Map<String, Object> result = new HashMap<String, Object>();
        setLogInfo(info);
        logger.debug(info);
        Buyer currentMember = getCurrentMember(request);
        Criteria criteria = new Criteria();
        criteria.add(Restrictions.eq("buyerId", currentMember.getId()));
        criteria.add(Restrictions.eq("groupId", redEnvelopId));
        pager.setPageSize(10);
        try {
            pager=redenvelopAccesslogService.getPager(getParamMap(), criteria, pager);
            List redenvelopaccountList = pager.getList();
            result.put(STATUS, SUCCESS);
            result.put("list", redenvelopaccountList);
            result.put(MESSAGE, "");
        } catch (Exception e) {
            logger.error(info + "时，发生异常", e);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "操作失败，请联系管理员。");
        }
        return result;
    }

    /**
     * Desc:获取红包记录
     * @param pager
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "getRedenvelopRecord")
    public String getRedenvelopRecord(Pager pager,Model model,HttpServletRequest request) {
        String info = "获取红包信息";
        setLogInfo(info);
        logger.debug(info);

        try{
            pager = getData(request,pager,0);
            model.addAttribute("redenvelopRecordList",pager.getList());
            model.addAttribute("pager", pager);

            //红包开始时间
            String startDate = request.getParameter("startDate");
            if (StringUtil.isNotEmpty(startDate)) {
                model.addAttribute("startDate", startDate);
            }

            //红包结束时间
            String endDate = request.getParameter("endDate");
            if (StringUtil.isNotEmpty(endDate)) {
                model.addAttribute("endDate", endDate);
            }

            //商家
            String merchantName = request.getParameter("merchantName");
            if (StringUtil.isNotEmpty(merchantName)) {
                model.addAttribute("merchantName", merchantName);
            }

            //红包类型
            String redEnvelopType = request.getParameter("redEnvelopType");
            if (StringUtil.isNotEmpty(redEnvelopType)) {
                model.addAttribute("redEnvelopType", redEnvelopType);
            }

            setPublicDate2Model(model);

            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
            LoginType loginType = getLoginType(request);
            model.addAttribute("loginType", loginType);
            String operatorRole = getOperatorRole(request);
            if (LoginType.operator.equals(loginType)) {
                model.addAttribute("role", operatorRole);
            }
            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/
            getAllCatelog(model);

        }catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
        }

        return Global.TEMPLATE_MALL + PATH + "/member/redEnvelopRecord";

    }

    /**
     * aJax获取下一页数据
     * @param pager
     * @param request
     * @return
     */
    @RequestMapping(value = "ajaxRedenvelopRecordData")
    @ResponseBody
    public Map<String, Object> ajaxRedenvelopRecordData(Pager pager,HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();

        try {
            String info = "红包列表页";
            setLogInfo(info);
            logger.error(info);

            pager = getData(request,pager,0);

            result.put(STATUS, SUCCESS);
            result.put(MESSAGE, "成功");
            result.put("pager", pager);
            result.put("total", pager.getTotalCount());
            result.put("pageNumber", pager.getPageNumber());

            result.put("goodslist", pager.getList());
            //----app端返回------
            result.put(DATA,pager.getList());

        }catch (Exception e){
            logger.error("获取红包时，发生异常", e);
            e.printStackTrace();
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "获取红包时，发生异常");
        }

        return result;
    }

    /**
     * Desc:获取红包详情
     * @param pager
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "getRedEnvelopDetail")
    public String getRedEnvelopDetail(Pager pager,Model model,HttpServletRequest request) {
        String info = "获取红包详情信息";
        setLogInfo(info);
        logger.debug(info);

        try{
            pager = getData(request,pager,1);

            model.addAttribute("redenvelopRecordDetailList",pager.getList());
            model.addAttribute("pager", pager);

            String groupId = request.getParameter("groupId");
            if (StringUtil.isNotEmpty(groupId)) {
                model.addAttribute("groupId", groupId);
            }

            //红包创建开始时间
            String startDate = request.getParameter("startDate");
            if (StringUtil.isNotEmpty(startDate)) {
                model.addAttribute("startDate", startDate);
            }

            //红包创建结束时间
            String endDate = request.getParameter("endDate");
            if (StringUtil.isNotEmpty(endDate)) {
                model.addAttribute("endDate", endDate);
            }

            //红包类型
            String redEnvelopType = request.getParameter("redEnvelopType");
            if (StringUtil.isNotEmpty(redEnvelopType)) {
                model.addAttribute("redEnvelopType", redEnvelopType);
            }

            //红包使用类型
            String redEnvelopAccessType = request.getParameter("redEnvelopAccessType");
            if (StringUtil.isNotEmpty(redEnvelopAccessType)) {
                model.addAttribute("redEnvelopAccessType", redEnvelopAccessType);
            }

            setPublicDate2Model(model);

            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
            LoginType loginType = getLoginType(request);
            model.addAttribute("loginType", loginType);
            String operatorRole = getOperatorRole(request);
            if (LoginType.operator.equals(loginType)) {
                model.addAttribute("role", operatorRole);
            }
            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/
            getAllCatelog(model);

        }catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
        }

        return Global.TEMPLATE_MALL + PATH + "/member/redEnvelopRecordDetail";

    }

    /**
     * aJax获取下一页红包流水数据
     * @param pager
     * @param request
     * @return
     */
    @RequestMapping(value = "ajaxRedenvelopRecordDetailData")
    @ResponseBody
    public Map<String, Object> ajaxRedenvelopRecordDetailData(Pager pager,HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();

        try {
            String info = "红包流水列表页";
            setLogInfo(info);
            logger.error(info);

            pager = getData(request,pager,1);

            result.put(STATUS, SUCCESS);
            result.put(MESSAGE, "成功");
            result.put("pager", pager);
            result.put("total", pager.getTotalCount());
            result.put("pageNumber", pager.getPageNumber());

            result.put("goodslist", pager.getList());

        }catch (Exception e){
            logger.error("获取红包流水时，发生异常", e);
            e.printStackTrace();
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "获取红包流水时，发生异常");
        }

        return result;
    }

    /**
     * Desc:根据条件查询红包数据
     * @param request
     * @param pager
     * @param type 查询数据类型  0:查询红包数据  1:查询红包详情数据
     * @return
     */
    private Pager getData(HttpServletRequest request,Pager pager,int type) {
        try {
            Criteria criteria = new Criteria();
            //设置页面默认为10条数据
            pager.setPageSize(10);

            Buyer buyer = getCurrentMember(request);
            if (type == 0) {
                //采购单ID
                if(StringUtil.isNotEmpty(buyer)){
                    criteria.add(Restrictions.eq("buyerId", buyer.getId()));
                }

                //红包开始时间
                String startDate = request.getParameter("startDate");
                if (StringUtil.isNotEmpty(startDate)) {
                    criteria.add(Restrictions.ge("DATE_FORMAT(expiryTime, '%Y-%m-%d')", startDate));
                }

                //红包结束时间
                String endDate = request.getParameter("endDate");
                if (StringUtil.isNotEmpty(endDate)) {
                    criteria.add(Restrictions.le("DATE_FORMAT(expiryTime, '%Y-%m-%d')", endDate));
                }

                //商家
                String merchantName = request.getParameter("merchantName");
                if (StringUtil.isNotEmpty(merchantName)) {
                    criteria.add(Restrictions.likeTwo("m.name", "'%" + merchantName + "%'"));
                }

                //红包类型
                String redEnvelopType = request.getParameter("redEnvelopType");
                if (StringUtil.isNotEmpty(redEnvelopType)) {
                    criteria.add(Restrictions.eq("redEnvelopType", redEnvelopType));
                }

                criteria.add(Restrictions.order("expiryTime", "DESC"));

                pager = vmRedenvelopaccountService.getRedenvelopRecord(getParamMap(), criteria, pager);
            }else{
                //红包分组ID
                String groupId = request.getParameter("groupId");
                if (StringUtil.isNotEmpty(groupId)) {
                    criteria.add(Restrictions.eq("groupId", groupId));
                }

                criteria.add(Restrictions.eq("isDelete", "N"));

                //红包创建开始时间
                String startDate = request.getParameter("startDate");
                if (StringUtil.isNotEmpty(startDate)) {
                    criteria.add(Restrictions.ge("DATE_FORMAT(createTime, '%Y-%m-%d')", startDate));
                }

                //红包创建结束时间
                String endDate = request.getParameter("endDate");
                if (StringUtil.isNotEmpty(endDate)) {
                    criteria.add(Restrictions.le("DATE_FORMAT(createTime, '%Y-%m-%d')", endDate));
                }

                //红包类型
                String redEnvelopType = request.getParameter("redEnvelopType");
                if (StringUtil.isNotEmpty(redEnvelopType)) {
                    criteria.add(Restrictions.eq("redEnvelopType", redEnvelopType));
                }

                //红包使用类型
                String redEnvelopAccessType = request.getParameter("redEnvelopAccessType");
                if (StringUtil.isNotEmpty(redEnvelopAccessType)) {
                    criteria.add(Restrictions.eq("accessType", redEnvelopAccessType));
                }

                criteria.add(Restrictions.order("createTime","Desc"));

                pager = redenvelopAccesslogService.getPager(getParamMap(), criteria, pager);
            }
        }catch (Exception e){
            logger.error("获取红包时，发生异常", e);
            e.printStackTrace();
        }

        return pager;
    }

}
