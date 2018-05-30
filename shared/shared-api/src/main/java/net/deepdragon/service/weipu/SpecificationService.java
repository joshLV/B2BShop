package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.Specification;
import net.deepdragon.entity.weipu.SpecificationValue;

import java.util.List;
import java.util.Map;

/**
 * 规格定义表数据接口
 */
public interface SpecificationService extends
		BaseService<Specification, String> {

	/**
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param specification
	 *            规格信息
	 * @param entity
	 *            规格参数集合
	 * @return
	 * @throws Exception
	 */
	Boolean saveSpecificationAndValues(Map<String, Object> paramMap,
									   Specification specification, List<SpecificationValue> entity)
			throws Exception;

	/**
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param specification
	 *            规格信息
	 * @param id
	 *            规格信息ID
	 * @param entity
	 *            规格详情集合
	 * @return
	 * @throws Exception
	 */
	Boolean updateSpecificationAndValues(Map<String, Object> paramMap,
										 Specification specification, List<String> deleteallId,
										 List<SpecificationValue> updatentity,
										 List<SpecificationValue> saveentity) throws Exception;

	/**
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param specificationList
	 *            规格ID集合
	 * @param specificationIds
	 * @return
	 */
	Boolean deleteAsseSpecificationAndValues(Map<String, Object> paramMap,
											 List<String> asList, List<String> allId) throws Exception;

}
