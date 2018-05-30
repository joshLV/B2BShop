package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.GroupSaleDao;
import net.deepdragon.entity.weipu.GroupSale;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.util.Constant;
import net.deepdragon.util.ReflectUtils;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 团购商品表数据接口实现
 */
@Repository(Weipu.SIGN + "GroupSaleDaoImpl")
public class GroupSaleDaoImpl extends BaseDaoImpl<GroupSale, String> implements GroupSaleDao {

	@Override
	public List<GroupSale> getGroupSalePager(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) {
		String defaultStatement = GroupSale.class.getName() + "Mapper.getGroupSalePager";
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
	}

    @Override
    public GroupSale getGroupSaleById(Map<String, Object> paramMap, String id) throws Exception {
        String defaultStatement = GroupSale.class.getName() + "Mapper.getGroupSaleById";

        paramMap.put("id", id);

        return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).selectOne(defaultStatement, paramMap);
    }

    /**
     * 根据ID获取实体对象.(批量的...)
     *
     * @param paramMap 租户ID
     * @param id       记录ID
     *
     * @return 实体对象
     */
    public GroupSale getByBatchType(Map<String, Object> paramMap, String id) {
        String defaultStatement = GroupSale.class.getName() + "Mapper.get";

        paramMap.put("id", id);

        return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).selectOne(defaultStatement, paramMap);
    }

    /**
     * 修改实体对象（批量的...）
     *
     * @param paramMap 租户ID
     * @param entity   实体类
     *
     * @return 受影响的行数
     */
    public int updateByBatchType(Map<String, Object> paramMap, GroupSale entity) {
        String defaultStatement = GroupSale.class.getName() + "Mapper.update";
        // 实体类存在tenantId字段
        Field field = ReflectUtils.getFieldByFieldName(entity, Constant.TENANTID_KEY);
        if (field != null) {
            ReflectUtils.setValueByFieldName(entity, Constant.TENANTID_KEY, paramMap.get(Constant.TENANTID_KEY));
        }

        return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).update(defaultStatement, entity);
    }

}
