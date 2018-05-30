package net.deepdragon.service.weipu.impl;

import com.alibaba.fastjson.JSON;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.constant.Shared;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.SystemSetDao;
import net.deepdragon.dao.weipu.*;
import net.deepdragon.entity.SystemSet;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.weipu.OrderService;
import net.deepdragon.util.*;
import net.deepdragon.weipu.bean.PayType;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

@Service(Weipu.SIGN + "OrderServiceImpl")
public class OrderServiceImpl extends BaseServiceImpl<Order, String> implements OrderService {

	@Resource(name = Weipu.SIGN + "OrderDaoImpl")
	private OrderDao orderDao;
	@Resource(name = Weipu.SIGN + "OrderItemDaoImpl")
	private OrderItemDao orderItemDao;
	@Resource(name = Weipu.SIGN + "GoodsDaoImpl")
	private GoodsDao goodsDao;
	@Resource(name = Weipu.SIGN + "CartItemDaoImpl")
	private CartItemDao cartItemDao;
	@Resource(name = Weipu.SIGN + "OrderLogDaoImpl")
	private OrderLogDao orderLogDao;
	@Resource(name = Weipu.SIGN + "OrderDistributionDaoImpl")
	private OrderDistributionDao orderDistributionDao;
	@Resource(name = Weipu.SIGN + "FlashSaleDaoImpl")
	private FlashSaleDao flashSaleDao;
	@Resource(name = Weipu.SIGN + "FlashSalePlandetailDaoImpl")
	private FlashSalePlandetailDao flashSalePlandetailDao;
	@Resource(name = Weipu.SIGN + "FlashMemberDaoImpl")
	private FlashMemberDao flashMemberDao;
	@Resource(name = Weipu.SIGN + "ActivityShopDaoImpl")
	private ActivityShopDao activityShopDao;
	@Resource(name = Weipu.SIGN + "ActivityMemberDaoImpl")
	private ActivityMemberDao activityMemberDao;
	@Resource(name = Weipu.SIGN + "GroupSaleDaoImpl")
	private GroupSaleDao groupSaleDao;
	@Resource(name = Weipu.SIGN + "DeliveryManDaoImpl")
	private DeliveryManDao deliveryManDao;
	@Resource(name = Shared.SIGN + "SystemSetDaoImpl")
	private SystemSetDao systemSetDao;
	@Resource(name = Weipu.SIGN + "AccountDaoImpl")
	private AccountDao accountDao;
    @Resource(name = Weipu.SIGN + "AccountLogDaoImpl")
    private AccountLogDao accountLogDao;
	@Resource(name = Weipu.SIGN + "GhjRedenvelopGrandlogDaoImpl")
	private GhjRedenvelopGrandlogDao redenvelopGrandlogDao;
	@Resource(name = Weipu.SIGN + "GhjRedenvelopRuleDaoImpl")
	private GhjRedenvelopRuleDao redenvelopRuleDao;
	@Resource(name = Weipu.SIGN + "GhjRedenvelopRangerebateruleDaoImpl")
	private GhjRedenvelopRangerebateruleDao  redenvelopRangerebateruleDao;
	@Resource(name = Weipu.SIGN + "GhjRedenvelopAccesslogDaoImpl")
	private GhjRedenvelopAccesslogDao redenvelopAccesslogDao;
//	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"QuotationDaoImpl")
//	private QuotationDao quotationDao;

	@Override
	public BaseDao<Order, String> getBaseDao() {
		return this.orderDao;
	}

	/**
	 *
 	 * @param paramMap
	 *            租户Id
	 * @param orders
	 *            订单相关的数据map
	 * @param cartItemIds
	 * 				购物车ID集合
	 * @return
	 */
	public List<Order> saveOrder(Map<String, Object> paramMap, List<Map<String, Object>> orders,List<String> cartItemIds,boolean isEnableConfirm) {
		List<Order> list = new ArrayList<Order>(0);
		for(Map<String, Object> map : orders ){
			list.add(saveOrder(paramMap, map, isEnableConfirm));
		}

		/** 删除已经购买的购物车中的数据 TianYu  2015-12-14 18:18:48 Start */
		if(cartItemIds != null && cartItemIds.size() > 0){
			this.cartItemDao.deleteByIds(paramMap,cartItemIds);
		}
		/** 删除已经购买的购物车中的数据 TianYu  2015-12-14 18:18:48 End */

		return list;
	}
	/**
	 * 保存订单信息
	 *
	 * @param paramMap
	 *            租户Id
	 * @param pMap
	 *            订单相关的数据map
	 *
	 * @return 订单对象
	 * @throws Exception
	 */
	public Order saveOrder(Map<String, Object> paramMap, Map<String, Object> pMap, boolean isEnableConfirm) {

		String dataFrom = (String)pMap.get("dataFrom");
		Order order = JSON.parseObject(JSON.toJSONString(pMap.get("order")), Order.class);
		String orderSn = OrderGenerator.generator();
		order.setOrderSn(orderSn);
//		order.setCreateUser(pMap.get("createUser").toString());
		List<OrderItem> orderItems = new ArrayList<OrderItem>();

//		double goodsTotalPrice = 0;


		List<Map<String, Object>> orderItemMapList = JSON.parseObject(JSON.toJSONString(pMap.get("orderItems")), List.class);
		for (Map<String, Object> map : orderItemMapList) {
			OrderItem item = JSON.parseObject(JSON.toJSONString(map), OrderItem.class);
			item.setOrderSn(orderSn);
			/* 下单时  商品价格调整   hks 2015-10-22 modify start*/

			if("1".equals(dataFrom)){//EC购物车提交
				Goods goods = goodsDao.getGoodsByBatchType(paramMap, item.getGoodsId());
				item.setGoodsPrice(goods.getPrice());
				item.setGoodsName(goods.getName());
				item.setUnits(goods.getUnit());
				item.setGoodsPriceCount(goods.getPrice() * item.getQuantity());
			}else if("2".equals(dataFrom)){//BEC购物车提交。     当"3".equals(dataFrom) 商品价格不用重新赋值
//				List<B2BGoodsPrice> batchPrices = goodsDao.getGoodsTradePrice(paramMap, item.getGoodsId(), item.getQuantity(), true);
				Goods goods = goodsDao.getGoodsByBatchType(paramMap, item.getGoodsId());

				/*if(batchPrices != null && batchPrices.size() > 0){
					item.setGoodsPrice(Double.parseDouble(batchPrices.get(0).getBatchPrice()));
				}else{
					*//******添加会员价判断 TianYu  2016-05-19 10:12:15 ****//*
					if( "yes".equalsIgnoreCase( order.getIsMemberPrice() )){
						item.setGoodsPrice(goods.getDefaultPrice());
					}else{
						item.setGoodsPrice(goods.getPrice());
					}
				}*/
				item.setGoodsName(goods.getName());
				item.setUnits(goods.getUnit());
				item.setGoodsPriceCount(item.getGoodsPrice() * item.getQuantity());
			}else if("4".equals(dataFrom)){//众筹订单
				item.setGoodsType(1);//0_普通商品，1_众筹商品
			}
			/* 下单时  商品价格调整   hks 2015-10-22 modify end*/

			orderItems.add(item);
		}
		// 设置订单状态、支付状态、配送状态
        if ("offline".equals(order.getPayType())) {// 货到付款
			if( isEnableConfirm ) {//开启订单确认功能，状态为 待确认
            	order.setOrderStatus(Order.OrderStatus.unconfirm);
			}else{
           		order.setOrderStatus(Order.OrderStatus.wait_seller_send_goods); // 未开启订单确认，状态更新为等待卖家发货
			}
        } else if ("online".equals(order.getPayType())) {
			if( isEnableConfirm ) {//开启订单确认功能，状态为 待确认
				order.setOrderStatus(Order.OrderStatus.unconfirm);
			}else{
				order.setOrderStatus(Order.OrderStatus.wait_seller_send_goods); // 未开启订单确认，状态更新为等待卖家发货
			}
        }else if("offlinepay".equals(order.getPayType())){
			if( isEnableConfirm ) {//开启订单确认功能，状态为 待确认
				order.setOrderStatus(Order.OrderStatus.unconfirm);
			}else{
				order.setOrderStatus(Order.OrderStatus.wait_seller_send_goods); // 未开启订单确认，状态更新为等待卖家发货
			}
		}
        if("4".equals(dataFrom)){//众筹订单
            order.setOrderType(1);//0_一般订单，1_众筹订单

			order.setOrderStatus( Order.OrderStatus.wait_buyer_pay_deposit );

            //冻结部分保证金
            /*Account acct = JSON.parseObject(JSON.toJSONString(pMap.get("account")), Account.class);
            double bond = ( acct.getAccountBlock() == null ? 0.0 :acct.getAccountBlock() );
			Account account = accountDao.get(paramMap, acct.getId(),true);

            AccountLog accountLog = JSON.parseObject(JSON.toJSONString(pMap.get("accountLog")), AccountLog.class);
            //accountLog.setId(OrderGenerator.generator());
            //accountLog.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
            //accountLog.setPlatform(Integer.valueOf(paramMap.get(Constant.PLATFORM_KEY).toString()));
            accountLog.setAccountId(account.getId());
            accountLog.setOrderSn(order.getOrderSn());
            accountLog.setPayMethod(1);//交易类型(0:充值 1:冻结 2：解冻 3：提现)
            accountLog.setAccount(bond);
            accountLog.setFeeAccount(0.0);//手续费
            accountLog.setOldAccountTotal(account.getAccountTotal());
            accountLog.setOldAccountBlock(account.getAccountBlock());
			accountLog.setStatus(1);
            accountLog.setCreateDate(DateUtil.getCalendar().getTime());
            if( 0.0 != bond ){
				acct.setAccountTotal(0.0);
                accountDao.update(paramMap, acct, true);
            }

            accountLogDao.save(paramMap, accountLog, true);*/

        }
		order.setPaymentStatus(Order.PaymentStatus.unpaid);
		order.setShippingStatus(Order.ShippingStatus.unshipped);
		order = orderDao.save(paramMap, order); // 保存订单
		orderItemDao.save(paramMap, orderItems); // 保存订单项
		if("3".equals(dataFrom)) {
			// 记录日志
			saveOrderLog(paramMap, order, "买家成功提交订单", true);
		}else{
			// 记录日志
			saveOrderLog(paramMap, order, "买家成功提交订单", true);
		}


		return order;
	}


