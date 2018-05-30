package net.deepdragon.erp.yunji.entity;

import java.util.Date;
/**
 * 品牌信息参数
 * @author ZGT
 *
 */
public class BrandRequest {
	public Date lastModifiedTime; // 最后一次修改时间 即最近同步时间

	public Date getLastModifiedTime() {
		return lastModifiedTime!=null?(Date)lastModifiedTime.clone():null;
	}

	public void setLastModifiedTime(Date lastModifiedTime) {
		this.lastModifiedTime = lastModifiedTime!=null?(Date)lastModifiedTime.clone():null;
	}

}
