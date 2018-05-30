package net.deepdragon.service.weipu.impl;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.SpecificationDao;
import net.deepdragon.dao.weipu.SpecificationValueDao;
import net.deepdragon.entity.weipu.Specification;
import net.deepdragon.entity.weipu.SpecificationValue;
import net.deepdragon.service.weipu.SpecificationService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN + "SpecificationServiceImpl")
public class SpecificationServiceImpl extends
		BaseServiceImpl<Specification, String> implements SpecificationService {

	@Resource(name = net.deepdragon.constant.weipu.Weipu.SIGN
			+ "SpecificationDaoImpl")
	private SpecificationDao specificationDao;
	@Resource(name = net.deepdragon.constant.weipu.Weipu.SIGN
			+ "SpecificationValueDaoImpl")
	private SpecificationValueDao specificationValueDao;

	@Override
	public BaseDao<Specification, String> getBaseDao() {
		return this.specificationDao;
	}

	@Override
	public Boolean saveSpecificationAndValues(Map<String, Object> paramMap,
			Specification specification, List<SpecificationValue> entity)
			throws Exception {
		try {
			Specification s = this.specificationDao.save(paramMap,
					specification);

			if (CollectionUtils.isNotEmpty(entity)) {
				for (SpecificationValue sv : entity) {
					sv.setSpecificationId(s.getId());
				}
				this.specificationValueDao.save(paramMap, entity);
			}
			return true;
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public Boolean updateSpecificationAndValues(Map<String, Object> paramMap,
			Specification specification, List<String> deleteallId,
			List<SpecificationValue> updatentity,
			List<SpecificationValue> saveentity) throws Exception {
		try {
			this.specificationDao.update(paramMap, specification);
			if(CollectionUtils.isNotEmpty(deleteallId)){
				this.specificationValueDao.delete(paramMap, deleteallId);
			}
			if(CollectionUtils.isNotEmpty(updatentity)){
				this.specificationValueDao.update(paramMap, updatentity);
			}
			if(CollectionUtils.isNotEmpty(saveentity)){
				this.specificationValueDao.save(paramMap, saveentity);
			}
			return true;
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public Boolean deleteAsseSpecificationAndValues(Map<String, Object> paramMap,
			List<String> asList, List<String> allId) throws Exception {
		try {
			this.specificationDao.delete(paramMap, asList);
			if(CollectionUtils.isNotEmpty(allId)){
				this.specificationValueDao.delete(paramMap, allId);
			}
			return true;
		} catch (Exception e) {
			throw e;
		}
	}

}
