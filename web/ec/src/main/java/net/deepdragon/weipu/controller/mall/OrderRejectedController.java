package net.deepdragon.weipu.controller.mall;

import com.alibaba.fastjson.JSON;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.Area;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.AreaService;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.OrderGenerator;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.tools.UploadTools;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 订单页面
 */
@Controller(Global.APP_SIGN + Global.MALL + "OrderRejectedController")
@RequestMapping(Global.MALL_PATH + "/orderRejected")
public class OrderRejectedController extends BaseMallController {

	@Resource
	private CacheData cacheData;
	@Resource
	private ReceiverService receiverService;
	@Resource
	private OrderService orderService;
	@Resource
	private OrderItemService orderItemService;
	@Resource
	private GoodsService goodsService;
	@Resource
	private GoodsImagesService goodsImagesService;
	@Resource
	private ActivityDecreaseamountService activityDecreaseamountService;

	@Resource
	private GoodsRejectedService goodsRejectedService;
	@Resource
	private GoodsRejectedDetailService goodsRejectedDetailService;

	@Resource
	private OrderRefundImagesService orderRefundImagesService;

	@Resource
	private AreaService areaService;



	/**
	 * 20160630 dzz
	 * 退货或退款列表集合页面处理
	 * 1.根据订单号查询对应订单下的所有的订单明细与订单明细对应的商品信息
	 * 2.订单状态为会员(或采购商) "订单已确认收货" 之后的流程
	 * @param pager
	 * @param model
	 * @param request
	 * @param orderId		订单Id信息
	 * @return
	 */
	@RequestMapping(value = "listRejected/{orderId}")
	public String listRejected(Pager pager, Model model, HttpServletRequest request, @PathVariable String orderId) {
		String info = "加载部分退货订单明细列表信息";
		setLogInfo(info);
		try {
			Order order = null;
			List<OrderItem> orderItemList = null;
			if(!"all".equals(orderId)) {
				//根据订单Id获取订单信息
				order = orderService.get(getParamMap(), orderId);
				//根据订单orderSn 获取订单明细信息列表集合
				Criteria criteria = new Criteria();
				criteria.add(Restrictions.eq("orderSn", order.getOrderSn()));
				orderItemList = orderItemService.getList(getParamMap(), criteria);

				for(int i=0; i<orderItemList.size(); i++) {
					//根据订单明细Id查询对应的部分退货明细信息
					Criteria goodsRejectedDetailCriteria = new Criteria();
					goodsRejectedDetailCriteria.add(Restrictions.eq("orderItemId", orderItemList.get(i).getId()));
					goodsRejectedDetailCriteria.add(Restrictions.order("createDate", "desc"));
					//查询退货明细信息列表
					List<GoodsRejectedDetail> goodsRejectedDetailList = goodsRejectedDetailService.getList(getParamMap(), goodsRejectedDetailCriteria);

					if(goodsRejectedDetailList!=null && goodsRejectedDetailList.size()>0) {
						GoodsRejectedDetail goodsRejectedDetail = goodsRejectedDetailList.get(0);
						model.addAttribute("goodsRejectedDetail", goodsRejectedDetail);

						orderItemList.get(i).setRejectedGoodsQuantity(goodsRejectedDetail.getGoodsQuantity());
						orderItemList.get(i).setRejectedSn(goodsRejectedDetail.getRejectedSn());

						//查询退货信息最新状态记录
						Criteria goodsRejectedCriteria = new Criteria();
						goodsRejectedCriteria.add(Restrictions.eq("rejectedSn", goodsRejectedDetail.getRejectedSn()));
						goodsRejectedCriteria.add(Restrictions.order("createDate", "desc"));
						List<GoodsRejected> goodsRejectedList = goodsRejectedService.getList(getParamMap(), goodsRejectedCriteria);

						GoodsRejected goodsRejected = goodsRejectedList.get(0);
						model.addAttribute("goodsRejected", goodsRejected);

						orderItemList.get(i).setRejectedStatus(goodsRejected.getRejectedStatus());//设置对应订单明细部分退货状态
						orderItemList.get(i).setGoodsPriceCount(StringUtil.isNotEmpty(goodsRejected.getRejectedMoney()) ? goodsRejected.getRejectedMoney() : 0.0000);
					} else {
						orderItemList.get(i).setRejectedGoodsQuantity(0);
					}
				}
			} else if("all".equals(orderId)) {

				List<Order> distinctOrder = new ArrayList<Order>();
				Criteria distinctGpByOrderSn = new Criteria();
				distinctGpByOrderSn.add(Restrictions.group("orderSn"));
				distinctGpByOrderSn.add(Restrictions.order("createDate", "desc"));
				List<GoodsRejected> distinctRejectList = goodsRejectedService.getList(getParamMap(), distinctGpByOrderSn);
				if(distinctRejectList!=null && distinctRejectList.size()>0) {
					for(int i=0; i<distinctRejectList.size(); i++) {
						Order orderTemp = new Order();
						Criteria c = new Criteria();
						c.add(Restrictions.eq("orderSn", distinctRejectList.get(i).getOrderSn()));
						c.add(Restrictions.eq("orderStatus", "trade_finished"));
						c.add(Restrictions.order("createDate", "desc"));
						orderTemp = orderService.getList(getParamMap(), c).get(0);
						distinctOrder.add(orderTemp);
					}
					model.addAttribute("distinctOrderList", distinctOrder);
				}


				//根据订单号分组查询对应的退货单集合
				Criteria rejectGbRejectedSnCriteria = new Criteria();
				rejectGbRejectedSnCriteria.add(Restrictions.order("createDate", "desc"));
				List<GoodsRejected> rejectGbOrderSn = goodsRejectedService.getList(getParamMap(), rejectGbRejectedSnCriteria);
				model.addAttribute("goodsRejectedList", rejectGbOrderSn);

				//根据退货单号查询退货明细信息
				Criteria goodsRDCriteria = new Criteria();
				goodsRDCriteria.add(Restrictions.group("rejectedSn"));
				goodsRDCriteria.add(Restrictions.order("createDate", "desc"));
				List<GoodsRejectedDetail> goodsRejectDetailList = goodsRejectedDetailService.getList(getParamMap(), goodsRDCriteria);
				model.addAttribute("goodsRejectDetailList", goodsRejectDetailList);

				List<Order> orderList = new ArrayList<Order>(0);
				orderItemList = new ArrayList<OrderItem>(0);

				//map(orderSn, 每次最新)
				Map<String, List<GoodsRejected>> distinctGoodsRejected = new HashMap<String, List<GoodsRejected>>();

				for(int i=0; i<rejectGbOrderSn.size(); i++) {
					Order orderTemp = new Order();
					Criteria criteria = new Criteria();
					criteria.add(Restrictions.eq("orderSn", rejectGbOrderSn.get(i).getOrderSn()));
					criteria.add(Restrictions.eq("orderStatus", "trade_finished"));
					criteria.add(Restrictions.order("createDate", "desc"));
					orderTemp = orderService.getList(getParamMap(), criteria).get(0);

					orderTemp.setRejectedSn(rejectGbOrderSn.get(i).getRejectedSn());

					orderList.add(orderTemp);
				}

				for(int i=0; i<goodsRejectDetailList.size(); i++) {
					Criteria criteria = new Criteria();
					criteria.add(Restrictions.eq("id", goodsRejectDetailList.get(i).getOrderItemId()));
					List<OrderItem> tempItemList = orderItemService.getList(getParamMap(), criteria);
					if(tempItemList!=null && tempItemList.size()>0) {
						OrderItem orderItemTemp = tempItemList.get(0);
						orderItemTemp.setRejectedSn(goodsRejectDetailList.get(i).getRejectedSn());
						orderItemTemp.setRejectedGoodsQuantity(goodsRejectDetailList.get(i).getGoodsQuantity());

						Criteria rejectCriteria = new Criteria();
						rejectCriteria.add(Restrictions.eq("rejectedSn", goodsRejectDetailList.get(i).getRejectedSn()));
						List<GoodsRejected> tempRejectedList = goodsRejectedService.getList(getParamMap(), rejectCriteria);
						if(tempRejectedList!=null && tempRejectedList.size()>0) {
							if("done".equals(goodsRejectDetailList.get(i).getRemark())) {
								orderItemTemp.setRejectedStatus(tempRejectedList.get(0).getRejectedStatus()+"_"+goodsRejectDetailList.get(i).getRemark());
							} else {
								orderItemTemp.setRejectedStatus(tempRejectedList.get(0).getRejectedStatus());
							}
							orderItemTemp.setGoodsPriceCount(StringUtil.isNotEmpty(tempRejectedList.get(0).getRejectedMoney()) ? tempRejectedList.get(0).getRejectedMoney() : 0.0000);
						}
						orderItemList.add(orderItemTemp);
					}
				}

				model.addAttribute("orderList", orderList);
			}

			model.addAttribute("order", order);
			model.addAttribute("orderItemList", orderItemList);
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}

		if("all".equals(orderId)) {
			return Global.TEMPLATE_MALL + PATH +"/member/rejected_list";
		}
		return Global.TEMPLATE_MALL + PATH +"/member/order_rejected_list";
	}


