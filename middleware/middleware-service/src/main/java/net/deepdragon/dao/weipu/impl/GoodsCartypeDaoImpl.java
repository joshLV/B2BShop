package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.GoodsCartypeDao;
import net.deepdragon.entity.weipu.Goods;
import net.deepdragon.entity.weipu.GoodsCartype;
import net.deepdragon.mybatis.domain.PageBounds;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 商品(配件)车型关联关系数据接口实现
*/
@Repository(Weipu.SIGN + "GoodsCartypeDaoImpl")
public class GoodsCartypeDaoImpl extends BaseDaoImpl<GoodsCartype, String> implements
        GoodsCartypeDao {

    @Override
    public List<Goods> getGoodsPager(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) {
        String defaultStatement = GoodsCartype.class.getName() + "Mapper.getGoodsPager";
        return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
    }
}
