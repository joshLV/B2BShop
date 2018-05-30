package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.MenuDao;
import net.deepdragon.entity.weipu.Menu;
import org.springframework.stereotype.Repository;

/**
 * 会员菜单数据接口实现
*/
@Repository(Weipu.SIGN + "MenuDaoImpl")
public class MenuDaoImpl extends BaseDaoImpl<Menu, String> implements
		MenuDao {

}
