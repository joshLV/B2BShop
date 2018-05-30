package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.QuotationDetailsDao;
import net.deepdragon.entity.weipu.QuotationDetails;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 报价详情表数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "QuotationDetailsDaoImpl")
public class QuotationDetailsDaoImpl extends BaseDaoImpl<QuotationDetails, String> implements
		QuotationDetailsDao {

	@Override
	public List<QuotationDetails> getListByQuotationId(Map<String, Object> paramMap, String quotationId) {
		String defaultStatement = QuotationDetails.class.getName() + "Mapper.getListByQuotationId";
		paramMap.put("quotationId", quotationId);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}
}