	/**
	 * 20160630 dzz
	 * 确认订单部分退货
	 * @param pager
	 * @param model
	 * @param request
	 * @param orderId			订单Id信息
	 * @param orderItemId		确认部分退货订单明细商品
	 * @return
	 */
	@RequestMapping(value = "confirmRejected/{orderId}/{orderItemId}")
	public String confirmRejected(Pager pager, Model model, HttpServletRequest request, @PathVariable String orderId, @PathVariable String orderItemId) {
		String info = "加载需要部分退货的订单明细与商品信息信息";
		setLogInfo(info);

		String apply = request.getParameter("apply");//判断是否为重新申请
		if(StringUtil.isNotEmpty(apply) && "again".equals(apply)) {
			model.addAttribute("apply", apply);
		}

		try {
			//根据订单Id获取订单信息
			Order order = orderService.get(getParamMap(), orderId);
			//根据订单明细Id获取对应的需部分退货以及商品信息
			OrderItem orderItem = orderItemService.get(getParamMap(), orderItemId);
			Goods goods = goodsService.get(getParamMap(), orderItem.getGoodsId()); // 根据订单明细中商品Id获取商品信息;

			/*设置当前退货订单状态*/
			//根据订单明细Id查询对应的部分退货明细信息
			Criteria goodsRejectedDetailCriteria = new Criteria();
			goodsRejectedDetailCriteria.add(Restrictions.eq("orderItemId", orderItemId));
			goodsRejectedDetailCriteria.add(Restrictions.order("createDate", "desc"));
			List<GoodsRejectedDetail> goodsRejectedDetailList = goodsRejectedDetailService.getList(getParamMap(), goodsRejectedDetailCriteria);

			if(goodsRejectedDetailList!=null && goodsRejectedDetailList.size()>0) {
				GoodsRejectedDetail goodsRejectedDetail = goodsRejectedDetailList.get(0);

				//查询退货信息最新状态记录
				Criteria goodsRejectedCriteria = new Criteria();
				goodsRejectedCriteria.add(Restrictions.eq("rejectedSn", goodsRejectedDetail.getRejectedSn()));
				goodsRejectedCriteria.add(Restrictions.order("createDate", "desc"));
				List<GoodsRejected> goodsRejectedList = goodsRejectedService.getList(getParamMap(), goodsRejectedCriteria);

				GoodsRejected goodsRejected = goodsRejectedList.get(0);
				orderItem.setRejectedStatus(goodsRejected.getRejectedStatus());//设置对应订单明细部分退货状态

				model.addAttribute("goodsRejected", goodsRejected);
				model.addAttribute("goodsRejectedDetail", goodsRejectedDetail);
			}

			List<OrderItem> orderItemList = new ArrayList<OrderItem>(0);
			orderItemList.add(orderItem);
			processOrderItemGoods(model, getParamMap(), orderItemList);

			model.addAttribute("order", order);
			model.addAttribute("orderItem", orderItem);
			setPublicDate2Model( model );
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}
		return Global.TEMPLATE_MALL + PATH +"/member/order_rejected_check";
	}