		/**
		 * 新增方法
		 * 判断系统是否开启订单确认
		 * @Author TianYu
		 * @Date 2015-8-19
		 * @return
		 */
	private boolean isEnableConfirm(Map<String, Object> paramMap){
		try {
			SystemSet s = systemSetDao.find(paramMap, "setKey", "isEnableConfirm");

			return s!=null?Boolean.parseBoolean(s.getSetvalue()):false;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println( "查询systemSet错误" );
			return false;
		}
	}

	/**
	 * 保存秒杀订单信息
	 *
	 * @param paramMap
	 *            租户Id
	 * @param pMap
	 *            订单相关的数据map
	 *
	 * @return 订单对象
	 * @throws Exception
	 */
	public Order saveSeckillOrder(Map<String, Object> paramMap, Map pMap, String saleId, String memberId) throws Exception {
		Order order = JSON.parseObject(JSON.toJSONString(pMap.get("order")), Order.class);
		String orderSn = OrderGenerator.generator();
		order.setOrderSn(orderSn);
		order.setCreateUser(pMap.get("createUser").toString());

		List<OrderItem> orderItems = new ArrayList<OrderItem>();

		List<Map<String, Object>> orderItemMapList = JSON.parseObject(JSON.toJSONString(pMap.get("orderItems")), List.class);
		for (Map<String, Object> map : orderItemMapList) {
			OrderItem item = JSON.parseObject(JSON.toJSONString(map), OrderItem.class);
			item.setOrderSn(orderSn);
			item.setCreateUser(pMap.get("createUser").toString());
			orderItems.add(item);
		}
		// 设置订单状态、支付状态、配送状态
        if ("offline".equals(order.getPayType())) {
            order.setOrderStatus(Order.OrderStatus.wait_seller_send_goods); // 货到付款时，状态更新为等待卖家发货
        } else if ("online".equals(order.getPayType())) {
            order.setOrderStatus(Order.OrderStatus.wait_buyer_pay);
        }
		order.setPaymentStatus(Order.PaymentStatus.unpaid);
		order.setShippingStatus(Order.ShippingStatus.unshipped);
		order.setType(1);// 秒杀订单类型

		order = orderDao.save(paramMap, order); // 保存订单
		orderItemDao.save(paramMap, orderItems); // 保存订单项
		//del by yangaming 秒杀不清空购物车
		//cartItemDao.deleteBatch(tenantId, "memberId", order.getMemberId()); // 删除购物车里的商品
		// 记录日志
		saveOrderLog(paramMap, order, "买家成功提交订单", true);
		// 减少库存
		FlashSale flashsale = flashSaleDao.get(paramMap, saleId);
		if (flashsale.getTotal() < 1) {
			throw new Exception("库存不足");
		} else {
			flashsale.setTotal(flashsale.getTotal() - 1);
			flashsale.setSold(flashsale.getSold() + 1);
			flashSaleDao.update(paramMap, flashsale);

			FlashSalePlandetail flashSalePlandetail = flashSalePlandetailDao.getFlashSalePlandetail(paramMap, flashsale.getDetailId());
			if (flashSalePlandetail != null && flashSalePlandetail.getIsPurchase() == 1) {
				// 记录用户秒杀记录
				List<FlashMember> list = new ArrayList<FlashMember>();
				FlashMember flashMember = new FlashMember();
				flashMember.setCreateDate(new Date());
				flashMember.setCreateUser("admin");
				flashMember.setMemberId(memberId);
				flashMember.setSaleId(saleId);
				list.add(flashMember);
				flashMemberDao.save(paramMap, list);
			}
		}
		return order;
	}

	/**
	 * 保存秒杀订单信息(线程同步)
	 *
	 * @param paramMap
	 *            租户Id
	 * @param pMap
	 *            订单相关的数据map
	 *
	 * @return 订单对象
	 * @throws Exception
	 */
	@Override
	public synchronized Order saveSeckillOrderSync(Map<String, Object> paramMap, Map pMap, String saleId, String memberId) throws Exception {
		Order order = JSON.parseObject(JSON.toJSONString(pMap.get("order")), Order.class);
		String orderSn = OrderGenerator.generator();
		order.setOrderSn(orderSn);
		order.setCreateUser(pMap.get("createUser").toString());

		List<OrderItem> orderItems = new ArrayList<OrderItem>();

		List<Map<String, Object>> orderItemMapList = JSON.parseObject(JSON.toJSONString(pMap.get("orderItems")), List.class);
		for (Map<String, Object> map : orderItemMapList) {
			OrderItem item = JSON.parseObject(JSON.toJSONString(map), OrderItem.class);
			item.setOrderSn(orderSn);
			item.setCreateUser(pMap.get("createUser").toString());
			orderItems.add(item);
		}
		// 设置订单状态、支付状态、配送状态
        if ("offline".equals(order.getPayType())) {
            order.setOrderStatus(Order.OrderStatus.wait_seller_send_goods); // 货到付款时，状态更新为等待卖家发货
        } else if ("online".equals(order.getPayType())) {
            order.setOrderStatus(Order.OrderStatus.wait_buyer_pay);
        }
		order.setPaymentStatus(Order.PaymentStatus.unpaid);
		order.setShippingStatus(Order.ShippingStatus.unshipped);
		order.setType(1);// 秒杀订单类型

		order = orderDao.save(paramMap, order); // 保存订单
		orderItemDao.save(paramMap, orderItems); // 保存订单项
		//del by yangaming 秒杀不清空购物车
		//cartItemDao.deleteBatch(tenantId, "memberId", order.getMemberId()); // 删除购物车里的商品
		// 记录日志
		saveOrderLog(paramMap, order, "买家成功提交订单", true);
		// 减少库存
		FlashSale flashsale = flashSaleDao.get(paramMap, saleId);
		if (flashsale.getTotal() < 1) {
			throw new Exception("库存不足");
		} else {
			flashsale.setTotal(flashsale.getTotal() - 1);
			flashsale.setSold(flashsale.getSold() + 1);
			flashSaleDao.update(paramMap, flashsale);

			FlashSalePlandetail flashSalePlandetail = flashSalePlandetailDao.getFlashSalePlandetail(paramMap, flashsale.getDetailId());
			if (flashSalePlandetail != null && flashSalePlandetail.getIsPurchase() == 1) {
				// 记录用户秒杀记录
				List<FlashMember> list = new ArrayList<FlashMember>();
				FlashMember flashMember = new FlashMember();
				flashMember.setCreateDate(new Date());
				flashMember.setCreateUser("admin");
				flashMember.setMemberId(memberId);
				flashMember.setSaleId(saleId);
				list.add(flashMember);
				flashMemberDao.save(paramMap, list);
			}
		}
		return order;
	}

	@Override
	public Order saveShipOrder(Map<String, Object> paramMap, Map pMap, String saleId, String memberId) {
		Order order = JSON.parseObject(JSON.toJSONString(pMap.get("order")), Order.class);
		String orderSn = OrderGenerator.generator();
		order.setOrderSn(orderSn);
		order.setCreateUser(pMap.get("createUser").toString());

		List<OrderItem> orderItems = new ArrayList<OrderItem>();

		List<Map<String, Object>> orderItemMapList = JSON.parseObject(JSON.toJSONString(pMap.get("orderItems")), List.class);
		for (Map<String, Object> map : orderItemMapList) {
			OrderItem item = JSON.parseObject(JSON.toJSONString(map), OrderItem.class);
			item.setOrderSn(orderSn);
			item.setCreateUser(pMap.get("createUser").toString());
			orderItems.add(item);
		}
		// 设置订单状态、支付状态、配送状态
		order.setOrderStatus(Order.OrderStatus.wait_buyer_pay);
		order.setPaymentStatus(Order.PaymentStatus.unpaid);
		order.setShippingStatus(Order.ShippingStatus.unshipped);
		order.setType(2);// 活动订单类型

		order = orderDao.save(paramMap, order); // 保存订单
		orderItemDao.save(paramMap, orderItems); // 保存订单项
		// 记录日志
		saveOrderLog(paramMap, order, "买家成功提交订单", true);
		// 减少库存
		ActivityShop activityShop = activityShopDao.get(paramMap, saleId);
		activityShop.setTotal(activityShop.getTotal() - 1);
		activityShop.setSold(activityShop.getSold() + 1);
		activityShopDao.update(paramMap, activityShop);
		// 记录用户秒杀记录
		List<ActivityMember> list = new ArrayList<ActivityMember>();
		ActivityMember activityMember = new ActivityMember();
		activityMember.setCreateDate(new Date());
		activityMember.setCreateUser("admin");
		activityMember.setMemberId(memberId);
		activityMember.setActivityId(saleId);
		list.add(activityMember);
		activityMemberDao.save(paramMap, list);
		return order;
	}

