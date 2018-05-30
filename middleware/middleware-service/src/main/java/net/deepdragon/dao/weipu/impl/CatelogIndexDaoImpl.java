package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.CatelogIndexDao;
import net.deepdragon.entity.weipu.CatelogIndex;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 首页商品类目数据接口实现
 */
@Repository(Weipu.SIGN + "CatelogIndexDaoImpl")
public class CatelogIndexDaoImpl extends BaseDaoImpl<CatelogIndex, String>
		implements CatelogIndexDao {

	@Override
	public int deleteAll(Map<String, Object> paramMap) {
		String defaultStatement = CatelogIndex.class.getName()
				+ "Mapper.deleteAll";
		return sqlSessionTemplateFactory.getSqlSessionTemplate(
				ExecutorType.BATCH).delete(defaultStatement);
	}

}
