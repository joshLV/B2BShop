package net.deepdragon.service.cuxiao;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.cuxiao.MTPromotions;
import net.deepdragon.entity.cuxiao.Promotions;
import net.deepdragon.service.weipu.BaseService;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by 15438 on 2016-04-13.
 */
public interface PromotionsService extends BaseService<Promotions,String> {
    //获取促销信息分页
    Pager getPromotionsPager(Map<String, Object> paramMap, Pager pager) throws Exception;
    //获取促销信息详情
    Promotions getPromotions(Map<String, Object> paramMap, String id) throws Exception;
    //根据Flag获取促销信息详情
    Promotions getPromotionsByFlag(Map<String, Object> paramMap, String flag) throws Exception;
    //更新专题活动开启状态
    void updateIsOpen(Map<String, Object> paramMap, String id, String isOpen) throws Exception;

    /**
     * 分页查询团购或者秒杀列表数据
     * @param paramMap
     * @param criteria
     * @param activityType 活动类型
     *@param pager  @return
     */
    Pager getMxAndTgPager(Map<String, Object> paramMap, Criteria criteria, String activityType, Pager pager) throws Exception;

    /**
     * 根据商品ID查询活动数据
     * @param paramMap
     * @param goodsId
     * @return
     * @throws Exception
     */
    MTPromotions getMTProtions4ValidGoodsNumsByGoodsId( Map<String, Object> paramMap,String goodsId ) throws  Exception;

    /**
     * 20160801 dzz
     * 促销活动信息统计(统计促销活动相关已购买商品数量)
     * @param paramMap
     * @param promotionsId 活动ID
     * @param goodsId 商品ID
     * @param memberId 会员ID
     * @return
     * @throws Exception
     */
    List<MTPromotions> getCountPromotions(Map<String, Object> paramMap, String promotionsId, String goodsId, String memberId) throws Exception;

    /**
     * 获取指定会员规定时间段内购买某商品的数量
     * @param paramMap
     * @param memberId
     * @param goodsId
     * @param startTime
     * @param endTime
     * @return
     */
    MTPromotions getBuyCount(Map<String, Object> paramMap, String memberId, String goodsId, Date startTime, Date endTime) throws Exception;



    /**
     * 20160804 dzz
     * 统计当前用户下单订单数量为多少
     * @param paramMap
     * @param criteria
     * @return
     * @throws Exception
     */
    List<MTPromotions> getCountPromotionsOrder(Map<String, Object> paramMap, Criteria criteria) throws Exception;
}