	/**
	 * 订单支付成功
	 *
	 * @param paramMap
	 *            租户Id
	 * @param orderNo
	 *            订单编号
	 */
	public Order orderPaidSuccess(Map<String, Object> paramMap, String orderNo) {
		Order order = orderDao.find(paramMap, "orderSn", orderNo);
		String oldOrderStatus = order.getOrderStatus()+"";
		String oldPaymentStatus = order.getPaymentStatus()+"";
		String oldShippingStatus = order.getShippingStatus()+"";
		order.setOrderStatus(Order.OrderStatus.wait_seller_send_goods);
		order.setPaymentStatus(Order.PaymentStatus.paid);
		order.setShippingStatus(Order.ShippingStatus.unshipped);

//		int result = orderDao.update(tenantId, order);
		orderDao.update(paramMap, order);

		// 记录日志
		saveOrderLog(paramMap, order,Order.OrderStatus.wait_seller_send_goods+"",oldOrderStatus, OrderLog.StatusType.order+"", "买家成功支付订单", false);
		saveOrderLog(paramMap, order,Order.PaymentStatus.paid+"", oldPaymentStatus,OrderLog.StatusType.payment+"", "买家成功支付订单", false);
		saveOrderLog(paramMap, order,Order.ShippingStatus.unshipped+"",oldShippingStatus, OrderLog.StatusType.shipping+"", "买家成功支付订单", false);

		return order;
	}

	/**
	 * 支付并自动确认收货（更新支付状态为已支付，更新配送状态为已收货，更新订单状态为交易完成）
	 *
	 * @param paramMap
	 *            租户Id
	 * @param orderNo
	 *            订单编号
	 */
	public Order orderPaidAndAutoFinished(Map<String, Object> paramMap, String orderNo) {
		Order order = orderDao.find(paramMap, "orderSn", orderNo);

		String oldOrderStatus = order.getOrderStatus()+"";
		String oldPaymentStatus = order.getPaymentStatus()+"";
		String oldShippingStatus = order.getShippingStatus()+"";

		order.setOrderStatus(Order.OrderStatus.trade_finished);
		order.setPaymentStatus(Order.PaymentStatus.paid);
		order.setShippingStatus(Order.ShippingStatus.takeover);

//		int result = orderDao.update(tenantId, order);
		orderDao.update(paramMap, order);

		// 记录日志
//		saveOrderLog(tenantId, order, "买家成功支付订单，系统自动确认收货！", false);
		saveOrderLog(paramMap, order,Order.OrderStatus.trade_finished+"",oldOrderStatus, OrderLog.StatusType.order+"", "买家成功支付订单", false);
		saveOrderLog(paramMap, order,Order.PaymentStatus.paid+"", oldPaymentStatus,OrderLog.StatusType.payment+"", "买家成功支付订单", false);
		saveOrderLog(paramMap, order,Order.ShippingStatus.takeover+"", oldShippingStatus,OrderLog.StatusType.shipping+"", "买家成功支付订单", false);

		return order;
	}

	/**
	 * 取消订单
	 *
	 * @param paramMap
	 *            租户Id
	 * @param orderId
	 *            订单Id
	 *
	 * @param reason 取消原因
	 * @return 取消的订单对象
	 */
	public Order cancle(Map<String, Object> paramMap, String orderId, String reason) {
		Order order = orderDao.get(paramMap, orderId);
		String oldOrderStatus = order.getOrderStatus()+"";
		order = updateOrderStatus(paramMap, orderId, Order.OrderStatus.cancel, order.getPaymentStatus(), order.getShippingStatus());
		// 记录日志
//		saveOrderLog(tenantId, order, "买家取消订单", false);
		saveOrderLog(paramMap, order,Order.OrderStatus.cancel+"",oldOrderStatus, OrderLog.StatusType.order+"", "买家取消订单："+reason, false);

		return order;
	}

	/**
	 * 删除订单
	 *
	 * @param paramMap
	 *            租户Id
	 * @param orderId
	 *            订单对象
	 *
	 * @return 删除的订单对象
	 */
	public Order deleteOrder(Map<String, Object> paramMap, String orderId) {
		Order order = orderDao.get(paramMap, orderId);
		String oldOrderStatus = order.getOrderStatus()+"";
		order = updateOrderStatus(paramMap, orderId, Order.OrderStatus.deleted, order.getPaymentStatus(), order.getShippingStatus());
		// 记录日志
//		saveOrderLog(tenantId, order, "删除订单", false);
		saveOrderLog(paramMap, order,Order.OrderStatus.deleted+"",oldOrderStatus, OrderLog.StatusType.order+"", "删除订单", false);


		return order;
	}

	/**
	 * 订单--确认收货
	 *
	 * @param paramMap
	 *            租户Id
	 * @param orderId
	 *            订单Id
	 *
	 * @return 确认的订单对象
	 */
	public Order confirmGoods(Map<String, Object> paramMap, String orderId) {
		// 记录日志
//		saveOrderLog(tenantId, order, "订单确认收货", false);

		Order oldOrder = orderDao.get(paramMap, orderId);

		String oldOrderStatus = oldOrder.getOrderStatus()+"";
		String oldPaymentStatus = oldOrder.getPaymentStatus()+"";
		String oldShippingStatus = oldOrder.getShippingStatus()+"";

		Order order = updateOrderStatus(paramMap, orderId, Order.OrderStatus.trade_finished, Order.PaymentStatus.paid, Order.ShippingStatus.takeover);

		// 记录日志
//		saveOrderLog(tenantId, order, "买家成功支付订单，系统自动确认收货！", false);
		if( !oldOrderStatus.equals( Order.OrderStatus.trade_finished.toString() ) ){
			saveOrderLog(paramMap, order,Order.OrderStatus.trade_finished+"",oldOrderStatus, OrderLog.StatusType.order+"", "订单交易完成", false);
		}
		if( !oldPaymentStatus.equals( Order.PaymentStatus.paid.toString() ) ) {
			saveOrderLog(paramMap, order,  Order.PaymentStatus.paid + "",oldPaymentStatus, OrderLog.StatusType.payment + "", "买家成功支付订单", false);
		}
		if( !oldShippingStatus.equals( Order.ShippingStatus.takeover.toString() ) ) {
			saveOrderLog(paramMap, order,  Order.ShippingStatus.takeover + "", oldShippingStatus, OrderLog.StatusType.shipping + "", "买家确认收货", false);
		}

		/**----begin-------1.根据商家的shopId查询当前商家发放的有效红包  2.根据指定的查询到的红包规则生成当前采购商的红包  3.保存采购商红包--------author yuech  createTime 2016-03-10--------------------**/
		try{
			List<GhjRedenvelopAccesslog> redenvelopAccesslogList =  BuildRuleListByMerchantId(order);//生成的红包列表
			if(redenvelopAccesslogList!=null && redenvelopAccesslogList.size()>0){ //保存红包对象
				for(GhjRedenvelopAccesslog redenvelopAccesslog : redenvelopAccesslogList){
					redenvelopAccesslogDao.save(paramMap,redenvelopAccesslog);
				}
			}
		}catch (Exception e){
			logger.error("保存采购商红包，发生异常, orderId=" + orderId, e);
		}
		/**----end-------------------author  yuech  createTime 2016-03-10------------------ **/
		//如果存在汇总单，更新汇总单的订单状态
		if( StringUtil.isNotEmpty(order.getParentSn()) ){
			boolean isChange = true;
			List<Order> orders = this.orderDao.findList(paramMap,"parentSn", order.getParentSn());

			if( orders != null && orders.size() > 0 ){
				for(Order o : orders){
					//如果存在子单的状态不是 交易完成， 不更新汇总单状态
					if( !orderId.equals(o.getId()) && !o.getOrderStatus().equals(Order.OrderStatus.trade_finished) ){
						isChange = false;
						break;
					}
				}
			}

			//如果所有子单的状态都为 交易完成  Order.OrderStatus.trade_finished
			//汇总单状态也改为 交易完成  Order.OrderStatus.trade_finished
			if(isChange){
				Order parentOrder = this.orderDao.find(paramMap, "orderSn",order.getParentSn());

				if( parentOrder != null ){
					//更新状态
					updateOrderStatus(paramMap, parentOrder.getId(), Order.OrderStatus.trade_finished, Order.PaymentStatus.paid, Order.ShippingStatus.takeover);

					if( !parentOrder.getOrderStatus().equals(Order.OrderStatus.wait_buyer_validate_goods) ){
						saveOrderLog(paramMap, order, Order.OrderStatus.trade_finished + "", parentOrder.getOrderStatus() + "", OrderLog.StatusType.order + "", "汇总单确认验货，交易完成", false);
					}
				}

			}
		}

		return order;
	}
	/***======================begin 2016-03-11 author yuech==========封装存红包相关的方法========================**/

