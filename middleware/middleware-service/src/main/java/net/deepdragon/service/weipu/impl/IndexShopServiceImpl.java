package net.deepdragon.service.weipu.impl;


import net.deepdragon.bean.PageList;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.IndexShopDao;
import net.deepdragon.entity.weipu.IndexShop;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.service.weipu.IndexShopService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN+"IndexShopServiceImpl")
public class IndexShopServiceImpl extends BaseServiceImpl<IndexShop, String> implements IndexShopService {

	@Resource(name= Weipu.SIGN+"IndexShopDaoImpl")
	private IndexShopDao indexShopDao;
	
	@Override
	public BaseDao<IndexShop, String> getBaseDao() {
		return this.indexShopDao;
	}


	/**
	 * 更具距离查询商家
	 * @param paramMap
	 * @param criteria
	 * @param pager
	 * @return
	 * @throws Exception
     */
	public List<Map<String, Object>> getPager4JULI(Map<String, Object> paramMap, Criteria criteria, Pager pager)
			throws Exception {
		return indexShopDao.getPager4JULI(paramMap,criteria,pager);
	}



	@Override
	public Pager getPagerJl(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		try {
			pager.setTotalCount(Integer.valueOf(indexShopDao.getPager4JULICount(paramMap)+""));//查询总数
			//计算分页
			int s=(pager.getPageNumber()-1)* pager.getPageSize();
			int e= pager.getPageSize();
			paramMap.put("s",s);
			paramMap.put("e",e);
			paramMap.put("limtString","limtString");
			List<Map<String,Object>> list =indexShopDao.getPager4JULI(paramMap, criteria, pager);
			pager.setList(list);
			return pager;
		} catch (Exception e) {
			throw e;
		}
	}

	/**
	 * 商品检索查询附近商家
	 * @param paramMap
	 * @param criteria
	 * @param pager
	 * @return
     * @throws Exception
     */
	@Override
	public Pager getPagerJl4SJ(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		try {
			pager.setTotalCount(Integer.valueOf(indexShopDao.getPager4JULI4SJCout(paramMap)+""));//查询总数
			//计算分页
			int s=(pager.getPageNumber()-1)* pager.getPageSize();
			int e= pager.getPageSize();
			paramMap.put("s",s);
			paramMap.put("e",e);
			paramMap.put("limtString","limtString");
			List<Map<String,Object>> list =indexShopDao.getPager4JULI4SJ(paramMap, criteria, pager);
			pager.setList(list);
			return pager;
		} catch (Exception e) {
			throw e;
		}
	}




}

