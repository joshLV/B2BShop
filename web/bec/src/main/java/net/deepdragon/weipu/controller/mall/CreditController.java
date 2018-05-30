package net.deepdragon.weipu.controller.mall;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.weipu.GhjCreditReplyService;
import net.deepdragon.service.weipu.GhjCreditService;
import net.deepdragon.service.weipu.GhjCreditUsedLogService;
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
import java.util.*;

/**
 * 授信相关
 */
@Controller(Global.APP_SIGN + Global.MALL + "CreditController")
@RequestMapping(Global.MALL_PATH + "/credit")
public class CreditController extends BaseMallController {

	@Resource
	private GhjCreditService creditService;
	@Resource
	private CacheData cacheData;
	@Resource
	private GhjCreditReplyService creditReplyService;
	@Resource
	private GhjCreditUsedLogService  creditUsedLogService;

	/**
	 * 列表查询
	 * @param pager
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "list")
	public String list(Pager pager, Model model, HttpServletRequest request) {
		String info = "授信记录";
		setLogInfo(info);
		logger.debug(info);

		Criteria criteria = new Criteria();
		criteria.add(Restrictions.eq("cre.buyerId",  getCurrentMember(request).getId()));
		criteria.add(Restrictions.order("cre.createDate","desc"));
		pager.setPageSize(10);
		try {
			//------------------根据条件查询  begin -------------------
			String startDate = request.getParameter("startDate");//查询起始时间
			if (StringUtil.isNotEmpty(startDate)) {
				criteria.add(Restrictions.ge("DATE_FORMAT(cre.createDate, '%Y-%m-%d')",startDate));
				model.addAttribute("startDate", startDate);
			}

			String endDate = request.getParameter("endDate");//查询结束时间
			if (StringUtil.isNotEmpty(endDate)) {
				criteria.add(Restrictions.le("DATE_FORMAT(cre.createDate, '%Y-%m-%d')", endDate));
				model.addAttribute("endDate", endDate);
			}
			String status = request.getParameter("status");//查询状态
			if (StringUtil.isNotEmpty(status)) {
				criteria.add(Restrictions.eq("cre.status", status));
				model.addAttribute("status", status);
			}
			//----------------end---------------------------------
			pager = creditService.getPager(getParamMap(), criteria, pager);
			List creditList = pager.getList();
			model.addAttribute("creditList", creditList);
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
		return Global.TEMPLATE_MALL + PATH + "/member/credit_list";
	}

	/**
	 * 保存
	 * @param credit
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/save", method = { RequestMethod.POST })
	public @ResponseBody
	Object save(GhjCredit credit, HttpServletRequest request) {
		String info = "保存申请授信信息(" + credit + ")";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			credit.setCreateDate(new Date());
			credit.setApplyTime(new Date());

			LoginType op=getLoginType(request);
			if(LoginType.operator.equals(op)){//操作员
				credit.setCreateUser(getCurrentOperator(request).getUserName());
				credit.setOperator(getCurrentOperator(request).getUserName());
			}else if(LoginType.buyer.equals(op)){//供应商
				credit.setCreateUser(getCurrentMember(request).getUserName());
				credit.setOperator(getCurrentMember(request).getUserName());
			}
			credit.setBuyerId(getCurrentMember(request).getId());
			credit.setTenantId(getTenantId());
			credit.setCompDesc(credit.getCompDesc().trim());
			credit=creditService.save(getParamMap(), credit);
			Thread.sleep(10);//数据库同步时，有延时
			credit=creditService.get(getParamMap(), credit.getId());
			
			result.put(STATUS, SUCCESS);
			result.put("credit", credit);
			result.put(MESSAGE, "");
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "保存失败，请联系管理员。");
		}
		
		return result;
	}

	@RequestMapping(value = "/delete", method = { RequestMethod.POST })
	public @ResponseBody
	Object delete(String creditId, HttpServletRequest request) {
		String info = "申请授信信息(" + creditId + ")";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			creditService.delete(getParamMap(), creditId);
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
	 * 修改信息查询
	 * @param creditId
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/edit", method = { RequestMethod.POST })
	public @ResponseBody
	Object edit(String creditId, HttpServletRequest request) {
		String info = "修改申请授信信息(" + creditId + ")";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			GhjCredit credit = creditService.get(getParamMap(), creditId);
			result.put("credit", credit);
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "删除失败，请联系管理员。");
		}
		LoginType op=getLoginType(request);
		if(LoginType.operator.equals( op )){//操作员
			result.put("member", getCurrentOperator(request));
		}else if(LoginType.buyer.equals( op )){//供应商
			result.put("member", getCurrentMember(request));
		}
		return result;
	}

	/**
	 * 修改授信信息
	 * @param request
	 * @param credit
	 * @return
	 */
	@RequestMapping(value = "/update", method = { RequestMethod.POST })
	public @ResponseBody
	Object update(HttpServletRequest request, GhjCredit credit) {
		String info = "保存修改后的收货人地址信息";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			LoginType op=getLoginType(request);
			if(LoginType.operator.equals( op )){//操作员
				credit.setModifyUser(getCurrentOperator(request).getUserName());
			}else if(LoginType.operator.equals( op )){//供应商
				credit.setModifyUser(getCurrentMember(request).getUserName());
			}

			credit.setModifyDate(new Date());
			creditService.update(getParamMap(), credit);

			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "");
			result.put("credit", creditService.get(getParamMap(), credit.getId()));
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "修改失败，请联系管理员。");
		}
		return result;
	}


	/**
	 * 修改授信信息状态
	 * @param request
	 * @param credit
	 * @return
	 */
	@RequestMapping(value = "/updateCreditStatus", method = { RequestMethod.POST })
	public @ResponseBody
	Object updateCreditStatus(HttpServletRequest request, GhjCredit credit) {
		String info = "修改授信状态id="+credit.getId();
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String newStatus=credit.getStatus();
			credit=creditService.get(this.getParamMap(),credit.getId());
			if(credit!=null){

				LoginType op=getLoginType(request);
				if(LoginType.operator.equals(op)){//操作员
					credit.setModifyUser(getCurrentOperator(request).getUserName());
				}else if(LoginType.operator.equals(op)){//供应商
					credit.setModifyUser(getCurrentMember(request).getUserName());
				}

				credit.setModifyDate(new Date());
				credit.setStatus(newStatus);
				creditService.update(getParamMap(), credit);

				result.put(STATUS, SUCCESS);
				result.put(MESSAGE, "");
				result.put("credit", creditService.get(getParamMap(), credit.getId()));
			}
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "修改失败，请联系管理员。");
		}
		return result;
	}


	@RequestMapping(value = "/getCreditReplyList", method = { RequestMethod.POST })
	public @ResponseBody
	Object getCreditReplyList(HttpServletRequest request, GhjCredit credit) {
		String info = "查询授信回复信息";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String newStatus=credit.getStatus();

			Criteria criteria=new Criteria();

			LoginType op=getLoginType(request);
			if(LoginType.operator.equals( op )){//操作员
				criteria.add(Restrictions.eq("buyerId", getCurrentOperator(request).getId()));
			}else if(LoginType.operator.equals( op )){//供应商
				criteria.add(Restrictions.eq("buyerId", getCurrentMember(request).getId()));
			}
			criteria.add(Restrictions.eq("creditId", credit.getId()));
			criteria.add(Restrictions.eq("platform", this.getPlatform()));
			List<GhjCreditReply> list= creditReplyService.getList(getParamMap(),criteria);

			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "");
			result.put("list", list);
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "修改失败，请联系管理员。");
		}
		return result;
	}
	/**
	 * 授信金额使用记录列表查询
	 * @param pager
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "useList")
	public String useList(Pager pager, Model model, HttpServletRequest request) {
		String info = "授信记录";
		setLogInfo(info);
		logger.debug(info);

		Criteria criteria = new Criteria();
		criteria.add(Restrictions.eq("cl.buyerId",  getCurrentMember(request).getId()));
		criteria.add(Restrictions.order("cl.createDate","desc"));
		pager.setPageSize(10);
		try {
			//------------------根据条件查询  begin -------------------
			String startDate = request.getParameter("startDate");//查询使用起始时间
			if (StringUtil.isNotEmpty(startDate)) {
				criteria.add(Restrictions.ge("DATE_FORMAT(cl.usedTime, '%Y-%m-%d')",startDate));
				model.addAttribute("startDate", startDate);
			}

			String endDate = request.getParameter("endDate");//查询使用结束时间
			if (StringUtil.isNotEmpty(endDate)) {
				criteria.add(Restrictions.le("DATE_FORMAT(cl.usedTime, '%Y-%m-%d')", endDate));
				model.addAttribute("endDate", endDate);
			}
			String bankName = request.getParameter("bankName");//查询状态
			if (StringUtil.isNotEmpty(bankName)) {
				criteria.add(Restrictions.eq("cr.bankName", bankName));
				model.addAttribute("bankName", bankName);
			}
			//----------------end---------------------------------
			pager = creditUsedLogService.getPager(getParamMap(), criteria, pager);
			List creditUsedList = pager.getList();
			model.addAttribute("creditUsedList", creditUsedList);
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
		return Global.TEMPLATE_MALL + PATH + "/member/creditUsedLog_list";
	}

	/**
	 * ajax加载更多申请授信记录
	 * @param request
	 * @return
	 */
	@RequestMapping(value="loadmore")
	public @ResponseBody
	Object ajaxLoadmore(HttpServletRequest request){
		Map<String,Object> result=new HashMap<String,Object>();
		String info="Ajax加载更多申请授信记录";
		setLogInfo(info);
		try{
			Criteria criteria=new Criteria();
            criteria.add(Restrictions.eq("cre.buyerId",getCurrentMember(request).getId()));
			criteria.add(Restrictions.order("cre.createDate","desc"));
			Pager pager = new Pager();
			pager.setOrderType("DESC");
			pager.setOrderBy("cre.createDate");
			pager.setPageSize(10);
			pager.setPageNumber(Integer.valueOf(request.getParameter("pageNumber")));
			pager=creditService.getPager(getParamMap(), criteria, pager);
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



}
