package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.EnquiryDao;
import net.deepdragon.entity.weipu.Enquiry;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 询价表数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "EnquiryDaoImpl")
public class EnquiryDaoImpl extends BaseDaoImpl<Enquiry, String> implements
		EnquiryDao {
	@Override
	public int updateState(Enquiry enquiry) {
		String defaultStatement = Enquiry.class.getName() + "Mapper.updateState";

		return sqlSessionTemplateFactory.getSqlSessionTemplate().update(
				defaultStatement, enquiry);
	}

	@Override
	public List<Map<String, Object>> getCount(Map<String, Object> paramMap, String buyerId) {
		String defaultStatement = Enquiry.class.getName() + "Mapper.getCount";

		paramMap.put("buyerId", buyerId);

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}
}
