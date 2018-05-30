package net.deepdragon.dao.impl;

import net.deepdragon.constant.Shared;
import net.deepdragon.dao.DeliveryMethodDao;
import net.deepdragon.entity.DeliveryMethod;
import net.deepdragon.util.Constant;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 配送方式数据接口实现
*/
@Repository(Shared.SIGN + "DeliveryMethodDaoImpl")
public class DeliveryMethodDaoImpl extends BaseDaoImpl<DeliveryMethod, String> implements
		DeliveryMethodDao {

    @Override
    public List<DeliveryMethod> getobshopByMethodId(Map<String,Object> paramMap, String obshopId) {
        String defaultStatement = DeliveryMethod.class.getName() + "Mapper.getobshopByMethodId";

        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("platform",paramMap.get(Constant.PLATFORM_KEY));
        parameter.put("obshopId",obshopId);

        return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
    }

}
