package net.viservice.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.deepdragon.bean.Pager;
import net.deepdragon.bean.TableSchema;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.open.Module;
import net.deepdragon.exceptions.DataSourceDescriptorException;
import net.deepdragon.procedure.StoredProcedureArgumentInfo;
import net.deepdragon.procedure.StoredProcedureInfo;
import net.deepdragon.service.open.ModuleService;
import net.deepdragon.weipu.bean.ModuleTree;

import org.junit.Ignore;
import org.junit.Test;

import com.alibaba.fastjson.JSON;

public class ModuleServiceTest extends BaseServiceTest {

	@Resource
	private ModuleService moduleService;

	@Test
	public void test_module_treee() throws Exception {
		List<Module> modules = this.moduleService.getAll(TENANTID);

		// Map<String,ModuleTree> nodes = new HashMap<String, ModuleTree>();

		Map<String, List<ModuleTree>> childs = new HashMap<String, List<ModuleTree>>();

		ModuleTree root = null;

		for (Module module : modules) {

			ModuleTree node = new ModuleTree();
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

			if ("0".equals(module.getParentId())) {
				root = node;
			} else {
				childs.get(module.getParentId()).add(node);
			}

			// if(nodes.get(module.getParentId())!=null){

			// }

			// if("0".equals(module.getParentId())){
			// nodes.put(module.getId(), tree);
			// }

			// System.out.println(JSON.toJSONString(nodes));
		}

		System.out.println(JSON.toJSONString(root));
	}

	@Test(expected = UnsupportedOperationException.class)
	@Ignore
	public void test_find() throws Exception {
		moduleService.find(TENANTID, "id", "131313");
	}

	@Test(expected = UnsupportedOperationException.class)
	@Ignore
	public void test_find_list() throws Exception {
		moduleService.findList(TENANTID, "id", "131313");
	}

	@Test(expected = UnsupportedOperationException.class)
	@Ignore
	public void test_find_list_by_ids() throws Exception {
		List<String> lists = new ArrayList<String>();
		lists.add("12345654654");
		moduleService.findListByIds(TENANTID, lists);
	}

	@Test(expected = UnsupportedOperationException.class)
	@Ignore
	public void test_save_batch() throws Exception {
		List<Module> lists = new ArrayList<Module>();

		moduleService.save(TENANTID, lists);
	}

	@Test(expected = UnsupportedOperationException.class)
	@Ignore
	public void test_save() throws Exception {
		moduleService.save(TENANTID, new Module());
	}

	@Test(expected = UnsupportedOperationException.class)
	@Ignore
	public void test_update() throws Exception {
		moduleService.update(TENANTID, new Module());
	}

	@Test(expected = UnsupportedOperationException.class)
	@Ignore
	public void test_update_batch() throws Exception {
		List<Module> lists = new ArrayList<Module>();
		moduleService.update(TENANTID, lists);
	}

	@Test(expected = UnsupportedOperationException.class)
	@Ignore
	public void test_delete_by_ids() throws Exception {
		List<String> lists = new ArrayList<String>();
		lists.add("12345654654");
		moduleService.delete(TENANTID, lists);
	}

	@Test(expected = UnsupportedOperationException.class)
	@Ignore
	public void test_delete_by_id() throws Exception {
		moduleService.delete(TENANTID, "454646465");
	}

	@Test(expected = UnsupportedOperationException.class)
	@Ignore
	public void test_delete_by_propery() throws Exception {
		moduleService.delete(TENANTID, "id", "4564646");
	}

	@Test
	@Ignore
	public void test_get() throws Exception {

		System.out.println(moduleService.get(TENANTID, "245259758792081408"));
	}

	@Test
	@Ignore
	public void test_get_all() throws Exception {
		System.out.println(moduleService.getAll(TENANTID));
	}

	@Test
	@Ignore
	public void test_get_count() throws Exception {
		System.out.println(moduleService.getTotalCount(TENANTID));
	}

	@Test
	@Ignore
	public void test_is_exist() throws Exception {
		System.out.println(moduleService.isExist(TENANTID, "sign", "system"));
	}

	@Test
	@Ignore
	public void test_get_pager() throws Exception {
		Criteria criteria = new Criteria();
		criteria.add(Restrictions.order("leftValue", "asc"));
		criteria.add(Restrictions.order("orderNo", "asc"));
		System.out.println(moduleService.getPager(TENANTID, criteria,
				new Pager()));
	}

