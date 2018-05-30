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
@Controller(Global.APP_SIGN + Global.MALL + "BrandController")
@RequestMapping(Global.MALL_PATH + "/brand")
public class BrandController extends BaseMallController{
    @Resource
    private CacheData cacheData;

    @RequestMapping(value = "/index")
    public String show(Model model){
        // Global.TEMPLATE_MALL + PATH + "/shop/default/result";
        setPublicDate2Model( model );

        return Global.TEMPLATE_MALL+PATH+"/brand";
    }
}
