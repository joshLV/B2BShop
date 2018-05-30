package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.MemberRankDao;
import net.deepdragon.entity.weipu.MemberRank;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

/**
 * 会员等级数据接口实现
*/
@Repository(Weipu.SIGN + "MemberRankDaoImpl")
public class MemberRankDaoImpl extends BaseDaoImpl<MemberRank, String> implements
		MemberRankDao {
	
	@Override
	public MemberRank getDefaultMemberRank(Map<String, Object> paramMap) {
		String defaultStatement = MemberRank.class.getName() + "Mapper.getDefaultMemberRank";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(
				defaultStatement, paramMap);
	}
	
}
