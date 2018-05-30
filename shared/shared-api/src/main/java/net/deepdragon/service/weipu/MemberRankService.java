package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.MemberRank;

import java.util.Map;

/**
 * 会员等级数据接口
 */
public interface MemberRankService extends BaseService<MemberRank, String> {

	/**
	 * 获取默认的会员等级
	 *
	 * @param paramMap
	 *            租户标识
	 * @return
	 * @throws Exception
	 */
	MemberRank getDefaultMemberRank(Map<String, Object> paramMap) throws Exception;

}
