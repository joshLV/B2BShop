package net.deepdragon.service.weipu;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.GhjVmRedenvelopaccount;

import java.util.List;
import java.util.Map;

/**
 * ghj_ghj_vm_redenvelopaccount数据接口
*/
public interface GhjVmRedenvelopaccountService extends BaseService<GhjVmRedenvelopaccount, String> {

    //查询平台定向供应商的红包
    List<GhjVmRedenvelopaccount> getDirectionalMerchantList(Map<String, Object> paramMap, Criteria criteria) throws Exception;
    //查询红包红包
    List<GhjVmRedenvelopaccount> getRedenvelopList(Map<String, Object> paramMap, Criteria criteria) throws Exception;
    /**
     * 获取红包记录
     *
     * @param paramMap
     *            租户标识
     * @param criteria
     *            字段条件
     * @return 参数列表
     */
    Pager getRedenvelopRecord(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception;
}
