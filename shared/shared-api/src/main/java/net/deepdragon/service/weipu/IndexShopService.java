package net.deepdragon.service.weipu;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.IndexShop;

import java.util.List;
import java.util.Map;

/**
 * 首页品牌旗舰店数据接口
*/
public interface IndexShopService extends BaseService<IndexShop, String> {

    List<Map<String,Object>> getPager4JULI(Map<String, Object> paramMap, Criteria criteria, Pager pager)
            throws Exception;



    Pager getPagerJl(Map<String, Object> paramMap, Criteria criteria, Pager pager)
            throws Exception;

    /**
     * 附近商品检索查询附近商家
     * @param paramMap
     * @param criteria
     * @param pager
     * @return
     * @throws Exception
     */
    Pager getPagerJl4SJ(Map<String, Object> paramMap, Criteria criteria, Pager pager)
            throws Exception;

}
