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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.HtmlUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 站内公告
 */
@Controller(Global.APP_SIGN + Global.MALL + "NoticeController")
@RequestMapping(Global.MALL_PATH + "/notice")
public class NoticeController extends BaseMallController {

	@Resource
	private ArticlesService articlesService;
	@Resource
	private ArticlesCategoryService articlesCategoryService;
	@Resource
	private CacheData cacheData;

	@RequestMapping(value = "list")
	public String list(Pager pager, Model model) {
		String info = "站内公告信息列表";
		setLogInfo(info);
		logger.debug(info);
		try {
			List<ArticlesCategory> hotArticleCategoryList = new ArrayList<ArticlesCategory>();
			ArticlesCategory notice = null;
			String[] signs = new String[] { "notice", "main", "tire", "battery", "service" };
			for (String sign : signs) {
				ArticlesCategory category = articlesCategoryService.find(getParamMap(), "sign", sign);
				if(category!=null){
					hotArticleCategoryList.add(category);
					if(StringUtils.equalsIgnoreCase("notice", category.getSign())){
						notice = category;
						Criteria criteria = new Criteria();
						criteria.add(Restrictions.eq("categoryId", category.getId()));
						criteria.add(Restrictions.eq("isPublication", 1));
						criteria.add(Restrictions.order("isTop", "desc"));
						criteria.add(Restrictions.order("createDate", "desc"));
						criteria.add(Restrictions.eq(Constant.TENANTID_KEY,getTenantId()));
						criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,getPlatform()));
                        pager.setPageSize(10);
						pager = articlesService.getPager(getParamMap(), criteria, pager);
						if(pager.getList()!=null){
							for(Object data : pager.getList()){
								Articles articles = (Articles) data;
								String content = HtmlUtils.htmlUnescape(articles.getContent());
								articles.setContent(content);
							}
						}
					}
				}
			}
			model.addAttribute("notice", notice);
			model.addAttribute("hotArticleCategoryList", hotArticleCategoryList); 
			model.addAttribute("pager", pager);  
		} catch (Exception ex) {
			logger.error("访问" + info + "时，发生异常", ex);
		}
		model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
		model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
		model.addAttribute("services", cacheData.getServices(getParamMap()));
		return Global.TEMPLATE_MALL + PATH + "/notice_list";
	}
	
}
