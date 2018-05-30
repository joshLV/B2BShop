package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.OrderRefundDao;
import net.deepdragon.entity.weipu.OrderRefund;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

/**
 * 退款单信息数据接口实现
*/
@Repository(Weipu.SIGN + "OrderRefundDaoImpl")
public class OrderRefundDaoImpl extends BaseDaoImpl<OrderRefund, String> implements
		OrderRefundDao {
	@Override
	public void updateGoodsStock(String goodsId, Integer stock) {
		String defaultStatement = OrderRefund.class.getName() + "Mapper.updateGoodsStock";

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("goodsId",goodsId);
		param.put("quantity",stock);

		sqlSessionTemplateFactory.getSqlSessionTemplate().update(defaultStatement,param);
	}
}
