package net.deepdragon.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.BaseEntity;
import net.deepdragon.bean.Pager;

/**
 * Service接口 - Service接口基类
 */
public interface BaseService<T extends BaseEntity, PK extends Serializable> {

	/**
	 * 根据主键获取唯一的实体对象.
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param id
	 *            主键
	 * @return
	 * @throws 
	 */
	T get(Map<String,Object> paramMap, PK id) throws Exception;

	/**
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param property
	 *            属性名
	 * @param value
	 *            属性值
	 * @return
	 * @throws Exception
	 */
	T find(Map<String,Object> paramMap, String property, Object value) throws Exception;

	/**
	 * 根据列名和值查询数据列表
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param property
	 *            属性名
	 * @param value
	 *            属性值
	 * @return
	 * @throws Exception
	 */
	List<T> findList(Map<String,Object> paramMap, String property, Object value)
			throws Exception;

	/**
	 * 根据主键ID获取数据列表
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param ids
	 *            主键集合
	 * @return
	 * @throws Exception
	 */
	List<T> findListByIds(Map<String,Object> paramMap, List<PK> ids) throws Exception;

	/**
	 * 获取全部数据
	 * 
	 * @param paramMap
	 *            参数Map
	 * @return
	 * @throws Exception
	 */
	List<T> getAll(Map<String,Object> paramMap) throws Exception;

	/**
	 * 获取分页数据
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param criteria
	 *            查询条件
	 * @param pager
	 * @return
	 * @throws Exception
	 */
	Pager getPager(Map<String,Object> paramMap, Criteria criteria, Pager pager)
			throws Exception;

	/**
	 * 获取列表数据
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param criteria
	 *            查询条件
	 * @return
	 * @throws Exception
	 */
	List<T> getList(Map<String,Object> paramMap, Criteria criteria)
			throws Exception;

	/**
	 * 获取当前总记录数
	 * 
	 * @param paramMap
	 *            参数Map
	 * @return
	 * @throws Exception
	 */
	Long getTotalCount(Map<String,Object> paramMap) throws Exception;

	/**
	 * 根据属性和值判断记录是否存在
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param property
	 *            属性名
	 * @param value
	 *            属性值
	 * @return
	 * @throws
	 * @throws 
	 */
	Boolean isExist(Map<String,Object> paramMap, String property, Object value)
			throws Exception;

	/**
	 * 保存实体对象
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param entity
	 *            实体对象
	 * @return
	 * @throws Exception
	 */
	T save(Map<String,Object> paramMap, T entity) throws Exception;

	/**
	 * 修改对象
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param entity
	 *            实体对象
	 * @return
	 * @throws Exception
	 */
	int update(Map<String,Object> paramMap, T entity) throws Exception;

	/**
	 * 删除对象
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param id
	 *            对象ID
	 * @return
	 * @throws Exception
	 */
	int delete(Map<String,Object> paramMap, PK id) throws Exception;

	/**
	 * 根据列名和值删除数据
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param property
	 *            列名称
	 * @param value
	 *            列值
	 * @return
	 * @throws Exception
	 */
	int delete(Map<String,Object> paramMap, String property, Object value) throws Exception;

	/**
	 * 批量删除对象
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param ids
	 * @return
	 * @throws
	 * @throws
	 * @throws 
	 */
	int[] delete(Map<String,Object> paramMap, List<PK> ids) throws Exception;

	/**
	 * 批量保存
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param entity
	 *            实体对象集合
	 * @return
	 * @throws Exception
	 */
	int[] save(Map<String,Object> paramMap, List<T> entity) throws Exception;

	/**
	 * 批量更新
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param entity
	 *            实体对象集合
	 * @return Exception
	 */
	int[] update(Map<String,Object> paramMap, List<T> entity) throws Exception;
}
