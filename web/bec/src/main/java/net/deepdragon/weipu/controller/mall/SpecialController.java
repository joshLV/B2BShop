package net.deepdragon.weipu.controller.mall;

import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2015/7/2.
 */
@Controller(Global.APP_SIGN + Global.MALL + "SpecialController")
@RequestMapping(Global.MALL_PATH + "/special")
public class SpecialController extends BaseMallController{
    @Resource
    private CacheData cacheData;

    @RequestMapping(value = "/index")
    public String show(Model model){
        // Global.TEMPLATE_MALL + PATH + "/shop/default/result";
        model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
        model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
        model.addAttribute("services", cacheData.getServices(getParamMap()));

        return Global.TEMPLATE_MALL+PATH+"/special";
    }
}