	private List<GhjRedenvelopAccesslog>  BuildRuleListByMerchantId(Order order) throws Exception{
		String merchantId = order.getShopId();
		/**根据商家查询商家发放的(前提条件：在有效期内)红包  --------------------begin------------*/
		Criteria c = new Criteria();
		c.add(Restrictions.eq("merchantId", merchantId));
		c.add(Restrictions.eq("isDelete", "N"));
		String currentDate = DateUtil.dateToString(new Date(),"yyyy-MM-dd");
		c.add(Restrictions.le("DATE_FORMAT(rStartTime, '%Y-%m-%d')", currentDate));
		c.add(Restrictions.gt("DATE_FORMAT(rEndTime, '%Y-%m-%d')", currentDate));
		List<GhjRedenvelopGrandlog> redenvelopGrandlogList = redenvelopGrandlogDao.getRedEnvelopByShopId(getParamMap(), c);
		/**------------------------------------------------------------------end-----------------**/

		/**根据订单商品的goodsId查询对应的红包id--------------begin---------------------**/
		List<String> goodsIds = BuildOrderItemGoods(getOrderItermGoodsIds(order));
		List<GhjRedenvelopRule> redenvelopRuleList = null;
		if(StringUtil.isNotEmpty(goodsIds)){
			Criteria goodsRule = new Criteria();
			goodsRule.add(Restrictions.in("goodsId",goodsIds));
			goodsRule.add(Restrictions.order("redEnvelopId", "asc"));
			redenvelopRuleList = redenvelopRuleDao.getRedEnvelopId(getParamMap(), goodsRule);
		}

		/**------------------------------------------------end-----------------------------**/
		List<String> redIdAndgoodsId = new ArrayList<>();
		if(StringUtil.isNotEmpty(redenvelopGrandlogList) && StringUtil.isNotEmpty(redenvelopRuleList)){
			for(int i=0;i<redenvelopGrandlogList.size();i++){ //循环商家的红包
				String redId = redenvelopGrandlogList.get(i).getId();//红包ID
				for(int k=0;k<redenvelopRuleList.size();k++){//循环订单商品对应的红包
					String tempRedId = redenvelopRuleList.get(k).getRedEnvelopId();//商品对应的红包ID，把商品ID和红包ID拼成Map的key,商品的goodsId和红包ID分别存入list，然后把把当前的list存入key对应的list
					if(redId.equals(tempRedId)){
						String goodsId = redenvelopRuleList.get(k).getGoodsId();
						String keyAndVal = tempRedId+"_"+goodsId;
						redIdAndgoodsId.add(keyAndVal);
					}
				}
			}
		}
		List<GhjRedenvelopAccesslog> redenvelopAccesslogList = buildDataByRedenveId(redIdAndgoodsId,order);
		return redenvelopAccesslogList;
	}
	/**根据红包id和goodsId组装一条规则一条数据
	 *
	 *  1	1601191544379946211
	    1	1601191602226256259
	    2	1601191544379946211
	    2	1601191602226256259
	 */
	private List<GhjRedenvelopAccesslog> buildDataByRedenveId(List<String> redIdAndgoodsId,Order order) throws Exception{
		Map<String,String> redEnve = new HashMap<>();//去掉重复的红包ID
		for (String str : redIdAndgoodsId) {
			String[] attr = str.split("_");
			redEnve.put(attr[0],attr[0]);
		}
		boolean flag = false;
		List<String>  goodsIdStr = null;
		List<GhjRedenvelopAccesslog> redenvelopAccessloglist = new ArrayList<>();//存储封装好的红包对象集合
		for (Map.Entry<String, String> entry : redEnve.entrySet()) {
			String ruleId = entry.getKey();
			Map<String,List<String>> redevenIdAndGoodsId = new HashMap<>();
			goodsIdStr = new ArrayList<>();
			for (String str : redIdAndgoodsId) {
				String[] attr = str.split("_");
				String tempRedId = attr[0];
				String goodsId = attr[1];
				if(ruleId.equals(tempRedId)){
					goodsIdStr.add(goodsId);
					flag = true;
				}
			}
			if(flag){
				redevenIdAndGoodsId.put(ruleId,goodsIdStr);//一个规则对应多个goodsId,此处在封装一个方法，一个规则对应一条数据
				GhjRedenvelopAccesslog redenvelopAccesslog = buildAccesslogModel(redevenIdAndGoodsId, order);//一个规则对应一条数据
				if(redenvelopAccesslog!=null){
					redenvelopAccessloglist.add(redenvelopAccesslog);
				}
				flag = false;
			}
		}
		return redenvelopAccessloglist;
	}
	/***根据规则组装一条红包数据对象 author yuech 2016-03-12 10:12*/
	private GhjRedenvelopAccesslog buildAccesslogModel(Map<String,List<String>> map,Order order) throws Exception{
		if(map!=null && map.size()>0){
			/***解析当前规则下对应的商品 生成一条红包数据**/
			List<OrderItem>  orderItems = getOrderItermGoodsIds(order);//获取订单项的商品信息
			String key = map.entrySet().iterator().next().getKey();//红包ghj_redenvelop_grandlog的id
			GhjRedenvelopGrandlog redenvelopGrandlog = redenvelopGrandlogDao.get(getParamMap(),key);
			List<String> goodsIds = map.get(key);
			double amount = 0.0;//定义一条规则对应生成的红包的金额的变量
			for(String goodsId : goodsIds){//循环当前购买商品中一个规则对应的多个商品
				for(int i=0;i<orderItems.size();i++){
					OrderItem orderItem = orderItems.get(i);
					String itermGoodsId = orderItem.getGoodsId();
					if(itermGoodsId.equals(goodsId)){//计算当前订单商品的返利额度，条件：(1).红包ID;(2).区间(当前订单商品的总金额);订单项中找到了终止订单项的循环
						double totalPrice = orderItem.getGoodsPrice()*orderItem.getQuantity();
						Criteria c = new Criteria();
						c.add(Restrictions.eq("redEnvelopId", key));
						c.add(Restrictions.eq("isDelete", "N"));
						c.add(Restrictions.le("rStartRange", totalPrice));
						c.add(Restrictions.gt("rEndRange", totalPrice));
						List<GhjRedenvelopRangerebaterule> rangerebaterulelist = redenvelopRangerebateruleDao.getList(getParamMap(), c);//此处本来查询返回一个对象，用list查询目的是便于组装查询条件，其次是防止脏数据查询报错

							//如果查不到区间内的，就查询优惠力度最大的区间
						if(rangerebaterulelist ==null || rangerebaterulelist.size()==0){
							c = new Criteria();
							c.add(Restrictions.eq("redEnvelopId", key));
							c.add(Restrictions.eq("isDelete", "N"));
							c.add(Restrictions.le("rEndRange", totalPrice));
							c.add(Restrictions.order("rEndRange","desc"));
							rangerebaterulelist = redenvelopRangerebateruleDao.getList(getParamMap(), c);//此处本来查询返回一个对象，用list查询目的是便于组装查询条件，其次是防止脏数据查询报错
						}

						if(rangerebaterulelist !=null && rangerebaterulelist.size()>0) {
							GhjRedenvelopRangerebaterule rangerebaterule = rangerebaterulelist.get(0);
							if (0 == redenvelopGrandlog.getType()) {//'红包类型：0_按比例返还，',
								double rate = rangerebaterule.getRAmount() / 100;
								//如果是按照比例返还，则商品总价x比例=返利金额
								amount += totalPrice * rate;
							} else if (1 == redenvelopGrandlog.getType()) {//1_按定额定额返还,直接累加同一个规则下的返还金额
								amount += rangerebaterule.getRAmount();
							}
						}else{
							break;
						}

					}
				}

			}
			if(amount>0){//如果amount>0说明可以生成红包，如果为0就没有必要生成红包数据对象了
				GhjRedenvelopAccesslog redenvelopAccesslog = new GhjRedenvelopAccesslog();
				redenvelopAccesslog.setOrderSn(order.getOrderSn());
				redenvelopAccesslog.setAccessType(0);
				redenvelopAccesslog.setAmount(amount);
				redenvelopAccesslog.setBuyerId(order.getMemberId());
				redenvelopAccesslog.setCreateTime(new Date());
				int pValidityPeriod = redenvelopGrandlog.getpValidityPeriod();
				if(0==pValidityPeriod){//为0时表示永远有效
					redenvelopAccesslog.setExpiryTime(DateUtil.stringToDate("2050-12-31 23:59:59","yyyy-MM-dd HH:mm:ss"));
				}else{
					Date date = DateUtils.dateAddByProp(new Date(), Calendar.DAY_OF_MONTH, pValidityPeriod);
					redenvelopAccesslog.setExpiryTime(date);//计算红包失效时间
				}
				redenvelopAccesslog.setMerchantId(redenvelopGrandlog.getMerchantId());
				redenvelopAccesslog.setRedEnvelopId(redenvelopGrandlog.getId());
				redenvelopAccesslog.setRedEnvelopType("rebate");
				redenvelopAccesslog.setTenantId(order.getTenantId());
				redenvelopAccesslog.setCreateUser(order.getCreateUser());
				return redenvelopAccesslog;
			}else{
				return null;
			}
		}else{
			return null;
		}
	}