	@Test
	@Ignore
	public void test_get_list() throws Exception {

		Criteria criteria = new Criteria();
		criteria.add(Restrictions.order("leftValue", "asc"));
		criteria.add(Restrictions.order("orderNo", "asc"));
		System.out.println(moduleService.getList(TENANTID, criteria));
	}

	@Test
	@Ignore
	public void testPrimaryKey() {
		System.out.println(moduleService.getPrimaryKey(TENANTID));
	}

	@Test
	@Ignore
	public void testGetColumns() {
		try {
			List<TableSchema> tables = moduleService.getColumns(TENANTID,
					"shared_log");
			for (TableSchema table : tables) {
				System.out.println(table.getColumnName());
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testSelectList() {
		try {
			System.out.println(moduleService.selectList(TENANTID,
					"select * from shared_log"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testSelectOne() {
		try {
			System.out.println(moduleService.selectOne(TENANTID,
					"select * from shared_log where id='3132123123'"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testInserOne() {
		try {
			String sql = "insert into shared_log (id,tenantId,className,methodName,action,operation,ip,createUser)";
			String primaryKey = moduleService.getPrimaryKey(TENANTID);
			sql += " values ("
					+ primaryKey
					+ ","
					+ TENANTID
					+ ",'net.viservice','add','add','add operation','192.168.0.32','admin')";

			System.out.println(moduleService.insertOne(TENANTID, sql));

			System.out.println(moduleService.selectOne(TENANTID,
					"select * from shared_log where id='" + primaryKey + "'"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testInserBatch() {
		try {

			List<String> sqls = new ArrayList<String>();

			String sql = "insert into shared_log (id,tenantId,className,methodName,action,operation,ip,createUser)";
			String primaryKey = moduleService.getPrimaryKey(TENANTID);
			sql += " values ("
					+ primaryKey
					+ ","
					+ TENANTID
					+ ",'net.viservice','add','add','add operation','192.168.0.32','admin')";
			sqls.add(sql);

			sql = "insert into shared_log (id,tenantId,className,methodName,action,operation,ip,createUser)";
			primaryKey = moduleService.getPrimaryKey(TENANTID);
			sql += " values ("
					+ primaryKey
					+ ","
					+ TENANTID
					+ ",'net.viservice','add','add','add operation','192.168.0.32','admin')";
			sqls.add(sql);

			System.out.println(moduleService.insertBatch(TENANTID, sqls));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testInserBatchEmpty() {
		try {

			List<String> sqls = new ArrayList<String>();

			System.out.println(moduleService.insertBatch(TENANTID, sqls));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testDeleteBatch() {
		try {

			List<String> sqls = new ArrayList<String>();

			String sql = "delete from shared_log where id = '231321231'";
			sqls.add(sql);

			sql = "delete from shared_log where id = '231321231'";
			sqls.add(sql);

			System.out.println(moduleService.deleteBatch(TENANTID, sqls));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testDeleteOne() {
		try {

			String sql = "delete from shared_log where id = '3132123123'";

			System.out.println(moduleService.deleteOne(TENANTID, sql));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testSelectPager() {
		Pager pager = new Pager();
		pager.setPageSize(1);
		try {
			System.out.println(moduleService.selectPager(TENANTID,
					"select * from shared_log", pager));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	 @Ignore
	public void test_sp_wop_module_add_root_node() throws Exception {

		String primaryKey = moduleService.getPrimaryKey(TENANTID);

		Map<String, Object> values = new HashMap<String, Object>();
		values.put("id", primaryKey);
		values.put("name", "根节点");
		values.put("url", "#");
		values.put("icon", "fa-icon");
		values.put("orderNo", 0);
		values.put("sign", "root");
		values.put("description", "root");
		values.put("createUser", "admin");

		StoredProcedureInfo storedProcedureInfo = moduleService
				.getStoredProcedureInfo(TENANTID, null,
						"sp_wop_module_add_root_node");

		List<StoredProcedureArgumentInfo> args = storedProcedureInfo
				.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}

		StoredProcedureInfo procedureInfo = moduleService.execute(TENANTID,
				storedProcedureInfo);
		System.out.println(procedureInfo.getArgumentInfo("resultCode")
				.getDataValue());
		System.out.println(procedureInfo.getArgumentInfo("resultMessage")
				.getDataValue());
	}

	@Test
	@Ignore
	public void test_sp_wop_module_add_node() throws Exception {

		Map<String, Object> parent = moduleService.selectOne(TENANTID,
				"select * from wop_module where parentId=0");

		String primaryKey = moduleService.getPrimaryKey(TENANTID);
		// 平台介绍
		Map<String, String> values = new HashMap<String, String>();
		values.put("id", primaryKey);
		values.put("parentId", parent.get("id").toString());
		values.put("name", "平台介绍");
		values.put("url", "open/index");
		values.put("icon", "fa-desktop");
		values.put("orderNo", "1");
		values.put("sign", "m001");
		values.put("description", "");
		values.put("createUser", "admin");

		StoredProcedureInfo storedProcedureInfo = moduleService
				.getStoredProcedureInfo(TENANTID, null,
						"sp_wop_module_add_node");

		List<StoredProcedureArgumentInfo> args = storedProcedureInfo
				.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}
		StoredProcedureInfo procedureInfo = moduleService.execute(TENANTID,
				storedProcedureInfo);

		// 通知公告
		primaryKey = moduleService.getPrimaryKey(TENANTID);

		values = new HashMap<String, String>();
		values.put("id", primaryKey);
		values.put("parentId", parent.get("id").toString());
		values.put("name", "通知公告");
		values.put("url", "#");
		values.put("icon", "fa-volume-up");
		values.put("orderNo", "1");
		values.put("sign", "m002");
		values.put("description", "");
		values.put("createUser", "admin");

		storedProcedureInfo = moduleService.getStoredProcedureInfo(TENANTID,
				null, "sp_wop_module_add_node");

		args = storedProcedureInfo.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}
		procedureInfo = moduleService.execute(TENANTID, storedProcedureInfo);

		String _primaryKey = moduleService.getPrimaryKey(TENANTID);
		values = new HashMap<String, String>();
		values.put("id", _primaryKey);
		values.put("parentId", primaryKey);
		values.put("name", "平台公告");
		values.put("url", "open/notice");
		values.put("icon", "fa-volume-up");
		values.put("orderNo", "3");
		values.put("sign", "m002001");
		values.put("description", "");
		values.put("createUser", "admin");

		storedProcedureInfo = moduleService.getStoredProcedureInfo(TENANTID,
				null, "sp_wop_module_add_node");

		args = storedProcedureInfo.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}
		procedureInfo = moduleService.execute(TENANTID, storedProcedureInfo);

		String __primaryKey = moduleService.getPrimaryKey(TENANTID);
		values = new HashMap<String, String>();
		values.put("id", __primaryKey);
		values.put("parentId", primaryKey);
		values.put("name", "联系我们");
		values.put("url", "open/contact");
		values.put("icon", "fa-volume-up");
		values.put("orderNo", "4");
		values.put("sign", "m002002");
		values.put("description", "");
		values.put("createUser", "admin");

		storedProcedureInfo = moduleService.getStoredProcedureInfo(TENANTID,
				null, "sp_wop_module_add_node");

		args = storedProcedureInfo.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}
		procedureInfo = moduleService.execute(TENANTID, storedProcedureInfo);

		// 开发指南
		primaryKey = moduleService.getPrimaryKey(TENANTID);

		values = new HashMap<String, String>();
		values.put("id", primaryKey);
		values.put("parentId", parent.get("id").toString());
		values.put("name", "开发指南");
		values.put("url", "#");
		values.put("icon", "fa-comment-o");
		values.put("orderNo", "1");
		values.put("sign", "m003");
		values.put("description", "");
		values.put("createUser", "admin");

		storedProcedureInfo = moduleService.getStoredProcedureInfo(TENANTID,
				null, "sp_wop_module_add_node");

		args = storedProcedureInfo.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}
		procedureInfo = moduleService.execute(TENANTID, storedProcedureInfo);
		// 错误代码一览表
		_primaryKey = moduleService.getPrimaryKey(TENANTID);
		values = new HashMap<String, String>();
		values.put("id", _primaryKey);
		values.put("parentId", primaryKey);
		values.put("name", "错误代码");
		values.put("url", "open/error");
		values.put("icon", "fa-comment-o");
		values.put("orderNo", "3");
		values.put("sign", "m003001");
		values.put("description", "");
		values.put("createUser", "admin");

		storedProcedureInfo = moduleService.getStoredProcedureInfo(TENANTID,
				null, "sp_wop_module_add_node");

		args = storedProcedureInfo.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}
		procedureInfo = moduleService.execute(TENANTID, storedProcedureInfo);

		// 面向商家服务
		primaryKey = moduleService.getPrimaryKey(TENANTID);

		values = new HashMap<String, String>();
		values.put("id", primaryKey);
		values.put("parentId", parent.get("id").toString());
		values.put("name", "面向商家服务");
		values.put("url", "#");
		values.put("icon", "fa-tachometer");
		values.put("orderNo", "1");
		values.put("sign", "m004");
		values.put("description", "");
		values.put("createUser", "admin");

		storedProcedureInfo = moduleService.getStoredProcedureInfo(TENANTID,
				null, "sp_wop_module_add_node");

		args = storedProcedureInfo.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}
		procedureInfo = moduleService.execute(TENANTID, storedProcedureInfo);
		// 用户服务
		_primaryKey = moduleService.getPrimaryKey(TENANTID);
		values = new HashMap<String, String>();
		values.put("id", _primaryKey);
		values.put("parentId", primaryKey);
		values.put("name", "用户服务");
		values.put("url", "open/error1");
		values.put("icon", "fa-users");
		values.put("orderNo", "3");
		values.put("sign", "m004001");
		values.put("description", "");
		values.put("createUser", "admin");

		storedProcedureInfo = moduleService.getStoredProcedureInfo(TENANTID,
				null, "sp_wop_module_add_node");

		args = storedProcedureInfo.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}
		procedureInfo = moduleService.execute(TENANTID, storedProcedureInfo);
		// 类目服务
		_primaryKey = moduleService.getPrimaryKey(TENANTID);
		values = new HashMap<String, String>();
		values.put("id", _primaryKey);
		values.put("parentId", primaryKey);
		values.put("name", "类目服务");
		values.put("url", "open/error1");
		values.put("icon", "fa-cogs");
		values.put("orderNo", "3");
		values.put("sign", "m004002");
		values.put("description", "");
		values.put("createUser", "admin");

		storedProcedureInfo = moduleService.getStoredProcedureInfo(TENANTID,
				null, "sp_wop_module_add_node");

		args = storedProcedureInfo.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}
		procedureInfo = moduleService.execute(TENANTID, storedProcedureInfo);

		// 商品服务
		_primaryKey = moduleService.getPrimaryKey(TENANTID);
		values = new HashMap<String, String>();
		values.put("id", _primaryKey);
		values.put("parentId", primaryKey);
		values.put("name", "商品服务");
		values.put("url", "open/error1");
		values.put("icon", "fa-barcode");
		values.put("orderNo", "3");
		values.put("sign", "m004003");
		values.put("description", "");
		values.put("createUser", "admin");

		storedProcedureInfo = moduleService.getStoredProcedureInfo(TENANTID,
				null, "sp_wop_module_add_node");

		args = storedProcedureInfo.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}
		procedureInfo = moduleService.execute(TENANTID, storedProcedureInfo);

		// 订单服务
		_primaryKey = moduleService.getPrimaryKey(TENANTID);
		values = new HashMap<String, String>();
		values.put("id", _primaryKey);
		values.put("parentId", primaryKey);
		values.put("name", "订单服务");
		values.put("url", "open/error1");
		values.put("icon", " fa-gavel");
		values.put("orderNo", "3");
		values.put("sign", "m004004");
		values.put("description", "");
		values.put("createUser", "admin");

		storedProcedureInfo = moduleService.getStoredProcedureInfo(TENANTID,
				null, "sp_wop_module_add_node");

		args = storedProcedureInfo.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}
		procedureInfo = moduleService.execute(TENANTID, storedProcedureInfo);

		// 商家服务
		_primaryKey = moduleService.getPrimaryKey(TENANTID);
		values = new HashMap<String, String>();
		values.put("id", _primaryKey);
		values.put("parentId", primaryKey);
		values.put("name", "商家服务");
		values.put("url", "open/error1");
		values.put("icon", " fa-gavel");
		values.put("orderNo", "3");
		values.put("sign", "m004005");
		values.put("description", "");
		values.put("createUser", "admin");

		storedProcedureInfo = moduleService.getStoredProcedureInfo(TENANTID,
				null, "sp_wop_module_add_node");

		args = storedProcedureInfo.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}
		procedureInfo = moduleService.execute(TENANTID, storedProcedureInfo);

		// 常见问题
		primaryKey = moduleService.getPrimaryKey(TENANTID);

		values = new HashMap<String, String>();
		values.put("id", primaryKey);
		values.put("parentId", parent.get("id").toString());
		values.put("name", "常见问题");
		values.put("url", "#");
		values.put("icon", "fa-tachometer");
		values.put("orderNo", "1");
		values.put("sign", "m005");
		values.put("description", "");
		values.put("createUser", "admin");

		storedProcedureInfo = moduleService.getStoredProcedureInfo(TENANTID,
				null, "sp_wop_module_add_node");

		args = storedProcedureInfo.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}
		procedureInfo = moduleService.execute(TENANTID, storedProcedureInfo);
		// 二级菜单
		_primaryKey = moduleService.getPrimaryKey(TENANTID);
		values = new HashMap<String, String>();
		values.put("id", _primaryKey);
		values.put("parentId", primaryKey);
		values.put("name", "二级菜单");
		values.put("url", "open/question1");
		values.put("icon", "fa-users");
		values.put("orderNo", "3");
		values.put("sign", "m005001");
		values.put("description", "");
		values.put("createUser", "admin");

		storedProcedureInfo = moduleService.getStoredProcedureInfo(TENANTID,
				null, "sp_wop_module_add_node");

		args = storedProcedureInfo.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}
		procedureInfo = moduleService.execute(TENANTID, storedProcedureInfo);

		// 三级菜单
		String ___primaryKey = moduleService.getPrimaryKey(TENANTID);
		values = new HashMap<String, String>();
		values.put("id", ___primaryKey);
		values.put("parentId", _primaryKey);
		values.put("name", "三级菜单");
		values.put("url", "open/question2");
		values.put("icon", "fa-users");
		values.put("orderNo", "3");
		values.put("sign", "m00500101");
		values.put("description", "");
		values.put("createUser", "admin");

		storedProcedureInfo = moduleService.getStoredProcedureInfo(TENANTID,
				null, "sp_wop_module_add_node");

		args = storedProcedureInfo.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}
		procedureInfo = moduleService.execute(TENANTID, storedProcedureInfo);

		// 功能菜单
		String ____primaryKey = moduleService.getPrimaryKey(TENANTID);
		values = new HashMap<String, String>();
		values.put("id", ____primaryKey);
		values.put("parentId", ___primaryKey);
		values.put("name", "功能菜单");
		values.put("url", "open/question3");
		values.put("icon", "fa-users");
		values.put("orderNo", "3");
		values.put("sign", "m0050010101");
		values.put("description", "");
		values.put("createUser", "admin");

		storedProcedureInfo = moduleService.getStoredProcedureInfo(TENANTID,
				null, "sp_wop_module_add_node");

		args = storedProcedureInfo.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}
		procedureInfo = moduleService.execute(TENANTID, storedProcedureInfo);
	}

	@Test
	@Ignore
	public void test_sp_wop_module_move_node() throws Exception {
		Map<String, String> values = new HashMap<String, String>();
		values.put("id", "245342025413558272");
		values.put("targetId", "245342025090596864");

		StoredProcedureInfo storedProcedureInfo = moduleService
				.getStoredProcedureInfo(TENANTID, null,
						"sp_wop_module_move_node");

		List<StoredProcedureArgumentInfo> args = storedProcedureInfo
				.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}

		System.out.println(args);

		StoredProcedureInfo procedureInfo = moduleService.execute(TENANTID,
				storedProcedureInfo);
		System.out.println(procedureInfo.getArgumentInfo("resultCode")
				.getDataValue());
		System.out.println(procedureInfo.getArgumentInfo("resultMessage")
				.getDataValue());
	}

	@Test
	// @Ignore
	public void test_sp_wop_module_delete_node() throws Exception {
		Map<String, String> values = new HashMap<String, String>();
		values.put("id", "246479558994296832");

		StoredProcedureInfo storedProcedureInfo = moduleService
				.getStoredProcedureInfo(TENANTID, null,
						"sp_wop_module_delete_node");

		List<StoredProcedureArgumentInfo> args = storedProcedureInfo
				.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}

		System.out.println(args);

		StoredProcedureInfo procedureInfo = moduleService.execute(TENANTID,
				storedProcedureInfo);
		System.out.println(procedureInfo.getArgumentInfo("resultCode")
				.getDataValue());
		System.out.println(procedureInfo.getArgumentInfo("resultMessage")
				.getDataValue());
	}

	@Test
	// @Ignore
	public void test_sp_wop_module_edit_node() throws Exception {

		Map<String, Object> values = new HashMap<String, Object>();
		values.put("id", "245342025413558272");
		values.put("parentId", "245250998317088768");
		values.put("name", "平台介绍");
		values.put("url", "open/index");
		values.put("icon", "tachometer");
		values.put("orderNo", "1");
		values.put("sign", "platfrom");
		values.put("description", "测试数据");
		values.put("modifyUser", "admin");
		values.put("modifyDate", new Date());

		StoredProcedureInfo storedProcedureInfo = moduleService
				.getStoredProcedureInfo(TENANTID, null,
						"sp_wop_module_edit_node");

		List<StoredProcedureArgumentInfo> args = storedProcedureInfo
				.getArguments();

		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(values.get(arg.getColumnName()));
			}
		}
		StoredProcedureInfo procedureInfo = moduleService.execute(TENANTID,
				storedProcedureInfo);

		System.out.println(procedureInfo.getArgumentInfo("resultCode")
				.getDataValue());
		System.out.println(procedureInfo.getArgumentInfo("resultMessage")
				.getDataValue());
	}

	/**
	 * 最简单的一个存储过程
	 * 
	 * @throws Exception
	 * @throws ServiceException
	 * @throws DataSourceDescriptorException
	 */
	@Test
	@Ignore
	public void testStoredProcedure1() throws Exception {

		StoredProcedureInfo storedProcedureInfo = moduleService
				.getStoredProcedureInfo(TENANTID, null, "sp_1");

		List<StoredProcedureArgumentInfo> args = storedProcedureInfo
				.getArguments();

		int i = 1;
		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(i++);
			}
		}

		System.out
				.println(moduleService.execute(TENANTID, storedProcedureInfo));

	}

	/**
	 * 带输入参数的存储过程
	 * 
	 * @throws Exception
	 * @throws ServiceException
	 * @throws DataSourceDescriptorException
	 */
	@Test
	@Ignore
	public void testStoredProcedure2() throws Exception {

		StoredProcedureInfo storedProcedureInfo = moduleService
				.getStoredProcedureInfo(TENANTID, null, "sp_2");

		List<StoredProcedureArgumentInfo> args = storedProcedureInfo
				.getArguments();

		int i = 1;
		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(i++);
			}
		}

		System.out
				.println(moduleService.execute(TENANTID, storedProcedureInfo));

	}

