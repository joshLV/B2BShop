package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.BuyerOperatorDao;
import net.deepdragon.entity.weipu.BuyerOperator;

import org.springframework.stereotype.Repository;

/**
 * 广货街操作员表数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "BuyerOperatorDaoImpl")
public class BuyerOperatorDaoImpl extends BaseDaoImpl<BuyerOperator, String> implements
		BuyerOperatorDao {

}
