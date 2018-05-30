package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.MemberDao;
import net.deepdragon.entity.weipu.Member;
import org.springframework.stereotype.Repository;

/**
 * 会员信息数据接口实现
*/
@Repository(Weipu.SIGN + "MemberDaoImpl")
public class MemberDaoImpl extends BaseDaoImpl<Member, String> implements
		MemberDao {

}
