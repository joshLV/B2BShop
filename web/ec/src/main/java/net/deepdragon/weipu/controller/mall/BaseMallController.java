package net.deepdragon.weipu.controller.mall;

import net.deepdragon.bean.Pager;
import net.deepdragon.bean.SystemSetKey;
import net.deepdragon.entity.weipu.Catelog;
import net.deepdragon.entity.weipu.EcLog;
import net.deepdragon.entity.weipu.Member;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.service.weipu.EcLogService;
import net.deepdragon.util.Constant;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.controller.BaseController;
import net.deepdragon.weipu.tools.BrowserUtils;
import net.deepdragon.weipu.tools.IpUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

public class BaseMallController extends BaseController {
	
	protected static final String STATUS = "status";
	protected static final String WARN = "warn";
	protected static final String SUCCESS = "success";
	protected static final String ERROR = "error";
	protected static final String MESSAGE = "message";
	protected static final String DATA = "data";
	protected static final String NOLOGIN = "nologin";




	@Resource
	private EcLogService ecLogService;
	@Resource
	private CacheData cacheData;

	@Value("#{configProperties['project.PATH']}")
	public String PATH;

	// AJAX输出，返回null
	public String ajax(String content, String type, HttpServletResponse response) {
		try {
			response.setContentType(type + ";charset=UTF-8");
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);
			response.getWriter().write(content);
			response.getWriter().flush();
		} catch (IOException e) {
			logger.error(
					"BaseMallController ajax(String content, String type) ，发生异常",
					e);
		} catch (Exception e) {
			logger.error(
					"BaseMallController ajax(String content, String type) ，发生异常",
					e);
		}
		return null;
	}

	// AJAX输出文本，返回null
	public String ajaxText(String text, HttpServletResponse response) {
		return ajax(text, "text/plain", response);
	}

	// AJAX输出HTML，返回null
	public String ajaxHtml(String html, HttpServletResponse response) {
		return ajax(html, "text/html", response);
	}

	// AJAX输出XML，返回null
	public String ajaxXml(String xml, HttpServletResponse response) {
		return ajax(xml, "text/xml", response);
	}

	// 根据字符串输出JSON，返回null
	public String ajaxJson(String jsonString, HttpServletResponse response) {
		return ajax(jsonString, "text/html", response);
	}

	public String getTenantId() {
		return "37100";
	}
	public String getParentID() {
		return "383838985778102272";
	}
	/**
	 * 获取当前登录的会员
	 * 
	 * @return
	 */
	public Member getCurrentMember(HttpServletRequest request) {
		return (Member) request.getSession().getAttribute(Global.CURRENT_MERMBER);
	}

	/**
	 * 获取请求参数中所有的信息
	 *
	 * @param request
	 * @return
	 */
	public Map<String, String> getAllRequestParam(
			final HttpServletRequest request) {
		Map<String, String> res = new HashMap<String, String>();
		Enumeration<?> temp = request.getParameterNames();
		if (null != temp) {
			while (temp.hasMoreElements()) {
				String en = (String) temp.nextElement();
				String value = request.getParameter(en);
				res.put(en, value);
				// 在报文上送时，如果字段的值为空，则不上送<下面的处理为在获取所有参数数据时，判断若值为空，则删除这个字段>
				if (res.get(en) == null || "".equals(res.get(en))) {
					// System.out.println("======为空的字段名===="+en);
					res.remove(en);
				}
			}
		}
		return res;
	}

	/**
	 * 	 获取所属平台的值
	 * @Author TianYu
	 * @Date 2015-12-07 09:38:37
	 * @return
	 */
	public Integer getPlatform() {
		return Constant.PLATFORM_B2C;
	}


	/**
	 * 获取查询条件中的map参数
	 * key: tenantId 租户ID
	 * key: platform 所属平台
	 * @Author TianYu
	 * @Date 2015-12-07 09:38:37
	 * @return
	 */
	public Map<String,Object> getParamMap(){
		Map<String,Object> param = new HashMap<String, Object>();

		param.put(Constant.TENANTID_KEY, getTenantId() );
		param.put(Constant.PLATFORM_KEY, getPlatform() );

		return param;
	}

	public String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		logger.info("----------------getIpAddr1-----------------" + ip );
		if (StringUtil.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
			logger.info("----------------getIpAddr21-----------------" + ip );
		}else if(ip.indexOf(',') > 0){
			String[] array = ip.split(",");
			if(array.length > 1){
				ip = array[0];
			}else{
				ip = null;
			}
			logger.info("----------------getIpAddr22-----------------" + ip );
		}
		if (StringUtil.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
			logger.info("----------------getIpAddr31-----------------" + ip );
		}else if(ip.indexOf(',') > 0){
			String[] array = ip.split(",");
			if(array.length > 1){
				ip = array[0];
			}else{
				ip = null;
			}
			logger.info("----------------getIpAddr32-----------------" + ip );
		}
		if (StringUtil.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
			logger.info("----------------getIpAddr41-----------------" + ip );
		}else if(ip.indexOf(',') > 0){
			String[] array = ip.split(",");
			if(array.length > 1){
				ip = array[0];
			}else{
				ip = null;
			}
			logger.info("----------------getIpAddr42-----------------" + ip );
		}
		logger.info("----------------getIpAddr5-----------------" + ip );
		return ip;
	}


	/**
	 * 保存日志信息
	 * @author 高晨
	 * @date 2016-6-21 16:32:10
	 *
	 * @param logType 日志类型
	 * @param remark  日志备注信息
	 * @param paramMap  留作扩展使用，以后有扩展信息，放到map里面，直接传递进来，构造方法不用修改。
	 * **/
	public void saveEcLog(HttpServletRequest request, String logType, String remark, Map<String, Object> paramMap)  {
		Member currentMember = getCurrentMember(request); //获取当前登录用户信息

		/*组装日志记录信息*/
		EcLog ecLog = new EcLog();
		ecLog.setLogIp(IpUtil.getIpAddr(request)); //设置IP信息
		ecLog.setLogType(logType);//登录了下
		ecLog.setTenantId(getTenantId());
		ecLog.setUserName(StringUtil.isNotEmpty(currentMember) ? currentMember.getUserName(): "异常账户");
		ecLog.setUserNamecn(StringUtil.isNotEmpty(currentMember) ? (StringUtil.isNotEmpty(currentMember.getNickName()) ? currentMember.getNickName() : currentMember.getUserName()) : "异常账户");
		ecLog.setCreateDate(new Date());
		ecLog.setCreateUser(StringUtil.isNotEmpty(currentMember) ? currentMember.getId() : "异常账户");
		ecLog.setLogBeizhu(remark);
		ecLog.setBrowserType(BrowserUtils.checkBrowse(request));

		try {
			ecLogService.save(getParamMap(),ecLog);
		}catch (Exception e){
			logger.error("增加日志异常， error:"+e.getMessage());
			e.printStackTrace();
		}
	}

	public String getSystemSetByKey(SystemSetKey key) throws Exception {
		return getSystemSetByKey(key.toString());
	}

	public String getSystemSetByKey(String key) throws Exception {
		return cacheData.getSystemSetValueByKey( getParamMap(), SystemSetKey.valueOf( key ) , false);
	}

	public String getSystemSetByKey(String key, boolean isReFresh) throws Exception {
		return cacheData.getSystemSetValueByKey( getParamMap(), SystemSetKey.valueOf( key ) , isReFresh);
	}

	/**
	 * 组装顶部和底部导航
	 * @param model
	 */
	public void setPublicDate2Model(Model model){
		model.addAttribute("middlenavigationList",cacheData.getMiddleNavigation(getParamMap()));
		model.addAttribute("bottomnavigationList",cacheData.getBottomNavigation(getParamMap()));
		model.addAttribute("services", cacheData.getServices(getParamMap()));
	}

	public void getAllCatelog(Model model) {
		List<Catelog> list = new ArrayList<Catelog>();
		Map<String, List<Catelog>> childrenMap = new HashMap<String, List<Catelog>>();
		cacheData.getAllCatelog(getParamMap(),list,childrenMap);
		model.addAttribute("catelogList", list);
		model.addAttribute("catelogChildrenMap", childrenMap);
	}
}
