package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.TagDao;
import net.deepdragon.entity.weipu.Tag;
import org.springframework.stereotype.Repository;

/**
 * 标签管理表数据接口实现
*/
@Repository(Weipu.SIGN + "TagDaoImpl")
public class TagDaoImpl extends BaseDaoImpl<Tag, String> implements
		TagDao {

}
