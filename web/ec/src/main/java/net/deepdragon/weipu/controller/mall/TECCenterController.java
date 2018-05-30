package net.deepdragon.weipu.controller.mall;

import net.deepdragon.entity.weipu.Articles;
import net.deepdragon.entity.weipu.ArticlesCategory;
import net.deepdragon.entity.weipu.Catelog;
import net.deepdragon.service.weipu.*;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Jiaowenxian on 2015/7/2.
 */
@Controller(Global.APP_SIGN + Global.MALL + "TECCenterController")
@RequestMapping("/teccenter")
public class TECCenterController extends BaseMallController{
    @Resource
    private NavigationService navigationService;
    @Resource
    private ArticlesCategoryService articlesCategoryService;
    @Resource
    private ArticlesService articlesService;
    @Resource
    private CacheData cacheData;

    @RequestMapping(value = "index")
    public String index(Model model) {
        String info = "进入前台主页面";
        setLogInfo(info);
        logger.debug(info);
        getAllCatelog(model);// 首页类目展示
        setPublicDate2Model( model );
//        model.addAttribute("articleComn", getArticlesBySign(getTenantId()));

        //add by zx 20150703
        getData(model);


        return Global.TEMPLATE_MALL + PATH + "/teccenter";
    }

    private void getData(Model model) {
//        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

        Map<String, Object> list = new HashMap<String, Object>();
        String[] signs = new String[]{"jrhq","rmzx","zdjj","nqyj","rmnyzs","knowledge","news"};
        Map<String, Object> map = null;
        for(String sign: signs){
            map = new HashMap<String, Object>();
            try {
                ArticlesCategory category = articlesCategoryService.find(getParamMap(), "sign", sign);
                List<Articles> articleses = null;
                if(sign.equals("news")){
                    map.put("category", category);
                    articleses = articlesService.getArticlesByTwoID(getParamMap(),3,category.getId());
                    map.put("twoCat", articlesCategoryService.findList(getParamMap(), "parentId", category.getId()));
                    map.put("articles", articleses);
//                    list.put(sign + );
                    list.put(sign, map);
                }else if(sign.equals("knowledge")){
                    map.put("category", category);
                    articleses = articlesService.getArticlesN(getParamMap(),4,category.getId());
                    List<ArticlesCategory> twoCatList = articlesCategoryService.findList(getParamMap(), "parentId", category.getId());
                    List<Map<String, Object>> twoList = new ArrayList<Map<String, Object>>();
                    for(ArticlesCategory two: twoCatList){
                        Map<String, Object> map2 = new HashMap<String, Object>();
                        map2.put("twoCat", two);
                        map2.put("threeCat",articlesCategoryService.findList(getParamMap(), "parentId", two.getId()));
                        twoList.add(map2);
                    }
                    map.put("CatTwo", twoList);
                    map.put("articles", articleses);
                    list.put(sign, map);
                }else{
                    articleses = articlesService.getArticles(getParamMap(), 10, category.getId());
                    list.put(sign, category);
                    list.put(sign + "articles", articleses);
                }
//                model.addAttribute(sign + "articles", articleses);

            }catch (Exception e){
                e.printStackTrace();
            }
//            list.add(map);
        }
        model.addAttribute("tec", list);
    }

    @RequestMapping(value = "detail/{id}", method = { RequestMethod.GET })
    public String index(@PathVariable String id,Model model) {
        getAllCatelog(model);// 首页类目展示
        setPublicDate2Model( model );
        Map<String, Object> list = new HashMap<String, Object>();
        String[] signs = new String[]{"rmzx","zdjj","nqyj"};
        for(String sign: signs){
            try {
                ArticlesCategory category = articlesCategoryService.find(getParamMap(), "sign", sign);
                List<Articles> articleses = articlesService.getArticles(getParamMap(), 10, category.getId());
                list.put(sign, category);
                list.put(sign + "articles", articleses);

                Articles article = articlesService.find(getParamMap(), "id", id);
                model.addAttribute("articleMain",article);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        model.addAttribute("tec", list);

        return Global.TEMPLATE_MALL + PATH + "/teccenterDetail";
    }
}