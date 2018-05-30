package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import net.deepdragon.bean.PageList;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.CartItem;
import net.deepdragon.mybatis.domain.PageBounds;
import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.PurchaseOrderDetailDao;
import net.deepdragon.entity.weipu.PurchaseOrderDetail;
import net.deepdragon.service.weipu.PurchaseOrderDetailService;

import java.util.List;
import java.util.Map;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"PurchaseOrderDetailServiceImpl")
public class PurchaseOrderDetailServiceImpl extends BaseServiceImpl<PurchaseOrderDetail, String> implements PurchaseOrderDetailService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"PurchaseOrderDetailDaoImpl")
	private PurchaseOrderDetailDao purchaseOrderDetailDao;
	
	@Override
	public BaseDao<PurchaseOrderDetail, String> getBaseDao() {
		return this.purchaseOrderDetailDao;
	}

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
	public Pager getPurchaseOrderDetailList(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception{
		try {
			PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
			List list = purchaseOrderDetailDao.getPurchaseOrderDetailList(paramMap, criteria, pageBounds);
			pager.setList(list);
			PageList pageList = (PageList) list;
			pager.setTotalCount(pageList.getPaginator().getTotalCount());
			return pager;
		} catch (Exception e) {
			throw e;
		}
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
	public Pager getPurchaseOrderNoPlatformDetailList(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception{
		try {
			PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
			List list = purchaseOrderDetailDao.getPurchaseOrderNoPlatformDetailList(paramMap, criteria, pageBounds);
			pager.setList(list);
			PageList pageList = (PageList) list;
			pager.setTotalCount(pageList.getPaginator().getTotalCount());
			return pager;
		} catch (Exception e) {
			throw e;
		}
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
	public List<CartItem> getListByBuyerIdAndIdsPurchaseOrder(Map<String, Object> paramMap, String buyerId, List<String> ids) throws Exception {
		return purchaseOrderDetailDao.getListByBuyerIdAndIdsPurchaseOrder(paramMap, buyerId, ids);
	}

	@Override
	public Pager getPagerGroupName(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
		List<PurchaseOrderDetail> list = purchaseOrderDetailDao.getPagerGroupName(paramMap, criteria, pageBounds);
		pager.setList(list);
		PageList pageList = (PageList) list;
		pager.setTotalCount(pageList.getPaginator().getTotalCount());
		return pager;
	}

	@Override
	public List<Map<String, String>> getInPlatformExportData(Map<String, Object> paramMap, String purchasOrdereId, List<String> ids) {
		return purchaseOrderDetailDao.getInPlatformExportData(paramMap, purchasOrdereId, ids);
	}
}

