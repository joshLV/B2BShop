package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.GoodsRejected;

import java.util.Map;

public interface GoodsRejectedDao extends BaseDao<GoodsRejected, String> {


    /**
     * 20160701 dzz
     * 保存部分退货功能商品信息
     * @param paramMap
     * @param entity
     * @return
     */
    Object saveGoodsRejected(Map<String, Object> paramMap, GoodsRejected entity);

}
