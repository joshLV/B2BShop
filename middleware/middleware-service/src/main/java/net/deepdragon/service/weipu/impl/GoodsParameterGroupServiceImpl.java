package net.deepdragon.service.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GoodsParameterDao;
import net.deepdragon.dao.weipu.GoodsParameterGroupDao;
import net.deepdragon.entity.weipu.GoodsParameter;
import net.deepdragon.entity.weipu.GoodsParameterGroup;
import net.deepdragon.service.weipu.GoodsParameterGroupService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN+"GoodsParameterGroupServiceImpl")
public class GoodsParameterGroupServiceImpl extends BaseServiceImpl<GoodsParameterGroup, String> implements GoodsParameterGroupService {

    @Resource(name = Weipu.SIGN + "GoodsParameterGroupDaoImpl")
    private GoodsParameterGroupDao goodsParameterGroupDao;
    @Resource(name = Weipu.SIGN + "GoodsParameterDaoImpl")
    private GoodsParameterDao goodsParameterDao;
	
	@Override
	public BaseDao<GoodsParameterGroup, String> getBaseDao() {
		return this.goodsParameterGroupDao;
	}

    /**
     * 保存参数相关数据
     *
     * @param paramMap              租户标识
     * @param goodsParameterGroup 商品参数分组
     * @param goodsParameterList  商品参数选项列表
     */
    public boolean saveGoodsParameterInfos(Map<String, Object> paramMap, GoodsParameterGroup goodsParameterGroup, List<GoodsParameter> goodsParameterList) throws Exception {
        GoodsParameterGroup parameterGroup = goodsParameterGroupDao.save(paramMap, goodsParameterGroup);
        String groupId = parameterGroup.getId();
        if (goodsParameterList != null && goodsParameterList.size() > 0) {
            for (GoodsParameter p : goodsParameterList) {
                p.setGroupId(groupId);
            }
        }

        // 保存参数选项
        int[] parameterSaveResult = {};
        if (goodsParameterList != null && goodsParameterList.size() > 0) {
            parameterSaveResult = goodsParameterDao.save(paramMap, goodsParameterList);
        }
        return StringUtils.isNotBlank(groupId) && parameterSaveResult.length >= 0;
    }

    /**
     * 更新参数相关数据
     *
     * @param paramMap             租户标识
     * @param goodsParameterGroup 商品参数分组
     * @param goodsParameterList  商品参数选项列表
     * @param deleteParamIds      删除了的参数选项
     */
    public boolean updateGoodsParameterInfos(Map<String, Object> paramMap, GoodsParameterGroup goodsParameterGroup, List<GoodsParameter> goodsParameterList, String deleteParamIds) throws Exception {
        int updateGoodsParamGroupResult = goodsParameterGroupDao.update(paramMap, goodsParameterGroup);

        List<GoodsParameter> doSaveGoodsParameterList = new ArrayList<GoodsParameter>();
        for (GoodsParameter p : goodsParameterList) {
            if (StringUtils.isBlank(p.getId())) {
                doSaveGoodsParameterList.add(p);
            }
        }
        goodsParameterList.removeAll(doSaveGoodsParameterList);
        // 先更新原有的参数选项
        int[] updateGoodsParameterResult = {};
        if (goodsParameterList.size() > 0) {
            updateGoodsParameterResult = goodsParameterDao.update(paramMap, goodsParameterList);
        }

        // 再保存新添加的参数选项
        int[] saveGoodsParameterResult = {};
        if (doSaveGoodsParameterList.size() > 0) {
            saveGoodsParameterResult = goodsParameterDao.save(paramMap, doSaveGoodsParameterList);
        }

        // 删除页面删除了的参数选项
        int[] deleteGoodsParameterResult = {};
        if (StringUtils.isNotBlank(deleteParamIds)) {
            deleteGoodsParameterResult = goodsParameterDao.delete(paramMap, Arrays.asList(deleteParamIds.split(",")));
        }

        return updateGoodsParamGroupResult != -1 && updateGoodsParameterResult.length >= 0 && saveGoodsParameterResult.length >= 0 && deleteGoodsParameterResult.length >= 0;
    }

    /**
     * 删除参数相关数据
     *
     * @param paramMap 租户标识
     * @param groupIds 租户标识
     * @param paramIds 商品参数分组Ids,用逗号分隔
     */
    public boolean deleteGoodsParameterInfos(Map<String, Object> paramMap, List groupIds, List paramIds) throws Exception {
        int[] deleteGoodsParameterResult = {};
        int[] deleteGoodsParameterGroupResult = {};
        if (paramIds != null && paramIds.size() > 0) {
            deleteGoodsParameterResult = goodsParameterDao.delete(paramMap, paramIds);
        }
        if (groupIds != null && groupIds.size() > 0) {
            deleteGoodsParameterGroupResult = goodsParameterGroupDao.delete(paramMap, groupIds);
        }
        return deleteGoodsParameterResult.length >= 0 && deleteGoodsParameterGroupResult.length >= 0;
    }


}

