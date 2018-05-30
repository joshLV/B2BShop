package net.deepdragon.service.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.RepairplantDao;
import net.deepdragon.entity.weipu.Cartype;
import net.deepdragon.entity.weipu.Repairplant;
import net.deepdragon.service.weipu.RepairplantService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN + "RepairplantServiceImpl")
public class RepairplantServiceImpl extends BaseServiceImpl<Repairplant, String> implements RepairplantService {

	@Resource(name = Weipu.SIGN + "RepairplantDaoImpl")
	private RepairplantDao repairplantDao;

	@Override
	public BaseDao<Repairplant, String> getBaseDao() {
		return this.repairplantDao;
	}

	@Override
	public Repairplant saveRepairPlant(Map<String, Object> paramMap, Repairplant repairplant, String schedules) {
		Repairplant plant = repairplantDao.save(paramMap, repairplant);
		String[] cartypeIds = schedules.split(",");
		for (int i = 0; i < cartypeIds.length; i++) {
			repairplantDao.saveRepairtCartypeMapping(plant.getId(), cartypeIds[i]);
		}

		return plant;
	}

	@Override
	public void deleteRepairPlant(Map<String, Object> paramMap, List<String> ids) {
		repairplantDao.delete(paramMap, ids);
		for (int i = 0; i < ids.size(); i++) {
			repairplantDao.deleteRepairtCartype(paramMap, ids.get(i));
		}
	}

	@Override
	public void updateRepairPlant(Map<String, Object> paramMap, Repairplant repairplant, String schedules) {
		repairplantDao.update(paramMap, repairplant);
		String[] cartypeIds = schedules.split(",");
		repairplantDao.deleteRepairtCartype(paramMap, repairplant.getId());
		for (int i = 0; i < cartypeIds.length; i++) {
			repairplantDao.saveRepairtCartypeMapping(repairplant.getId(), cartypeIds[i]);
		}
	}

	@Override
	public List<Cartype> getRepairtCartype(Map<String, Object> paramMap, String repairId) {
		return repairplantDao.getRepairtCartype(paramMap, repairId);
	}

}
