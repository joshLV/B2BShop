package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.QuotationDetailsDao;
import net.deepdragon.entity.weipu.QuotationDetails;
import net.deepdragon.service.weipu.QuotationDetailsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"QuotationDetailsServiceImpl")
public class QuotationDetailsServiceImpl extends BaseServiceImpl<QuotationDetails, String> implements QuotationDetailsService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"QuotationDetailsDaoImpl")
	private QuotationDetailsDao quotationDetailsDao;
	
	@Override
	public BaseDao<QuotationDetails, String> getBaseDao() {
		return this.quotationDetailsDao;
	}

	@Override
	public List<QuotationDetails> getListByQuotationId(Map<String, Object> paramMap, String quotationId) {
		return quotationDetailsDao.getListByQuotationId(paramMap,quotationId);
	}
}

