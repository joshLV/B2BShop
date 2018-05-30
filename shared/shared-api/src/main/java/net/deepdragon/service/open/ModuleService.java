package net.deepdragon.service.open;

import net.deepdragon.entity.open.OpenModule;
import net.deepdragon.service.weipu.BaseService;
import net.deepdragon.weipu.bean.ModuleTree;

import java.util.Map;


/**
 * 开放平台模块数据接口
*/
public interface ModuleService extends BaseService<OpenModule, String> {

	ModuleTree getModuleTree(Map<String, Object> paramMap) throws Exception;
}
