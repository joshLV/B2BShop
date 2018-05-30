package net.deepdragon.service.weipu;

import net.deepdragon.bean.Pager;
import net.deepdragon.bean.TableSchema;
import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.BaseEntity;
import net.deepdragon.exceptions.DataSourceDescriptorException;
import net.deepdragon.procedure.StoredProcedureInfo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * Service接口 - Service接口基类
 */
public interface BaseService<T extends BaseEntity, PK extends Serializable> {

	/**
	 * 根据主键获取唯一的实体对象.
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param id
	 *            主键
	 * @return
	 * @throws ServiceException
	 */
	T get(Map<String, Object> paramMap, PK id) throws Exception;

	/**
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param property
	 *            属性名
	 * @param value
	 *            属性值
	 * @return
	 * @throws Exception
	 */
	T find(Map<String, Object> paramMap, String property, Object value) throws Exception;

	/**
	 * 根据列名和值查询数据列表
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param property
	 *            属性名
	 * @param value
	 *            属性值
	 * @return
	 * @throws Exception
	 */
	List<T> findList(Map<String, Object> paramMap, String property, Object value)
			throws Exception;

	/**
	 * 根据主键ID获取数据列表
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param ids
	 *            主键集合
	 * @return
	 * @throws Exception
	 */
	List<T> findListByIds(Map<String, Object> paramMap, List<PK> ids) throws Exception;

	/**
	 * 获取全部数据
	 * 
	 * @param paramMap
	 *            租户标识
	 * @return
	 * @throws Exception
	 */
	List<T> getAll(Map<String, Object> paramMap) throws Exception;

	/**
	 * 获取分页数据
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param criteria
	 *            查询条件
	 * @param pager
	 * @return
	 * @throws Exception
	 */
	Pager getPager(Map<String, Object> paramMap, Criteria criteria, Pager pager)
			throws Exception;

	/**
	 * 获取列表数据
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param criteria
	 *            查询条件
	 * @return
	 * @throws Exception
	 */
	List<T> getList(Map<String, Object> paramMap, Criteria criteria)
			throws Exception;

	/**
	 * 获取当前总记录数
	 * 
	 * @param paramMap
	 *            租户标识
	 * @return
	 * @throws Exception
	 */
	Long getTotalCount(Map<String, Object> paramMap) throws Exception;

	/**
	 * 根据属性和值判断记录是否存在
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param property
	 *            属性名
	 * @param value
	 *            属性值
	 * @return
	 * @throws DataSourceDescriptorException
	 * @throws ServiceException
	 */
	Boolean isExist(Map<String, Object> paramMap, String property, Object value)
			throws Exception;

	/**
	 * 保存实体对象
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param entity
	 *            实体对象
	 * @return
	 * @throws Exception
	 */
	T save(Map<String, Object> paramMap, T entity) throws Exception;

	/**
	 * 修改对象
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param entity
	 *            实体对象
	 * @return
	 * @throws Exception
	 */
	int update(Map<String, Object> paramMap, T entity) throws Exception;

	/**
	 * 删除对象
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param id
	 *            对象ID
	 * @return
	 * @throws Exception
	 */
	int delete(Map<String, Object> paramMap, PK id) throws Exception;

	/**
	 * 根据列名和值删除数据
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param property
	 *            列名称
	 * @param value
	 *            列值
	 * @return
	 * @throws Exception
	 */
	int delete(Map<String, Object> paramMap, String property, Object value) throws Exception;

	/**
	 * 批量删除对象
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param ids
	 * @return
	 * @throws ForeignKeyException
	 * @throws DataSourceDescriptorException
	 * @throws ServiceException
	 */
	int[] delete(Map<String, Object> paramMap, List<PK> ids) throws Exception;

	/**
	 * 批量保存
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param entity
	 *            实体对象集合
	 * @return
	 * @throws Exception
	 */
	int[] save(Map<String, Object> paramMap, List<T> entity) throws Exception;

	/**
	 * 批量更新
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param entity
	 *            实体对象集合
	 * @return Exception
	 */
	int[] update(Map<String, Object> paramMap, List<T> entity) throws Exception;
	
	
	/**
	 * 获取主键值,数据库不是采用自增主键,添加操作需要调用该方法获取主键
	 * 
	 * @param paramMap
	 * @return
	 */
	String getPrimaryKey(Map<String, Object> paramMap);

	/**
	 * 根据SQL语句获取集合列表
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param sql
	 *            SQL
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> selectList(Map<String, Object> paramMap, String sql)
			throws Exception;

	/**
	 * 根据SQL语句获取集合
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> selectOne(Map<String, Object> paramMap, String sql) throws Exception;

	/**
	 * 根据SQL获取分页集合
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param sql
	 * @param pager
	 * @return
	 * @throws Exception
	 */
	Pager selectPager(Map<String, Object> paramMap, String sql, Pager pager)
			throws Exception;

	/**
	 * 插入单条数据
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	boolean insertOne(Map<String, Object> paramMap, String sql) throws Exception;

	/**
	 * 批量插入数据
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	boolean insertBatch(Map<String, Object> paramMap, List<String> sql) throws Exception;

	/**
	 * 判断数据库中表是否存在
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param tableName
	 *            表名
	 * @return
	 * @throws Exception
	 */
	boolean isTableNameExist(Map<String, Object> paramMap, String tableName)
			throws Exception;

	/**
	 * 数据表CREATE，ALTER，DROP操作方法
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param sql
	 *            DDL语句
	 * @return
	 * @throws Exception
	 */
	boolean executeTableOperation(Map<String, Object> paramMap, List<String> sql)
			throws Exception;

	/**
	 * 获取存储过程信息
	 * 
	 * @param paramMap
	 * @param catalog
	 * @param procedureName
	 * @return
	 * @throws Exception
	 */
	StoredProcedureInfo getStoredProcedureInfo(Map<String, Object> paramMap, String catalog,
											   String procedureName) throws Exception;

	/**
	 * 执行存储过程
	 * 
	 * @param paramMap
	 * @param storedProcedureInfo
	 * @return
	 * @throws Exception
	 */
	StoredProcedureInfo execute(Map<String, Object> paramMap,
								StoredProcedureInfo storedProcedureInfo) throws Exception;

	/**
	 * 根据表名或者视图名称获取列信息
	 * 
	 * @param paramMap
	 * @param tableOrViewName
	 * @return
	 * @throws Exception
	 */
	List<TableSchema> getColumns(Map<String, Object> paramMap, String tableOrViewName)
			throws Exception;

	/**
	 * 删除单条记录
	 * @param paramMap
	 *            租户ID
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	boolean deleteOne(Map<String, Object> paramMap, String sql)
			throws Exception;

	/**
	 * 批量删除记录
	 * @param paramMap
	 *            租户ID
	 * @param sql
	 * @return
	 * @throws DataSourceDescriptorException
	 * @throws ServiceException
	 */
	boolean deleteBatch(Map<String, Object> paramMap, List<String> sql)
			throws Exception;
}
