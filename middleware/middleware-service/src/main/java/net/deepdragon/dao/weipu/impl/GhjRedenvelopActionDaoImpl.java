package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.GhjRedenvelopActionDao;
import net.deepdragon.entity.weipu.GhjRedenvelopAction;

import org.springframework.stereotype.Repository;

/**
 * ghj_redenvelop_action数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "GhjRedenvelopActionDaoImpl")
public class GhjRedenvelopActionDaoImpl extends BaseDaoImpl<GhjRedenvelopAction, String> implements
		GhjRedenvelopActionDao {

}
