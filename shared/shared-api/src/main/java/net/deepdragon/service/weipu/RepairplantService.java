package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.Cartype;
import net.deepdragon.entity.weipu.Repairplant;

import java.util.List;
import java.util.Map;

/**
 * 维修厂信息数据接口
 */
public interface RepairplantService extends BaseService<Repairplant, String> {
	/**
	 * 
	 * @param paramMap
	 * @param repairplant 维修厂信息
	 * @param schedules 主营车型
	 * @return
	 */
	Repairplant saveRepairPlant(Map<String, Object> paramMap, Repairplant repairplant, String schedules);

	/**
	 * 维修厂信息
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param ids
	 *            方案Ids集合
	 * 
	 * @return 处理了多少项数据
	 */
	void deleteRepairPlant(Map<String, Object> paramMap, List<String> ids);

	/**
	 * 
	 * @param paramMap
	 * @param repairplant 维修厂信息
	 * @param schedules 主营车型
	 * @return
	 */
	void updateRepairPlant(Map<String, Object> paramMap, Repairplant repairplant, String schedules);
	
	/**
	 * 
	 * @param paramMap
	 * @param repairId
	 * @return
	 */
	List<Cartype> getRepairtCartype(Map<String, Object> paramMap, String repairId);
}