	/**组装订单项**/
	private List<OrderItem>  getOrderItermGoodsIds(Order order){
		Criteria criteria = new Criteria();
		criteria.add(Restrictions.eq("orderSn", order.getOrderSn()));
		List<OrderItem> orderItemList = orderItemDao.getList(getParamMap(), criteria);// 1.查询订单详情(前提条件：当orderId是主订单的id时就不会有订单项，所以就从它的子订单中取商品)
		if (orderItemList != null && orderItemList.size() > 0) {
			return orderItemList;
		}else{
			List<Order> childOrders = orderDao.findList(getParamMap(), "parentSn", order.getOrderSn());
			if(childOrders!=null && childOrders.size()>0){
				List<String> orderSnList = new ArrayList<>();
				for(Order ordersn : childOrders){
					orderSnList.add(ordersn.getOrderSn());
				}
				Criteria c = new Criteria();
				c.add(Restrictions.in("orderSn", orderSnList));
				orderItemList = orderItemDao.getList(getParamMap(), c);
			}
			return orderItemList;
		}
	}
	/**
	 * 根据订单商品查询该商品返利规则
	 */
	private List<String> BuildOrderItemGoods(List<OrderItem> orderItemList){
		/**不同的商品 拥有相同的返利规则 则存入一条红包数据**/
		List<String> goodsIds = null ;
		if(orderItemList!=null && orderItemList.size() > 0){
			goodsIds = new ArrayList<>();//组装存放订单商品的ID
			for (OrderItem orderItem : orderItemList) {
				goodsIds.add(orderItem.getGoodsId());
			}
		}
		return goodsIds;
	}
	/**此方法是BaseControler的基础方法，该类不能引用，此处重新引入以下**/
	private Map<String,Object> getParamMap(){
		Map<String,Object> param = new HashMap<>();
		param.put(Constant.TENANTID_KEY, "37100");
		param.put(Constant.PLATFORM_KEY, Constant.PLATFORM_B2B );
		return param;
	}

	/***======================end 2016-03-11 author yuech==========封装存红包相关的方法========================**/

	/**
	 * 拆分订单
	 *
	 * @param paramMap
	 *            租户Id
	 * @param order
	 *            页面提交过来的总订单
	 *
	 * @return 总订单对象
	 */
	public Order splitOrder(Map<String, Object> paramMap, Order order) {
		List<OrderItem> orderItems = orderItemDao.findList(paramMap, "orderSn", order.getOrderSn());
		int shopNums = countShopNums(paramMap, orderItems); // 商家数量
		if (shopNums > 1) {
			List<String> shopIdList = new ArrayList<String>();
			Map<String, Order> shopIdOrderMapping = new HashMap<String, Order>();
			String orderSn = order.getOrderSn();
			for (OrderItem item : orderItems) {
				Goods goods = goodsDao.get(paramMap, item.getGoodsId());
				String shopId = goods.getShopId();
				if (!shopIdList.contains(shopId)) { // 如果商品属于不同店铺，则生成一个该店铺的订单
					// 1、生成新的子订单
					Order childOrder = order;
					childOrder.setId(null);
					childOrder.setOrderSn(OrderGenerator.generator());
					childOrder.setParentSn(orderSn);
					childOrder.setShopId(shopId);
					// 重新计算订单商品数量、总价格和订单总额
					childOrder.setGoodsTotalQuantity(item.getQuantity());
					childOrder.setGoodsTotalPrice(item.getGoodsPrice() * item.getQuantity());
					childOrder.setTotalAmount(item.getGoodsPrice() * item.getQuantity() + order.getDeliveryFee());
					childOrder = orderDao.saveOne(paramMap, childOrder);
					// 2、更新订单项的orderSn为新生成的子订单的orderSn
					item.setOrderSn(childOrder.getOrderSn());
					item.setModifyUser(childOrder.getCreateUser());

					shopIdOrderMapping.put(shopId, childOrder);
					shopIdList.add(shopId);
				} else { // 只更新订单项的orderSn
					Order childOrder = shopIdOrderMapping.get(shopId);
					// 重新计算并更新订单商品数量、总价格和订单总额
					childOrder.setGoodsTotalQuantity(childOrder.getGoodsTotalQuantity() + item.getQuantity());
					childOrder.setGoodsTotalPrice(childOrder.getGoodsTotalPrice() + (item.getGoodsPrice() * item.getQuantity()));
					childOrder.setTotalAmount(childOrder.getTotalAmount() + (item.getGoodsPrice() * item.getQuantity() + order.getDeliveryFee()));
					orderDao.update(paramMap, childOrder);
					item.setOrderSn(childOrder.getOrderSn());
					item.setModifyUser(childOrder.getCreateUser());
				}
				item.setModifyDate(new Date());
				orderItemDao.update(paramMap, item);
			}
		} else if (shopNums == 1) { // 当只有一个店铺时修改此订单的shopId为其订单项中任意一个商品的shopId
			OrderItem item = orderItems.get(0);
			Goods goods = goodsDao.get(paramMap, item.getGoodsId());
			String shopId = goods.getShopId();
			order.setShopId(shopId);
			orderDao.update(paramMap, order);
		}

		return order;
	}

	@Override
	public boolean orderInvalid(Map<String, Object> paramMap, Order entity, String operator) {
		int count = orderDao.update(paramMap, entity);
		if (count > 0) {
			OrderLog orderLog = new OrderLog();
			orderLog.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
			orderLog.setOrderSn(entity.getOrderSn());
			orderLog.setType("作废");
			orderLog.setOperator(operator);
			orderLog.setCreateUser(operator);
			orderLog.setInfo("作废成功");
			orderLog.setCreateDate(new Date());
			orderLogDao.save(paramMap, orderLog);
			return true;
		}
		return false;
	}

	@Override
	public boolean orderShipped(Map<String, Object> paramMap, Order entity, String operator, OrderDistribution OrderDistribution) {
		int count = orderDao.update(paramMap, entity);
		// 减库存
		String orderSn = entity.getOrderSn();
		List<OrderItem> orderItemList = orderItemDao.findList(paramMap, "orderSn", orderSn);
		if (orderItemList != null && orderItemList.size() > 0) {
			List<String> tmpGoodsIds = new ArrayList<String>();
			Map<String, Integer> goodsIdCountMap = new HashMap<String, Integer>(); // 商品Id---购买数量
			for (OrderItem item : orderItemList) {
				goodsIdCountMap.put(item.getGoodsId(), item.getQuantity());
				tmpGoodsIds.add(item.getGoodsId());
			}
			// 把所有订单项里的商品都扒拉出来，重新修改字段值后再更新
			List<Goods> goodsList = goodsDao.findListByIds(paramMap, tmpGoodsIds);
			if (goodsList != null && goodsList.size() > 0) {
				Goods g;
				for (Goods goods : goodsList) {
					g = new Goods();
					g.setId(goods.getId());
					g.setStock(goods.getStock() - goodsIdCountMap.get(goods.getId()));
					goodsDao.updateUnBatch(paramMap, g);
				}
			}
		}

		if (count > 0) {
			OrderLog orderLog = new OrderLog();
			orderLog.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
			orderLog.setOrderSn(entity.getOrderSn());
			orderLog.setType("确认配送");
			orderLog.setOperator(operator);
			orderLog.setCreateUser(operator);
			orderLog.setInfo("确认配送成功");
			orderLog.setCreateDate(new Date());
			orderDistributionDao.save(paramMap, OrderDistribution);
			orderLogDao.save(paramMap, orderLog);
			return true;
		}
		return false;
	}

	@Override
	public boolean orderXYMShipped(Map<String, Object> paramMap, Order entity, String operator, OrderDistribution orderDistribution) {
		int count = orderDao.update(paramMap, entity);
		// 减库存
		String orderSn = entity.getOrderSn();
		List<OrderItem> orderItemList = orderItemDao.findList(paramMap, "orderSn", orderSn);
		if (orderItemList != null && orderItemList.size() > 0) {
			List<String> tmpGoodsIds = new ArrayList<String>();
			Map<String, Integer> goodsIdCountMap = new HashMap<String, Integer>(); // 商品Id---购买数量
			for (OrderItem item : orderItemList) {
				goodsIdCountMap.put(item.getGoodsId(), item.getQuantity());
				tmpGoodsIds.add(item.getGoodsId());
			}
			// 把所有订单项里的商品都扒拉出来，重新修改字段值后再更新
			List<Goods> goodsList = goodsDao.findListByIds(paramMap, tmpGoodsIds);
			if (goodsList != null && goodsList.size() > 0) {
				Goods g;
				for (Goods goods : goodsList) {
					g = new Goods();
					g.setId(goods.getId());
					g.setStock(goods.getStock() - goodsIdCountMap.get(goods.getId()));
					goodsDao.updateUnBatch(paramMap, g);
				}
			}
		}

		if (count > 0) {
			OrderLog orderLog = new OrderLog();
			orderLog.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
			orderLog.setOrderSn(entity.getOrderSn());
			orderLog.setType("确认派送");
			orderLog.setOperator(operator);
			orderLog.setCreateUser(operator);
			orderLog.setInfo("已派送,分拣中");
			orderLog.setCreateDate(new Date());
			orderDistributionDao.save(paramMap, orderDistribution);
			orderLogDao.save(paramMap, orderLog);
			return true;
		}
		return false;
	}

