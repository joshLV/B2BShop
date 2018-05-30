package net.deepdragon.dao.open.impl;

import net.deepdragon.dao.open.ModuleDao;
import net.deepdragon.dao.weipu.impl.BaseDaoImpl;
import net.deepdragon.entity.open.OpenModule;
import org.springframework.stereotype.Repository;

/**
 * 开放平台模块数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Open.SIGN + "ModuleDaoImpl")
public class ModuleDaoImpl extends BaseDaoImpl<OpenModule, String> implements
		ModuleDao {

}
