package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.Cartype;
import net.deepdragon.entity.weipu.Repairplant;

import java.util.List;
import java.util.Map;

public interface RepairplantDao extends BaseDao<Repairplant, String> {
	/**
	 * 
	 * @param repairId 维修厂ID
	 * @param cartypeId 车型ID
	 */
	void saveRepairtCartypeMapping(String repairId, String cartypeId);

	void deleteRepairtCartype(Map<String, Object> paramMap, String repairId);
	
	List<Cartype> getRepairtCartype(Map<String, Object> paramMap ,String repairId);
}
