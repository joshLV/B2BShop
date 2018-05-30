package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.*;
import net.deepdragon.entity.weipu.Enquiry;
import net.deepdragon.entity.weipu.EnquiryGoods;
import net.deepdragon.entity.weipu.EnquiryLog;
import net.deepdragon.entity.weipu.EnquiryMerchant;
import net.deepdragon.service.weipu.EnquiryService;
import net.deepdragon.util.Constant;
import net.deepdragon.util.StringUtil;
import org.springframework.stereotype.Service;
import sun.plugin2.gluegen.runtime.CPU;

import javax.annotation.Resource;
import java.util.*;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"EnquiryServiceImpl")
public class EnquiryServiceImpl extends BaseServiceImpl<Enquiry, String> implements EnquiryService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"EnquiryDaoImpl")
	private EnquiryDao enquiryDao;
	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"EnquiryGoodsDaoImpl")
	private EnquiryGoodsDao enquiryGoodsDao;
	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"EnquiryLogDaoImpl")
	private EnquiryLogDao enquiryLogDao;
	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"EnquiryMerchantDaoImpl")
	private EnquiryMerchantDao enquiryMerchantDao;
	
	@Override
	public BaseDao<Enquiry, String> getBaseDao() {
		return this.enquiryDao;
	}

	@Override
	public void saveEnquiry(Map<String, Object> paramMap, String buyerId, Enquiry enquiry) throws Exception{
		//商家ID
		List<String> merchantIds = null;
		//询价单
		List<EnquiryGoods> goods = enquiry.getGoods();

		//是否报含税价
		if( enquiry.getIsContainTax() == null ){
			enquiry.setIsContainTax( 1 );
		}

		//交易方式不是其它时，不保存其它方式
		if( enquiry.getTradeExchange() == 1 ){
			enquiry.setOtherTrade( null );
		}
		//是否签署保密协议
		if( enquiry.getIsSecrecyAgreement() == null ){
			enquiry.setIsSecrecyAgreement( 1 );
		}

		//是否指定供应商，指定时需要保存我的供应商
		if( 2 == enquiry.getEnquiryMode() ){
			merchantIds = new ArrayList<String>();
			if( enquiry.getMerchantIds().indexOf(",") > 0 ){
				String[] ids = enquiry.getMerchantIds().split(",");
				for(String id : ids){
					merchantIds.add(id);
				}
			}else{
				merchantIds.add( enquiry.getMerchantIds() );
			}
		}

		enquiry.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
		enquiry.setBuyerId(buyerId);
		enquiry.setReleaseDateTime(new Date());
		enquiry.setEnquiryState(1);
		enquiry.setIsDelete(1);
		enquiry.setCreateDate(new Date());
		enquiry.setCreateUser(buyerId);



		enquiry = this.enquiryDao.save(paramMap, enquiry);

		//保存询价单商品
		Iterator<EnquiryGoods> it = goods.iterator();
		while( it.hasNext() ){
			EnquiryGoods good = it.next();
			if( StringUtil.isNotEmpty(good.getGoodsName()) ){
				good.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
				good.setEnquiryId(enquiry.getId());
				good.setIsDelete(1);
				good.setCreateDate(new Date());
				good.setCreateUser(buyerId);

				this.enquiryGoodsDao.save(paramMap, good);
			}else{
				it.remove();
			}
		}

		//保存日志
		EnquiryLog log = new EnquiryLog();
		log.setIsDelete(1);
		log.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
		log.setEnquiryId( enquiry.getId() );
		log.setContent("发布询价单["+enquiry.getTitle()+"]");
		log.setCreateUser(buyerId);
		log.setCreateDate(new Date());

		this.enquiryLogDao.save(paramMap, log);
		//保存指定供应商
		if(merchantIds!=null){
			for(String id : merchantIds){
				EnquiryMerchant em = new EnquiryMerchant();
				em.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
				em.setEnquiryId(enquiry.getId());
				em.setMerchantId(id);
				em.setIsDelete(1);
				em.setCreateUser(buyerId);
				em.setCreateDate(new Date());

				enquiryMerchantDao.save(paramMap, em);
			}

		}
	}

	@Override
	public Map<String, Object> getCount(Map<String, Object> paramMap, String buyerId) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("-1", 0);//询价单数量
		map.put("1", 0);//接收报价中-询价单数量
		map.put("2", 0);//报价已截止-询价单数量
		map.put("3", 0);//询价已撤销-所有询价单数量
		map.put("4", 0);//询价已完结-所有询价单数量


		//更新截止的询价单
		updateState(paramMap,buyerId, 2);

		//统计各状态的条数
		List<Map<String,Object>> lists = this.enquiryDao.getCount(paramMap, buyerId);

		Long total = 0l;

		if( lists != null && lists.size() > 0 ){
			for( Map<String,Object> m : lists ){
				map.put(m.get("enquiryState")+"", m.get("totalCount") );
				total += (Long)m.get("totalCount");
			}
		}
		map.put("-1", total);
		return map;
	}


	@Override
	public void updateState(Map<String, Object> paramMap, String buyerId, int enquiryState) throws Exception {
		//更新截止的询价单
		Enquiry enquiry = new Enquiry();
		enquiry.setEnquiryState(enquiryState);
		enquiry.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
		enquiry.setOfferEndDateTime(new Date());
		enquiry.setIsDelete(1);
		enquiry.setBuyerId(buyerId);

		this.enquiryDao.updateState(enquiry);
	}
}

