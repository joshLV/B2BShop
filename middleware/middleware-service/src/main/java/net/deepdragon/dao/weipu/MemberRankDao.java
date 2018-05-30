package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.MemberRank;

import java.util.Map;

public interface MemberRankDao extends BaseDao<MemberRank, String> {
	
	/**
	 * 获取默认的会员等级
	 * 
	 * @param paramMap
	 *            租户标识
	 * @return
	 * @throws Exception
	 */
	MemberRank getDefaultMemberRank(Map<String, Object> paramMap);
	
}
