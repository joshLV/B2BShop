package net.deepdragon.dao.weipu;

import net.deepdragon.bean.Pager;
import net.deepdragon.bean.TableSchema;
import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.BaseEntity;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.mybatis.support.SqlSessionCallback;
import net.deepdragon.procedure.StoredProcedureInfo;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * Dao接口 - Dao基接口
 */
public interface BaseDao<T extends BaseEntity, PK extends Serializable> {

	/**
	 * 根据ID获取实体对象.
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param id
	 *            记录ID
	 * @return 实体对象
	 */
	T get(Map<String, Object> paramMap, PK id);

	/**
	 * 根据某一列获取实体对象
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param property
	 *            列名称
	 * @param value
	 *            值
	 * @return
	 */
	T find(Map<String, Object> paramMap, String property, Object value);

	/**
	 * 根据列名和属性值获取实体对象集合
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param property
	 *            列名
	 * @param value
	 *            值
	 * @return
	 */
	List<T> findList(Map<String, Object> paramMap, String property, Object value);

	/**
	 * 根据ID集合获取对象集合
	 * 
	 * @param paramMap
	 *            标识
	 * @param ids
	 *            ID集合
	 * @return
	 */
	List<T> findListByIds(Map<String, Object> paramMap, List<PK> ids);
	
	/**
	 * 获取全部数据集合
	 * 
	 * @param paramMap
	 *            租户ID
	 * @return 实体对象集合
	 */
	List<T> getAll(Map<String, Object> paramMap);

	/**
	 * 获取分页集合对象
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param criteria
	 *            查询条件
	 * @param pageBounds
	 *            分页参数
	 * @return 分页对象
	 */
	List<T> getPager(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds);

	/**
	 * 获取集合对象
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param criteria
	 *            查询条件
	 * @return
	 */
	List<T> getList(Map<String, Object> paramMap, Criteria criteria);

	/**
	 * 获取当前记录总数
	 * 
	 * @param paramMap
	 *            租户ID
	 * @return
	 */
	Long getTotalCount(Map<String, Object> paramMap);

	/**
	 * 根据属性名判断数据是否已存在.
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param property
	 *            列名称
	 * @param value
	 *            值
	 * @return
	 */
	Boolean isExist(Map<String, Object> paramMap, String property, Object value);

	/**
	 * 保存实体对象
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param entity
	 *            实体类
	 * @return 实体对象
	 */
	T save(Map<String, Object> paramMap, T entity);

	/**
	 * 批量保存数据
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param entity
	 *            实体类
	 * @return
	 */
	int[] save(Map<String, Object> paramMap, List<T> entity);

	/**
	 * 修改实体对象
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param entity
	 *            实体类
	 * @return 受影响的行数
	 */
	int update(Map<String, Object> paramMap, T entity);

	/**
	 * 批量修改实体类
	 * @param paramMap
	 *            租户ID
	 * @param entity
	 *            实体类
	 * @return
	 */
	int[] update(Map<String, Object> paramMap, List<T> entity);

	/**
	 * 删除实体对象
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param id
	 *            PK
	 * @return 受影响的行数
	 */
	int delete(Map<String, Object> paramMap, PK id);

	/**
	 * 删除实体
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param property
	 *            列名称
	 * @param value
	 *            列值
	 * @return
	 */
	int delete(Map<String, Object> paramMap, String property, Object value);
	
	/**
	 * 批量删除实体对象.
	 * 
	 * @param paramMap
	 * @param ids
	 * @return
	 */
	int[] delete(Map<String, Object> paramMap, List<PK> ids);
	
	
	/**
	 * 执行SQL语句，返回记录集合
	 * 
	 * @param sql
	 * @return
	 */
	List<Map<String, Object>> selectList(String sql);

	/**
	 * 执行SQL语句，返回记录
	 * 
	 * @param sql
	 * @return
	 */
	Map<String, Object> selectOne(String sql);

	/**
	 * 获取分页对象
	 * 
	 * @param sql
	 * @param pager
	 * @return
	 */
	Pager selectPager(String sql, Pager pager) throws SQLException;

	/**
	 * 插入单条记录
	 * 
	 * @param callback
	 * @return
	 */
	boolean insertOne(SqlSessionCallback<Boolean> callback) throws SQLException;

	/**
	 * 批量插入记录
	 * 
	 * @param callback
	 * @return
	 * @throws SQLException
	 */
	boolean insertBatch(SqlSessionCallback<Boolean> callback)
			throws SQLException;

	/**
	 * 计算记录总数
	 * 
	 * @param callback
	 * @return
	 * @throws SQLException
	 */
	int getCount(SqlSessionCallback<Integer> callback) throws SQLException;

	/**
	 * 删除单调记录
	 * 
	 * @param callback
	 * @return
	 */
	boolean deleteOne(SqlSessionCallback<Boolean> callback) throws SQLException;

	/**
	 * 批量删除记录
	 * 
	 * @param callback
	 * @return
	 * @throws SQLException
	 */
	boolean deleteBatch(SqlSessionCallback<Boolean> callback)
			throws SQLException;

	/**
	 * 判断表名是否存在
	 * 
	 * @param tableName
	 *            表名
	 * @return
	 * @throws SQLException
	 */
	boolean isTableNameExist(SqlSessionCallback<Boolean> callback)
			throws SQLException;

	/**
	 * 数据表CREATE，ALTER，DROP操作方法
	 * 
	 * @param callback
	 * @return
	 * @throws SQLException
	 */
	boolean executeTableOperation(SqlSessionCallback<Boolean> callback)
			throws SQLException;

	/**
	 * 获取存储过程的元信息,建议缓存
	 * 
	 * @param catalog
	 *            存储过程包名
	 * @param procedureName
	 *            存储过程名称
	 * @return
	 */
	StoredProcedureInfo getStoredProcedureInfo(
			SqlSessionCallback<StoredProcedureInfo> callback)
			throws SQLException;

	/**
	 * 执行存储过程
	 * 
	 * @param callback
	 * @return
	 * @throws SQLException
	 */
	StoredProcedureInfo execute(SqlSessionCallback<StoredProcedureInfo> callback)
			throws SQLException;

	/**
	 * 根据表名或者视图名称获取列信息
	 * 
	 * @param callback
	 * @return
	 * @throws SQLException
	 */
	List<TableSchema> getColumns(SqlSessionCallback<List<TableSchema>> callback)
			throws SQLException;

}

