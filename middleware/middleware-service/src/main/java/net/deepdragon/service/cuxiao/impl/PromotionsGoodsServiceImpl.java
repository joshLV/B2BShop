package net.deepdragon.service.cuxiao.impl;

import net.deepdragon.bean.PageList;
import net.deepdragon.bean.Pager;
import net.deepdragon.constant.cuxiao.Cuxiao;
import net.deepdragon.dao.cuxiao.PromotionsGoodsDao;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.entity.cuxiao.PromotionsGoods;
import net.deepdragon.entity.weipu.Goods;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.service.cuxiao.PromotionsGoodsService;
import net.deepdragon.service.weipu.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by 15438 on 2016-04-13.
 */
@Service(Cuxiao.SIGN + "PromotionsGoodsServiceImpl")
public class PromotionsGoodsServiceImpl extends BaseServiceImpl<PromotionsGoods,String> implements PromotionsGoodsService {
    @Resource(name = Cuxiao.SIGN + "PromotionsGoodsDaoImpl")
    private PromotionsGoodsDao promotionsGoodsDao;
    @Override
    protected BaseDao<PromotionsGoods, String> getBaseDao() {
        return this.promotionsGoodsDao;
    }

    @Override
    public Pager getPromotionsGoodsPager(Map<String, Object> paramMap, String promotionsId,Pager pager) throws Exception {
        try {
            PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
            paramMap.put("promotionsId",promotionsId);
            List<Goods> list = promotionsGoodsDao.getPromotionsGoodsPager(paramMap,pageBounds);
            pager.setList(list);
            PageList<Goods> pageList = (PageList<Goods>) list;
            pager.setTotalCount(pageList.getPaginator().getTotalCount());
            return pager;
        }catch (Exception e){
            throw e;
        }
    }

    @Override
    public PromotionsGoods getPromotionsGoods(Map<String, Object> paramMap, String goodsId, String promotionsId) throws Exception {
        return promotionsGoodsDao.getPromotionsGoods(paramMap,goodsId,promotionsId);
    }
}
