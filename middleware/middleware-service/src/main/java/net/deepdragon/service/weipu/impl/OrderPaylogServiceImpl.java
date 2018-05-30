package net.deepdragon.service.weipu.impl;

import net.deepdragon.dao.weipu.*;
import net.deepdragon.dao.weipu.impl.AccountLogDaoImpl;
import net.deepdragon.dao.weipu.impl.GhjCreditReplyDaoImpl;
import net.deepdragon.dao.weipu.impl.GhjCreditUsedLogDaoImpl;
import net.deepdragon.dao.weipu.impl.GhjRedenvelopAccesslogDaoImpl;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.weipu.OrderPaylogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN + "OrderPaylogServiceImpl")
public class OrderPaylogServiceImpl extends BaseServiceImpl<OrderPaylog, String> implements OrderPaylogService {

	@Resource(name = net.deepdragon.constant.weipu.Weipu.SIGN + "OrderPaylogDaoImpl")
	private OrderPaylogDao orderPaylogDao;
	@Resource(name = net.deepdragon.constant.weipu.Weipu.SIGN + "AccountDaoImpl")
	private AccountDao accountDao;
	@Resource(name = net.deepdragon.constant.weipu.Weipu.SIGN + "AccountLogDaoImpl")
	private AccountLogDao accountLogDao;
	@Resource(name = net.deepdragon.constant.weipu.Weipu.SIGN + "GhjRedenvelopAccesslogDaoImpl")
	private GhjRedenvelopAccesslogDao redenvelopAccesslogDao;
	@Resource(name = net.deepdragon.constant.weipu.Weipu.SIGN + "GhjCreditReplyDaoImpl")
	private GhjCreditReplyDao ghjCreditReplyDao;
	@Resource(name = net.deepdragon.constant.weipu.Weipu.SIGN + "GhjCreditUsedLogDaoImpl")
	private GhjCreditUsedLogDao ghjCreditUsedLogDao;

	@Override
	public BaseDao<OrderPaylog, String> getBaseDao() {
		return this.orderPaylogDao;
	}

	@Override
	public List<OrderPaylog> getPayCount(Map<String, Object> paramMap, String start, String end) {

		return orderPaylogDao.getPayCount(paramMap, start, end);
	}

	@Override
	public void saveMultiPayData(Map<String, Object> paramMap,MultiPayRecord multiPayRecord) throws Exception {
		//1、账户数据更新
		//2、账户使用日志保存
		if(multiPayRecord.getAccount() != null){
			//使用批量保存
			List<Account> accountList = new ArrayList<Account>(1);
			accountList.add(multiPayRecord.getAccount());
			List<AccountLog> accountLogList = new ArrayList<AccountLog>(1);
			accountLogList.add(multiPayRecord.getAccountLog());
			this.accountDao.update(paramMap, accountList);
			this.accountLogDao.save(paramMap, accountLogList);
		}
		//3、授信回复数据更新
		//4、授信使用日志保存
		if( multiPayRecord.getCreditReplyList() != null && multiPayRecord.getCreditReplyList().size() > 0){
			this.ghjCreditReplyDao.update(paramMap, multiPayRecord.getCreditReplyList());
			this.ghjCreditUsedLogDao.save(paramMap, multiPayRecord.getCreditUsedLogList());
		}
		//5、红包使用日志保存
		if( multiPayRecord.getRedenvelopAccesslogList() != null && multiPayRecord.getRedenvelopAccesslogList().size() > 0 ){
			this.redenvelopAccesslogDao.save(paramMap, multiPayRecord.getRedenvelopAccesslogList());
		}
		//6、支付日志保存
		if( multiPayRecord.getOrderPaylogList() != null && multiPayRecord.getOrderPaylogList().size() > 0){
			this.orderPaylogDao.save(paramMap, multiPayRecord.getOrderPaylogList());
		}
	}

	@Override
	public Double getPaidAmountTotalByOrderSn(Map<String, Object> paramMap, String orderSn, String no)  throws Exception {
		return orderPaylogDao.getPaidAmountTotalByOrderSn(paramMap, orderSn, no);
	}

	@Override
	public List<OrderPaylog> getRPayTotalGroupByR(Map<String, Object> paramMap, String orderSn, String buyerId) throws Exception {
		return orderPaylogDao.getRPayTotalGroupByR(paramMap, orderSn, buyerId);
	}

	@Override
	public List<OrderPaylog> getPayTotalGroupByType(Map<String, Object> paramMap, String orderSn, String buyerId) throws Exception {
		return orderPaylogDao.getPayTotalGroupByType(paramMap, orderSn, buyerId);
	}
}