	@Override
	public boolean orderPaid(Map<String, Object> paramMap, Order entity, String operator) {
		int count = orderDao.update(paramMap, entity);
		if (count > 0) {
			OrderLog orderLog = new OrderLog();
			orderLog.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
			orderLog.setOrderSn(entity.getOrderSn());
			orderLog.setType("确认支付");
			orderLog.setOperator(operator);
			orderLog.setCreateUser(operator);
			orderLog.setInfo("确认支付成功");
			orderLog.setCreateDate(new Date());
			orderLogDao.save(paramMap, orderLog);
			return true;
		}
		return false;
	}

	@Override
	public boolean orderConfirm(Map<String, Object> paramMap, Order entity, String operator) {
		int count = orderDao.update(paramMap, entity);
		if (count > 0) {
			OrderLog orderLog = new OrderLog();
			orderLog.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
			orderLog.setOrderSn(entity.getOrderSn());
			orderLog.setType("确认订单");
			orderLog.setOperator(operator);
			orderLog.setCreateUser(operator);
			orderLog.setInfo("确认订单成功");
			orderLog.setCreateDate(new Date());
			orderLogDao.save(paramMap, orderLog);
			return true;
		}
		return false;
	}

	/**
	 * 更新订单相关的各种状态
	 *
	 * @param paramMap
	 *            租户Id
	 * @param orderId
	 *            订单Id
	 * @param orderStatus
	 *            订单状态
	 * @param paymentStatus
	 *            支付状态
	 * @param shippingStatus
	 *            配送状态
	 */
	private Order updateOrderStatus(Map<String, Object> paramMap, String orderId, Order.OrderStatus orderStatus, Order.PaymentStatus paymentStatus, Order.ShippingStatus shippingStatus) {
		Order order = orderDao.get(paramMap, orderId);
		order.setOrderStatus(orderStatus);
		order.setPaymentStatus(paymentStatus);
		order.setShippingStatus(shippingStatus);
		order.setModifyDate( new Date() );

		orderDao.update(paramMap, order);

		return order;
	}

	/**
	 * 记录订单日志
	 *
	 * @param paramMap
	 *            租户Id
	 * @param order
	 *            订单对象
	 * @param info
	 *            日志内容
	 * @param isBatch
	 *            是否采用批量模式
	 */
	private void saveOrderLog(Map<String, Object> paramMap, Order order, String info, boolean isBatch) {
		OrderLog orderLog = new OrderLog();
		orderLog.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
		orderLog.setOrderSn(order.getOrderSn());
		orderLog.setType(order.getOrderStatus().toString());
		orderLog.setOperator(order.getCreateUser());
		orderLog.setInfo(info);
		orderLog.setCreateUser(order.getCreateUser());
		orderLog.setOldType("cartItem");
		orderLog.setStatusType(OrderLog.StatusType.order.toString());
		orderLogDao.saveOrderLog(paramMap, orderLog, isBatch);
	}

	/**
	 * 保存订单日志
	 * @param paramMap
	 * @param order 订单
	 * @param type 目前状态
	 * @param oldType 更新前状态
	 * @param statusType 状态类型
	 * @param info
	 * @param isBatch
	 */
	private void saveOrderLog(Map<String, Object> paramMap, Order order,String type,String oldType, String statusType, String info, boolean isBatch) {
		OrderLog orderLog = new OrderLog();
		orderLog.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
		orderLog.setOrderSn(order.getOrderSn());
		orderLog.setType(type);
		orderLog.setOperator(order.getCreateUser());
		orderLog.setInfo(info);
		orderLog.setCreateUser(order.getCreateUser());
		orderLog.setOldType(oldType);
		orderLog.setStatusType(statusType);
		orderLogDao.saveOrderLog(paramMap, orderLog, isBatch);
	}

	/**
	 * 计算订单项中的商品对应了几个商家(店铺)
	 *
	 * @param paramMap
	 *            租户Id
	 * @param orderItems
	 *            订单项列表
	 *
	 * @return 商家个数
	 */
	private int countShopNums(Map<String, Object> paramMap, List<OrderItem> orderItems) {
		// 判断是否需要拆单,如果shopIds只有一个，则不进行拆单
		List<String> shopIds = new ArrayList<String>();
		if (orderItems != null && orderItems.size() > 0) {
			List<String> goodsIds = new ArrayList<String>();
			for (OrderItem item : orderItems) {
				if (!goodsIds.contains(item.getGoodsId())) {
					goodsIds.add(item.getGoodsId());
				}
			}
			List<Goods> goodsList = goodsDao.findListByIds(paramMap, goodsIds);
			for (Goods goods : goodsList) {
				if (!shopIds.contains(goods.getShopId())) {
					shopIds.add(goods.getShopId());
				}
			}
		}

		return shopIds.size();
	}

	@Override
	public List<Order> getExportList(Map<String, Object> paramMap, Criteria criteria) {
		return orderDao.getExportList(paramMap, criteria);
	}

	@Override
	public List<Order> getXYMExportList(Map<String, Object> paramMap, Criteria criteria) {
		return orderDao.getXYMExportList(paramMap, criteria);
	}

	@Override
	public Order saveOrderXiYingMen(Map<String, Object> paramMap, Map pMap) throws Exception {
		Order order = JSON.parseObject(JSON.toJSONString(pMap.get("order")), Order.class);
		String orderSn = OrderGenerator.generator();
		order.setOrderSn(orderSn);
		order.setCreateUser(pMap.get("createUser").toString());
		List<OrderItem> orderItems = new ArrayList<OrderItem>();
		OrderItem item;
		double goodsTotalPrice = 0;
		List<Map<String, Object>> orderItemMapList = JSON.parseObject(JSON.toJSONString(pMap.get("orderItems")), List.class);
		for (Map<String, Object> map : orderItemMapList) {
			item = JSON.parseObject(JSON.toJSONString(map), OrderItem.class);
			item.setOrderSn(orderSn);
			item.setCreateUser(pMap.get("createUser").toString());
			Goods goods = goodsDao.getGoodsByBatchType(paramMap, item.getGoodsId());
			item.setGoodsPrice(item.getGoodsPrice() != null && item.getGoodsPrice() > 0 ? item.getGoodsPrice() : goods.getPrice());
			item.setGoodsName(goods.getName());
			orderItems.add(item);
			goodsTotalPrice += (item.getGoodsPrice() != null && item.getGoodsPrice() > 0 ? item.getGoodsPrice() : goods.getPrice()) * item.getQuantity();
			if(goods.getIsLianYing()!=1){	//联营商品不关心
				if (goods.getStock() != null) {     // 如果录入了库存，包括库存为0
	                if ((goods.getStock() - item.getQuantity() >= 0)) {
	                    goods.setStock(goods.getStock() - item.getQuantity());
	                    goodsDao.update(paramMap, goods);
	                } else {
	                    throw new Exception("库存不足");
	                }
	            }
			}
		}
		// 重新再计算商品总价格和订单总额
		order.setGoodsTotalPrice(goodsTotalPrice);
		order.setTotalAmount(goodsTotalPrice + order.getDeliveryFee());
		// 设置订单状态、支付状态、配送状态
        if ("offline".equals(order.getPayType())) {
            order.setOrderStatus(Order.OrderStatus.wait_seller_send_goods); // 货到付款时，状态更新为等待卖家发货
        } else if ("online".equals(order.getPayType())) {
            order.setOrderStatus(Order.OrderStatus.unconfirm);
        }
        order.setPaymentStatus(Order.PaymentStatus.unpaid);
		order.setShippingStatus(Order.ShippingStatus.unshipped);
		order.setType(0);

		order = orderDao.save(paramMap, order); // 保存订单
		orderItemDao.save(paramMap, orderItems); // 保存订单项
		cartItemDao.deleteBatch(paramMap, "memberId", order.getMemberId()); // 删除购物车里的商品
		// 记录日志
		saveOrderLog(paramMap, order, "买家成功提交订单", true);

		return order;

	}

