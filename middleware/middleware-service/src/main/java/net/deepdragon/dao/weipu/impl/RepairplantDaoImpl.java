package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.RepairplantDao;
import net.deepdragon.entity.weipu.Cartype;
import net.deepdragon.entity.weipu.Repairplant;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 维修厂信息数据接口实现
 */
@Repository(Weipu.SIGN + "RepairplantDaoImpl")
public class RepairplantDaoImpl extends BaseDaoImpl<Repairplant, String> implements RepairplantDao {

	@Override
	public void deleteRepairtCartype(Map<String, Object> paramMap, String repairId) {
		String defaultStatement = Repairplant.class.getName() + "Mapper.deleteRepairtCartype";
		this.sqlSessionTemplateFactory.getSqlSessionTemplate().delete(defaultStatement, repairId);
	}

	@Override
	public List<Cartype> getRepairtCartype(Map<String, Object> paramMap, String repairId) {
		String defaultStatement = Repairplant.class.getName() + "Mapper.getRepairtCartype";
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, repairId);
	}

	@Override
	public void saveRepairtCartypeMapping(String repairId, String cartypeId) {
		String defaultStatement = Repairplant.class.getName() + "Mapper.saveRepairtCartypeMapping";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("repairId", repairId);
		parameter.put("cartypeId", cartypeId);
		this.sqlSessionTemplateFactory.getSqlSessionTemplate().insert(defaultStatement, parameter);
	}
}
