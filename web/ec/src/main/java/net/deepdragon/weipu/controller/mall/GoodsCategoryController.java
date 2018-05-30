package net.deepdragon.weipu.controller.mall;

import net.deepdragon.entity.weipu.Goods;
import net.deepdragon.service.weipu.GoodsCategoryService;
import net.deepdragon.weipu.Global;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by haoxiaolei on 2014/7/10 0010.
 * 网站商城 商品分类相关
 */
@Controller(Global.APP_SIGN + Global.MALL + "GoodsCategoryController")
@RequestMapping(Global.MALL_PATH + "/gc")
public class GoodsCategoryController extends BaseMallController {
    @Resource
    private GoodsCategoryService gcService;

    @RequestMapping("/getCategoryOfGoods/{categoryId}/{nums}")
    public String getCategoryOfGoods(@PathVariable String categoryId, @PathVariable Integer nums, Model model) {
        String info = "根据商品分类获取商品列表信息";
        setLogInfo(info);
        try {
            List<Goods> goodsList = (List<Goods>) gcService.getCategoryOfGoods(getParamMap(), categoryId, nums);
            model.addAttribute("goodsList", goodsList);
        } catch (Exception e) {
            logger.error(info + "时，发生异常", e);
        }

        return "";
    }


}