	/**
	 * 20160701 dzz 添加备注信息
	 * 根据订单明细信息获取对应的商品信息以及活动信息
	 * @param model
	 * @param paramMap
	 * @param orderItemList
	 * @throws Exception
	 */
	private void processOrderItemGoods(Model model, Map<String,Object> paramMap, List<OrderItem> orderItemList) throws Exception {
		Criteria criteria;
		List<String> goodsIds = new ArrayList<String>();
		Map<String,Double> goodsIdPrice= new HashMap<String,Double>();
		Map<String,String> goodsActivicty = new HashMap<String,String>();
		for (OrderItem orderItem : orderItemList) {
			goodsIds.add(orderItem.getGoodsId());
			goodsIdPrice.put(orderItem.getGoodsId(),orderItem.getGoodsPrice());
			String tmj="";
			if(orderItem.getTableName() != null && orderItem.getTableName().equals("cx_activity_decreaseamount")) {
				ActivityDecreaseamount activityDecreaseamount = activityDecreaseamountService.get(getParamMap(), orderItem.getTablePkId());
				if(activityDecreaseamount!=null){
					tmj="满"+activityDecreaseamount.getTotalPrice()+"元减"+activityDecreaseamount.getDecreaseAmount()+"元";
				}
			}
			goodsActivicty.put(orderItem.getGoodsId(),tmj);
		}
		criteria = new Criteria();
		criteria.add(Restrictions.in("a.id", goodsIds));
		criteria.add(Restrictions.eq("status", 5));
		List<Goods> goodsList = goodsService.getList(paramMap, criteria);

		// 加载当前goods的图片
		if (goodsList != null && goodsList.size() > 0) {
			for (Goods goods : goodsList) {
				List<GoodsImages> goodsImagesList = goodsImagesService.findList(paramMap, "goodsId", goods.getId());
				if (goodsImagesList != null && goodsImagesList.size() > 0) {
					goods.setPic(goodsImagesList.get(0).getPic());
				}
				goods.setPrice(goodsIdPrice.get(goods.getId()));
				goods.setDiscount(goodsActivicty.get(goods.getId()));
			}
		}

		model.addAttribute("goodsList", goodsList);
		model.addAttribute("orderItemList", orderItemList);
		model.addAttribute("orderStatusMapping", getOrderStatusMapping());
		model.addAttribute("services", cacheData.getServices(getParamMap()));
	}
	private Map<String, String> getOrderStatusMapping() {
		Map<String, String> map = new LinkedHashMap<String, String>();
		map.put("", "全部状态");
		map.put("unconfirm", "未确认");
		map.put("wait_buyer_pay", "等待付款");
		map.put("wait_seller_send_goods", "等待发货");
		map.put("wait_buyer_confirm_goods", "等待收货");
		map.put("trade_finished", "交易完成");
		map.put("cancel", "已取消");
		map.put("invalid", "已作废");
		map.put("deleted", "已删除");
		map.put("refunding", "退款中...");
        /*map.put("refund_part", "部分退款");
        map.put("refund_success", "全额退款");
        map.put("reship_part", "部分退货");*/
        /*map.put("reship_success", "已退货");*/
		/*map.put("refund_success", "退款完成");*/
		/**暂时去掉退货完成状态 Auth:zhangqiang Time:2015-09-24 09:59:35 Start */
//		map.put("reship_success", "退款完成");
		/**暂时去掉退货完成状态 Auth:zhangqiang Time:2015-09-24 09:59:35 End */
		/*map.put("order_item_exception","订单中商品已下架或者停售");*/

		return map;
	}



