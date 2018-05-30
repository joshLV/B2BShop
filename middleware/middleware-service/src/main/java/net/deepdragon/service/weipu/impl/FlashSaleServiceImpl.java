package net.deepdragon.service.weipu.impl;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.FlashSaleDao;
import net.deepdragon.entity.weipu.FlashSale;
import net.deepdragon.service.weipu.FlashSaleService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN + "FlashSaleServiceImpl")
public class FlashSaleServiceImpl extends BaseServiceImpl<FlashSale, String> implements FlashSaleService {

	@Resource(name = net.deepdragon.constant.weipu.Weipu.SIGN + "FlashSaleDaoImpl")
	private FlashSaleDao flashSaleDao;

	@Override
	public BaseDao<FlashSale, String> getBaseDao() {
		return this.flashSaleDao;
	}

	@Override
	public boolean svaeFlashSale(Map<String, Object> paramMap, List<FlashSale> flashSaleList, String detailId) {
		try {
			if (StringUtils.isNotEmpty(detailId)) {
				flashSaleDao.delFlashSale(paramMap, detailId);
			}
			if (CollectionUtils.isNotEmpty(flashSaleList)) {
				for (FlashSale flashSale : flashSaleList) {
					flashSaleDao.saveFlashSale(paramMap, flashSale);
				}
			}
		} catch (Exception e) {
			logger.error("修改活动商品时");
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public List<Map<String, Object>> getFlashSaleGoods(Map<String, Object> paramMap, int type) {
		return flashSaleDao.getFlashSaleGoods(paramMap, type);
	}
	
	@Override
	public List<Map<String,Object>> getAllFlashSaleGoods(Map<String, Object> paramMap,int type){
		return flashSaleDao.getAllFlashSaleGoods(paramMap, type);
	}
}
