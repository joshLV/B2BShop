package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.WonderfulShowDao;
import net.deepdragon.entity.weipu.WonderfulShow;
import org.springframework.stereotype.Repository;

/**
 * 精彩展示数据接口实现
*/
@Repository(Weipu.SIGN + "WonderfulShowDaoImpl")
public class WonderfulShowDaoImpl extends BaseDaoImpl<WonderfulShow, String> implements
		WonderfulShowDao {

}
