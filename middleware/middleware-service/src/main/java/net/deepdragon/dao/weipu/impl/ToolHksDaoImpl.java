package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.ToolHksDao;
import net.deepdragon.entity.weipu.ToolHks;

import org.springframework.stereotype.Repository;

/**
 * ghj_tool_hks数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "ToolHksDaoImpl")
public class ToolHksDaoImpl extends BaseDaoImpl<ToolHks, String> implements
		ToolHksDao {

}
