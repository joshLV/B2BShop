package net.deepdragon.service.impl;


import net.deepdragon.constant.Shared;
import net.deepdragon.dao.AreaDao;
import net.deepdragon.dao.BaseDao;
import net.deepdragon.entity.Area;
import net.deepdragon.service.AreaService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service(Shared.SIGN+"AreaServiceImpl")
public class AreaServiceImpl extends BaseServiceImpl<Area, String> implements AreaService{

	@Resource(name= Shared.SIGN+"AreaDaoImpl")
	private AreaDao areaDao;
	
	@Override
	public BaseDao<Area, String> getBaseDao() {
		return this.areaDao;
	}

	@Override
	public Area save(Map<String, Object> paramMap, Area entity, Area parent)
			throws Exception {
		Area area = this.areaDao.save(paramMap, entity);
		Area updateObj = new Area();
		updateObj.setId(area.getId());
		String fullName = area.getName();
		String path = area.getId();
		if (parent != null) {
			path = parent.getPath() + "," + area.getId();
			fullName = parent.getFullName() + area.getName();
		}
		updateObj.setFullName(fullName);
		updateObj.setPath(path);
		updateObj.setModifyUser(area.getCreateUser());
		updateObj.setModifyDate(area.getCreateDate());
		this.areaDao.update(paramMap, updateObj);
		return area;
	}
	
}

