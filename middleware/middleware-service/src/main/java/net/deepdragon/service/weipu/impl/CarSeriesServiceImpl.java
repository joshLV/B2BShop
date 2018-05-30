package net.deepdragon.service.weipu.impl;


import net.deepdragon.bean.PageList;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.CarSeriesDao;
import net.deepdragon.entity.weipu.CarSeries;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.service.weipu.CarSeriesService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN+"CarSeriesServiceImpl")
public class CarSeriesServiceImpl extends BaseServiceImpl<CarSeries, String> implements CarSeriesService {

	@Resource(name= Weipu.SIGN+"CarSeriesDaoImpl")
	private CarSeriesDao carSeriesDao;
	
	@Override
	public BaseDao<CarSeries, String> getBaseDao() {
		return this.carSeriesDao;
	}

    @Override
    public Pager getSeriesPager(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
        try {
            PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
            List list = carSeriesDao.getSeriesPager(paramMap, criteria, pageBounds);
            pager.setList(list);
            PageList pageList = (PageList) list;
            pager.setTotalCount(pageList.getPaginator().getTotalCount());
            return pager;
        } catch (Exception e) {
            throw e;
        }
    }
}

