package net.deepdragon.service.weipu.impl;

import net.deepdragon.bean.PageList;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.*;
import net.deepdragon.entity.weipu.Order;
import net.deepdragon.entity.weipu.OrderPaylog;
import net.deepdragon.entity.weipu.OrderRefund;
import net.deepdragon.entity.weipu.OrderRefundLog;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.service.weipu.OrderRefundLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN + "OrderRefundLogServiceImpl")
public class OrderRefundLogServiceImpl extends BaseServiceImpl<OrderRefundLog, String> implements OrderRefundLogService {

	@Resource(name = Weipu.SIGN + "OrderRefundLogDaoImpl")
	private OrderRefundLogDao orderRefundLogDao;

	@Resource(name = Weipu.SIGN + "OrderRefundDaoImpl")
	private OrderRefundDao orderRefundDao;
	
	@Resource(name = Weipu.SIGN + "OrderDaoImpl")
	private OrderDao orderDao;
	
	@Resource(name = Weipu.SIGN + "OrderPaylogDaoImpl")
	private OrderPaylogDao orderPaylogDao;

	@Override
	public BaseDao<OrderRefundLog, String> getBaseDao() {
		return this.orderRefundLogDao;
	}

	@Override
	public void savelog(Map<String,Object> paramMap, OrderRefundLog orderRefundLog) {
		OrderRefund orderRefund = orderRefundDao.get(paramMap, orderRefundLog.getRefundId());
		orderRefund.setStatus(orderRefundLog.getType());
		orderRefund.setAttn(orderRefundLog.getCreateUser());
		orderRefund.setModifyUser(orderRefundLog.getCreateUser());
		orderRefund.setModifyDate(orderRefundLog.getModifyDate());
		orderRefund.setCardNo(orderRefundLog.getCardNo());
		orderRefundDao.update(paramMap, orderRefund);
		orderRefundLogDao.save(paramMap, orderRefundLog);
		if(orderRefundLog.getType().toString().equals("refunded")){
			Order order = orderDao.find(paramMap, "orderSn", orderRefundLog.getOrderSn());
			order.setPaymentStatus(Order.PaymentStatus.refunding);
			orderDao.update(paramMap, order);
			//生成支付记录
			OrderPaylog orderPaylog = new OrderPaylog();
            orderPaylog.setOrderSn(orderRefundLog.getOrderSn());
            orderPaylog.setMemberId(order.getMemberId());
            orderPaylog.setNo(orderRefundLog.getCardNo());
            orderPaylog.setUniqueno("");
            orderPaylog.setInfo("退款成功!");
            orderPaylog.setAmount(orderRefund.getAmount());
            orderPaylog.setCreateUser(order.getCreateUser());
            orderPaylog.setCreateDate(new Date());
            orderPaylog.setSign("refund");
            orderPaylog.setName("订单退款");
            orderPaylog.setStatus("true");
            orderPaylogDao.save(paramMap, orderPaylog);
		}
	}
	
	@Override
	public void eRPRefund(Map<String,Object> paramMap,OrderRefund orderRefund) {
		OrderRefundLog orderRefundLog = new OrderRefundLog();
		OrderRefund newOrderRefund = new OrderRefund();
		newOrderRefund =orderRefundDao.save(paramMap, orderRefund);
		orderRefundLog.setCreateUser(newOrderRefund.getCreateUser());
		orderRefundLog.setCreateDate(newOrderRefund.getCreateDate());
		orderRefundLog.setInfo(newOrderRefund.getInfo());
		orderRefundLog.setOperator(newOrderRefund.getCreateUser());
		orderRefundLog.setOrderSn(newOrderRefund.getOrderSn());
		orderRefundLog.setRefundId(newOrderRefund.getId());
		orderRefundLog.setType(newOrderRefund.getStatus());
		orderRefundLogDao.save(paramMap, orderRefundLog);
	}

	@Override
	public Pager getRefundLogPager(Map<String,Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		try {
			PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
			List<OrderRefundLog> list = orderRefundLogDao.getRefundLogPager(paramMap, criteria, pageBounds);
			pager.setList(list);
			PageList<OrderRefundLog> pageList = (PageList<OrderRefundLog>) list;
			pager.setTotalCount(pageList.getPaginator().getTotalCount());
			return pager;
		} catch (Exception e) {
			throw e;
		}
	}

}
