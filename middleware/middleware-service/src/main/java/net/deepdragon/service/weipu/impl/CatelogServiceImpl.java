package net.deepdragon.service.weipu.impl;


import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.CatelogDao;
import net.deepdragon.entity.weipu.Catelog;
import net.deepdragon.service.weipu.CatelogService;
import net.deepdragon.util.Constant;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN+"CatelogServiceImpl")
public class CatelogServiceImpl extends BaseServiceImpl<Catelog, String> implements CatelogService {

	@Resource(name= Weipu.SIGN+"CatelogDaoImpl")
	private CatelogDao catelogDao;
	
	@Override
	public BaseDao<Catelog, String> getBaseDao() {
		return this.catelogDao;
	}

    /**
     * 根据后台GoodsCategory获取前台的Catelog对象
     *
     * @param paramMap   租户Id
     * @param categoryId 条件对象
     *
     * @return Catelog对象
     */
    public Catelog getCatelogByGategory(Map<String, Object> paramMap, String categoryId) {
        Criteria criteria = new Criteria();
        criteria.add(Restrictions.eq("id", categoryId));
        criteria.add(Restrictions.eq(Constant.TENANTID_KEY, paramMap.get(Constant.TENANTID_KEY).toString()));
//        criteria.add(Restrictions.eq(Constant.PLATFORM_KEY, paramMap.get(Constant.PLATFORM_KEY).toString()));
        List<Catelog> catelogList = (List<Catelog>) catelogDao.getCatelogByGategory(criteria);
        return (catelogList != null && catelogList.size() > 0) ? catelogList.get(0) : null;
    }

	@Override
	public List<Catelog> getList4Shop(Map<String, Object> paramMap, String shopId)
			throws Exception {
		return catelogDao.getList4Shop(paramMap, shopId);
	}

	@Override
	public List<Catelog> getAllParents(Map<String, Object> paramMap) {
		return catelogDao.getAllParents(paramMap);
	}

	@Override
	public List<Catelog> getSons(Map<String, Object> paramMap, String id) {
		return catelogDao.getSons(paramMap,id);
	}

}

