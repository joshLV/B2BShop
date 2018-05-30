package net.viservice.service;

import java.util.Date;

import javax.annotation.Resource;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.Tenant;

import net.deepdragon.service.TenantService;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

//@Ignore
public class TenantServiceTest extends BaseServiceTest{

	
	@Resource
	private TenantService tenantService;
	
	private Tenant tenant;
	
	@Before
	public void testInsert(){
		tenant = new Tenant();
		tenant.setCode("37100");
		tenant.setName("郑州宝源科技有限公司");
		tenant.setShortName("宝源科技");
		tenant.setLinker("测试张");
		tenant.setEmail("54218809@qq.com");
		tenant.setAddress("4646465,787878,65464");
		tenant.setDescription("测试数据");
		
		tenant.setCreateDate(new Date());
		tenant.setCreateUser("test");
		
		try {
			tenant = tenantService.save("37100", tenant);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testFind(){
		try {
			logger.info(tenantService.find("37100","id", tenant.getId())+"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void testGet(){
		try {
			logger.info(tenantService.get("37100", tenant.getId())+"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void testUpdate(){
		try {
			tenant.setModifyDate(new Date());
			tenant.setModifyUser("test");
			
			tenantService.update("37100", tenant);
			
			logger.info(tenantService.getAll("37100")+"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void testGetList(){
		try {
			
			Criteria criteria = new Criteria();
			
			logger.info(tenantService.getList("37100", criteria)+"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void testGetPager(){
		try {
			
			Criteria criteria = new Criteria();
			
			logger.info(tenantService.getPager("37100", criteria,new Pager())+"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@After
	public void testAfter(){
		try {
			tenantService.delete("37100", tenant.getId());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
