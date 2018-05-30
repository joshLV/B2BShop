package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.SpecificationValueDao;
import net.deepdragon.entity.weipu.SpecificationValue;
import net.deepdragon.service.weipu.SpecificationValueService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"SpecificationValueServiceImpl")
public class SpecificationValueServiceImpl extends BaseServiceImpl<SpecificationValue, String> implements SpecificationValueService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"SpecificationValueDaoImpl")
	private SpecificationValueDao specificationValueDao;
	
	@Override
	public BaseDao<SpecificationValue, String> getBaseDao() {
		return this.specificationValueDao;
	}
	
}