    /**
     * 保存团购订单(只支持单个商品)
     *
     * @param paramMap 租户Id
     * @param pMap     订单相关的数据map
     *
     * @return 订单对象
     */
    public Order saveGroupBuyOrder(Map<String, Object> paramMap, Map pMap) throws Exception {
        Order order = JSON.parseObject(JSON.toJSONString(pMap.get("order")), Order.class);
        String orderSn = OrderGenerator.generator();
        order.setOrderSn(orderSn);
        order.setCreateUser(pMap.get("createUser").toString());
        List<OrderItem> orderItems = new ArrayList<OrderItem>();
        String saleId = pMap.get("saleId").toString();
        GroupSale groupGoods = groupSaleDao.getByBatchType(paramMap, saleId);
        OrderItem item;
        double goodsTotalPrice = 0;
        List<Map<String, Object>> orderItemMapList = JSON.parseObject(JSON.toJSONString(pMap.get("orderItems")), List.class);
        for (Map<String, Object> map : orderItemMapList) {
            item = JSON.parseObject(JSON.toJSONString(map), OrderItem.class);
            item.setOrderSn(orderSn);
            item.setCreateUser(pMap.get("createUser").toString());
            item.setGoodsPrice(groupGoods.getYpice());
            item.setGoodsName(pMap.get("goodsName").toString());
            orderItems.add(item);
            goodsTotalPrice += groupGoods.getYpice() * item.getQuantity();

            if (groupGoods.getTotal() - item.getQuantity() >= 0) {
                groupGoods.setTotal(groupGoods.getTotal() - item.getQuantity());
                groupGoods.setSold(groupGoods.getSold() + item.getQuantity());
                groupSaleDao.updateByBatchType(paramMap, groupGoods);
            } else {
                throw new Exception("库存不足");
            }
        }
        // 重新再计算商品总价格和订单总额
        order.setGoodsTotalPrice(goodsTotalPrice);
        order.setTotalAmount(goodsTotalPrice + order.getDeliveryFee());
        // 设置订单状态、支付状态、配送状态
        if ("offline".equals(order.getPayType())) {
            order.setOrderStatus(Order.OrderStatus.wait_seller_send_goods); // 货到付款时，状态更新为等待卖家发货
        } else if ("online".equals(order.getPayType())) {
            order.setOrderStatus(Order.OrderStatus.unconfirm);
        }
        order.setPaymentStatus(Order.PaymentStatus.unpaid);
        order.setShippingStatus(Order.ShippingStatus.unshipped);
        order.setType(2);   // 团购类型

        order = orderDao.save(paramMap, order); // 保存订单
        orderItemDao.save(paramMap, orderItems); // 保存订单项
        //del by yangaming 团购不清空购物车
        //cartItemDao.deleteBatch(tenantId, "memberId", order.getMemberId()); // 删除购物车里的商品
        // 记录日志
        saveOrderLog(paramMap, order, "买家成功提交订单", true);

        return order;
    }

	@Override
	public Order saveOrderJiuTouYa(Map<String, Object> paramMap, Map pMap) throws Exception {

		Order order = JSON.parseObject(JSON.toJSONString(pMap.get("order")), Order.class);
		String orderSn = OrderGenerator.generator();
		order.setOrderSn(orderSn);
		order.setCreateUser(pMap.get("createUser").toString());
		List<OrderItem> orderItems = new ArrayList<OrderItem>();
		OrderItem item;
		double goodsTotalPrice = 0;
		List<Map<String, Object>> orderItemMapList = JSON.parseObject(JSON.toJSONString(pMap.get("orderItems")), List.class);
		for (Map<String, Object> map : orderItemMapList) {
			item = JSON.parseObject(JSON.toJSONString(map), OrderItem.class);
			item.setOrderSn(orderSn);
			item.setCreateUser(pMap.get("createUser").toString());
			Goods goods = goodsDao.getGoodsByBatchType(paramMap, item.getGoodsId());
			item.setGoodsPrice(goods.getPrice());
			item.setGoodsName(goods.getName());
			orderItems.add(item);
			goodsTotalPrice += goods.getPrice() * item.getQuantity();

            if (goods.getStock() != null) {     // 如果录入了库存，包括库存为0
                if (goods.getStock() - item.getQuantity() >= 0) {
                    goods.setStock(goods.getStock() - item.getQuantity());
                    goodsDao.update(paramMap, goods);
                } else {
                    throw new Exception("库存不足");
                }
            }
		}
		// 重新再计算商品总价格和订单总额
		order.setGoodsTotalPrice(goodsTotalPrice);
		order.setTotalAmount(goodsTotalPrice + order.getDeliveryFee());
		// 设置订单状态、支付状态、配送状态
		order.setOrderStatus(Order.OrderStatus.unconfirm);
		order.setPaymentStatus(Order.PaymentStatus.unpaid);
		order.setShippingStatus(Order.ShippingStatus.unshipped);
		order.setType(0);

		order = orderDao.save(paramMap, order); // 保存订单
		orderItemDao.save(paramMap, orderItems); // 保存订单项
		cartItemDao.deleteBatch(paramMap, "memberId", order.getMemberId()); // 删除购物车里的商品
		// 记录日志
		saveOrderLog(paramMap, order, "买家成功提交订单", true);

		return order;

	}

	@Override
	public List<Order> getHourOrderList(Map<String, Object> paramMap, int hour, int type) {
		return orderDao.getHourOrderList(paramMap, hour, type);
	}

	@Override
	public int updateHourOrder(Map<String, Object> paramMap, List<Order> list, List<Goods> goodsList) throws Exception {
		int count[] = orderDao.update(paramMap, list);
		goodsDao.update(paramMap, goodsList);
		return count.length;
	}

	/**
	 * 出库
	 *
	 * @param orderDistributionList 配送单列表
	 *
	 * @return 日志信息
	 */
	public List<String> outStorage(Map<String, Object> paramMap, List<OrderDistribution> orderDistributionList) {
		List<String> logInfoList = new ArrayList<String>();
		Order order;
		for (OrderDistribution od : orderDistributionList) {
			order = orderDao.find(paramMap, "orderSn", od.getOrderSn());
			if (order != null && order.getShippingStatus().equals(Order.ShippingStatus.sorting)) {

				String oldOrderStatus = order.getOrderStatus()+"";
				String oldShippingStatus = order.getShippingStatus()+"";

				order.setOrderStatus(Order.OrderStatus.wait_buyer_confirm_goods);
				order.setShippingStatus(Order.ShippingStatus.shipped);
				order.setModifyDate( new Date() );
				orderDao.update(paramMap, order);
				DeliveryMan dm = deliveryManDao.get(paramMap, od.getDeliveryManId());
				String logInfo = "订单号:" + order.getOrderSn() + "的订单在" + DateUtil.toString(new Date(), DateUtil.Format_DateTime +
						"已由　" + od.getDeliveryManName() + "[" + od.getDeliveryManId() + "] 负责配送，配送员电话:" + dm.getMobile());


//				saveOrderLog(tenantId, order, logInfo, false);
				saveOrderLog(paramMap, order,Order.OrderStatus.wait_buyer_confirm_goods+"", oldOrderStatus,OrderLog.StatusType.order+"", logInfo, false);
				saveOrderLog(paramMap, order,Order.ShippingStatus.shipped+"", oldShippingStatus,OrderLog.StatusType.shipping+"", logInfo, false);

				logInfoList.add(logInfo);
			}
		}

		return logInfoList;
	}

	@Override
	public List<Order> getConfirmOrderList(Map<String, Object> paramMap, int hour) {
		return orderDao.getConfirmOrderList(paramMap, hour);
	}

	@Override
	public PayType getPayAmount(Map<String, Object> paramMap, String start,String end) {
		return orderDao.getPayAmount(paramMap, start, end);
	}

	/**
	 * 后台操作员取消订单
	 *
	 * @param paramMap   租户Id
	 * @param orderList  订单对象列表
	 * @param operator   操作员名称
	 * @param operatorId 操作员Id
	 */
	public List<Order> cancelOrderByOperator(Map<String, Object> paramMap, List<Order> orderList, String operator, String operatorId) {
		if (orderList != null && orderList.size() > 0) {
			for (Order order : orderList) {
				String oldOrderStatus = order.getOrderStatus()+"";
				order.setOrderStatus(Order.OrderStatus.cancel);
				order.setModifyDate( new Date() );
				orderDao.update(paramMap, order);
				String logInfo = "操作员：" + operator + "[" + operatorId + "]在 " + DateUtils.format(new Date(), DateUtils.SHOW_DATETIME_FORMAT) + " 通过后台操作取消了订单号为：【" + order.getId() + "】的订单";
//				saveOrderLog(tenantId, order, logInfo, false);

				saveOrderLog(paramMap, order,Order.OrderStatus.cancel+"",oldOrderStatus, OrderLog.StatusType.order+"", logInfo, false);
			}
		}

		return orderList;
	}

	/**
	 * 获取商品日报
	 * @return
	 */
	@Override
	public List<Map<String, Object>> getGoodsDayReport(Map<String, Object> paramMap){
		return orderDao.getGoodsDayReport(paramMap);
	}

	/**
     * 订单商品报表
     * @param paramMap
     * @param criteria
     * @return
     */
	@Override
    public List<Map<String, Object>> getOrderGoodsReport(Map<String, Object> paramMap, Criteria criteria){
    	return orderDao.getOrderGoodsReport(paramMap, criteria);
    }

	/**
     * 商品报表
     * @param paramMap
     * @param criteria
     * @return
     */
	@Override
	public List<Map<String, Object>> getGoodsReport(Map<String, Object> paramMap, Criteria criteria){
		return orderDao.getGoodsReport(paramMap, criteria);
	}


