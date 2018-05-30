package net.deepdragon.service.cuxiao;

import net.deepdragon.bean.Pager;
import net.deepdragon.entity.cuxiao.PromotionsGoods;
import net.deepdragon.entity.weipu.Goods;
import net.deepdragon.service.weipu.BaseService;

import java.util.Map;

/**
 * Created by 15438 on 2016-04-13.
 */
public interface PromotionsGoodsService extends BaseService<PromotionsGoods,String> {
    //获取促销商品信息分页
    Pager getPromotionsGoodsPager(Map<String, Object> paramMap, String promotionsId,Pager pager) throws Exception;

    //获取促销商品信息
    PromotionsGoods getPromotionsGoods(Map<String, Object> paramMap, String goodsId, String promotionsId) throws Exception;
}
