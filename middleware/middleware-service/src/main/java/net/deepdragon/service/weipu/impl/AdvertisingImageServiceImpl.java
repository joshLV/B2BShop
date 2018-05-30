package net.deepdragon.service.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.AdvertisingImageDao;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.entity.weipu.AdvertisingImage;
import net.deepdragon.service.weipu.AdvertisingImageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN
		+ "AdvertisingImageServiceImpl")
public class AdvertisingImageServiceImpl extends
		BaseServiceImpl<AdvertisingImage, String> implements
		AdvertisingImageService {

	@Resource(name = Weipu.SIGN
			+ "AdvertisingImageDaoImpl")
	private AdvertisingImageDao advertisingImageDao;

	@Override
	public BaseDao<AdvertisingImage, String> getBaseDao() {
		return this.advertisingImageDao;
	}

	@Override
	public List<AdvertisingImage> getAds(Map<String, Object> paramMap, String sign, int size)
			throws Exception {
		try {
			return this.advertisingImageDao.getAds(paramMap, sign, size);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<AdvertisingImage> getNewAds(Map<String, Object> paramMap, String sign,
			int size) throws Exception {
		try {
			return this.advertisingImageDao.getNewAds(paramMap, sign, size);
		} catch (Exception e) {
			throw e;
		}
	}

}
