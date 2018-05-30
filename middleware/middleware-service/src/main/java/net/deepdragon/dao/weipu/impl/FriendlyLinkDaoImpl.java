package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.FriendlyLinkDao;
import net.deepdragon.entity.weipu.FriendlyLink;

import org.springframework.stereotype.Repository;

/**
 * 友情链接数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "FriendlyLinkDaoImpl")
public class FriendlyLinkDaoImpl extends BaseDaoImpl<FriendlyLink, String> implements
		FriendlyLinkDao {

}
