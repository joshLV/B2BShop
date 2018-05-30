package net.deepdragon.weipu.controller.mall;

import net.deepdragon.bean.Pager;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheKeys;
import net.deepdragon.weipu.cache.CacheUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller(Global.APP_SIGN + "CacheController")
@RequestMapping("/cache")
public class CacheController extends BaseMallController {

	@Value("#{configProperties['project.PATH']}")
	public String PATH;

	@RequestMapping(value = "/list", method = { RequestMethod.GET })
	public String list() {
		String info = "缓存Key列表页面";
		setLogInfo(info);
		logger.debug(info);
		return Global.TEMPLATE_MALL + PATH + "/cache_list";
	}

	@RequestMapping(value = "/ajax")
	public @ResponseBody
	Object ajax(String parentId, Pager pager) {
		String info = "获取缓存Key列表数据页面";
		setLogInfo(info);
		logger.debug(info);
		try {
			Map<String, Object> data = null;
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			for (CacheKeys cacheKey : CacheKeys.values()) {
				data = new HashMap<String, Object>();
				data.put("id", cacheKey.getKey());
				data.put("key", cacheKey.getKey());
				data.put("description", cacheKey.getDescription());
				list.add(data);
			}
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("rows", list);
			result.put("total", CacheKeys.values().length);
			return result;
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
		}
		return null;
	}

	@RequestMapping(value = "/delete", method = { RequestMethod.POST })
	public @ResponseBody
	Object delete(String ids) {
		String info = "清除缓存数据(" + ids + ")";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String[] keys = StringUtils.split(ids, ",");
			Arrays.sort(keys);
			for (CacheKeys cacheKey : CacheKeys.values()) {
				CacheUtil.delete(cacheKey.getKey() + getTenantId());
//				int index = Arrays.binarySearch(keys, cacheKey.getKey());
//				if (index >= 0) {
//					CacheUtil.delete(cacheKey.getKey() + getTenantId());
//				}
			}
			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "");
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "清除缓存数据失败，请联系管理员。");
		}

		return result;
	}

}
