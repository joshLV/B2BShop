package net.deepdragon.service.weipu.impl;

import net.deepdragon.bean.PageList;
import net.deepdragon.bean.Pager;
import net.deepdragon.bean.TableSchema;
import net.deepdragon.condition.Criteria;
import net.deepdragon.dao.callback.*;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.entity.weipu.BaseEntity;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.procedure.StoredProcedureInfo;
import net.deepdragon.service.weipu.BaseService;
import net.deepdragon.util.IdWorker;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * Service实现类 - Service实现类基类
 */
public abstract class BaseServiceImpl<T extends BaseEntity, PK extends Serializable>
		implements BaseService<T, PK> {

	protected Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource
	private IdWorker idWorker;
	
	protected abstract BaseDao<T, PK> getBaseDao();

	@Override
	public T get(Map<String, Object> paramMap, PK id) throws Exception {
		try {
			return this.getBaseDao().get(paramMap, id);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public T find(Map<String, Object> paramMap, String property, Object value)
			throws Exception {
		try {
			return this.getBaseDao().find(paramMap, property, value);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<T> findList(Map<String, Object> paramMap, String property, Object value)
			throws Exception {
		try {
			return this.getBaseDao().findList(paramMap, property, value);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<T> findListByIds(Map<String, Object> paramMap, List<PK> ids)
			throws Exception {
		try {
			return this.getBaseDao().findListByIds(paramMap, ids);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<T> getAll(Map<String, Object> paramMap) throws Exception {
		try {
			return this.getBaseDao().getAll(paramMap);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public Pager getPager(Map<String, Object> paramMap, Criteria criteria, Pager pager)
			throws Exception {
		try {
			PageBounds pageBounds = new PageBounds(pager.getPageNumber(),
					pager.getPageSize());
			List<T> list = getBaseDao().getPager(paramMap, criteria, pageBounds);
			pager.setList(list);
			PageList<T> pageList = (PageList<T>) list;
			pager.setTotalCount(pageList.getPaginator().getTotalCount());
			return pager;
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<T> getList(Map<String, Object> paramMap, Criteria criteria) throws Exception {
		try {

			return this.getBaseDao().getList(paramMap, criteria);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public Long getTotalCount(Map<String, Object> paramMap) throws Exception {
		try {
			return this.getBaseDao().getTotalCount(paramMap);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public Boolean isExist(Map<String, Object> paramMap, String property, Object value)
			throws Exception {
		try {
			return this.getBaseDao().isExist(paramMap, property, value);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public T save(Map<String, Object> paramMap, T entity) throws Exception {
		try {
			return this.getBaseDao().save(paramMap, entity);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int update(Map<String, Object> paramMap, T entity) throws Exception {
		try {
			return this.getBaseDao().update(paramMap, entity);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int delete(Map<String, Object> paramMap, PK id) throws Exception {
		try {
			return this.getBaseDao().delete(paramMap, id);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int delete(Map<String, Object> paramMap, String property, Object value)
			throws Exception {
		try {
			return this.getBaseDao().delete(paramMap, property,value);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int[] delete(Map<String, Object> paramMap, List<PK> ids) throws Exception {
		try {
			return this.getBaseDao().delete(paramMap, ids);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int[] save(Map<String, Object> paramMap, List<T> entity) throws Exception {
		try {
			return this.getBaseDao().save(paramMap, entity);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int[] update(Map<String, Object> paramMap, List<T> entity) throws Exception {
		try {
			return this.getBaseDao().update(paramMap, entity);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<Map<String, Object>> selectList(Map<String, Object> paramMap, String sql)
			throws Exception {
		try {
			return getBaseDao().selectList(sql);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public StoredProcedureInfo getStoredProcedureInfo(Map<String, Object> paramMap,
			String catalog, String procedureName) throws Exception {
		try {
			StoredProcedureInfoCallback callback = new StoredProcedureInfoCallback(
					catalog, procedureName);
			return getBaseDao().getStoredProcedureInfo(callback);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public StoredProcedureInfo execute(Map<String, Object> paramMap,
			StoredProcedureInfo storedProcedureInfo) throws Exception {
		try {
			StoredProcedureExecuteCallback callback = new StoredProcedureExecuteCallback(
					storedProcedureInfo);

			return getBaseDao().execute(callback);

		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public boolean isTableNameExist(Map<String, Object> paramMap, String tableName)
			throws Exception {
		try {
			TableNameExistCallback callback = new TableNameExistCallback(
					tableName);
			return getBaseDao().isTableNameExist(callback);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public Map<String, Object> selectOne(Map<String, Object> paramMap, String sql)
			throws Exception {
		try {
			return getBaseDao().selectOne(sql);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public Pager selectPager(Map<String, Object> paramMap, String sql, Pager pager)
			throws Exception {
		try {
			return getBaseDao().selectPager(sql, pager);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public boolean executeTableOperation(Map<String, Object> paramMap, List<String> sql)
			throws Exception {
		try {
			TableOperationCallback callback = new TableOperationCallback(sql);
			return getBaseDao().executeTableOperation(callback);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public boolean insertOne(Map<String, Object> paramMap, String sql) throws Exception {
		try {
			OneSqlCallback callback = new OneSqlCallback(sql);
			return getBaseDao().insertOne(callback);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public boolean insertBatch(Map<String, Object> paramMap, List<String> sql)
			throws Exception {
		try {
			BatchSqlCallback callback = new BatchSqlCallback(sql);
			return getBaseDao().insertBatch(callback);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public String getPrimaryKey(Map<String, Object> paramMap) {
		return String.valueOf(idWorker.getId());
	}

	@Override
	public List<TableSchema> getColumns(Map<String, Object> paramMap, String tableOrViewName)
			throws Exception {
		try {
			TableSchemaCallback callback = new TableSchemaCallback(
					tableOrViewName);
			return getBaseDao().getColumns(callback);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public boolean deleteOne(Map<String, Object> paramMap, String sql) throws Exception {
		try {
			OneSqlCallback callback = new OneSqlCallback(sql);
			return getBaseDao().deleteBatch(callback);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public boolean deleteBatch(Map<String, Object> paramMap, List<String> sql)
			throws Exception {
		try {
			BatchSqlCallback callback = new BatchSqlCallback(sql);
			return getBaseDao().deleteBatch(callback);
		} catch (Exception e) {
			throw e;
		}
	}
}
