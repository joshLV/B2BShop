package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.dao.weipu.PurchaseOrderDetailDao;
import net.deepdragon.entity.weipu.CartItem;
import net.deepdragon.entity.weipu.Goods;
import net.deepdragon.entity.weipu.PurchaseOrderDetail;

import net.deepdragon.mybatis.domain.PageBounds;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 采购单明细表数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "PurchaseOrderDetailDaoImpl")
public class PurchaseOrderDetailDaoImpl extends BaseDaoImpl<PurchaseOrderDetail, String> implements
		PurchaseOrderDetailDao {

	/**
	 * 获取采购单明细
	 *
	 * @param paramMap
	 *            租户标识
	 * @param criteria
	 *            字段条件
	 *
	 * @return 参数列表
	 */
	public List<Goods> getPurchaseOrderDetailList(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) {
		String defaultStatement = PurchaseOrderDetail.class.getName() + "Mapper.getPurchaseOrderDetailInPlatform";
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
	}

	/**
	 * 获取非平台采购单明细
	 *
	 * @param paramMap
	 *            租户标识
	 * @param criteria
	 *            字段条件
	 *
	 * @return 参数列表
	 */
	public List<PurchaseOrderDetail> getPurchaseOrderNoPlatformDetailList(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) {
		String defaultStatement = PurchaseOrderDetail.class.getName() + "Mapper.getPurchaseOrderDetailNoPlatform";

		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
	}

	/**
	 * 获取非平台采购单明细
	 *
	 * @param buyerId
	 *            采购商ID
	 * @param ids
	 *            采购单明细ID集合
	 * @return 参数列表
	 */
	public List<CartItem> getListByBuyerIdAndIdsPurchaseOrder(Map<String, Object> paramMap, String buyerId, List<String> ids) {
		String defaultStatement = PurchaseOrderDetail.class.getName() + "Mapper.getListByBuyerIdAndIdsPurchaseOrder";

		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("buyerId", buyerId);
		parameter.put("ids", ids);

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}


	@Override
	public List<PurchaseOrderDetail> getPagerGroupName(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) {
		String defaultStatement = PurchaseOrderDetail.class.getName() + "Mapper.getPagerGroupName";

		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
	}

	@Override
	public List<Map<String, String>> getInPlatformExportData(Map<String, Object> paramMap, String purchasOrdereId, List<String> ids) {
		String defaultStatement = PurchaseOrderDetail.class.getName() + "Mapper.getInPlatformExportData";

		paramMap.put("purchasOrdereId", purchasOrdereId);
		paramMap.put("list", ids);

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}
}