	/**
	 * 带输入参数的存储过程
	 * 
	 * @throws Exception
	 * @throws ServiceException
	 * @throws DataSourceDescriptorException
	 */
	@Test
	@Ignore
	public void testStoredProcedure3() throws Exception {

		StoredProcedureInfo storedProcedureInfo = moduleService
				.getStoredProcedureInfo(TENANTID, null, "sp_3");

		List<StoredProcedureArgumentInfo> args = storedProcedureInfo
				.getArguments();

		int i = 1;
		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(i++);
			}
		}

		System.out
				.println(moduleService.execute(TENANTID, storedProcedureInfo));

	}

	/**
	 * 带输入和输出参数的存储过程
	 * 
	 * @throws Exception
	 * @throws ServiceException
	 * @throws DataSourceDescriptorException
	 */
	@Test
	@Ignore
	public void testStoredProcedure4() throws Exception {

		StoredProcedureInfo storedProcedureInfo = moduleService
				.getStoredProcedureInfo(TENANTID, null, "sp_4");

		List<StoredProcedureArgumentInfo> args = storedProcedureInfo
				.getArguments();

		int i = 1;
		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(i++);
			}
		}

		System.out
				.println(moduleService.execute(TENANTID, storedProcedureInfo));

	}

	/**
	 * 既做输入又做输出参数的存储过程
	 * 
	 * @throws Exception
	 * @throws ServiceException
	 * @throws DataSourceDescriptorException
	 */
	@Test
	@Ignore
	public void testStoredProcedure5() throws Exception {

		StoredProcedureInfo storedProcedureInfo = moduleService
				.getStoredProcedureInfo(TENANTID, null, "sp_5");

		List<StoredProcedureArgumentInfo> args = storedProcedureInfo
				.getArguments();

		int i = 1;
		for (StoredProcedureArgumentInfo arg : args) {
			if (arg.isInputParameter()) {
				arg.setDataValue(i++);
			}
		}

		System.out
				.println(moduleService.execute(TENANTID, storedProcedureInfo));

	}
}
