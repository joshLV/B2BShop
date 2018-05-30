package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.CarBrandDao;
import net.deepdragon.entity.weipu.CarBrand;
import net.deepdragon.service.weipu.CarBrandService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(Weipu.SIGN+"CarBrandServiceImpl")
public class CarBrandServiceImpl extends BaseServiceImpl<CarBrand, String> implements CarBrandService{

	@Resource(name= Weipu.SIGN+"CarBrandDaoImpl")
	private CarBrandDao carBrandDao;
	
	@Override
	public BaseDao<CarBrand, String> getBaseDao() {
		return this.carBrandDao;
	}
	
}

