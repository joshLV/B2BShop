package net.deepdragon.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import net.deepdragon.entity.BaseEntity;
import net.deepdragon.bean.PageList;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.dao.BaseDao;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.service.BaseService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Service实现类 - Service实现类基类
 */
public abstract class BaseServiceImpl<T extends BaseEntity, PK extends Serializable>
		implements BaseService<T, PK> {

	protected Logger logger = LoggerFactory.getLogger(this.getClass());

	abstract BaseDao<T, PK> getBaseDao();

	@Override
	public T get(Map<String,Object> paramMap, PK id) throws Exception {
		try {
			return this.getBaseDao().get(paramMap, id);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public T find(Map<String,Object> paramMap, String property, Object value)
			throws Exception {
		try {
			return this.getBaseDao().find(paramMap, property, value);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<T> findList(Map<String,Object> paramMap, String property, Object value)
			throws Exception {
		try {
			return this.getBaseDao().findList(paramMap, property, value);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<T> findListByIds(Map<String,Object> paramMap, List<PK> ids)
			throws Exception {
		try {
			return this.getBaseDao().findListByIds(paramMap, ids);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<T> getAll(Map<String,Object> paramMap) throws Exception {
		try {
			return this.getBaseDao().getAll(paramMap);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public Pager getPager(Map<String,Object> paramMap, Criteria criteria, Pager pager)
			throws Exception {
		try {
			PageBounds pageBounds = new PageBounds(pager.getPageNumber(),
					pager.getPageSize());
			List<T> list = getBaseDao()
					.getPager(paramMap, criteria, pageBounds);
			pager.setList(list);
			PageList<T> pageList = (PageList<T>) list;
			pager.setTotalCount(pageList.getPaginator().getTotalCount());
			return pager;
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<T> getList(Map<String,Object> paramMap, Criteria criteria) throws Exception {
		try {
			return this.getBaseDao().getList(paramMap, criteria);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public Long getTotalCount(Map<String,Object> paramMap) throws Exception {
		try {
			return this.getBaseDao().getTotalCount(paramMap);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public Boolean isExist(Map<String,Object> paramMap, String property, Object value)
			throws Exception {
		try {
			return this.getBaseDao().isExist(paramMap, property, value);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public T save(Map<String,Object> paramMap, T entity) throws Exception {
		try {
			return this.getBaseDao().save(paramMap, entity);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int update(Map<String,Object> paramMap, T entity) throws Exception {
		try {
			return this.getBaseDao().update(paramMap, entity);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int delete(Map<String,Object> paramMap, PK id) throws Exception {
		try {
			return this.getBaseDao().delete(paramMap, id);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int delete(Map<String,Object> paramMap, String property, Object value)
			throws Exception {
		try {
			return this.getBaseDao().delete(paramMap, property,value);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int[] delete(Map<String,Object> paramMap, List<PK> ids) throws Exception {
		try {
			return this.getBaseDao().delete(paramMap, ids);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int[] save(Map<String,Object> paramMap, List<T> entity) throws Exception {
		try {
			return this.getBaseDao().save(paramMap, entity);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int[] update(Map<String,Object> paramMap, List<T> entity) throws Exception {
		try {
			return this.getBaseDao().update(paramMap, entity);
		} catch (Exception e) {
			throw e;
		}
	}

	
}
