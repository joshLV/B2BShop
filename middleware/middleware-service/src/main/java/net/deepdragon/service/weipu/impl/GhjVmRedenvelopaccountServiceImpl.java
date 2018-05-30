package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import net.deepdragon.bean.PageList;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.mybatis.domain.PageBounds;
import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GhjVmRedenvelopaccountDao;
import net.deepdragon.entity.weipu.GhjVmRedenvelopaccount;
import net.deepdragon.service.weipu.GhjVmRedenvelopaccountService;

import java.util.List;
import java.util.Map;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjVmRedenvelopaccountServiceImpl")
public class GhjVmRedenvelopaccountServiceImpl extends BaseServiceImpl<GhjVmRedenvelopaccount, String> implements GhjVmRedenvelopaccountService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"GhjVmRedenvelopaccountDaoImpl")
	private GhjVmRedenvelopaccountDao ghjVmRedenvelopaccountDao;
	
	@Override
	public BaseDao<GhjVmRedenvelopaccount, String> getBaseDao() {
		return this.ghjVmRedenvelopaccountDao;
	}

	@Override
	public List<GhjVmRedenvelopaccount> getDirectionalMerchantList(Map<String, Object> paramMap, Criteria criteria) throws Exception{
		try {
			return this.ghjVmRedenvelopaccountDao.getDirectionalMerchantList(paramMap, criteria);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<GhjVmRedenvelopaccount> getRedenvelopList(Map<String, Object> paramMap, Criteria criteria) throws Exception{
		try {
			return this.ghjVmRedenvelopaccountDao.getRedenvelopList(paramMap, criteria);
		} catch (Exception e) {
			throw e;
		}
	}

	/**
	 * 获取红包记录
	 *
	 * @param paramMap
	 *            租户标识
	 * @param criteria
	 *            字段条件
	 * @param pager
	 *            分页信息
	 *
	 * @return 参数列表
	 */
	public Pager getRedenvelopRecord(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception{
		try {
			PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
			List list = this.ghjVmRedenvelopaccountDao.getRedenvelopRecord(paramMap, criteria, pageBounds);
			pager.setList(list);
			PageList pageList = (PageList) list;
			pager.setTotalCount(pageList.getPaginator().getTotalCount());
			return pager;
		} catch (Exception e) {
			throw e;
		}
	}

}

