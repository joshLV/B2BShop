package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.dao.weipu.GhjVmRedenvelopaccountDao;
import net.deepdragon.entity.weipu.GhjVmRedenvelopaccount;

import net.deepdragon.mybatis.domain.PageBounds;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * ghj_ghj_vm_redenvelopaccount数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "GhjVmRedenvelopaccountDaoImpl")
public class GhjVmRedenvelopaccountDaoImpl extends BaseDaoImpl<GhjVmRedenvelopaccount, String> implements
		GhjVmRedenvelopaccountDao {

	@Override
	public List<GhjVmRedenvelopaccount> getDirectionalMerchantList(Map<String, Object> paramMap, Criteria criteria) {
		String defaultStatement = GhjVmRedenvelopaccount.class.getName() + "Mapper.getDirectionalMerchantList";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, criteria);
	}
	@Override
	public List<GhjVmRedenvelopaccount> getRedenvelopList(Map<String, Object> paramMap, Criteria criteria) {
		String defaultStatement = GhjVmRedenvelopaccount.class.getName() + "Mapper.getRedenvelopList";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, criteria);
	}
	/**
	 * 获取红包记录
	 *
	 * @param paramMap
	 *            租户标识
	 * @param criteria
	 *            字段条件
	 * @param pageBounds
	 *            分页信息
	 *
	 * @return 参数列表
	 */
	public List<GhjVmRedenvelopaccount> getRedenvelopRecord(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) {
		String defaultStatement = GhjVmRedenvelopaccount.class.getName() + "Mapper.getRedenvelopRecord";

		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
	}
}
