package net.deepdragon.service.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.CarouselAdvertisingDao;
import net.deepdragon.entity.weipu.CarouselAdvertising;
import net.deepdragon.service.weipu.CarouselAdvertisingService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN
		+ "CarouselAdvertisingServiceImpl")
public class CarouselAdvertisingServiceImpl extends
		BaseServiceImpl<CarouselAdvertising, String> implements
		CarouselAdvertisingService {

	@Resource(name = Weipu.SIGN
			+ "CarouselAdvertisingDaoImpl")
	private CarouselAdvertisingDao carouselAdvertisingDao;

	@Override
	public BaseDao<CarouselAdvertising, String> getBaseDao() {
		return this.carouselAdvertisingDao;
	}

	@Override
	public boolean saveCarouselAdvertisings(Map<String, Object> paramMap,
			List<CarouselAdvertising> updatentity,
			List<CarouselAdvertising> saveentity) throws Exception {
		if (CollectionUtils.isNotEmpty(updatentity)) {
			carouselAdvertisingDao.update(paramMap, updatentity);
		}
		if(CollectionUtils.isNotEmpty(saveentity)){
			carouselAdvertisingDao.save(paramMap, saveentity);
		}
		return false;
	}

}
