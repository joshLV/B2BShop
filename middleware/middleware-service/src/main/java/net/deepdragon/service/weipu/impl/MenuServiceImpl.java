package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.MenuDao;
import net.deepdragon.entity.weipu.Menu;
import net.deepdragon.service.weipu.MenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(Weipu.SIGN+"MenuServiceImpl")
public class MenuServiceImpl extends BaseServiceImpl<Menu, String> implements MenuService {

	@Resource(name= Weipu.SIGN+"MenuDaoImpl")
	private MenuDao menuDao;
	
	@Override
	public BaseDao<Menu, String> getBaseDao() {
		return this.menuDao;
	}
	
}

