package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.GoodsParameter;

import java.util.List;
import java.util.Map;

/**
 * 商品参数选项表数据接口
*/
public interface GoodsParameterService extends BaseService<GoodsParameter, String> {

    /**
     * 根据商品ID获取参数，不关联参数组
     * @param paramMap
     * @param goodsId
     * @return
     * parameterId 参数ID
     * NAME 参数名
     * content 参数值
     * 2016-1-20 18:06:22
     * TianYu
     */
    List<Map<String,Object>> getParamNoGroup(Map<String, Object> paramMap, String goodsId);
}