	/**
	 * 根据订单商品项编号itemid取消单个商品，是否增减库存flag
	 * @param paramMap
	 * @param itemId
	 * @param flag 0：不操作；1：增加库存
	 * @param operator
	 * @param operatorId
	 * @return
	 */
    public boolean updateOrderItemCancel(Map<String, Object> paramMap, String itemId, int flag ,String operator, String operatorId){
    	OrderItem item = orderItemDao.get(paramMap, itemId);
    	if(item != null){
    		//--更新订单
    		Order order = orderDao.find(paramMap, "orderSn", item.getOrderSn());

			String oldOrderStatus = order.getOrderStatus()+"";

			order.setGoodsTotalQuantity(order.getGoodsTotalQuantity() - item.getQuantity());
    		order.setGoodsTotalPrice(order.getGoodsTotalPrice() - item.getQuantity()*item.getGoodsPrice());
    		order.setTotalAmount(order.getTotalAmount() - item.getQuantity()*item.getGoodsPrice());
    		order.setModifyUser(operator);
    		order.setModifyDate(new Date());
    		orderDao.update(paramMap, order);
    		//--记录订单日志
    		String logInfo = "操作员：" + operator + "[" + operatorId + "]在 " + DateUtils.format(new Date(), DateUtils.SHOW_DATETIME_FORMAT) + " 通过后台操作取消了订单号：【" + order.getId() + "】中的商品【"+item.getGoodsName()+"("+item.getGoodsId()+")】";
    		OrderLog log = new OrderLog();
			log.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
			log.setOrderSn(item.getOrderSn());
			log.setType(Order.OrderStatus.invalid+"");
			log.setInfo(logInfo);
			log.setOperator(operator);
			log.setCreateUser(operator);
			log.setStatusType(OrderLog.StatusType.order.toString());
			log.setOldType(oldOrderStatus);
    		orderLogDao.save(paramMap, log);
//    		saveOrderLog(tenantId, order, logInfo, false);

			//--更新orderitem
    		item.setStatus(1);
    		item.setModifyUser(operator);
    		item.setModifyDate(new Date());
    		orderItemDao.update(paramMap, item);
    		//--更新商品库存
    		if(flag == 1){
    			Goods goods = goodsDao.get(paramMap, item.getGoodsId());
    			goods.setStock(goods.getStock() + item.getQuantity());
    		}
    	}
    	return true;
    }

	@Override
	public List<Map<String, Object>> getPassengerByTime(Map<String, Object> paramMap,
			String start, String end) {

		return orderDao.getPassengerByTime(paramMap, start,end);
	}

	@Override
	public List<Map<String, Object>> getOrderModeByTime(Map<String, Object> paramMap,
			String start, String end) {
		return orderDao.getOrderModeByTime(paramMap, start, end);
	}

	@Override
	public List<Order> findListByOrderSns(Map<String, Object> paramMap, List<String> orderSns) throws Exception {
		return orderDao.findListByOrderSns(paramMap, orderSns);
	}


	/**
	 * 确认到货
	 * @param paramMap
	 *            租户Id
	 * @param orderId
	 *            订单Id
	 *
	 * @return
	 *
	 * TianYu 2016-3-7 16:30:02
	 */
	public Order validateGoods(Map<String, Object> paramMap, String orderId) {
		// 记录日志
//		saveOrderLog(tenantId, order, "订单确认收货", false);

		Order oldOrder = orderDao.get(paramMap, orderId);
        String oldOrderStatus = oldOrder.getOrderStatus()+"";
        String oldPaymentStatus = oldOrder.getPaymentStatus()+"";
        String oldShippingStatus = oldOrder.getShippingStatus()+"";
		if(Order.IsOriginal.huizong.name().equals(oldOrder.getIsOriginal())){

            //如果汇总单的状态不是等待买家收货，则不再继续处理
            if(!Order.OrderStatus.wait_buyer_confirm_goods.equals(oldOrder.getOrderStatus())){
                return null;
            }
            //更新汇总单
            Order order = updateOrderStatus(paramMap, orderId, Order.OrderStatus.wait_buyer_validate_goods, Order.PaymentStatus.paid, Order.ShippingStatus.takeover);

            // 记录日志
            if( !oldOrderStatus.equals( Order.OrderStatus.wait_buyer_validate_goods.toString() ) ){
                saveOrderLog(paramMap, order,Order.OrderStatus.wait_buyer_validate_goods+"",oldOrderStatus, OrderLog.StatusType.order+"", "订单确认到货", false);
            }
            if( !oldPaymentStatus.equals( Order.PaymentStatus.paid.toString() ) ) {
                saveOrderLog(paramMap, order,  Order.PaymentStatus.paid + "",oldPaymentStatus, OrderLog.StatusType.payment + "", "买家成功支付订单", false);
            }
            if( !oldShippingStatus.equals( Order.ShippingStatus.takeover.toString() ) ) {
                saveOrderLog(paramMap, order,  Order.ShippingStatus.takeover + "", oldShippingStatus, OrderLog.StatusType.shipping + "", "买家确认收货", false);
            }


            //更新所有子单
            List<Order> orders = this.orderDao.findList(paramMap,"parentSn", oldOrder.getOrderSn());
            for(Order subOrder: orders){
                //如果子单的状态不是等待买家收货，则跳过当前子弹，继续处理下一条子单
                if(!Order.OrderStatus.wait_buyer_confirm_goods.equals(subOrder.getOrderStatus())){
                    continue;
                }

                String orderStatus = subOrder.getOrderStatus()+"";
                String paymentStatus = subOrder.getPaymentStatus()+"";
                String shippingStatus = subOrder.getShippingStatus()+"";

                Order subOrderNew = updateOrderStatus(paramMap, subOrder.getId(), Order.OrderStatus.wait_buyer_validate_goods, Order.PaymentStatus.paid, Order.ShippingStatus.takeover);

                // 记录日志

                if( !orderStatus.equals( Order.OrderStatus.wait_buyer_validate_goods.toString() ) ){
                    saveOrderLog(paramMap, subOrderNew,Order.OrderStatus.wait_buyer_validate_goods+"",orderStatus, OrderLog.StatusType.order+"", "订单确认到货", false);
                }
                if( !paymentStatus.equals( Order.PaymentStatus.paid.toString() ) ) {
                    saveOrderLog(paramMap, subOrderNew,  Order.PaymentStatus.paid + "",paymentStatus, OrderLog.StatusType.payment + "", "买家成功支付订单", false);
                }
                if( !shippingStatus.equals( Order.ShippingStatus.takeover.toString() ) ) {
                    saveOrderLog(paramMap, subOrderNew,  Order.ShippingStatus.takeover + "", shippingStatus, OrderLog.StatusType.shipping + "", "买家确认收货", false);
                }
            }

            return order;
		}else{


			Order order = updateOrderStatus(paramMap, orderId, Order.OrderStatus.wait_buyer_validate_goods, Order.PaymentStatus.paid, Order.ShippingStatus.takeover);

			// 记录日志
            //		saveOrderLog(tenantId, order, "买家成功支付订单，系统自动确认收货！", false);
			if( !oldOrderStatus.equals( Order.OrderStatus.wait_buyer_validate_goods.toString() ) ){
				saveOrderLog(paramMap, order,Order.OrderStatus.wait_buyer_validate_goods+"",oldOrderStatus, OrderLog.StatusType.order+"", "订单确认到货", false);
			}
			if( !oldPaymentStatus.equals( Order.PaymentStatus.paid.toString() ) ) {
				saveOrderLog(paramMap, order,  Order.PaymentStatus.paid + "",oldPaymentStatus, OrderLog.StatusType.payment + "", "买家成功支付订单", false);
			}
			if( !oldShippingStatus.equals( Order.ShippingStatus.takeover.toString() ) ) {
				saveOrderLog(paramMap, order,  Order.ShippingStatus.takeover + "", oldShippingStatus, OrderLog.StatusType.shipping + "", "买家确认收货", false);
			}

			//如果存在汇总单，更新汇总单的订单状态
			if( StringUtil.isNotEmpty(order.getParentSn()) ){
				boolean isChange = true;
				List<Order> orders = this.orderDao.findList(paramMap,"parentSn", order.getParentSn());

				if( orders != null && orders.size() > 0 ){
					for(Order o : orders){
						//如果存在子单的状态不是 等待买家验货， 不更新汇总单状态
						if( !orderId.equals(o.getId()) && !o.getOrderStatus().equals(Order.OrderStatus.wait_buyer_validate_goods) ){
							isChange = false;
							break;
						}
					}
				}

				//如果所有子单的状态都为 等待买家验货  Order.OrderStatus.wait_buyer_validate_goods
				//汇总单状态也改为 等待买家验货  Order.OrderStatus.wait_buyer_validate_goods
				if(isChange){
					Order parentOrder = this.orderDao.find(paramMap, "orderSn",order.getParentSn());

					if( parentOrder != null ){
						//更新状态
						updateOrderStatus(paramMap, parentOrder.getId(), Order.OrderStatus.wait_buyer_validate_goods, Order.PaymentStatus.paid, Order.ShippingStatus.takeover);

						if( !parentOrder.getOrderStatus().equals(Order.OrderStatus.wait_buyer_validate_goods) ){
							saveOrderLog(paramMap, order, Order.OrderStatus.wait_buyer_validate_goods + "", parentOrder.getOrderStatus() + "", OrderLog.StatusType.order + "", "汇总单确认到货", false);
						}
					}

				}
			}
			return order;
		}

	}


	public List<Order> queryOrderGoodsAbnormal(Map<String, Object> paramMap, Criteria criteriar) throws Exception {
		return orderDao.queryOrderGoodsAbnormal(paramMap, criteriar);
	}


	/**
	 * 20160718 dzz
	 * 1.查询当前众筹商品已众筹商品数量总数 (条件: 订单类型orderType:1, 商品Id, 众筹开始结束时间范围)
	 * 2.查询当前用户所众筹商品数量总数 (条件: 订单类型orderType:1, 商品Id, 众筹开始结束时间范围, 当前用户Id)
	 * @param paramMap
	 * @param criteria
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getZCQuantitySum(Map<String, Object> paramMap, Criteria criteria) throws Exception {
		return orderDao.getZCQuantitySum(paramMap, criteria);
	}

}
