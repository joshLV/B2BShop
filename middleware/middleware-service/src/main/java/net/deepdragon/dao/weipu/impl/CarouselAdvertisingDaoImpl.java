package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.CarouselAdvertisingDao;
import net.deepdragon.entity.weipu.CarouselAdvertising;
import org.springframework.stereotype.Repository;

/**
 * 轮播广告数据接口实现
*/
@Repository(Weipu.SIGN + "CarouselAdvertisingDaoImpl")
public class CarouselAdvertisingDaoImpl extends BaseDaoImpl<CarouselAdvertising, String> implements
		CarouselAdvertisingDao {

}
