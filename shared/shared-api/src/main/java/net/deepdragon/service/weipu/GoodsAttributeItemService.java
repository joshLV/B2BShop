package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.GoodsAttribute;
import net.deepdragon.entity.weipu.GoodsAttributeItem;

import java.util.List;
import java.util.Map;

/**
 * 商品分类属性项数据接口
*/
public interface GoodsAttributeItemService extends BaseService<GoodsAttributeItem, String> {
    /**
     * 保存参数相关数据
     *
     * @param paramMap            租户标识
     * @param goodsAttribute 商品属性
     * @param strList  商品属性列表
     */
    boolean saveGoodsAttributeItemInfos(Map<String, Object> paramMap, GoodsAttribute goodsAttribute, List<GoodsAttributeItem> goodsAttributeItemList) throws Exception;

    /**
     * 更新参数相关数据
     *
     * @param paramMap            租户标识
     * @param goodsAttribute 商品属性
     * @param goodsAttributeItemList  商品属性列表
     */
    boolean updateGoodsAttributeInfos(Map<String, Object> paramMap, List<String> deleteallId, GoodsAttribute goodsAttribute, List<GoodsAttributeItem> saveList, List<GoodsAttributeItem> updateList) throws Exception;

    /**
     * 删除参数相关数据
     *
     * @param paramMap 租户标识
     * @param ids      商品属性Ids,用逗号分隔
     */
    boolean deleteGoodsAttributeItemInfos(Map<String, Object> paramMap, List<String> asList, List<String> allId) throws Exception;
}
