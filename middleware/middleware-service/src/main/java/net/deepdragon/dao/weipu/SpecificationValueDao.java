package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.SpecificationValue;

import java.util.Map;

public interface SpecificationValueDao extends BaseDao<SpecificationValue, String> {

    SpecificationValue getSpBatch(Map<String, Object> paramMap, String id);
}
