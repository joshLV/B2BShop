package net.deepdragon.service.weipu.impl;

import com.alibaba.fastjson.JSON;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.constant.Shared;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.SystemSetDao;
import net.deepdragon.dao.weipu.*;
import net.deepdragon.entity.SystemSet;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.weipu.CrossBorderOrderService;
import net.deepdragon.service.weipu.OrderService;
import net.deepdragon.util.*;
import net.deepdragon.weipu.bean.PayType;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

@Service(Weipu.SIGN + "CrossBorderOrderServiceImpl")
public class CrossBorderOrderServiceImpl extends BaseServiceImpl<Order, String> implements CrossBorderOrderService {

	@Resource(name = Weipu.SIGN + "CrossBorderOrderDaoImpl")
	private CrossBorderOrderDao crossBorderOrderDao;

	@Override
	public BaseDao<Order, String> getBaseDao() {
		return this.crossBorderOrderDao;
	}

	@Override
	public Map<String, Object> getCrossBorderOrderMap(Map<String, Object> paramMap, Criteria criteria) {
		return crossBorderOrderDao.getCrossBorderOrderMap(paramMap, criteria);
	}

	public int updateCrossBorderOrderStatus(Map<String, Object> paramMap) {
		return crossBorderOrderDao.updateCrossBorderOrderStatus(paramMap);
	}

	public Map<String, Object> getCrossBorderOrderInfo(Map<String, Object> paramMap, Criteria criteria) {
		return crossBorderOrderDao.getCrossBorderOrderInfo(paramMap,criteria);
	}

	public int saveCrossBorderOrder(Map<String, Object> paramMap, Map pMap) {
		return crossBorderOrderDao.saveCrossBorderOrder(paramMap, pMap);
	}
}
