package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.InvitebusinessDao;
import net.deepdragon.entity.weipu.Invitebusiness;
import org.springframework.stereotype.Repository;

/**
 * wp_invitebusiness数据接口实现
*/
@Repository(Weipu.SIGN + "InvitebusinessDaoImpl")
public class InvitebusinessDaoImpl extends BaseDaoImpl<Invitebusiness, String> implements
		InvitebusinessDao {

}
