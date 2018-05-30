package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GoodsDao;
import net.deepdragon.dao.weipu.MerchantDao;
import net.deepdragon.entity.weipu.Merchant;
import net.deepdragon.service.weipu.MerchantService;
import net.deepdragon.util.Constant;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN+"MerchantServiceImpl")
public class MerchantServiceImpl extends BaseServiceImpl<Merchant, String> implements MerchantService {

	@Resource(name= Weipu.SIGN+"MerchantDaoImpl")
	private MerchantDao merchantDao;
	@Resource(name= Weipu.SIGN+"GoodsDaoImpl")
	private GoodsDao goodsDao;

	@Override
	public BaseDao<Merchant, String> getBaseDao() {
		return this.merchantDao;
	}

    /**
     * 更新店铺信息，如果要关闭店铺，则要把该店铺下的所有商品都要下架
     */
    public int update(Map<String, Object> paramMap, Merchant entity) throws Exception {
        int result = super.update(paramMap, entity);
        if (entity.getStatus() == -1) { // 当status=-1时说明要关闭店铺
            goodsDao.marketableGoods(paramMap, entity.getId(), 0);
        }
        return result;
    }

    @Override
    public List<Merchant> getNameMerchants(Map<String, Object> paramMap, String merchantName) throws Exception {
        return merchantDao.getNameMerchants(paramMap, merchantName);
    }
}

