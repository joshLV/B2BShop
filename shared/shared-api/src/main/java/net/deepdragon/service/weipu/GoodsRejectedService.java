package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.GoodsRejected;

import java.util.Map;

/**
 * wp_goods_rejected数据接口
*/
public interface GoodsRejectedService extends BaseService<GoodsRejected, String> {

    /**
     * 20160701 dzz
     * 保存部分退货商品信息
     * @param param
     * @param goodsRejected         退货商品主表对象
     * @return
     */
    Object saveGoodsRejected(Map<String, Object> param, GoodsRejected goodsRejected) throws Exception;

}
