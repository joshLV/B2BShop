package net.deepdragon.service.weipu.impl;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GoodsAttributeDao;
import net.deepdragon.dao.weipu.GoodsAttributeItemDao;
import net.deepdragon.entity.weipu.GoodsAttribute;
import net.deepdragon.entity.weipu.GoodsAttributeItem;
import net.deepdragon.service.weipu.GoodsAttributeItemService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"GoodsAttributeItemServiceImpl")
public class GoodsAttributeItemServiceImpl extends BaseServiceImpl<GoodsAttributeItem, String> implements GoodsAttributeItemService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"GoodsAttributeItemDaoImpl")
	private GoodsAttributeItemDao goodsAttributeItemDao;
    @Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"GoodsAttributeDaoImpl")
    private GoodsAttributeDao goodsAttributeDao;
	@Override
	public BaseDao<GoodsAttributeItem, String> getBaseDao() {
		return this.goodsAttributeItemDao;
	}
    /**
     * 保存属性相关数据
     *
     * @param paramMap              租户标识
     * @param goodsAttributeItem 商品参数分组
     * @param goodsAttributeItemList  商品参数选项列表
     */
    @Override
    public boolean saveGoodsAttributeItemInfos(Map<String, Object> paramMap, GoodsAttribute goodsAttribute, List<GoodsAttributeItem> goodsAttributeItemList) throws Exception {
        try {
            GoodsAttribute Attribute = goodsAttributeDao.save(paramMap, goodsAttribute);
            if (CollectionUtils.isNotEmpty(goodsAttributeItemList)) {
                for (GoodsAttributeItem item : goodsAttributeItemList) {
                    item.setAttributeId(Attribute.getId());
                }
                goodsAttributeItemDao.save(paramMap, goodsAttributeItemList);
            }
            return true;
        } catch (Exception e) {
            throw e;
        }

    }
    /**
     * 更新属性相关数据
     *
     * @param paramMap              租户标识
     * @param goodsAttribute 商品属性分组
     * @param goodsAttributeItemList  商品属性列表
     */
    @Override
    public boolean updateGoodsAttributeInfos(Map<String, Object> paramMap,List<String> deleteallId, GoodsAttribute goodsAttribute, List<GoodsAttributeItem> saveList,List<GoodsAttributeItem> updateList) throws Exception {
        try {
            this.goodsAttributeDao.update(paramMap, goodsAttribute);
            if(CollectionUtils.isNotEmpty(deleteallId)){
                this.goodsAttributeItemDao.delete(paramMap, deleteallId);
            }
            if(CollectionUtils.isNotEmpty(updateList)){
                this.goodsAttributeItemDao.update(paramMap, updateList);
            }
            if(CollectionUtils.isNotEmpty(saveList)){
                this.goodsAttributeItemDao.save(paramMap, saveList);
            }
            return true;
        } catch (Exception e) {
            throw e;
        }
    }
    /**
     * 保存属性相关数据
     *
     * @param paramMap              租户标识
     * @param ids 商品属性分组
     */
    @Override
    public boolean deleteGoodsAttributeItemInfos(Map<String, Object> paramMap,List<String> asList, List<String> allId) throws Exception {
        try {
            this.goodsAttributeDao.delete(paramMap, asList);
            this.goodsAttributeItemDao.delete(paramMap, allId);
            return true;
        } catch (Exception e) {
            throw e;
        }
    }
}

