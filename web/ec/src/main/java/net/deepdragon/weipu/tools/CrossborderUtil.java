package net.deepdragon.weipu.tools;

import com.alibaba.fastjson.JSON;
import net.deepdragon.entity.weipu.Member;
import net.deepdragon.entity.weipu.Order;
import net.deepdragon.util.Constant;
import net.deepdragon.util.StringUtil;
import org.apache.commons.lang.ArrayUtils;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * Desc:获取跨境相关信息工具类
 * Auth:zhangqiang
 * Time:2016-01-21 16:19:47
 */
public class CrossborderUtil {
    public static String CROSSBORDER_FLAGS = "cross-border.flag";
    public static String CROSSBORDER_SHOPID = "cross-border.shopId";
    public static String CROSSBORDER_MEMBERID = "cross-border.memberId";
    public static String CROSSBORDER_CATELOGID = "cross-border.catelogId";
    public static String CROSSBORDER_CATELOGFLAG = "cross-border.catelogFlag";

    private static Map<String,String> crossBorderMap = null;

    /**
     * 通过key获取参数值
     * @param key 参数key
     * @return
     * @throws Exception
     */
    public static String getFileParams(String key) throws Exception {
        String params = "";
        if (crossBorderMap == null) {
            crossBorderMap = PropertiesUtil.getAll(Constant.PROJECTCONF);
        }

        if(StringUtil.isNotEmpty(key)){
            params = crossBorderMap.get(key).toString();

        }

        return params;
    }

    /**
     * 判断是否开启跨境商品验证
     * @return
     * @throws Exception
     */
    public static boolean isCrossborder() throws Exception{
        boolean flags = false;
        String params = "";
        params = getFileParams(CROSSBORDER_FLAGS);
        if (StringUtil.isNotEmpty(params)) {
            if ("true".equals(params)) {
                flags = true;
            }
        }
        return flags;
    }

    /**
     * 判断是否开启跨境商品分类验证
     * @return
     * @throws Exception
     */
    public static boolean isCrossborderCatlog() throws Exception{
        boolean flags = false;
        String params = "";
        params = getFileParams(CROSSBORDER_CATELOGFLAG);
        if (StringUtil.isNotEmpty(params)) {
            if ("true".equals(params)) {
                flags = true;
            }
        }
        return flags;
    }

    public static boolean isShopCatelog(String shopId,String catelogId) throws Exception{
        boolean flags = false;
        String params = "";

        params = getFileParams(CROSSBORDER_SHOPID);
        if (StringUtil.isNotEmpty(params) && StringUtil.isNotEmpty(shopId) && StringUtil.isNotEmpty(catelogId)) {
            if (stringToarrayUtil(params,shopId)) {

                if(isCrossborderCatlog()) {
                    params = getFileParams(CROSSBORDER_CATELOGID);
                    if (StringUtil.isNotEmpty(params)) {
                        if (stringToarrayUtil(params,catelogId)) {
                            flags = true;
                        }
                    }
                }else{
                    flags = true;
                }

            }
        }

        return flags;
    }

    public static boolean stringToarrayUtil(String params,String inParams) throws Exception{
        boolean flags = false;
        String[] paramArray;

        if (StringUtil.isNotEmpty(params) && StringUtil.isNotEmpty(inParams)) {
            paramArray = params.split(",");
            if (paramArray.length > 0) {
                flags = Arrays.asList(paramArray).contains(inParams);
            }
        }

        return flags;
    }

    //判断该会员是否有下跨境商品单的权限。
    public static boolean isCrossborderMember(Member member) {
        try {
            return ArrayUtils.indexOf((PropertiesUtil.getAll(Constant.PROJECTCONF).get(CROSSBORDER_MEMBERID)).split(","), member.getUserName()) != -1;
        } catch (Exception e) {

        }
        return false;
    }


    public static void main(String[] args) throws Exception{
//        System.out.println("sss="+isCrossborder());
        System.out.println("sss="+isShopCatelog("123","4567"));
    }
}
