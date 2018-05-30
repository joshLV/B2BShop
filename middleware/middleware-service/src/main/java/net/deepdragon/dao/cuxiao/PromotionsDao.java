package net.deepdragon.dao.cuxiao;

import net.deepdragon.condition.Criteria;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.entity.cuxiao.MTPromotions;
import net.deepdragon.entity.cuxiao.Promotions;
import net.deepdragon.mybatis.domain.PageBounds;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by 15438 on 2016-04-13.
 * 促销信息DAO
 */
public interface PromotionsDao extends BaseDao<Promotions,String> {
    //获取促销信息分页
    List<Promotions> getPromotionsPager(Map<String, Object> paramMap, PageBounds pageBounds) throws Exception;
    //获取促销信息详情
    Promotions getPromotions(Map<String, Object> paramMap, String id) throws Exception;
    //根据Flag获取促销信息详情
    Promotions getPromotionsByFlag(Map<String, Object> paramMap, String flag) throws Exception;
    //更新专题活动开启状态
    void updateIsOpen(Map<String, Object> paramMap, String id, String isOpen) throws Exception;

    List<MTPromotions> getMxAndTgPager(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) throws Exception;

    /**
     * 20160801 dzz
     * 促销活动信息统计(统计促销活动相关已购买商品数量)
     * @param paramMap
     * @param promotionsId
     * @param goodsId
     * @return
     * @throws Exception
     */
    List<MTPromotions> getCountPromotions(Map<String, Object> paramMap, String promotionsId,String goodsId) throws Exception;


    /**
     * 20160804 dzz
     * 统计当前用户下单订单数量为多少
     * @param paramMap
     * @param criteria
     * @return
     * @throws Exception
     */
    List<MTPromotions> getCountPromotionsOrder(Map<String, Object> paramMap, Criteria criteria) throws Exception;


    /**
     * 查询活动期间购买活动商品的数量
     * @param paramMap
     * @param memberId
     * @param goodsId
     * @param startTime
     * @param endTime
     * @return
     * @throws Exception
     * @Author TianYu 2016-08-16 09:54:23
     */
    List<MTPromotions> getBuyCount(Map<String, Object> paramMap, String memberId, String goodsId, Date startTime, Date endTime) throws Exception;

    /**
     * 根据商品查询所参加的活动
     * @param paramMap
     * @param goodsId
     * @return
     * @throws Exception
     */
    MTPromotions getMTProtions4ValidGoodsNumsByGoodsId(Map<String, Object> paramMap, String goodsId) throws Exception;
}

