package net.deepdragon.service.cuxiao.impl;

import net.deepdragon.bean.PageList;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.constant.cuxiao.Cuxiao;
import net.deepdragon.dao.cuxiao.PromotionsDao;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.entity.cuxiao.MTPromotions;
import net.deepdragon.entity.cuxiao.Promotions;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.service.cuxiao.PromotionsService;
import net.deepdragon.service.weipu.impl.BaseServiceImpl;
import net.deepdragon.util.StringUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by GZJ on 2016-04-13.
 */
@Service(Cuxiao.SIGN + "PromotionsServiceImpl")
public class PromotionsServiceImpl extends BaseServiceImpl<Promotions,String> implements PromotionsService {
    @Resource(name = Cuxiao.SIGN + "PromotionsDaoImpl")
    private PromotionsDao promotionsDao;
    @Override
    protected BaseDao<Promotions, String> getBaseDao() {
        return promotionsDao;
    }

    @Override
    public Pager getPromotionsPager(Map<String, Object> paramMap, Pager pager) throws Exception {
        try {
            PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
            List<Promotions> list = promotionsDao.getPromotionsPager(paramMap,pageBounds);
            pager.setList(list);
            PageList<Promotions> pageList = (PageList<Promotions>) list;
            pager.setTotalCount(pageList.getPaginator().getTotalCount());
            return pager;
        }catch (Exception e){
            throw e;
        }
    }

    @Override
    public Promotions getPromotions(Map<String, Object> paramMap, String id) throws Exception {
        return promotionsDao.getPromotions(paramMap,id);
    }

    @Override
    public Promotions getPromotionsByFlag(Map<String, Object> paramMap, String flag) throws Exception {
        return promotionsDao.getPromotionsByFlag(paramMap,flag);
    }

    @Override
    public void updateIsOpen(Map<String, Object> paramMap, String id, String isOpen) throws Exception {
        promotionsDao.updateIsOpen(paramMap,id,isOpen);
    }

    @Override
    public Pager getMxAndTgPager(Map<String, Object> paramMap, Criteria criteria, String activityType, Pager pager) throws Exception{
        try {
            PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());

            if(StringUtil.isNotEmpty(activityType)) {
                criteria.add(Restrictions.eq("activityType", activityType));
            }

            List<MTPromotions> list = promotionsDao.getMxAndTgPager(paramMap, criteria, pageBounds);
            pager.setList(list);
            PageList<MTPromotions> pageList = (PageList<MTPromotions>) list;
            pager.setTotalCount(pageList.getPaginator().getTotalCount());
            return pager;
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public MTPromotions getMTProtions4ValidGoodsNumsByGoodsId(Map<String, Object> paramMap, String goodsId) throws Exception {
        return promotionsDao.getMTProtions4ValidGoodsNumsByGoodsId(paramMap, goodsId);
    }

    /**
     * 20160801 dzz
     * 促销活动信息统计(统计促销活动相关已购买商品数量)
     * @param paramMap
     * @param promotionsId
     * @param goodsId
     * @param memberId
     * @return
     * @throws Exception
     */
    public List<MTPromotions> getCountPromotions(Map<String, Object> paramMap, String promotionsId,String goodsId, String memberId) throws Exception {
        //1、查询活动基础信息
        List<MTPromotions> promotionsList = promotionsDao.getCountPromotions(paramMap, promotionsId, goodsId);

        //2、根据活动信息统计活动期间商品的数量
        if( promotionsList != null && promotionsList.size() > 0 ){
            for(MTPromotions m : promotionsList ){
                List<MTPromotions> mtPromotionses = promotionsDao.getBuyCount(paramMap, memberId, m.getGoodsId(), m.getStartTime(), m.getEndTime());
                if( mtPromotionses != null && mtPromotionses.size() > 0 ){
                    m.setQuantity( mtPromotionses.get(0).getResultCount() );
                    m.setResultCount( mtPromotionses.get(0).getResultCount() );
                }else{
                    m.setQuantity( 0 );
                    m.setResultCount( 0 );
                }
            }
        }

        return promotionsList;
    }

    /**
     * 获取指定会员规定时间段内购买某商品的数量
     * @param paramMap
     * @param memberId
     * @param goodsId
     * @param startTime
     * @param endTime
     * @return
     */
    public MTPromotions getBuyCount(Map<String, Object> paramMap, String memberId, String goodsId, Date startTime, Date endTime) throws Exception{
        List<MTPromotions> mtPromotionses = promotionsDao.getBuyCount(paramMap, memberId, goodsId, startTime, endTime);
        if( mtPromotionses != null && mtPromotionses.size() > 0 ){
            return mtPromotionses.get(0);
        }else{
            return null;
        }
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
        return promotionsDao.getCountPromotionsOrder(paramMap, criteria);
    }
}
