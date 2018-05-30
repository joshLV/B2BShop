package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.ComplaintDao;
import net.deepdragon.entity.weipu.Complaint;
import org.springframework.stereotype.Repository;

/**
 * author :乐昌海
 */
@Repository(Weipu.SIGN + "ComplaintDaoImpl")
public class ComplaintDaoImpl extends BaseDaoImpl<Complaint, String> implements ComplaintDao {
}
