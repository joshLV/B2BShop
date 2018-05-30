package net.deepdragon.service.weipu.impl;

import net.deepdragon.bean.PageList;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.OrderItemDao;
import net.deepdragon.entity.weipu.OrderItem;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.service.weipu.OrderItemService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN + "OrderItemServiceImpl")
public class OrderItemServiceImpl extends BaseServiceImpl<OrderItem, String> implements OrderItemService {

	@Resource(name = Weipu.SIGN + "OrderItemDaoImpl")
	private OrderItemDao orderItemDao;

	@Override
	public BaseDao<OrderItem, String> getBaseDao() {
		return this.orderItemDao;
	}

	@Override
	public List<OrderItem> getExportList(Map<String, Object> paramMap, Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return orderItemDao.getExportList(paramMap, criteria);
	}

    @Override
    public Pager getOrderItemPager(Map<String, Object> paramMap, Criteria criteria,
                                  Pager pager) throws Exception {
        try {
            PageBounds pageBounds = new PageBounds
                    (pager.getPageNumber(),
                            pager.getPageSize());
            List<OrderItem> list = orderItemDao
                    .getOrderItemPager(paramMap, criteria,
                            pageBounds);
            pager.setList(list);
            PageList<OrderItem> pageList = (PageList<OrderItem>) list;
            pager.setTotalCount(pageList.getPaginator().getTotalCount
                    ());
            return pager;
        } catch (Exception e) {
            throw e;
        }
    }

	@Override
	public List<Map<String, Object>> getBestSellersGoodsByTime(Map<String, Object> paramMap,
			String start, String end, int num) throws Exception {
		return orderItemDao.getBestSellersGoodsByTime(paramMap,start,end,num);
	}

	@Override
	public List<Map<String, Object>> getDullSellersGoodsByTime(Map<String, Object> paramMap,
			String start, String end, int num) {
		return orderItemDao.getDullSellersGoodsByTime(paramMap,start,end,num);
	}

	@Override
	public List<Map<String, Object>> getCrossBorderItemList(Map<String, Object> paramMap, Criteria criteria) {
		return orderItemDao.getCrossBorderItemList(paramMap, criteria);
	}


	/**
	 *
	 * @param paramMap
	 *            租户标识
	 * @param criteria
	 *            查询条件
	 * @param pager
	 * @return
	 * @throws Exception
	 */
	public Pager getPagerItemsGpGoodsId(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
		List<OrderItem> list = orderItemDao.getPagerItemsGpGoodsId(paramMap, criteria, pageBounds);
		pager.setList(list);
		PageList pageList = (PageList) list;
		pager.setTotalCount(pageList.getPaginator().getTotalCount());
		return pager;
	}

}
