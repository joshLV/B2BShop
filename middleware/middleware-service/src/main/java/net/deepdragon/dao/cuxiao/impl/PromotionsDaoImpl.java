package net.deepdragon.dao.cuxiao.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.cuxiao.Cuxiao;
import net.deepdragon.dao.cuxiao.PromotionsDao;
import net.deepdragon.dao.weipu.impl.BaseDaoImpl;
import net.deepdragon.entity.cuxiao.MTPromotions;
import net.deepdragon.entity.cuxiao.Promotions;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.util.Constant;
import net.deepdragon.util.DateUtil;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by 15438 on 2016-04-13.
 */
@Repository(Cuxiao.SIGN + "PromotionsDaoImpl")
public class PromotionsDaoImpl extends BaseDaoImpl<Promotions,String> implements PromotionsDao{

    @Override
    public List<Promotions> getPromotionsPager(Map<String, Object> paramMap,PageBounds pageBounds) throws Exception {
        String defaultStatement = Promotions.class.getName() + "Mapper.listPromotions";
        paramMap.put("tenantId", paramMap.get(Constant.TENANTID_KEY));
        return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement,paramMap,pageBounds);
    }

    @Override
    public Promotions getPromotions(Map<String, Object> paramMap, String id) throws Exception {
        String defaultStatement = Promotions.class.getName()+"Mapper.get";
        paramMap.put("tenantId", paramMap.get(Constant.TENANTID_KEY));
        paramMap.put("id", id);
        return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).selectOne(defaultStatement, paramMap);
    }

    @Override
    public Promotions getPromotionsByFlag(Map<String, Object> paramMap, String flag) throws Exception {
        String defaultStatement = Promotions.class.getName()+"Mapper.getByFlag";
        paramMap.put("tenantId", paramMap.get(Constant.TENANTID_KEY));
        paramMap.put("flag", flag);
        return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).selectOne(defaultStatement, paramMap);
    }

    @Override
    public void updateIsOpen(Map<String, Object> paramMap, String id, String isOpen) throws Exception {
        String defaultStatement = Promotions.class.getName()+"Mapper.updateIsOpen";
        paramMap.put("id",id);
        paramMap.put("isOpen",isOpen);
        sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).update(defaultStatement, paramMap);
    }

    @Override
    public List<MTPromotions> getMxAndTgPager(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) throws Exception {
        String defaultStatement = Promotions.class.getName()+ "Mapper.getMxAndTgPager";

        return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
    }

    /**
     * 20160801 dzz
     * 促销活动信息统计(统计促销活动相关已购买商品数量)
     * @param paramMap
     * @param goodsId
     * @return
     * @throws Exception
     */
    public List<MTPromotions> getCountPromotions(Map<String, Object> paramMap, String promotionsId, String goodsId) throws Exception {
        String defaultStatement = Promotions.class.getName()+ "Mapper.getCountPromotions";
        paramMap.put("promotionsId", promotionsId);
        paramMap.put("goodsId", goodsId);
        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
    }


    /**
     * 20160804 dzz
     * 统计当前用户下单订单数量为多少
     * @param paramMap
     * @param criteria
     * @return
     * @throws Exception
     */
    public List<MTPromotions> getCountPromotionsOrder(Map<String, Object> paramMap, Criteria criteria) throws Exception {
        String defaultStatement = Promotions.class.getName()+ "Mapper.getCountPromotionsOrder";
        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
    }

    @Override
    public List<MTPromotions> getBuyCount(Map<String, Object> paramMap, String memberId, String goodsId, Date startTime, Date endTime) throws Exception {
        String defaultStatement = Promotions.class.getName()+ "Mapper.getBuyCount";
        paramMap.put("memberId", memberId);
        paramMap.put("goodsId", goodsId);
        paramMap.put("startTime", DateUtil.dateToString(startTime, "yyyy-MM-dd HH:mm:ss" ));
        paramMap.put("endTime", DateUtil.dateToString(endTime, "yyyy-MM-dd HH:mm:ss" ));
        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
    }

    @Override
    public MTPromotions getMTProtions4ValidGoodsNumsByGoodsId(Map<String, Object> paramMap, String goodsId) throws Exception {
        String defaultStatement = Promotions.class.getName()+ "Mapper.getMTProtions4ValidGoodsNumsByGoodsId";
        paramMap.put("goodsId", goodsId);
        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(defaultStatement, paramMap);
    }
}
