package net.deepdragon.service.weipu.impl;


import net.deepdragon.bean.PageList;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.CartypeDao;
import net.deepdragon.entity.weipu.Cartype;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.service.weipu.CartypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN+"CartypeServiceImpl")
public class CartypeServiceImpl extends BaseServiceImpl<Cartype, String> implements CartypeService{

	@Resource(name= Weipu.SIGN+"CartypeDaoImpl")
	private CartypeDao cartypeDao;
	
	@Override
	public BaseDao<Cartype, String> getBaseDao() {
		return this.cartypeDao;
	}

    @Override
    public Pager getCartypePager(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
        try {
            PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
            List list = cartypeDao.getCartypePager(paramMap, criteria, pageBounds);
            pager.setList(list);
            PageList pageList = (PageList) list;
            pager.setTotalCount(pageList.getPaginator().getTotalCount());
            return pager;
        } catch (Exception e) {
            throw e;
        }
    }
}

