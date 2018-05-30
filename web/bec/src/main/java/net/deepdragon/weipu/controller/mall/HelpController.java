package net.deepdragon.weipu.controller.mall;

import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.Articles;
import net.deepdragon.entity.weipu.ArticlesCategory;
import net.deepdragon.service.weipu.ArticlesCategoryService;
import net.deepdragon.service.weipu.ArticlesService;
import net.deepdragon.util.Constant;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.List;

import static org.springframework.web.util.HtmlUtils.htmlUnescape;

@Controller(Global.APP_SIGN + Global.MALL + "HelpController")
@RequestMapping("/help")
public class HelpController extends BaseMallController {

	@Resource
	private ArticlesService articlesService;
	@Resource
	private ArticlesCategoryService articlesCategoryService;
	@Resource
	private CacheData cacheData;

	@RequestMapping(value = "")
	public String help(Model model) {
		String info = "进入帮助中心";
		setLogInfo(info);
		logger.debug(info);
		model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
		model.addAttribute("services", cacheData.getServices(getParamMap()));
		return Global.TEMPLATE_MALL + PATH + "/help";
	}

	@RequestMapping(value = "question/{id}", method = { RequestMethod.GET })
	public String question(@PathVariable String id,Model model) {
		String info = "查看帮助内容[id:" + id + "]";
		setLogInfo(info);
		logger.debug(info);
		try {
			Articles articles = articlesService.get(getParamMap(), id);

			/*20160627 dzz 会员中心-帮助中心功能处理, 异常条件: 当此Id对象的帮助中心对象不存在时做一下方法处理*/
			String parentSign = "help"; //分类标识
			if(articles==null) {
				ArticlesCategory articlesCategory = this.articlesCategoryService.find(getParamMap(),"sign", parentSign);
				if(articlesCategory!=null) {
					List<Articles> articlesList = articlesService.findList(getParamMap(), "categoryId", articlesCategory.getId());
					if(articlesList != null  && articlesList.size() > 0) {
						articles = articlesList.get(0);
						articles.setContent(htmlUnescape(articles.getContent()));
					} else {
						parentSign = "shopping";
						articlesCategory = this.articlesCategoryService.find(getParamMap(),"sign", parentSign);
						if(articlesCategory!=null) {
							articlesList = articlesService.findList(getParamMap(), "categoryId", articlesCategory.getId());
							if(articlesList != null  && articlesList.size() > 0) {
								articles = articlesList.get(0);
								articles.setContent(htmlUnescape(articles.getContent()));
							}
						}
					}
				} else {
					articles = new Articles();
					articles.setContent("无数据");
				}
			}

            articles.setContent(htmlUnescape(articles.getContent()));
			model.addAttribute("articles", articles);
		} catch (Exception e) {
			e.printStackTrace();
		}
		getLeftMenu(model);
		model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
		model.addAttribute("services", cacheData.getServices(getParamMap()));
		model.addAttribute("helpName","帮助中心");
		return Global.TEMPLATE_MALL + PATH + "/help_question";
	}

	@RequestMapping(value = "marketLandscape")
	public String marketLandscape(Model model) {
		String info = "查看市场实景";
		setLogInfo(info);
		logger.debug(info);
		try {

			ArticlesCategory articlesCategory = this.articlesCategoryService.find(getParamMap(), "sign", "marketLandscape");
			Articles articles = null;

			if( articlesCategory != null ){
				List<Articles> articlesList = articlesService.findList(getParamMap(), "categoryId", articlesCategory.getId());
				if(articlesList != null  && articlesList.size() > 0) {
					articles = articlesList.get(0);
					articles.setContent(htmlUnescape(articles.getContent()));
				}
			}

			if(articles == null){
				articles = new Articles();
				articles.setContent("无数据");
			}

			model.addAttribute("articles", articles);

		} catch (Exception e) {
			e.printStackTrace();
		}
		getLeftMenu(model);
		model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
		model.addAttribute("services", cacheData.getServices(getParamMap()));
		model.addAttribute("helpName","帮助中心");
		return Global.TEMPLATE_MALL + PATH + "/market_landscape";
	}

	private void getLeftMenu(Model model) {
		try {
			String parentSign = "help";
			ArticlesCategory parent = articlesCategoryService.find(getParamMap(), "sign", parentSign);
			if (parent == null) {
				logger.error("获取帮助中心左侧菜单父级分类[sign"+parentSign+"]数据为空。");
				return;
			}
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("parentId", parent.getId()));
			criteria.add(Restrictions.order("orderNo", "ASC"));
			criteria.add(Restrictions.eq(Constant.TENANTID_KEY,getTenantId()));
			criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,getPlatform()));
			List<ArticlesCategory> parentList = null;
			parentList = articlesCategoryService.getList(getParamMap(), criteria);
			criteria = new Criteria();
			criteria.add(Restrictions.isNotNull("categoryId"));
			criteria.add(Restrictions.eq("isPublication", "1"));
			criteria.add(Restrictions.order("isTop", "DESC"));
			criteria.add(Restrictions.order("orderNo", "ASC"));
			criteria.add(Restrictions.eq(Constant.TENANTID_KEY,getTenantId()));
			criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,getPlatform()));
			List<Articles> childList = articlesService.getList(getParamMap(), criteria);
			model.addAttribute("parentList", parentList);
			model.addAttribute("childList", childList);

		} catch (Exception e) {
			logger.error("获取帮助中心左侧菜单数据时，发生异常",e);
			e.printStackTrace();
		}
		
	}

}
