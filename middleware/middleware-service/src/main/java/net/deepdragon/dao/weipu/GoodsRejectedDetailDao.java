package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.GoodsRejectedDetail;

import java.util.Map;

public interface GoodsRejectedDetailDao extends BaseDao<GoodsRejectedDetail, String> {

    /**
     * 20160701 dzz
     * 保存部分退货功能商品明细信息
     * @param paramMap
     * @param entity
     * @return
     */
    Object saveGoodsRejectedDetail(Map<String, Object> paramMap, GoodsRejectedDetail entity);

}
