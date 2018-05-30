package com.Logistics;

import com.alibaba.fastjson.JSON;
import com.squareup.okhttp.*;
import net.deepdragon.entity.weipu.CartItem;
import net.deepdragon.entity.weipu.OrderItem;
import net.deepdragon.util.MyBeanUtils;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.tools.PropertiesUtil;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Explain: 调用物流接口Controll
 * FileName: LogisticsUtil
 * Author: zhnagqiang
 * Time: 2016-05-04 10:43:35
 * Desc: 调用物流接口
 * Version: V1.0
 */
public class LogisticsUtil {
    private  static final Logger logger = LoggerFactory.getLogger(LogisticsUtil.class);
    private static final MediaType JSONS = MediaType.parse("application/json; charset=utf8");
    private static final String httpURL = PropertiesUtil.getValue("applicationContext.properties","LOGISTICSCOSTQUERYURL");;
    //访问物流公司接口使用
    private static final String LOGISTICSUSERNAME="ghj2016";//物流接口访问用户名
    private static final String LOGISTICSPASSWORD="Pa$$word";//物流接口访问密码

    /**
     *
     * @param items 订单明细
     * @param shipAreaId  收货地址区域ID  shered_area
     * @return
     *  String logisticsStatus = resData.get("logisticsStatus")+"";
     *  String deliveryFee = resData.get("deliveryFee")+"";
     */
    public static Double logisticsTools(List<Map<String,Object>> items, String shipAreaId){

        logger.error("调用物流接口Controll");

        Map<String,Object> resData = new HashMap<String,Object>();
        String resultString = "",statusFlag = "false";

        try {
            if(items == null || items.size() == 0 || !StringUtil.isNotEmpty(shipAreaId)){
                logger.error("调用物流接口:订单明细或者收货地址区域不能为空");
                return -1d;
            }

            Map data = installRequstParam(items,shipAreaId);

            if (StringUtil.isNotEmpty(httpURL)) {
                try {
                    String str = JSON.toJSONString(data);
                    RequestBody body = RequestBody.create(JSONS,str);
                    Request request = new Request.Builder().url(httpURL).post(body).build();

                    Response res = new OkHttpClient().newCall(request).execute();

                    int status = res.code();

                    if (200 == status) {
                        resultString = res.body().string();
                    }


                    if (StringUtil.isNotEmpty(resultString)) {
                        JSONObject jasonObject = JSONObject.fromObject(resultString);
                        resData = (Map)jasonObject;
                        statusFlag = "success";

                        if (StringUtil.isNotEmpty(resData)) {
                            String s = resData.get("status")+"";
                            String result = resData.get("result")+"";
                            if ("success".equals(statusFlag) && "S".equals(s) && StringUtil.isNotEmpty(result)) {
                                return Double.parseDouble(result);
                            }else if("F".equals(statusFlag)) {
                                logger.error("商品的体积或重量存在问题");
                            }else{
                                logger.error("微货通接口调用出现异常");
                            }
                        }

                    }
                } catch (IOException e) {
                    logger.error("微货通接口调用出现异常:"+e);
                    return -500d;
                }
            }

        }catch (Exception e) {
            logger.error("微货通接口调用出现异常:"+e);
            return -500d;
        }
        return -500d;
    }

    private static Map installRequstParam(List<Map<String, Object>> items, String shipAreaId){
        Map data = new HashMap();
        if( items != null && items.size() > 0 ){
            data.put("name", LOGISTICSUSERNAME);
            data.put("pwd", LOGISTICSPASSWORD);
            data.put("address",shipAreaId);


            List<Map> list = new ArrayList<Map>();
            for (int i=0;i<items.size();i++) {
                Map maps = items.get(i);
                Map dataItem = new HashMap();
                dataItem.put("commodityname",maps.get("gname")+"");
                dataItem.put("commoditycode",maps.get("barcode")+"");
                dataItem.put("commodityclassify",maps.get("categoryId")+"");
                dataItem.put("volume",maps.get("volume")+"");
                dataItem.put("volumeunit","");
                dataItem.put("weight",maps.get("weight")+"");
                dataItem.put("quantity",maps.get("quantity")+"");
                list.add(dataItem);
            }
            data.put("commodities",list);
        }
        return data;
    }

}
