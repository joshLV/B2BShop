package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.FlashMemberDao;
import net.deepdragon.entity.weipu.FlashMember;
import org.springframework.stereotype.Repository;

/**
 * 会员秒杀记录数据接口实现
*/
@Repository(Weipu.SIGN + "FlashMemberDaoImpl")
public class FlashMemberDaoImpl extends BaseDaoImpl<FlashMember, String> implements
		FlashMemberDao {

}
