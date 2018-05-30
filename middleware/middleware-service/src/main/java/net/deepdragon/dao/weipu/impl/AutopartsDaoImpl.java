package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.AutopartsDao;
import net.deepdragon.entity.weipu.Autoparts;
import org.springframework.stereotype.Repository;

/**
 * 汽配城信息数据接口实现
*/
@Repository(Weipu.SIGN + "AutopartsDaoImpl")
public class AutopartsDaoImpl extends BaseDaoImpl<Autoparts, String> implements
		AutopartsDao {

}
