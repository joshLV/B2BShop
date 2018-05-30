package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.FlashSalePlandetailDao;
import net.deepdragon.entity.weipu.FlashSalePlandetail;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

/**
 * 秒杀方案明细数据接口实现
 */
@Repository(Weipu.SIGN + "FlashSalePlandetailDaoImpl")
public class FlashSalePlandetailDaoImpl extends BaseDaoImpl<FlashSalePlandetail, String> implements FlashSalePlandetailDao {

	public void deleteDetailByPlanId(Map<String, Object> paramMap, String planId) {
		String defaultStatement = FlashSalePlandetail.class.getName() + "Mapper.deleteDetailByPlanId";
		sqlSessionTemplateFactory.getSqlSessionTemplate().delete(defaultStatement, planId);
	}

	@Override
	public FlashSalePlandetail getFlashSalePlandetail(Map<String, Object> paramMap, String id) {
		String defaultStatement = FlashSalePlandetail.class.getName() + "Mapper.get";
		paramMap.put("id", id);
		return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).selectOne(defaultStatement, paramMap);
	}
}
