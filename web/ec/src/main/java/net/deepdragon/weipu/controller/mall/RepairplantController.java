package net.deepdragon.weipu.controller.mall;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.Area;
import net.deepdragon.entity.weipu.Cartype;
import net.deepdragon.entity.weipu.Repairplant;
import net.deepdragon.service.AreaService;
import net.deepdragon.service.weipu.CartypeService;
import net.deepdragon.service.weipu.RepairplantService;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.List;

/**
 * 订单页面
 */
@Controller(Global.APP_SIGN + Global.MALL + "RepairplantController")
@RequestMapping(Global.MALL_PATH + "/repairplant")
public class RepairplantController extends BaseMallController {
	@Resource
	private RepairplantService repairplantService;
	@Resource
	private CartypeService cartypeService;
	@Resource
	private CacheData cacheData;
	@Resource
	private AreaService areaService;

	@RequestMapping(value = "/list", method = { RequestMethod.GET })
	public String list(Model model, Pager pager) {
		String info = "维修厂";
		setLogInfo(info);
		logger.debug(info);
		try {
			Criteria criteria = new Criteria();
			pager.setPageSize(5);
			if (StringUtils.isNotEmpty(pager.getOrderBy()) && StringUtils.isNotEmpty(pager.getOrderType())) {
				criteria.add(Restrictions.order(pager.getOrderBy(), pager.getOrderType().toUpperCase()));
			}
			pager = repairplantService.getPager(getParamMap(), criteria, pager);
			List<Repairplant> list = (List<Repairplant>) pager.getList();
			for (Repairplant repairplant : list) {
				List<Cartype> cList = repairplantService.getRepairtCartype(getParamMap(), repairplant.getId());
				StringBuffer buffer = new StringBuffer();
				for (Cartype cartype : cList) {
					buffer.append(cartype.getName() + "、");
				}
				String business = buffer.toString();
				repairplant.setBusiness(business.substring(0, business.length()-1));
			}
			model.addAttribute("list", list);
			model.addAttribute("pager", pager);
			model.addAttribute("total", pager.getTotalCount());
            setPublicDate2Model( model );
			// 获取地区列表
			criteria = new Criteria();
			criteria.add(Restrictions.isNull("parentId"));
			List<Area> areaList = areaService.getList(getParamMap(), criteria);
			model.addAttribute("areaList", areaList);
			// 获取车型列表
			List<Cartype> cartypeList = cartypeService.getAll(getParamMap());
			model.addAttribute("cartypeList", cartypeList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Global.TEMPLATE_MALL + PATH + "/repairplant_list";
	}
    @RequestMapping(value = "s/{keyword}")
    public String search(@PathVariable String keyword, Pager pager, Model model) {
        String info = "全站搜索";
        setLogInfo(info);
        logger.debug(info);
        try {
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.like("name", "%"+keyword+"%"));
            pager.setPageSize(5);
            if (StringUtils.isNotEmpty(pager.getOrderBy())
                    && StringUtils.isNotEmpty(pager.getOrderType())) {
                criteria.add(Restrictions.order(pager.getOrderBy(), pager
                        .getOrderType().toUpperCase()));
            }
            pager= repairplantService.getPager(getParamMap(), criteria, pager);
            // 获取地区列表
            criteria = new Criteria();
            criteria.add(Restrictions.isNull("parentId"));
            List<Area> areaList = areaService.getList(getParamMap(), criteria);
            model.addAttribute("areaList", areaList);
            model.addAttribute("list", pager.getList());
            model.addAttribute("pager", pager);
            model.addAttribute("total", pager.getTotalCount());
            setPublicDate2Model( model );
        } catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }

        model.addAttribute("keyword", keyword);

        return Global.TEMPLATE_MALL + PATH + "/repairplant_result";
    }
    @RequestMapping(value = "areaSearch/{keyword}")
    public String areaSearch(@PathVariable String keyword, Pager pager, Model model) {
        String info = "全站搜索";
        setLogInfo(info);
        logger.debug(info);
        try {
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.like("areaPath", "%"+keyword+"%"));
            pager.setPageSize(5);
            if (StringUtils.isNotEmpty(pager.getOrderBy())
                    && StringUtils.isNotEmpty(pager.getOrderType())) {
                criteria.add(Restrictions.order(pager.getOrderBy(), pager
                        .getOrderType().toUpperCase()));
            }
            pager= repairplantService.getPager(getParamMap(), criteria, pager);
            // 获取地区列表
            criteria = new Criteria();
            criteria.add(Restrictions.isNull("parentId"));
            List<Area> areaList = areaService.getList(getParamMap(), criteria);
            model.addAttribute("areaList", areaList);
            model.addAttribute("list", pager.getList());
            model.addAttribute("pager", pager);
            model.addAttribute("total", pager.getTotalCount());
            setPublicDate2Model( model );
        } catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }

        model.addAttribute("keyword", keyword);

        return Global.TEMPLATE_MALL + PATH + "/repairplant_result";
    }
}
