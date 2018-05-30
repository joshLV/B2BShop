package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.ActivityFullcutDao;
import net.deepdragon.entity.weipu.ActivityFullcut;

import org.springframework.stereotype.Repository;

/**
 * 促销满减活动主表数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "ActivityFullcutDaoImpl")
public class ActivityFullcutDaoImpl extends BaseDaoImpl<ActivityFullcut, String> implements
		ActivityFullcutDao {

}