	@RequestMapping("submitGoodsReject")
	@ResponseBody
	public Object submitGoodsReject(HttpServletRequest request) {
		String info = "部分退货订单信息提交";
		setLogInfo(info);
		Map<String,Object> resultMap = new HashMap<String, Object>();

		String rejectedSn=""; //退货单号

		//获取相关变量信息(判断部分退货订单是否是重复申请)
		//备注: 如果用户再次申请部分退货, 重新生成新的退货单(即新的退货单号)以及退货单明细等信息
		String apply = request.getParameter("apply");//判断是否为重新申请
		String oldRejectedSn = request.getParameter("rejectedSn");
		if(StringUtil.isNotEmpty(apply) && "again".equals(apply)) {
			rejectedSn = OrderGenerator.generator();
			Criteria oldGoodsRejectDetailC = new Criteria();
			oldGoodsRejectDetailC.add(Restrictions.eq("rejectedSn", oldRejectedSn));
			GoodsRejectedDetail oldEntity = null;
			try {
				oldEntity = goodsRejectedDetailService.getList(getParamMap(), oldGoodsRejectDetailC).get(0);
				oldEntity.setRemark("done");
				goodsRejectedDetailService.update(getParamMap(), oldEntity);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {
			rejectedSn = StringUtil.isNotEmpty(request.getParameter("rejectedSn")) ? request.getParameter("rejectedSn"): OrderGenerator.generator();
		}

		GoodsRejected goodsRejected = new GoodsRejected(); //退货主表对象实例化
		GoodsRejectedDetail goodsRejectedDetail = new GoodsRejectedDetail();//退货明细表实例化
		try {
			//waitBusinessApprove: 等待商家审批
			goodsRejected = goodsRejectedAssemble(request, goodsRejected, rejectedSn, "waitBusinessApprove");//组装退货主表对象
			goodsRejectedDetail = goodsRejectedDetailAssemble(request, goodsRejectedDetail, rejectedSn);//组装退货明细表对象

			goodsRejectedService.saveGoodsRejected(getParamMap(), goodsRejected);
			//保存部分退货明细信息
			goodsRejectedDetailService.saveRejectedDetail(getParamMap(), goodsRejectedDetail);

			resultMap.put(STATUS, SUCCESS);
			resultMap.put(MESSAGE, "["+rejectedSn+"]退货申请成功");

		} catch(Exception e) {
			resultMap.put(STATUS, ERROR);
			resultMap.put(MESSAGE, "保存退货申请异常!");
			logger.error(info + "时，发生异常", e);
		}
		return resultMap;
	}


	/**
	 * 20160707 dzz
	 * 进入用户提交退货单凭证页面
	 * @param request
	 * @param rejectedSn		退货单号
	 * @return
	 */
	@RequestMapping("confirmRejectedVoucher/{orderId}/{rejectedSn}")
	public String confirmRejectedVoucher(Pager pager, Model model, HttpServletRequest request, @PathVariable String orderId,@PathVariable String rejectedSn) {
		String info = "加载退货单提交凭证页面";
		setLogInfo(info);

		try {
			//根据退货单号获取当前退货单最新状态数据
			//查询退货信息最新状态记录
			GoodsRejected goodsRejectedValidObj = null;
			Criteria goodsRejectedCriteria = new Criteria();
			goodsRejectedCriteria.add(Restrictions.eq("rejectedSn", rejectedSn));
			goodsRejectedCriteria.add(Restrictions.order("createDate", "desc"));
			List<GoodsRejected> goodsRejectedList = goodsRejectedService.getList(getParamMap(), goodsRejectedCriteria);
			if(goodsRejectedList!=null && goodsRejectedList.size()>0) {
				goodsRejectedValidObj = goodsRejectedList.get(0);
				model.addAttribute("goodsRejected", goodsRejectedValidObj);
			}

			GoodsRejectedDetail goodsRejectedDetailValidObj = null;
			Criteria goodsRejectedDetailCriteria = new Criteria();
			goodsRejectedDetailCriteria.add(Restrictions.eq("rejectedSn", rejectedSn));
			goodsRejectedDetailCriteria.add(Restrictions.order("createDate", "desc"));
			List<GoodsRejectedDetail> goodsRejectedDetailList = goodsRejectedDetailService.getList(getParamMap(), goodsRejectedDetailCriteria);
			if(goodsRejectedDetailList!=null && goodsRejectedDetailList.size()>0) {
				goodsRejectedDetailValidObj = goodsRejectedDetailList.get(0);
				model.addAttribute("goodsRejectedDetail", goodsRejectedDetailValidObj);
			}


			//根据订单Id获取订单信息
			Order order = orderService.get(getParamMap(), orderId);
			//根据订单明细Id获取对应的需部分退货以及商品信息
			OrderItem orderItem = orderItemService.get(getParamMap(), goodsRejectedDetailValidObj.getOrderItemId());


			model.addAttribute("order", order);
			model.addAttribute("orderItem", orderItem);
			setPublicDate2Model( model );
		} catch(Exception e) {
			logger.error(info + "时，发生异常", e);
		}

		return Global.TEMPLATE_MALL + PATH +"/member/order_rejected_check_address";
	}


	@RequestMapping("submitGoodsRejectAddr/{rejectedSn}")
	@ResponseBody
	public Object submitGoodsRejectAddr(HttpServletRequest request, @PathVariable String rejectedSn) {
		String info = "部分退货单凭证信息提交";
		setLogInfo(info);
		Map<String,Object> resultMap = new HashMap<String, Object>();

		try {
			//根据退货单号获取当前退货单最新状态数据
			//查询退货信息最新状态记录
			GoodsRejected goodsRejectedValidObj = null;
			Criteria goodsRejectedCriteria = new Criteria();
			goodsRejectedCriteria.add(Restrictions.eq("rejectedSn", rejectedSn));
			goodsRejectedCriteria.add(Restrictions.order("createDate", "desc"));
			List<GoodsRejected> goodsRejectedList = goodsRejectedService.getList(getParamMap(), goodsRejectedCriteria);
			if(goodsRejectedList!=null && goodsRejectedList.size()>0) {
				goodsRejectedValidObj = goodsRejectedList.get(0);
			}

			GoodsRejectedDetail goodsRejectedDetailValidObj = null;
			Criteria goodsRejectedDetailCriteria = new Criteria();
			goodsRejectedDetailCriteria.add(Restrictions.eq("rejectedSn", rejectedSn));
			goodsRejectedDetailCriteria.add(Restrictions.order("createDate", "desc"));
			List<GoodsRejectedDetail> goodsRejectedDetailList = goodsRejectedDetailService.getList(getParamMap(), goodsRejectedDetailCriteria);
			if(goodsRejectedDetailList!=null && goodsRejectedDetailList.size()>0) {
				goodsRejectedDetailValidObj = goodsRejectedDetailList.get(0);
			}

			// waitBusinessConfirmReceipt:  等待商家确认收货
			GoodsRejected goodsRejected = goodsRejectedAssemble(request, goodsRejectedValidObj!=null ? goodsRejectedValidObj : new GoodsRejected(), rejectedSn, "waitMemberSendGoods");//组装退货主表对象
			GoodsRejectedDetail goodsRejectedDetail = goodsRejectedDetailAssemble(request, goodsRejectedDetailValidObj!=null ? goodsRejectedDetailValidObj : new GoodsRejectedDetail(), rejectedSn);//组装退货明细表对象

			goodsRejected.setRejectedMoney(goodsRejectedList.get(0).getRejectedMoney());

			if(StringUtil.isEmpty(goodsRejected.getRejectedReason())) {
				if(goodsRejectedList!=null && goodsRejectedList.size()>0) {
					goodsRejected.setRejectedReason(goodsRejectedList.get(0).getRejectedReason());
				}
			}
			if(StringUtil.isEmpty(goodsRejectedDetail.getRejectedReason())) {
				if(goodsRejectedDetailList!=null && goodsRejectedDetailList.size()>0) {
					goodsRejectedDetail.setRejectedReason(goodsRejectedDetailList.get(0).getRejectedReason());
				}
			}

			goodsRejectedService.update(getParamMap(), goodsRejected);
			//保存部分退货明细信息
			goodsRejectedDetailService.update(getParamMap(), goodsRejectedDetail);

			resultMap.put(STATUS, SUCCESS);
			resultMap.put(MESSAGE, "["+rejectedSn+"]退货物流凭证上传成功");

		} catch(Exception e) {
			resultMap.put(STATUS, ERROR);
			resultMap.put(MESSAGE, "保存退货物流凭证异常!");
			logger.error(info + "时，发生异常", e);
		}
		return resultMap;
	}


	/**
	 * 20160707 dzz
	 * 组装退货单主表
	 * @param request
	 * @param goodsRejected		需组装对象
	 * @param rejectedSn			退货单号
	 * @param rejectedStatus		退货状态
	 * @return
	 */
	private GoodsRejected goodsRejectedAssemble(HttpServletRequest request, GoodsRejected goodsRejected, String rejectedSn, String rejectedStatus) {
		//获取相关变量信息
		String orderSn = request.getParameter("orderSn");//订单号
		String memberId = getCurrentMember(request).getId(); //会员Id
		String shopId = request.getParameter("shopId"); //商家,店铺Id
		String rejectedReason = request.getParameter("rejectedReason"); //退货原因
		String deliveryAddress = request.getParameter("deliveryAddress"); //收货地址
		if(StringUtil.isNotEmpty(deliveryAddress)) {
			try {
				List<Area> area = areaService.findList(getParamMap(), "path", deliveryAddress);
				deliveryAddress = (area!=null && area.size()>0) ? area.get(0).getFullName() : "";
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			deliveryAddress="";
		}
		String deliveryAddressDetail = request.getParameter("deliveryAddressDetail"); //收货地址详细信息
		String logisticsName = request.getParameter("logisticsName"); //物流名称
		String logisticsNo = request.getParameter("logisticsNo"); //物流单号
		String shippingInstructions = request.getParameter("shippingInstructions"); //发货说明
		String file = request.getParameter("file"); //发货凭证1
		try {
			//保存图片功能
			if("waitMemberSendGoods".equals(rejectedStatus)) {
				List<String[]> imagelist = UploadTools.upload(request);//获取图片信息列表集合
				if(imagelist!=null && imagelist.size()>0) {
					for(int i=0; i<imagelist.size(); i++) {
						String results[] = imagelist.get(i);
						if (!results[0].equals("0")) {
							String url= results[0] + "/" + results[1];
							if(i==0) {
								goodsRejected.setShippingVoucher1(url);
							} else if(i==1) {
								goodsRejected.setShippingVoucher2(url);
							} else if(i==2) {
								goodsRejected.setShippingVoucher3(url);
							}
						}
					}
				}
				rejectedStatus = "waitBusinessConfirmReceipt"; //等待商家确认收货
				goodsRejected.setShippingTime(new Date());//发货时间
			}

			logisticsName = URLDecoder.decode(logisticsName, "utf-8");
			rejectedReason = URLDecoder.decode(rejectedReason, "utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

//		goodsRejected.setRejectedStatus("waitBusinessApprove");//等待商家审批
		goodsRejected.setRejectedStatus(rejectedStatus);//等待商家审批
		goodsRejected.setPlatform(getPlatform());
		goodsRejected.setRejectedSn(rejectedSn);
		goodsRejected.setOrderSn(orderSn);
		goodsRejected.setMemberId(memberId);
		goodsRejected.setShopId(shopId);
		goodsRejected.setRejectedReason(rejectedReason);
		goodsRejected.setDeliveryAddress(deliveryAddress+deliveryAddressDetail);
		goodsRejected.setLogisticsName(logisticsName);
		goodsRejected.setLogisticsNo(logisticsNo);
		goodsRejected.setShippingInstructions(shippingInstructions);
		/*goodsRejected.setShippingVoucher1(shippingVoucher1);
		goodsRejected.setShippingVoucher2(shippingVoucher2);
		goodsRejected.setShippingVoucher3(shippingVoucher3);*/
		goodsRejected.setCreateUser(getCurrentMember(request).getUserName());
		goodsRejected.setCreateDate(new Date());


		if("waitBusinessApprove".equals(rejectedStatus)) { //等待商家审批
			String  orderItemId = request.getParameter("orderItemId");
			String  goodsQuantity = request.getParameter("goodsQuantity");
			BigDecimal orderItemPrice = new BigDecimal("0.0000");//购买商品是的商品价格
			BigDecimal refundMoney = new BigDecimal("0.0000"); //计算部分退货应退款金额
			try {
				OrderItem orderItem = orderItemService.get(getParamMap(), orderItemId);
				orderItemPrice = new BigDecimal(orderItem.getGoodsPrice());
				refundMoney = orderItemPrice.multiply(new BigDecimal(goodsQuantity));
				goodsRejected.setRejectedMoney(refundMoney.doubleValue());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return goodsRejected;
	}

	/**
	 * 20160707 dzz
	 * 组装退货单明细表对象
	 * @param request
	 * @param goodsRejectedDetail		需组装对象
	 * @param rejectedSn					退货单号
	 * @return
	 */
	private GoodsRejectedDetail goodsRejectedDetailAssemble(HttpServletRequest request, GoodsRejectedDetail goodsRejectedDetail, String rejectedSn) {
		//获取相关变量信息
		String  orderItemId = request.getParameter("orderItemId");
		String  goodsId = request.getParameter("goodsId");
		String  goodsQuantity = request.getParameter("goodsQuantity");
		String  rejectedMoney = request.getParameter("rejectedMoney");
		String  rejectedReason = request.getParameter("rejectedReason");

		BigDecimal orderItemPrice = new BigDecimal("0.0000");//购买商品是的商品价格
		BigDecimal refundMoney = new BigDecimal("0.0000"); //计算部分退货应退款金额
//		BigDecimal orderItemQuantity = new BigDecimal("0");
		try {
			OrderItem orderItem = orderItemService.get(getParamMap(), orderItemId);
			orderItemPrice = new BigDecimal(orderItem.getGoodsPrice());
//			orderItemQuantity = new BigDecimal(orderItem.getQuantity());

			rejectedReason = URLDecoder.decode(rejectedReason, "utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		//取消此公式(计算公式: 退货商品价格 * 退货商品数量)
//		refundMoney = orderItemPrice.multiply(orderItemQuantity.subtract(new BigDecimal(goodsQuantity)));
		refundMoney = orderItemPrice.multiply(new BigDecimal(goodsQuantity));

		goodsRejectedDetail.setRejectedSn(rejectedSn);
		goodsRejectedDetail.setOrderItemId(orderItemId);
		goodsRejectedDetail.setGoodsId(goodsId);
//		goodsRejectedDetail.setGoodsQuantity(orderItemQuantity.subtract(new BigDecimal(goodsQuantity)).intValue()); //取消此公式(退货商品数量 = 订单购买商品数量 - 当前退货商品购买数量)
		goodsRejectedDetail.setGoodsQuantity(new BigDecimal(goodsQuantity).intValue()); //退货商品数量
		goodsRejectedDetail.setRejectedMoney(refundMoney.doubleValue());
		goodsRejectedDetail.setRejectedReason(rejectedReason);

		return goodsRejectedDetail;
	}


	/**
	 * 20160705 dzz
	 * 根据退货单号查询日志信息
	 * @param request
	 * @param rejectedSn
	 * @return
	 */
	@RequestMapping("getRejectedDetailLog/{rejectedSn}")
	@ResponseBody
	public Object getRejectedDetailLog(HttpServletRequest request, @PathVariable String rejectedSn) {
		String info = "查询退货日志信息";
		setLogInfo(info);
		Map<String,Object> resultMap = new HashMap<String, Object>();

		try {
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("rejectedSn", rejectedSn));
			criteria.add(Restrictions.order("createDate", "desc"));
			List<GoodsRejected> goodsRejectedList = goodsRejectedService.getList(getParamMap(), criteria);
			if(goodsRejectedList!=null && goodsRejectedList.size()>0) {
				for(int i=0; i<goodsRejectedList.size(); i++) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					goodsRejectedList.get(i).setCreateDateFormatter(sdf.format(goodsRejectedList.get(i).getCreateDate()));
				}
				resultMap.put("goodsRejectedLogs", goodsRejectedList);
				resultMap.put(STATUS, SUCCESS);
				resultMap.put(MESSAGE, "退货单["+rejectedSn+"]退货详情");
			} else {
				resultMap.put(STATUS, ERROR);
				resultMap.put(MESSAGE, "暂无退货单详情信息");
			}
		} catch (Exception e) {
			resultMap.put(STATUS, ERROR);
			resultMap.put(MESSAGE, "查询退货日志信息异常!");
			logger.error(info + "时，发生异常", e);
		}

		return resultMap;
	}

}
