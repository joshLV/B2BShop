package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.BuyerInvoiceDao;
import net.deepdragon.entity.weipu.BuyerInvoice;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

/**
 * 采购商发票信息数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "BuyerInvoiceDaoImpl")
public class BuyerInvoiceDaoImpl extends BaseDaoImpl<BuyerInvoice, String> implements
		BuyerInvoiceDao {

	@Override
	public BuyerInvoice getDefaultInvoiceInfo(Map<String, Object> paramMap, String buyerId) {
		String defaultStatement = BuyerInvoice.class.getName() + "Mapper.getDefault";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("buyerId",buyerId);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(defaultStatement,parameter);
	}

	@Override
	public void updateDefault(Map<String, Object> paramMap, String buyerId, String id) {
		String defaultStatement = BuyerInvoice.class.getName() + "Mapper.updateDefault";
		paramMap.put("buyerId",buyerId);
		if(id != null) {
			paramMap.put("id", id);
		}
		sqlSessionTemplateFactory.getSqlSessionTemplate().update(defaultStatement,paramMap);
	}
}
