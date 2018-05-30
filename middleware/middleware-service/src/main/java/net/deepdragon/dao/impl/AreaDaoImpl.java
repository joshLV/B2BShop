package net.deepdragon.dao.impl;

import net.deepdragon.constant.Shared;
import net.deepdragon.dao.AreaDao;
import net.deepdragon.entity.Area;
import org.springframework.stereotype.Repository;

/**
 * 地区信息表数据接口实现
*/
@Repository(Shared.SIGN + "AreaDaoImpl")
public class AreaDaoImpl extends BaseDaoImpl<Area, String> implements
		AreaDao {

}
