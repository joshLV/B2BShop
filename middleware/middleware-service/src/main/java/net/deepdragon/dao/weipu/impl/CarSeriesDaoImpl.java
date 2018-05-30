package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.CarSeriesDao;
import net.deepdragon.entity.weipu.CarSeries;
import net.deepdragon.mybatis.domain.PageBounds;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 汽车系列表数据接口实现
*/
@Repository(Weipu.SIGN + "CarSeriesDaoImpl")
public class CarSeriesDaoImpl extends BaseDaoImpl<CarSeries, String> implements
		CarSeriesDao {

    @Override
    public List<?> getSeriesPager(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) {
        String defaultStatement = CarSeries.class.getName() + "Mapper.getSeriesPager";
        return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
    }
}
