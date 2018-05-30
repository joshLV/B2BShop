package net.deepdragon.service.open.impl;


import net.deepdragon.dao.open.ModuleDao;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.entity.open.OpenModule;
import net.deepdragon.service.open.ModuleService;
import net.deepdragon.service.weipu.impl.BaseServiceImpl;
import net.deepdragon.weipu.bean.ModuleTree;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service(net.deepdragon.constant.weipu.Open.SIGN+"ModuleServiceImpl")
public class ModuleServiceImpl extends BaseServiceImpl<OpenModule, String> implements ModuleService{

	@Resource(name=net.deepdragon.constant.weipu.Open.SIGN+"ModuleDaoImpl")
	private ModuleDao moduleDao;
	
	@Override
	public BaseDao<OpenModule, String> getBaseDao() {
		return this.moduleDao;
	}

	@Override
	@Deprecated
	public OpenModule find(Map<String, Object> paramMap, String property, Object value)
			throws Exception {
		throw new UnsupportedOperationException("Method is overridden, this operation is not supported!");
	}

	@Override
	@Deprecated
	public List<OpenModule> findList(Map<String, Object> paramMap, String property, Object value)
			throws Exception {
		throw new UnsupportedOperationException("Method is overridden, this operation is not supported!");
	}

	@Override
	@Deprecated
	public List<OpenModule> findListByIds(Map<String, Object> paramMap, List<String> ids)
			throws Exception {
		throw new UnsupportedOperationException("Method is overridden, this operation is not supported!");
	}

	@Override
	@Deprecated
	public OpenModule save(Map<String, Object> paramMap, OpenModule entity) throws Exception {
		throw new UnsupportedOperationException("Method is overridden, this operation is not supported!");
	}

	@Override
	@Deprecated
	public int delete(Map<String, Object> paramMap, String id) throws Exception {
		throw new UnsupportedOperationException("Method is overridden, this operation is not supported!");
	}

	@Override
	@Deprecated
	public int delete(Map<String, Object> paramMap, String property, Object value)
			throws Exception {
		throw new UnsupportedOperationException("Method is overridden, this operation is not supported!");
	}

	@Override
	@Deprecated
	public int[] delete(Map<String, Object> paramMap, List<String> ids) throws Exception {
		throw new UnsupportedOperationException("Method is overridden, this operation is not supported!");
	}

	@Override
	@Deprecated
	public int[] save(Map<String, Object> paramMap, List<OpenModule> entity) throws Exception {
		throw new UnsupportedOperationException("Method is overridden, this operation is not supported!");
	}

	@Override
	@Deprecated
	public int update(Map<String, Object> paramMap, OpenModule entity) throws Exception {
		throw new UnsupportedOperationException("Method is overridden, this operation is not supported!");
	}

	@Override
	@Deprecated
	public int[] update(Map<String, Object> paramMap, List<OpenModule> entity) throws Exception {
		throw new UnsupportedOperationException("Method is overridden, this operation is not supported!");
	}

	@Override
	public ModuleTree getModuleTree(Map<String, Object> paramMap) throws Exception {
		List<OpenModule> modules = this.moduleDao.getAll(paramMap);
		
		ModuleTree result = null;
		
		Map<String,List<ModuleTree>> childs = new HashMap<String, List<ModuleTree>>();
		
		for(OpenModule module : modules){
			
			ModuleTree node =new ModuleTree();
			node.setId(module.getId());
			node.setText(module.getName());
			node.setIcon(module.getIcon());
			node.setLevel(module.getLevel());
			node.setPid(module.getParentId());
			node.setSign(module.getSign());
			node.setUrl(module.getUrl());
			
			List<ModuleTree> child = new ArrayList<ModuleTree>();
			node.setChildren(child);
			
			childs.put(module.getId(), child);
			
			if("0".equals(module.getParentId())){
				result = node;
			}else{
				childs.get(module.getParentId()).add(node);
			}
		}

		return result;
	}
		
}

