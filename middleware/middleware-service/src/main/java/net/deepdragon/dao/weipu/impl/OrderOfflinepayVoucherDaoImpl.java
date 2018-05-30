package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.OrderOfflinepayVoucherDao;
import net.deepdragon.entity.weipu.OrderOfflinepayVoucher;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * b2b_order_offlinepay_voucher数据接口实现
*/
@Repository(Weipu.SIGN + "OrderOfflinepayVoucherDaoImpl")
public class OrderOfflinepayVoucherDaoImpl extends BaseDaoImpl<OrderOfflinepayVoucher, String> implements OrderOfflinepayVoucherDao {

	public List<OrderOfflinepayVoucher> findListByOrderSn(Map<String, Object> paramMap,String property, Object value){
		String defaultStatement = OrderOfflinepayVoucher.class.getName() + "Mapper.findListByOrderSn";
		paramMap.put("orderSn", value);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, paramMap);
	}

}
