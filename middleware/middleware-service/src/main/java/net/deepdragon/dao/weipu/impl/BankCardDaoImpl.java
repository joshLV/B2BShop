package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BankCardDao;
import net.deepdragon.entity.weipu.BankCard;
import org.springframework.stereotype.Repository;

/**
 * author :乐昌海
 */
@Repository(Weipu.SIGN + "BankCardDaoImpl")
public class BankCardDaoImpl extends BaseDaoImpl<BankCard, String> implements BankCardDao {
}
