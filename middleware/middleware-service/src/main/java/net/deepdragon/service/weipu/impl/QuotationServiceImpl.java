package net.deepdragon.service.weipu.impl;


import net.deepdragon.bean.PageList;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.QuotationDao;
import net.deepdragon.entity.weipu.Quotation;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.service.weipu.QuotationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"QuotationServiceImpl")
public class QuotationServiceImpl extends BaseServiceImpl<Quotation, String> implements QuotationService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"QuotationDaoImpl")
	private QuotationDao quotationDao;
	
	@Override
	public BaseDao<Quotation, String> getBaseDao() {
		return this.quotationDao;
	}

	@Override
	public Pager getPagerByEnquiryId(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		try {
			pager.setOrderBy("o.createDate");
			PageBounds pageBounds = new PageBounds(pager.getPageNumber(),
					pager.getPageSize());
			List<Map<String,Object>> list = quotationDao.getPagerByEnquiryId(paramMap, criteria, pageBounds);
			pager.setList(list);
			PageList<Map<String,Object>> pageList = (PageList<Map<String,Object>>) list;
			pager.setTotalCount(pageList.getPaginator().getTotalCount());
			return pager;
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<Map<String, Object>> getListByEnquiryId(Map<String, Object> paramMap, Criteria criteria) throws Exception {
		try {
			return quotationDao.getListByEnquiryId(paramMap, criteria);
		} catch (Exception e) {
			throw e;
		}
	}
}

