package net.deepdragon.weipu.controller.mall;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.Articles;
import net.deepdragon.entity.weipu.ArticlesCategory;
import net.deepdragon.service.weipu.ArticlesCategoryService;
import net.deepdragon.service.weipu.ArticlesService;
import net.deepdragon.util.Constant;
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

import static org.springframework.web.util.HtmlUtils.htmlUnescape;

/**
 * Created by Administrator on 2015/7/2.
 */
@Controller(Global.APP_SIGN + Global.MALL + "ServeHallController")
@RequestMapping(Global.MALL_PATH + "/serveHall")
public class ServeHallController extends BaseMallController{
    @Resource
    private ArticlesService articlesService;
    @Resource
    private CacheData cacheData;
    @Resource
    private ArticlesCategoryService articlesCategoryService;

    @RequestMapping(value = "/index")
    public String show(Model model){
        // Global.TEMPLATE_MALL + PATH + "/shop/default/result";
        setPublicDate2Model( model );

        model.addAttribute("question", getArticles(getTenantId(), "problem"));
        model.addAttribute("answer", getArticles(getTenantId(), "answer"));

        return Global.TEMPLATE_MALL+PATH+"/serveHallIndex";
    }

    public List<Map<String, Object>> getArticles(String tenantId, String sign){
        List<Map<String, Object>> services = null;
        services = new ArrayList<Map<String, Object>>();
        try {
            ArticlesCategory parent = articlesCategoryService.find(getParamMap(), "sign", sign);
            List<ArticlesCategory> categories = articlesCategoryService.findList(getParamMap(), "parentId", parent.getId());
            for (ArticlesCategory category : categories) {
                    Map<String, Object> data = new HashMap<String, Object>();
                    data.put("category", category);
                    data.put("articles", articlesService.getArticles(
                            getParamMap(), category.getSign(), null, null, null));
                    services.add(data);
            }
        } catch (Exception ex) {
            logger.error("获取常见问题信息时，发生异常。", ex);
            ex.printStackTrace();
        }
        return services;
    }

    @RequestMapping(value = "detail/{id}", method = { RequestMethod.GET })
    public String detail(@PathVariable String id,Model model) {
        String info = "查看帮助内容[id:" + id + "]";
        setLogInfo(info);
        logger.debug(info);
        try {
            Articles articles = articlesService.get(getParamMap(), id);
            articles.setContent(htmlUnescape(articles.getContent()));
            model.addAttribute("article", articles);

            ArticlesCategory category = articlesCategoryService.find(getParamMap(), "id", articles.getCategoryId());
            model.addAttribute("category", category);
            List<ArticlesCategory> categories = articlesCategoryService.findList(getParamMap(), "parentid", category.getParentId());
            model.addAttribute("catelogs", categories);
        } catch (Exception e) {
            e.printStackTrace();
        }
        setPublicDate2Model( model );
        return Global.TEMPLATE_MALL + PATH + "/serveHallDetail";
    }

    @RequestMapping(value = "list/{id}", method = { RequestMethod.GET })
    public String list(@PathVariable String id,Model model,Pager pager) {
        String info = "查看帮助内容[id:" + id + "]";
        setLogInfo(info);
        logger.debug(info);
        try {
            ArticlesCategory category = articlesCategoryService.find(getParamMap(), "id", id);
            model.addAttribute("category", category);
            List<ArticlesCategory> categories = articlesCategoryService.findList(getParamMap(), "parentid", category.getParentId());
            model.addAttribute("catelogs", categories);

            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("isPublication", 1));
            criteria.add(Restrictions.eq("categoryId", category.getId()));
            criteria.add(Restrictions.order("modifyDate", "DESC"));
            criteria.add(Restrictions.eq(Constant.TENANTID_KEY,getTenantId()));
            criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,getPlatform()));
            pager.setPageSize(10);
            pager= articlesService.getPager(getParamMap(), criteria, pager);
            model.addAttribute("articles", pager.getList());
            model.addAttribute("pager", pager);
        } catch (Exception e) {
            e.printStackTrace();
        }
        setPublicDate2Model( model );
        return Global.TEMPLATE_MALL + PATH + "/serveHallDetail";
    }
}
