package net.deepdragon.weipu.controller.mall;

import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2015/7/2.
 */
@Controller(Global.APP_SIGN + Global.MALL + "MarketIntroduceController")
@RequestMapping(Global.MALL_PATH + "/introduce")
public class MarketIntroduceController extends BaseMallController{

    @Resource
    private CacheData cacheData;

    @RequestMapping(value = "/{whichapp}")
    public String show(@PathVariable String whichapp,Model model){
        // Global.TEMPLATE_MALL + PATH + "/shop/default/result";
        model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
        model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
        model.addAttribute("services", cacheData.getServices(getParamMap()));
        model.addAttribute("cls","app_introduce");
        if("whichapp".equals(whichapp)){
            return Global.TEMPLATE_APP+PATH+"/mall_introduce";
        }else{
            return Global.TEMPLATE_MALL+PATH+"/marketIntroduce";
        }

    }
}
