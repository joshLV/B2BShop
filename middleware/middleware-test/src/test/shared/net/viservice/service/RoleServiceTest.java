package net.viservice.service;

import java.util.Date;

import javax.annotation.Resource;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.Role;

import net.deepdragon.service.RoleService;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

//@Ignore
public class RoleServiceTest extends BaseServiceTest{
	
	@Resource
	private RoleService roleService;
	
	private Role role;
	
	@Before
	public void testInsert(){
		role = new Role();
//		role.setTenantId("37100");
		role.setName("系统管理员");
		role.setDescription("测试数据");
		
		role.setCreateDate(new Date());
		role.setCreateUser("test");
		
		try {
			role = roleService.save("37100", role);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testFind(){
		try {
			logger.info(roleService.find("37100","id", role.getId())+"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void testGet(){
		try {
			logger.info(roleService.get("37100", role.getId())+"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void testUpdate(){
		try {
			role.setModifyDate(new Date());
			role.setModifyUser("test");
			
			roleService.update("37100", role);
			
			logger.info(roleService.getAll("37100")+"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void testGetList(){
		try {
			
			Criteria criteria = new Criteria();
			
			logger.info(roleService.getList("37100", criteria)+"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void testGetPager(){
		try {
			
			Criteria criteria = new Criteria();
			
			logger.info(roleService.getPager("37100", criteria,new Pager())+"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@After
	public void testAfter(){
		try {
			roleService.delete("37100", role.getId());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
