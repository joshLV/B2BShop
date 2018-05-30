package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.AdvertisingImageDao;
import net.deepdragon.entity.weipu.AdvertisingImage;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.util.Constant;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 广告图片管理数据接口实现
 */
@Repository(Weipu.SIGN + "AdvertisingImageDaoImpl")
public class AdvertisingImageDaoImpl extends BaseDaoImpl<AdvertisingImage, String> implements AdvertisingImageDao {

	@Override
	public List<AdvertisingImage> getPager(Map<String, Object> paramMap, Criteria criteria,
			PageBounds pageBounds) {
		String defaultStatement = AdvertisingImage.class.getName() + "Mapper.getPager";
		if (criteria == null) {
			criteria = new Criteria();
		}
		criteria.add(Restrictions.eq("a.tenantId", paramMap.get(Constant.TENANTID_KEY)));
		criteria.add(Restrictions.eq("a.platform", paramMap.get(Constant.PLATFORM_KEY)));
		criteria.add(Restrictions.order("a.createDate", "desc"));

		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
	}

	@Override
	public List<AdvertisingImage> getAds(Map<String, Object> paramMap, String sign, int size) {
		String defaultStatement = AdvertisingImage.class.getName() + "Mapper.getAds";

		paramMap.put("sign", sign);
		paramMap.put("size", size);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}

	@Override
	public List<AdvertisingImage> getNewAds(Map<String, Object> paramMap, String sign,
			int size) {
		String defaultStatement = AdvertisingImage.class.getName() + "Mapper.getNewAds";

		paramMap.put("sign", sign);
		paramMap.put("size", size);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}

}
