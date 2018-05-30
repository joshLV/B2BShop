package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.EnquiryGoodsDao;
import net.deepdragon.entity.weipu.EnquiryGoods;
import org.springframework.stereotype.Repository;

/**
 * 询价商品表数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "EnquiryGoodsDaoImpl")
public class EnquiryGoodsDaoImpl extends BaseDaoImpl<EnquiryGoods, String> implements
		EnquiryGoodsDao {

}
