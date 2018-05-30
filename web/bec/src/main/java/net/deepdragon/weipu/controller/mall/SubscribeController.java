package net.deepdragon.weipu.controller.mall;

import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.Menu;
import net.deepdragon.service.weipu.MenuService;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller(Global.APP_SIGN + Global.MALL + "SubscribeController")
@RequestMapping(Global.MALL_PATH+"/member/subscribe")
public class SubscribeController extends BaseMallController {
	@Resource
	private MenuService menuService;
	@Resource
	private CacheData cacheData;
	
	@RequestMapping(value = "list")
    public String list(Model model) {
        String info = "邮件订阅";
        setLogInfo(info);
        logger.debug(info);

        model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
        model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
        return Global.TEMPLATE_MALL + PATH + "/member/subscribe";
    }

}
