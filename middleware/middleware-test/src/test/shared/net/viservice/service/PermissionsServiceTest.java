package net.viservice.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.deepdragon.entity.Permissions;

import net.deepdragon.service.PermissionsService;
import org.junit.Test;

public class PermissionsServiceTest extends BaseServiceTest {
	@Resource
	private PermissionsService permissionsService;
	
	@Test
	public void testGet(){
		List<Permissions> permissions=new ArrayList<Permissions>();
		Permissions pers= new Permissions(); 
		pers.setRoleId("242367348558790656");
		pers.setModuleId("1");
		pers.setCreateUser("admin");
		pers.setCreateDate(new Date());
		pers.setPermissions("aaaaa");
		Permissions pers1= new Permissions(); 
		pers1.setRoleId("242367348558790656");
		pers1.setModuleId("2");
		pers1.setCreateUser("admin");
		pers1.setCreateDate(new Date());
		pers1.setPermissions("aaaaa");
		permissions.add(pers);
		permissions.add(pers1);
		try {
			permissionsService.saveRelationship("37100", "242367348558790656", permissions);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
