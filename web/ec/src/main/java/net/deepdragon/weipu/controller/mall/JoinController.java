package net.deepdragon.weipu.controller.mall;

import net.deepdragon.entity.weipu.Catelog;
import net.deepdragon.entity.weipu.Invitebusiness;
import net.deepdragon.service.AreaService;
import net.deepdragon.service.weipu.InviteBusinessService;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/7/1.
 */
@Controller(Global.APP_SIGN + Global.MALL + "JoinController")
@RequestMapping(Global.MALL_PATH + "/join")
public class JoinController extends BaseMallController{

    @Resource
    private CacheData cacheData;
    @Resource
    private InviteBusinessService inviteBusinessService;
    @Resource
    private AreaService areaService;

    @RequestMapping(value = "/{whichapp}")
    public String show(@PathVariable String whichapp,Model model){
        // Global.TEMPLATE_MALL + PATH + "/shop/default/result";
        setPublicDate2Model( model );

        model.addAttribute("cls","app_join");
        model.addAttribute("msg",null);
        if(Global.WHICH_APP.equals(whichapp)){
           return Global.TEMPLATE_APP + PATH +"/join";
        }else {
            getAllCatelog(model);
            return Global.TEMPLATE_MALL + PATH + "/join";
        }
    }

//    @RequestMapping(value="/save/{whichclient}")
//    @ResponseBody
//    public Object save(@PathVariable String whichclient, Invitebusiness invitebusiness,HttpServletRequest request){
//        Map<String, Object> result = new HashMap<String, Object>();
//        try {
//            result.put(STATUS, SUCCESS);
//            result.put(MESSAGE, "您所提交的信息系统已收录！");
////            String province= request.getParameter("province");
////            String city=request.getParameter("city");
////            invitebusiness.setAreaPath(province+city);
//            invitebusiness.setAreaPath("陕西省西安市");
//            inviteBusinessService.save(getParamMap(),invitebusiness);
//        } catch (Exception e) {
//            result.put(STATUS, ERROR);
//            result.put(MESSAGE, "您填写的信息未能提交，请重试或打热线电话咨询！");
//            e.printStackTrace();
//        }
////        if(Global.WHICH_APP.equals(whichclient)){
////            return Global.TEMPLATE_APP + PATH +"/join";
////        }else {
////            return Global.TEMPLATE_MALL + PATH + "/join";
////        }
//        return result;
//    }


    @RequestMapping(value="/save/{whichclient}")
    @ResponseBody
    public Object save(@PathVariable String whichclient, HttpServletRequest request,@ModelAttribute("invitebussiness") Invitebusiness invitebusiness){
        Map<String, Object> result = new HashMap<String, Object>();
        try {

//            Invitebusiness invitebusiness = new Invitebusiness();
//            String province= request.getParameter("province");
//            String city=request.getParameter("city");
//            invitebusiness.setAreaPath(province+city);
            /*invitebusiness.setName(request.getParameter("name"));

            invitebusiness.setAddress(request.getParameter("address"));
            invitebusiness.setHead(request.getParameter("head"));
            invitebusiness.setMobile(request.getParameter("mobile"));
            invitebusiness.setTelphone(request.getParameter("telphone"));
            invitebusiness.setBusinessLicenseCode(request.getParameter("businessLicenseCode"));*/
            invitebusiness.setAreaPath("陕西省西安市");
            invitebusiness.setStatus(0);
            inviteBusinessService.save(getParamMap(),invitebusiness);
            result.put(STATUS, SUCCESS);
            result.put(MESSAGE, "您所提交的信息系统已收录，工作人员随后会联系您！");
        } catch (Exception e) {
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "您填写的信息未能提交，请重试或打热线电话咨询！");
            logger.error("保存招商信息时发生错误",e);
//            e.printStackTrace();
        }
//        if(Global.WHICH_APP.equals(whichclient)){
//            return Global.TEMPLATE_APP + PATH +"/join";
//        }else {
//            return Global.TEMPLATE_MALL + PATH + "/join";
//        }
        return result;
    }

    @RequestMapping(value = "/index/{whichclient}")
    public String showApp(@PathVariable String whichclient,Model model){
        // Global.TEMPLATE_MALL + PATH + "/shop/default/result";
        setPublicDate2Model( model );
        if (Global.WHICH_APP.equals(whichclient)){
            return Global.TEMPLATE_APP + PATH + "/join";
        }else{
            getAllCatelog(model);
            return Global.TEMPLATE_MALL + PATH + "/join";
        }
    }

}
