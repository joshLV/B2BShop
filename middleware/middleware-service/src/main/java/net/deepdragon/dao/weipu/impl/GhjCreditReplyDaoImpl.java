package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.GhjCreditReplyDao;
import net.deepdragon.entity.weipu.GhjCreditReply;

import org.springframework.stereotype.Repository;

/**
 * ghj_ghj_credit_reply数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "GhjCreditReplyDaoImpl")
public class GhjCreditReplyDaoImpl extends BaseDaoImpl<GhjCreditReply, String> implements
		GhjCreditReplyDao {

}
