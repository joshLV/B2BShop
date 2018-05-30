package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.CatelogDao;
import net.deepdragon.entity.weipu.Catelog;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 前台类目数据接口实现
 */
@Repository(Weipu.SIGN + "CatelogDaoImpl")
public class CatelogDaoImpl extends BaseDaoImpl<Catelog, String> implements CatelogDao {

    /**
     * 根据后台GoodsCategory获取前台的Catelog对象
     *
     * @param criteria 条件对象
     *
     * @return Category对象列表
     */
    public List<Catelog> getCatelogByGategory(Criteria criteria) {
        String defaultStatement = Catelog.class.getName() + "Mapper.getCatelogByGategory";
        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria);
    }
    
	@Override
	public List<Catelog> getList4Shop(Map<String, Object> paramMap, String shopId) {
		String defaultStatement = Catelog.class.getName() + "Mapper.getList4Shop";
		paramMap.put("shopId", shopId);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}

	@Override
	public List<Catelog> getAllParents(Map<String, Object> paramMap) {
		String defaultStatement = Catelog.class.getName() + "Mapper.getAllParents";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}

	@Override
	public List<Catelog> getSons(Map<String, Object> paramMap, String id) {
		String defaultStatement = Catelog.class.getName() + "Mapper.getSons";
		paramMap.put("id", id);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}


}
