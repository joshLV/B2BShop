package net.deepdragon.weipu.controller.mall;

import com.alibaba.fastjson.JSON;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.Area;
import net.deepdragon.service.AreaService;
import net.deepdragon.weipu.Global;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 地区相关
 */
@Controller(Global.APP_SIGN + Global.MALL + "AreaController")
@RequestMapping(Global.MALL_PATH + "/area")
public class AreaController extends BaseMallController {

	private static String PATH_SEPARATOR = ",";// 树路径分隔符

	@Resource
	private AreaService areaService;

	// 根据地区Path值获取下级地区JSON数据
	@RequestMapping(value = "ajaxChildren")
	@ResponseBody
	public String ajaxChildrenArea(HttpServletRequest request, HttpServletResponse response) {
		String path = getParameter(request, "path");
		String parentId = "";
		parentId = StringUtils.contains(path, PATH_SEPARATOR) ? StringUtils.substringAfterLast(path, PATH_SEPARATOR) : path;

		List<Area> childrenAreaList = new ArrayList<Area>();
		Criteria criteria = new Criteria();
		if (StringUtils.isEmpty(parentId)) {
			criteria.add(Restrictions.isNull("parentId"));
		} else {
			criteria.add(Restrictions.eq("parentId", parentId));
		}
		
		try {
			childrenAreaList = areaService.getList(getParamMap(), criteria);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Map<String, String>> optionList = new ArrayList<Map<String, String>>();
		for (Area area : childrenAreaList) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("title", area.getName());
			map.put("value", area.getPath());
			optionList.add(map);
		}
		return ajaxJson(JSON.toJSONString(optionList), response);
	}
	@RequestMapping(value = "ajax/getAllArea")
	@ResponseBody
	public String ajaxGetAllArea(HttpServletRequest request, HttpServletResponse response) {

		class AreaJSON{
			private String value;
			private String text;
			private List<AreaJSON> children;
			public AreaJSON(){
				this.value = "";
				this.text = "";
			}
			public AreaJSON build(Area area){
				this.value = area.getPath();
				this.text = area.getName();
				return this;
			}

			public String getValue() {
				return value;
			}

			public void setValue(String value) {
				this.value = value;
			}

			public String getText() {
				return text;
			}

			public void setText(String text) {
				this.text = text;
			}

			public List<AreaJSON> getChildren() {
				return children;
			}

			public void setChildren(List<AreaJSON> children) {
				this.children = children;
			}
		}
		List<AreaJSON> areaJSONs = new ArrayList<>();
		try {
			List<Area> areas = areaService.findList(this.getParamMap(),"1", "1");
			List<Area> areas1 = new ArrayList<Area>();
			List<Area> areas2 = new ArrayList<Area>();
			// 找到所有的省级区域
			for(Area area: areas) {
				int len = area.getPath().split(",").length;
				if (len == 1){
					areaJSONs.add(new AreaJSON().build(area));
				}else if(len == 2){
					areas1.add(area);
				}else if(len == 3){
					areas2.add(area);
				}
			}
			// 找到所有的市级区域
			for(AreaJSON areajson: areaJSONs){
				for(Area area: areas1){
					if(StringUtils.isNotBlank(area.getPath())
							&& area.getPath().startsWith(areajson.getValue() + ",")){
						if(areajson.getChildren() == null){
							List<AreaJSON> ajs = new ArrayList<AreaJSON>();
							ajs.add(new AreaJSON().build(area));
							areajson.setChildren(ajs);
						}else{
							areajson.getChildren().add(new AreaJSON().build(area));
						}
					}
				}
			}

			for(AreaJSON areajson1: areaJSONs){
				if (areajson1.getChildren() == null || areajson1.getChildren().size() == 0) continue;
				for(AreaJSON areajson2 : areajson1.getChildren()){
					for(Area area: areas2){
						if(StringUtils.isNotBlank(area.getPath())
								&& area.getPath().startsWith(areajson2.getValue() + ",") ){
							if(areajson2.getChildren() == null){
								List<AreaJSON> ajs = new ArrayList<AreaJSON>();
								ajs.add(new AreaJSON().build(area));
								areajson2.setChildren(ajs);
							}else{
								areajson2.getChildren().add(new AreaJSON().build(area));
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ajaxJson(JSON.toJSONString(areaJSONs), response);
	}

}
