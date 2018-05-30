package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.KeywordsLogDao;
import net.deepdragon.entity.weipu.KeywordsLog;
import org.springframework.stereotype.Repository;

/**
 * 搜索关键字日志表
*/
@Repository(Weipu.SIGN + "KeywordsLogDaoImpl")
public class KeywordsLogDaoImpl extends BaseDaoImpl<KeywordsLog, String> implements KeywordsLogDao {

}
