package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.CartypeDao;
import net.deepdragon.entity.weipu.Cartype;
import net.deepdragon.mybatis.domain.PageBounds;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 车型表数据接口实现
*/
@Repository(Weipu.SIGN + "CartypeDaoImpl")
public class CartypeDaoImpl extends BaseDaoImpl<Cartype, String> implements
        CartypeDao {

    @Override
    public List<Cartype> getCartypePager(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) {
        String defaultStatement = Cartype.class.getName() + "Mapper.getCartypePager";
        return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
    }
}
