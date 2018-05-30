package net.deepdragon.weipu.controller.mall;

import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.Area;
import net.deepdragon.entity.weipu.Buyer;
import net.deepdragon.entity.weipu.BuyerReceiver;
import net.deepdragon.entity.weipu.Receiver;
import net.deepdragon.service.AreaService;
import net.deepdragon.service.weipu.BuyerReceiverService;
import net.deepdragon.service.weipu.MemberService;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 会员相关
 */
@Controller(Global.APP_SIGN + Global.MALL + "ReceiverController")
@RequestMapping(Global.MALL_PATH + "/receiver")
public class ReceiverController extends BaseMallController {

	@Resource
	private MemberService memberService;
	@Resource
	private BuyerReceiverService buyerReceiverService;
	@Resource
	private AreaService areaService;

	@RequestMapping(value = "/save", method = { RequestMethod.POST })
	public @ResponseBody
	Object save(BuyerReceiver receiver, HttpServletRequest request) {
		String info = "保存收货地址信息(" + receiver + ")";
		setLogInfo(info);
		logger.debug(info);
		//String whichclient=request.getParameter(Global.WHICHCLIENT);
		Buyer currentMember = getCurrentMember(request);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			/** 保存前 将其他地址设置为非默认 hks 2015-11-13 10:15:42 add  start**/
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("re.buyerId", currentMember.getId()));
			List<BuyerReceiver> receiverList = buyerReceiverService.getList(getParamMap(), criteria);
			for(BuyerReceiver receiver1:receiverList){
				if(receiver1.getIsDefault()==1){
					receiver1.setIsDefault(0);
					buyerReceiverService.update(getParamMap(), receiver1);
				}
			}
			/** 保存前 将其他地址设置为非默认 hks 2015-11-13 10:15:42 add  end**/


			receiver.setCreateDate(new Date());
			receiver.setCreateUser(getCurrentMember(request).getCreateUser());
			receiver.setTenantId(getTenantId());
			receiver.setBuyerId(getCurrentMember(request).getId());
			receiver.setIsDelete(1);
			/** 设置保存的地址为默认 hks 2015-11-13 10:15:42 modify  start**/
//			if (receiver.getIsDefault() == null) {
				receiver.setIsDefault(1);
//			}
			/** 设置保存的地址为默认 hks 2015-11-13 10:15:42 modify  end**/
			receiver=buyerReceiverService.save(getParamMap(), receiver);
			Thread.sleep(10);//数据库同步时，有延时
			receiver=buyerReceiverService.get(getParamMap(), receiver.getId());
			
