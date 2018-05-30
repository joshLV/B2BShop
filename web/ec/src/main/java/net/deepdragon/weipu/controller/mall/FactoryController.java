package net.deepdragon.weipu.controller.mall;

import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.Merchant;
import net.deepdragon.entity.weipu.MerchantType;
import net.deepdragon.service.AreaService;
import net.deepdragon.service.weipu.MerchantService;
import net.deepdragon.service.weipu.MerchantTypeService;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.List;

@Controller(Global.APP_SIGN + Global.MALL + "FactoryController")
@RequestMapping(Global.MALL_PATH + "/factory")
public class FactoryController extends BaseMallController {
	
	@Resource
    private MerchantService merchantService;
    @Resource
    private MerchantTypeService merchantTypeService;
    @Resource
    private AreaService areaService;
	@Resource
	private CacheData cacheData;
	
	@RequestMapping(value = "/list", method = { RequestMethod.GET })
	public String list(Model model) {
		String info = "生产厂家信息列表展示";
		setLogInfo(info);
		logger.debug(info);
		List<Merchant> merchantList = null;
		Criteria criteria = new Criteria();
		criteria.add(Restrictions.eq("status", 3));
		try {
            MerchantType merchantType = merchantTypeService.find(getParamMap(),"name","生产厂家");
            if(merchantType!=null){
                criteria.add(Restrictions.eq("typeId",merchantType.getId()));
            }
            merchantList = merchantService.getList(getParamMap(), criteria);
		} catch (Exception e) {
			logger.error("查询所有已审核生产厂家信息", e);
		}
		model.addAttribute("merchantList", merchantList);
		setPublicDate2Model( model );
		return Global.TEMPLATE_MALL + PATH + "/factory_list";
	}
	
}
