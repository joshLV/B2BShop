package net.deepdragon.weipu.controller.mall;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.Catelog;
import net.deepdragon.service.weipu.BuyerScoreService;
import net.deepdragon.service.weipu.MemberScoreService;
import net.deepdragon.service.weipu.MenuService;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by gzj on 2015/9/17 0017.
 * 会员积分Controller
 */
@Controller(Global.APP_SIGN + Global.MALL + "MemberScoreController")
@RequestMapping(Global.MALL_PATH + "/member/vantages")
public class MemberScoreController extends BaseMallController{
    @Resource
    private MemberScoreService memberScoreService;
    @Resource
    private MenuService menuService;
    @Resource
    private BuyerScoreService buyerScoreService;
    @Resource
    private CacheData cacheData;

    @RequestMapping(value = "list")
    public String list(Pager pager, Model model, HttpServletRequest request) {
        String whichclient = request.getParameter(Global.WHICHCLIENT);
        String info = "会员积分";
        setLogInfo(info);
        logger.debug(info);
        try{
            String memberId=getCurrentMember(request).getId();
            Criteria criteria2 = new Criteria();
            criteria2.add(Restrictions.eq("b2b_buyer_score.buyerId", memberId));
            criteria2.add(Restrictions.gt("b2b_buyer_score.score", 0));
            criteria2.add(Restrictions.order("b2b_buyer_score.id", "DESC"));
            pager.setPageSize(20);
            pager = buyerScoreService.getPager(getParamMap(),criteria2,pager);
            model.addAttribute("vantagesList",pager.getList());
            model.addAttribute("pager", pager);

//            model.addAttribute("member", member);
            setPublicDate2Model(model);
            getAllCatelog(model);

            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
            LoginType loginType = getLoginType(request);
            model.addAttribute("loginType", loginType);
            String operatorRole = getOperatorRole(request);
            if (LoginType.operator.equals(loginType)) {
                model.addAttribute("role", operatorRole);
            }
            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/
        }   catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }
        if(Global.WHICH_APP.equals(whichclient)){
            return Global.TEMPLATE_APP + PATH + "/member/member_score_list";
        }else{
            return Global.TEMPLATE_MALL + PATH + "/member/member_score_list";
        }
    }

    @RequestMapping(value = "/ajax/loadmore", method = {RequestMethod.POST})
    public
    @ResponseBody
    Object orderLoadMore(HttpServletRequest request) {
        String info = "Ajax加载更多的会员积分";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(STATUS, SUCCESS);
        result.put(MESSAGE, "操作成功");
        try {

            String memberId=getCurrentMember(request).getId();
            Criteria criteria2 = new Criteria();
            criteria2.add(Restrictions.eq("b2b_buyer_score.buyerId", memberId));
            criteria2.add(Restrictions.order("b2b_buyer_score.id", "DESC"));
            Pager pager = new Pager();
            pager.setPageSize(10);
            pager.setPageNumber(Integer.valueOf(request.getParameter("pageNumber")));
            pager.setPageSize(Integer.valueOf(request.getParameter("pageSize")));
            pager = buyerScoreService.getPager(getParamMap(),criteria2,pager);

            result.put("vantagesList", pager.getList());
            result.put("pager", pager);

        } catch (Exception e) {
            logger.error(info + "时，发生异常", e);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "操作失败");
        }
        return result;
    }
}

