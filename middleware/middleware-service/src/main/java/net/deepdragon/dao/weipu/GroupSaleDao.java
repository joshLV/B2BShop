package net.deepdragon.dao.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.GroupSale;
import net.deepdragon.mybatis.domain.PageBounds;

import java.util.List;
import java.util.Map;

public interface GroupSaleDao extends BaseDao<GroupSale, String> {

	public List<GroupSale> getGroupSalePager(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds);
    public GroupSale getGroupSaleById(Map<String, Object> paramMap,String id)throws Exception;

    /**
     * 根据ID获取实体对象.(批量的...)
     *
     * @param paramMap 租户ID
     * @param id       记录ID
     *
     * @return 实体对象
     */
    GroupSale getByBatchType(Map<String, Object> paramMap, String id);

    /**
     * 修改实体对象（批量的...）
     *
     * @param paramMap 租户ID
     * @param entity   实体类
     *
     * @return 受影响的行数
     */
    int updateByBatchType(Map<String, Object> paramMap, GroupSale entity);
}
