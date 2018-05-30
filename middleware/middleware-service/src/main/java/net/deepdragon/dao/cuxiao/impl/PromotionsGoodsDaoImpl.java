package net.deepdragon.dao.cuxiao.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.constant.cuxiao.Cuxiao;
import net.deepdragon.dao.cuxiao.PromotionsGoodsDao;
import net.deepdragon.dao.weipu.impl.BaseDaoImpl;
import net.deepdragon.entity.cuxiao.Promotions;
import net.deepdragon.entity.cuxiao.PromotionsGoods;
import net.deepdragon.entity.weipu.Goods;
import net.deepdragon.mybatis.domain.PageBounds;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by 15438 on 2016-04-13.
 */
@Repository(Cuxiao.SIGN + "PromotionsGoodsDaoImpl")
public class PromotionsGoodsDaoImpl extends BaseDaoImpl<PromotionsGoods,String> implements PromotionsGoodsDao {

    @Override
    public List<Goods> getPromotionsGoodsPager(Map<String, Object> paramMap, PageBounds pageBounds) throws Exception {
        String defaultStatement = PromotionsGoods.class.getName() + "Mapper.listPromotionsGoods";
        return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement,paramMap,pageBounds);
    }

    @Override
    public PromotionsGoods getPromotionsGoods(Map<String, Object> paramMap, String goodsId, String promotionsId) throws Exception {
        String defaultStatement = PromotionsGoods.class.getName() + "Mapper.getPromotionsGoods";
        paramMap.put("goodsId",goodsId);
        paramMap.put("promotionsId",promotionsId);
        return  sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).selectOne(defaultStatement, paramMap);
    }

    @Override
    public List<PromotionsGoods> getList(Map<String, Object> paramMap, Criteria criteria){
        String defaultStatement = PromotionsGoods.class.getName() + "Mapper.getList";
        criteria.add(Restrictions.eq("isDelete","N"));
        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
                defaultStatement, criteria);
    }
}
