package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.CarBrandDao;
import net.deepdragon.entity.weipu.CarBrand;
import org.springframework.stereotype.Repository;

/**
 * 汽车品牌表数据接口实现
*/
@Repository(Weipu.SIGN + "CarBrandDaoImpl")
public class CarBrandDaoImpl extends BaseDaoImpl<CarBrand, String> implements
		CarBrandDao {

}
