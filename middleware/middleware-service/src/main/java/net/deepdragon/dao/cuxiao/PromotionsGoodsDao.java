package net.deepdragon.dao.cuxiao;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.entity.cuxiao.PromotionsGoods;
import net.deepdragon.entity.weipu.Goods;
import net.deepdragon.mybatis.domain.PageBounds;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

/**
 * Created by 15438 on 2016-04-13.
 */
public interface PromotionsGoodsDao extends BaseDao<PromotionsGoods,String> {
    //获取促销商品信息分页
    List<Goods> getPromotionsGoodsPager(Map<String, Object> paramMap, PageBounds pageBounds) throws Exception;

    //获取促销商品信息
    PromotionsGoods getPromotionsGoods(Map<String, Object> paramMap,String goodsId,String promotionsId) throws Exception;
}
