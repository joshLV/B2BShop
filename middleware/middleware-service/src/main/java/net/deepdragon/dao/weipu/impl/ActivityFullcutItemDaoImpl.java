package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.ActivityFullcutItemDao;
import net.deepdragon.entity.weipu.ActivityFullcutItem;

import org.springframework.stereotype.Repository;

/**
 * 参与活动商品表数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "ActivityFullcutItemDaoImpl")
public class ActivityFullcutItemDaoImpl extends BaseDaoImpl<ActivityFullcutItem, String> implements
		ActivityFullcutItemDao {

}
