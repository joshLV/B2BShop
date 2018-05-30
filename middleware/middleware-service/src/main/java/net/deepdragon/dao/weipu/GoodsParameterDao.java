package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.GoodsParameter;

import java.util.List;
import java.util.Map;

public interface GoodsParameterDao extends BaseDao<GoodsParameter, String> {

    List<Map<String,Object>> getParamNoGroup(Map<String, Object> paramMap, String goodsId);
}
