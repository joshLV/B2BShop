package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.GoodsParameter;
import net.deepdragon.entity.weipu.GoodsParameterGroup;

import java.util.List;
import java.util.Map;

/**
 * 商品参数分组表数据接口
*/
public interface GoodsParameterGroupService extends BaseService<GoodsParameterGroup, String> {
    /**
     * 保存参数相关数据
     *
     * @param paramMap            租户标识
     * @param goodsParameterGroup 商品参数分组
     * @param goodsParameterList  商品参数选项列表
     */
    boolean saveGoodsParameterInfos(Map<String, Object> paramMap, GoodsParameterGroup goodsParameterGroup, List<GoodsParameter> goodsParameterList) throws Exception;

    /**
     * 更新参数相关数据
     *
     * @param paramMap            租户标识
     * @param goodsParameterGroup 商品参数分组
     * @param goodsParameterList  商品参数选项列表
     * @param deleteParamIds      删除了的参数选项
     */
    boolean updateGoodsParameterInfos(Map<String, Object> paramMap, GoodsParameterGroup goodsParameterGroup, List<GoodsParameter> goodsParameterList, String deleteParamIds) throws Exception;

    /**
     * 删除参数相关数据
     *
     * @param paramMap 租户标识
     * @param groupIds 参数组Ids
     * @param paramIds 商品参数分组Ids,用逗号分隔
     */
    boolean deleteGoodsParameterInfos(Map<String, Object> paramMap, List groupIds, List paramIds) throws Exception;
}