			result.put(STATUS, SUCCESS);
			result.put("receiver", receiver);
			result.put(MESSAGE, "");
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "保存失败，请联系管理员。");
		}
		
		return result;
	}

	/**
	 * 页面跳转 廖汉银 2015-10-27
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toUpdate/{type}")
	public String toUpdate(@PathVariable String type,Model model,HttpServletRequest request){
		//String whichclient = request.getParameter(Global.WHICHCLIENT);
		//String type=request.getParameter("type");
		String info = "会员收货地址页面跳转";
		setLogInfo(info);
		logger.debug(info);


		StringBuffer areaJson=new StringBuffer("[");
		try {
			Criteria criteriaParent=new Criteria();
			criteriaParent.add(Restrictions.isNull("parentId"));
			List<Area> areaParent=areaService.getList(this.getParamMap(),criteriaParent);
			for(int i=0;i<areaParent.size();i++){
				Area area=areaParent.get(i);
				areaJson.append("{value:'"+area.getPath()+"',text:'"+area.getName()+"'");
				Criteria criteriaChildren=new Criteria();
				criteriaChildren.add(Restrictions.eq("parentId", area.getId()));
				List<Area> areaChildren=areaService.getList(this.getParamMap(),criteriaChildren);
				if(areaChildren.size()>0){
					areaJson.append(",children:[");
					for (int j=0;j<areaChildren.size();j++){
						Area areaCh=areaChildren.get(j);
						areaJson.append("{value:'"+areaCh.getPath()+"',text:'"+areaCh.getName()+"'}");
						areaJson.append(j==areaChildren.size()-1?"]}":",");
					}
				}else{
					areaJson.append("}");
				}
				areaJson.append(i==areaParent.size()-1?"]":",");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		String to=request.getParameter("to");
		if(StringUtil.isNotEmpty(to)){
			model.addAttribute("to",StringUtil.isNotEmpty(to) ? to:"");//从哪里请求的,会员中心为Null，app端订单确认处为:ordercheck
			model.addAttribute("o",request.getParameter("o"));
			model.addAttribute("paymentId",request.getParameter("paymentId"));
			model.addAttribute("deliveryId",request.getParameter("deliveryId"));
		}

		/*String o=request.getParameter("o");
		model.addAttribute("o",o == null ? "":o);//会员中心请求过来为Null，app端订单确认处不为null*/

		model.addAttribute("cityData", areaJson);

		if(!type.equals("add")){
			String receiverId=request.getParameter("receiverId");
			try {
				BuyerReceiver receiver = buyerReceiverService.get(this.getParamMap(), receiverId);
				Area area = areaService.get(this.getParamMap(), receiver.getAreaId());
				model.addAttribute("receiver",receiver);
				model.addAttribute("fullName", area.getFullName());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return Global.TEMPLATE_APP + PATH + "/member/receiver";
	}

	@RequestMapping(value = "/delete", method = { RequestMethod.POST })
	public @ResponseBody
	Object delete(String receiverId, HttpServletRequest request) {
		String info = "收货地址信息(" + receiverId + ")";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			buyerReceiverService.delete(getParamMap(), receiverId);
			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "");
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "删除失败，请联系管理员。");
		}
		return result;
	}

	@RequestMapping(value = "/edit", method = { RequestMethod.POST })
	public @ResponseBody
	Object edit(String receiverId, HttpServletRequest request) {
		String info = "修改收货地址信息(" + receiverId + ")";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			BuyerReceiver receiver = buyerReceiverService.get(getParamMap(), receiverId);
			result.put("receiver", receiver);
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "删除失败，请联系管理员。");
		}
		return result;
	}
	
	@RequestMapping(value = "/update", method = { RequestMethod.POST })
	public @ResponseBody
	Object update(HttpServletRequest request, BuyerReceiver receiver) {
		String info = "保存修改后的收货人地址信息";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			receiver.setModifyUser(getCurrentMember(request).getUserName());
			receiver.setModifyDate(new Date());

			buyerReceiverService.update(getParamMap(), receiver);

			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "");
			result.put("receiver", buyerReceiverService.get(getParamMap(), receiver.getId()));
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "修改失败，请联系管理员。");
		}
		return result;
	}

	/** 添加设置默认   hks 2015-11-06 add start **/
	@RequestMapping(value = "/setDefault", method = { RequestMethod.POST })
	public @ResponseBody
	Object setDefault(String receiverId, HttpServletRequest request) {
		String info = "设置默认收货地址信息(" + receiverId + ")";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		Buyer currentMember = getCurrentMember(request);
		try {

			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("re.buyerId", currentMember.getId()));
			List<BuyerReceiver> receiverList = buyerReceiverService.getList(getParamMap(), criteria);
			for(BuyerReceiver receiver:receiverList){
				if(receiver.getIsDefault()==1){
					receiver.setIsDefault(0);
					buyerReceiverService.update(getParamMap(), receiver);
				}
			}
			BuyerReceiver receiver = buyerReceiverService.get(getParamMap(), receiverId);
			receiver.setIsDefault(1);
			buyerReceiverService.update(getParamMap(), receiver);
			result.put("receiver", receiver);
			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "");
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "设置默认收货地址发生异常，请联系管理员。");
		}
		return result;
	}
	/** 添加设置默认   hks 2015-11-06 add end **/
	
	@RequestMapping(value = "/info", method = { RequestMethod.POST })
	public @ResponseBody
	Object info(String receiverId) {
		String info = "获取收货地址信息(" + receiverId + ")";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			BuyerReceiver receiver = buyerReceiverService.get(getParamMap(), receiverId);
			result.put(STATUS, SUCCESS);
			result.put("receiver", receiver);
			result.put(MESSAGE, "");
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "获取收获地址信息失败，请联系管理员。");
		}
		return result;
	}
	
}
