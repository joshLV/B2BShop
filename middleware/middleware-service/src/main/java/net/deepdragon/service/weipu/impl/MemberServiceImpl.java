package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.MemberDao;
import net.deepdragon.entity.weipu.Member;
import net.deepdragon.service.weipu.MemberService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(Weipu.SIGN+"MemberServiceImpl")
public class MemberServiceImpl extends BaseServiceImpl<Member, String> implements MemberService {

	@Resource(name= Weipu.SIGN+"MemberDaoImpl")
	private MemberDao memberDao;
	
	@Override
	public BaseDao<Member, String> getBaseDao() {
		return this.memberDao;
	}
	
}

