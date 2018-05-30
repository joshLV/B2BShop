package net.deepdragon.dao.impl;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.BaseEntity;
import net.deepdragon.util.Constant;
import net.deepdragon.util.ReflectUtils;
import net.deepdragon.dao.BaseDao;
import net.deepdragon.mybatis.SqlSessionTemplateFactory;
import net.deepdragon.mybatis.domain.PageBounds;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.ibatis.executor.BatchResult;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.Assert;

/**
 * Dao实现类 - Dao实现类基类
 */
public abstract class BaseDaoImpl<T extends BaseEntity, PK extends Serializable>
		implements BaseDao<T, PK> {

	protected final Logger logger = LoggerFactory.getLogger(this.getClass());

	/* 大批量操作时,每5000笔批量操作后执行JDBC操作 */
	public static final int DEFAULT_FLUSH_BATCH_SIZE = 5000;

	protected SqlSessionTemplateFactory sqlSessionTemplateFactory;

	private Class<T> entityClass = null;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public BaseDaoImpl() {
		this.entityClass = null;
		Class c = getClass();
		Type type = c.getGenericSuperclass();
		if (type instanceof ParameterizedType) {
			Type[] parameterizedType = ((ParameterizedType) type)
					.getActualTypeArguments();
			this.entityClass = (Class<T>) parameterizedType[0];
		}
	}

	@Resource(name = "sqlSessionTemplateFactory")
	public void setSqlSessionTemplateFactory(
			SqlSessionTemplateFactory sqlSessionTemplateFactory) {
		this.sqlSessionTemplateFactory = sqlSessionTemplateFactory;
	}

	@Override
	public T get(Map<String,Object> paramMap, PK id) {
		String defaultStatement = this.entityClass.getName() + "Mapper.get";

		paramMap.put("id", id);

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(
				defaultStatement, paramMap);
	}

	@Override
	public T find(Map<String,Object> paramMap, String property, Object value) {

		String defaultStatement = this.entityClass.getName() + "Mapper.find";

		paramMap.put("property", property);
		paramMap.put("value", value);

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(
				defaultStatement, paramMap);
	}

	@Override
	public List<T> findList(Map<String,Object> paramMap, String property, Object value) {
		String defaultStatement = this.entityClass.getName() + "Mapper.find";

		paramMap.put("property", property);
		paramMap.put("value", value);

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, paramMap);

	}

	@Override
	public List<T> findListByIds(Map<String,Object> paramMap, List<PK> ids) {

		String defaultStatement = this.entityClass.getName()
				+ "Mapper.findListByIds";

		paramMap.put("list",ids);

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, paramMap);

	}

	@Override
	public List<T> getAll(Map<String,Object> paramMap) {
		String defaultStatement = this.entityClass.getName() + "Mapper.getAll";

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, paramMap);
	}

	@Override
	public List<T> getPager(Map<String,Object> paramMap, Criteria criteria,
			PageBounds pageBounds) {
		String defaultStatement = this.entityClass.getName()
				+ "Mapper.getPager";

		return this.sqlSessionTemplateFactory.getSqlSessionTemplate()
				.selectList(defaultStatement, criteria, pageBounds);
	}

	@Override
	public List<T> getList(Map<String,Object> paramMap, Criteria criteria) {
		String defaultStatement = this.entityClass.getName() + "Mapper.getList";

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, criteria);
	}

	@Override
	public Long getTotalCount(Map<String,Object> paramMap) {
		String defaultStatement = this.entityClass.getName()
				+ "Mapper.getTotalCount";

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(
				defaultStatement, paramMap);
	}

	@Override
	public Boolean isExist(Map<String,Object> paramMap, String property, Object value) {
		String defaultStatement = this.entityClass.getName() + "Mapper.isExist";

		paramMap.put("property", property);
		paramMap.put("value", value);

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(
				defaultStatement, paramMap);
	}

	@Override
	public T save(Map<String,Object> paramMap, T entity) {
		String defaultStatement = this.entityClass.getName() + "Mapper.save";

		// 实体类存在tenantId字段
		Field field = ReflectUtils.getFieldByFieldName(entity, "tenantId");
		if (field != null) {
			ReflectUtils.setValueByFieldName(entity, "tenantId", paramMap.get(Constant.TENANTID_KEY).toString());
		}
		//获取实体类存在platform字段
		Field fieldPlatForm = ReflectUtils.getFieldByFieldName(entity, Constant.PLATFORM_KEY);
		if(fieldPlatForm!=null && !"".equals(fieldPlatForm)) {
			ReflectUtils.setValueByFieldName(entity, Constant.PLATFORM_KEY, paramMap.get(Constant.PLATFORM_KEY).toString());
		}

		this.sqlSessionTemplateFactory.getSqlSessionTemplate().insert(defaultStatement, entity);

		return entity;
	}

	@Override
	public int update(Map<String,Object> paramMap, T entity) {
		String defaultStatement = this.entityClass.getName() + "Mapper.update";
		// 实体类存在tenantId字段
		Field field = ReflectUtils.getFieldByFieldName(entity,
				"tenantId");
		if (field != null) {
			ReflectUtils.setValueByFieldName(entity, "tenantId",
					paramMap.get(Constant.TENANTID_KEY));
		}
		return sqlSessionTemplateFactory.getSqlSessionTemplate().update(
				defaultStatement, entity);
	}

	@Override
	public int delete(Map<String,Object> paramMap, PK id) {
		String defaultStatement = this.entityClass.getName() + "Mapper.delete";

		paramMap.put("id",id);

		return sqlSessionTemplateFactory.getSqlSessionTemplate().delete(
				defaultStatement, paramMap);
	}

	@Override
	public int delete(Map<String,Object> paramMap, String property, Object value) {
		String defaultStatement = this.entityClass.getName()
				+ "Mapper.deleteByProperty";

		paramMap.put("property", property);
		paramMap.put("value", value);


		return sqlSessionTemplateFactory.getSqlSessionTemplate().delete(
				defaultStatement, paramMap);
	}

	@Override
	public int[] delete(Map<String,Object> paramMap, List<PK> ids) {
		String defaultStatement = this.entityClass.getName() + "Mapper.delete";
		Assert.notEmpty(ids, "parameter 'ids' can't be null or empty!");
		List<Integer> batchResultList = new ArrayList<Integer>();
		SqlSession sqlSession = sqlSessionTemplateFactory
				.getSqlSessionTemplate(ExecutorType.BATCH);
		try {
			for (int i = 0; i < ids.size(); i++) {
				sqlSession.delete(defaultStatement, ids.get(i));
				if ((i + 1) % DEFAULT_FLUSH_BATCH_SIZE == 0) {
					List<BatchResult> currentBatchResultList = sqlSession
							.flushStatements();
					extractBatchResult(batchResultList, currentBatchResultList);
				}
			}
		} finally {
			List<BatchResult> currentBatchResultList = sqlSession
					.flushStatements();
			extractBatchResult(batchResultList, currentBatchResultList);
		}
		return ArrayUtils
				.toPrimitive(batchResultList.toArray(new Integer[] {}));
	}

	@Override
	public int[] save(Map<String,Object> paramMap, List<T> entity) {
		String defaultStatement = this.entityClass.getName() + "Mapper.save";
		Assert.notEmpty(entity, "parameter 'entity' can't be null or empty!");
		List<Integer> batchResultList = new ArrayList<Integer>();
		SqlSession sqlSession = sqlSessionTemplateFactory
				.getSqlSessionTemplate(ExecutorType.BATCH);

		try {
			for (int i = 0; i < entity.size(); i++) {
				// 实体类存在tenantId字段
				Field field = ReflectUtils.getFieldByFieldName(entity.get(i),
						"tenantId");
				if (field != null) {
					ReflectUtils.setValueByFieldName(entity.get(i), "tenantId",
							paramMap.get(Constant.TENANTID_KEY));
				}
				
				sqlSession.insert(defaultStatement, entity.get(i));
				if ((i + 1) % DEFAULT_FLUSH_BATCH_SIZE == 0) {
					List<BatchResult> currentBatchResultList = sqlSession
							.flushStatements();
					extractBatchResult(batchResultList, currentBatchResultList);
				}
			}
		} finally {
			List<BatchResult> currentBatchResultList = sqlSession
					.flushStatements();
			extractBatchResult(batchResultList, currentBatchResultList);
		}
		return ArrayUtils
				.toPrimitive(batchResultList.toArray(new Integer[] {}));
	}

	@Override
	public int[] update(Map<String,Object> paramMap, List<T> entity) {
		String defaultStatement = this.entityClass.getName() + "Mapper.update";
		Assert.notEmpty(entity, "parameter 'entity' can't be null or empty!");
		List<Integer> batchResultList = new ArrayList<Integer>();
		SqlSession sqlSession = sqlSessionTemplateFactory
				.getSqlSessionTemplate(ExecutorType.BATCH);
		try {
			for (int i = 0; i < entity.size(); i++) {
				// 实体类存在tenantId字段
				Field field = ReflectUtils.getFieldByFieldName(entity.get(i),
						"tenantId");
				if (field != null) {
					ReflectUtils.setValueByFieldName(entity.get(i), "tenantId",
							paramMap.get(Constant.TENANTID_KEY));
				}
				sqlSession.update(defaultStatement, entity.get(i));
				if ((i + 1) % DEFAULT_FLUSH_BATCH_SIZE == 0) {
					List<BatchResult> currentBatchResultList = sqlSession
							.flushStatements();
					extractBatchResult(batchResultList, currentBatchResultList);
				}
			}
		} finally {
			List<BatchResult> currentBatchResultList = sqlSession
					.flushStatements();
			extractBatchResult(batchResultList, currentBatchResultList);
		}
		return ArrayUtils
				.toPrimitive(batchResultList.toArray(new Integer[] {}));
	}

	protected void extractBatchResult(List<Integer> batchResultList,
			List<BatchResult> currentBatchResultList) {
		if (currentBatchResultList != null && !currentBatchResultList.isEmpty()) {
			for (BatchResult batchResult : currentBatchResultList) {
				int[] updateCounts = batchResult.getUpdateCounts();
				if (updateCounts != null && updateCounts.length > 0) {
					for (int n = 0; n < updateCounts.length; n++) {
						batchResultList.add(updateCounts[n]);
					}
				}
			}
		}
	}
}
