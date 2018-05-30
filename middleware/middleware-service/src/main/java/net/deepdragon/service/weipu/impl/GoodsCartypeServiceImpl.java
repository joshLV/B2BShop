package net.deepdragon.service.weipu.impl;


import net.deepdragon.bean.PageList;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GoodsCartypeDao;
import net.deepdragon.entity.weipu.GoodsCartype;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.service.weipu.GoodsCartypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN+"GoodsCartypeServiceImpl")
public class GoodsCartypeServiceImpl extends BaseServiceImpl<GoodsCartype, String> implements GoodsCartypeService{

	@Resource(name= Weipu.SIGN+"GoodsCartypeDaoImpl")
	private GoodsCartypeDao goodsCartypeDao;
	
	@Override
	public BaseDao<GoodsCartype, String> getBaseDao() {
		return this.goodsCartypeDao;
	}

    @Override
    public Pager getGoodsPager(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
        try {
            PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
            List list = goodsCartypeDao.getGoodsPager(paramMap, criteria, pageBounds);
            pager.setList(list);
            PageList pageList = (PageList) list;
            pager.setTotalCount(pageList.getPaginator().getTotalCount());
            return pager;
        } catch (Exception e) {
            throw e;
        }
    }
}

