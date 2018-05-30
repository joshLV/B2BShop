package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.dao.weipu.QuotationDao;
import net.deepdragon.entity.weipu.Quotation;
import net.deepdragon.mybatis.domain.PageBounds;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 报价表数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "QuotationDaoImpl")
public class QuotationDaoImpl extends BaseDaoImpl<Quotation, String> implements QuotationDao {

	@Override
	public List<Map<String,Object>> getPagerByEnquiryId(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) {
		String defaultStatement = Quotation.class.getName()
				+ "Mapper.getPagerByEnquiryId";

		return this.sqlSessionTemplateFactory.getSqlSessionTemplate()
				.selectList(defaultStatement, criteria, pageBounds);
	}

	@Override
	public List<Map<String, Object>> getListByEnquiryId(Map<String, Object> paramMap, Criteria criteria) {
		String defaultStatement = Quotation.class.getName() + "Mapper.getListByEnquiryId";

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, criteria);
	}


	public int updateQuotationToDown(Map<String, Object> paramMap,int isDownOrder,String quotationId) {
		String defaultStatement = Quotation.class.getName() + "Mapper.updateQuotationToDown";
		paramMap.put("isDownOrder", isDownOrder);
		paramMap.put("quotationId", quotationId);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().update(defaultStatement, paramMap);
	}
}
