package net.deepdragon.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.BaseEntity;
import net.deepdragon.mybatis.domain.PageBounds;

/**
 * Dao接口 - Dao基接口
 */
public interface BaseDao<T extends BaseEntity, PK extends Serializable> {

	/**
	 * 根据ID获取实体对象.
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param id
	 *            记录ID
	 * @return 实体对象
	 */
	T get(Map<String,Object> paramMap, PK id);

	/**
	 * 根据某一列获取实体对象
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param property
	 *            列名称
	 * @param value
	 *            值
	 * @return
	 */
	T find(Map<String,Object> paramMap, String property, Object value);

	/**
	 * 根据列名和属性值获取实体对象集合
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param property
	 *            列名
	 * @param value
	 *            值
	 * @return
	 */
	List<T> findList(Map<String,Object> paramMap, String property, Object value);

	/**
	 * 根据ID集合获取对象集合
	 *
	 * @param ids
	 *            ID集合
	 * @return
	 */
	List<T> findListByIds(Map<String,Object> paramMap, List<PK> ids);
	
	/**
	 * 获取全部数据集合
	 * 
	 * @param paramMap
	 *            参数Map
	 * @return 实体对象集合
	 */
	List<T> getAll(Map<String,Object> paramMap);

	/**
	 * 获取分页集合对象
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param criteria
	 *            查询条件
	 * @param pageBounds
	 *            分页参数
	 * @return 分页对象
	 */
	List<T> getPager(Map<String,Object> paramMap, Criteria criteria, PageBounds pageBounds);

	/**
	 * 获取集合对象
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param criteria
	 *            查询条件
	 * @return
	 */
	List<T> getList(Map<String,Object> paramMap, Criteria criteria);

	/**
	 * 获取当前记录总数
	 * 
	 * @param paramMap
	 *            参数Map
	 * @return
	 */
	Long getTotalCount(Map<String,Object> paramMap);

	/**
	 * 根据属性名判断数据是否已存在.
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param property
	 *            列名称
	 * @param value
	 *            值
	 * @return
	 */
	Boolean isExist(Map<String,Object> paramMap, String property, Object value);

	/**
	 * 保存实体对象
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param entity
	 *            实体类
	 * @return 实体对象
	 */
	T save(Map<String,Object> paramMap, T entity);

	/**
	 * 批量保存数据
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param entity
	 *            实体类
	 * @return
	 */
	int[] save(Map<String,Object> paramMap, List<T> entity);

	/**
	 * 修改实体对象
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param entity
	 *            实体类
	 * @return 受影响的行数
	 */
	int update(Map<String,Object> paramMap, T entity);

	/**
	 * 批量修改实体类
	 * @param paramMap
	 *            参数Map
	 * @param entity
	 *            实体类
	 * @return
	 */
	int[] update(Map<String,Object> paramMap, List<T> entity);

	/**
	 * 删除实体对象
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param id
	 *            PK
	 * @return 受影响的行数
	 */
	int delete(Map<String,Object> paramMap, PK id);

	/**
	 * 删除实体
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param property
	 *            列名称
	 * @param value
	 *            列值
	 * @return
	 */
	int delete(Map<String,Object> paramMap, String property, Object value);
	
	/**
	 * 批量删除实体对象.
	 * 
	 * @param paramMap
	 * @param ids
	 * @return
	 */
	int[] delete(Map<String,Object> paramMap, List<PK> ids);

}
