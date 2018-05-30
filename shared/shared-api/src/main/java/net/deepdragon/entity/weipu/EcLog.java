package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：sys_ec_log
 * 表代码：sys_ec_log
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"EcLog")
public class EcLog extends BaseEntity {

	private static final long serialVersionUID = 1483341440977517707L;

	/*声明登录类型枚举*/
	/*login: PC端信息登录*/
	public enum LogType{
		登录
	}

	/**
	*tenantId
	*/
	private String tenantId;
	
	/**
	*userName
	*/
	private String userName;
	
	/**
	*userNamecn
	*/
	private String userNamecn;
	
	/**
	*logType
	*/
	private String logType;
	
	/**
	*logIp
	*/
	private String logIp;
	
	/**
	* 备注信息
	*/
	private String logBeizhu;
	
	
	/**
	* 字段名称 :tenantId
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/

	private String browserType;



	public String getTenantId() {
		return this.tenantId;
	}

	/**
	* 字段名称 :tenantId
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setTenantId(String tenantId) {
		 this.tenantId = tenantId;
    }
    
	/**
	* 字段名称 :userName
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getUserName() {
		return this.userName;
	}

	/**
	* 字段名称 :userName
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setUserName(String userName) {
		 this.userName = userName;
    }
    
	/**
	* 字段名称 :userNamecn
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getUserNamecn() {
		return this.userNamecn;
	}

	/**
	* 字段名称 :userNamecn
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setUserNamecn(String userNamecn) {
		 this.userNamecn = userNamecn;
    }
    
	/**
	* 字段名称 :logType
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public String getLogType() {
		return this.logType;
	}

	/**
	* 字段名称 :logType
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public void setLogType(String logType) {
		 this.logType = logType;
    }
    
	/**
	* 字段名称 :logIp
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public String getLogIp() {
		return this.logIp;
	}

	/**
	* 字段名称 :logIp
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public void setLogIp(String logIp) {
		 this.logIp = logIp;
    }
    
	/**
	* 字段名称 :logNot
	* 数据类型 :varchar(200)
	* 是否必填 :false
	*/
	public String getLogBeizhu() {
		return this.logBeizhu;
	}

	/**
	* 字段名称 :logBeizhu
	* 数据类型 :varchar(200)
	* 是否必填 :false
	*/
	public void setLogBeizhu(String logBeizhu) {
		 this.logBeizhu = logBeizhu;
    }


	public String getBrowserType() {
		return this.browserType;
	}

	/**
	 * 字段名称 :browserType
	 * 数据类型 :varchar(20)
	 * 是否必填 :false
	 */
	public void setBrowserType(String browserType) {
		this.browserType = browserType;
	}
}