package net.deepdragon.service.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.MemberRankDao;
import net.deepdragon.entity.weipu.MemberRank;
import net.deepdragon.service.weipu.MemberRankService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service(Weipu.SIGN + "MemberRankServiceImpl")
public class MemberRankServiceImpl extends BaseServiceImpl<MemberRank, String>
		implements MemberRankService {

	@Resource(name = Weipu.SIGN
			+ "MemberRankDaoImpl")
	private MemberRankDao memberRankDao;

	@Override
	public BaseDao<MemberRank, String> getBaseDao() {
		return this.memberRankDao;
	}

	@Override
	public MemberRank getDefaultMemberRank(Map<String, Object> paramMap) throws Exception {
		try {
			return this.memberRankDao.getDefaultMemberRank(paramMap);
		} catch (Exception e) {
			throw e;
		}
	}
	
}
