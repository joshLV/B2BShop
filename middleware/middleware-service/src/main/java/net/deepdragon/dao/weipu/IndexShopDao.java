package net.deepdragon.dao.weipu;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.IndexShop;
import net.deepdragon.mybatis.domain.PageBounds;

import java.util.List;
import java.util.Map;

public interface IndexShopDao extends BaseDao<IndexShop, String> {


    List<Map<String,Object>> getPager4JULI(Map<String, Object> paramMap, Criteria criteria, Pager pager)
            throws Exception;
    Long getPager4JULICount(Map<String, Object> paramMap);

    /**
     * 检索附近商家统计
     * @param paramMap
     * @return
     */
    Long getPager4JULI4SJCout(Map<String, Object> paramMap);

    List<Map<String,Object>> getPager4JULI4SJ(Map<String, Object> paramMap, Criteria criteria, Pager pager)
    throws Exception;

}
