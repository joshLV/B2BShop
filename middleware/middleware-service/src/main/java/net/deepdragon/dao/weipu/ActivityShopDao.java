package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.ActivityShop;

import java.util.Map;

public interface ActivityShopDao extends BaseDao<ActivityShop, String> {

	public int saveShop(Map<String, Object> paramMap, ActivityShop entity);
}
