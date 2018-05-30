package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.OrderOfflinepayVoucherDao;
import net.deepdragon.entity.weipu.OrderOfflinepayVoucher;
import net.deepdragon.service.weipu.OrderOfflinepayVoucherService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN+"OrderOfflinepayVoucherServiceImpl")
public class OrderOfflinepayVoucherServiceImpl extends BaseServiceImpl<OrderOfflinepayVoucher, String> implements OrderOfflinepayVoucherService {

	@Resource(name = net.deepdragon.constant.weipu.Weipu.SIGN + "OrderOfflinepayVoucherDaoImpl")
	private OrderOfflinepayVoucherDao orderOfflinepayVoucherDao;

	@Override
	public BaseDao<OrderOfflinepayVoucher, String> getBaseDao() {
		return this.orderOfflinepayVoucherDao;
	}

	public List<OrderOfflinepayVoucher> findListByOrderSn(Map<String, Object> paramMap, String property, Object value) {
		return orderOfflinepayVoucherDao.findListByOrderSn(paramMap, property, value);
	}
}

