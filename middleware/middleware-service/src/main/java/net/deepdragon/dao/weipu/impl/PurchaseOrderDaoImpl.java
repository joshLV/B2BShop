package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.PurchaseOrderDao;
import net.deepdragon.entity.weipu.PurchaseOrder;

import org.springframework.stereotype.Repository;

/**
 * 采购单表数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "PurchaseOrderDaoImpl")
public class PurchaseOrderDaoImpl extends BaseDaoImpl<PurchaseOrder, String> implements
		PurchaseOrderDao {

}
