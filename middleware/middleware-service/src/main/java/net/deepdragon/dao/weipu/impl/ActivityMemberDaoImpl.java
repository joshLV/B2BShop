package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.ActivityMemberDao;
import net.deepdragon.entity.weipu.ActivityMember;
import org.springframework.stereotype.Repository;

/**
 * 会员参与活动记录数据接口实现
*/
@Repository(Weipu.SIGN + "ActivityMemberDaoImpl")
public class ActivityMemberDaoImpl extends BaseDaoImpl<ActivityMember, String> implements
		ActivityMemberDao {

}
