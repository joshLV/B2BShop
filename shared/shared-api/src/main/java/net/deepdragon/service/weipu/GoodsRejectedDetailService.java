package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.GoodsRejectedDetail;

import java.util.Map;

/**
 * wp_goods_rejected_detail数据接口
*/
public interface GoodsRejectedDetailService extends BaseService<GoodsRejectedDetail, String> {

    /**
     * 20160704 dzz
     * 保存部分退货商品详情信息
     * @param paramMap
     * @param goodsRejectedDetail
     * @return
     */
    Object saveRejectedDetail(Map<String, Object> paramMap, GoodsRejectedDetail goodsRejectedDetail);

}
