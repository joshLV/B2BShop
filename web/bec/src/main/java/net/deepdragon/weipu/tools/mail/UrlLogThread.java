package net.deepdragon.weipu.tools.mail;

import net.deepdragon.service.weipu.KeywordsLogService;
import net.deepdragon.util.*;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Explain: 搜索时保存关键字线程
 * FileName:
 * Author: TianYu
 * Time: 2016-01-05 16:59
 * Desc: 搜索时保存关键字线程
 * Version: V1.0
 */
public class UrlLogThread extends Thread{
    protected Logger logger = LoggerFactory.getLogger(getClass());
    /** tenantId */
    private String tenantId = "37100";
    /** 关键字 */
    private String url;
    /** 参数 */
    private Map<String, String[]> params;
    /** 创建、更新人 */
    private String whichClient;
    /** 微信公众号openId */
    private String openId;
    /** 创建人 */
    private String createUser;
    /** IP */
    private String ipAddress;
    /** logType */
    private String logType;

    private UrlLogThread(){}

    public UrlLogThread(String url, Map<String, String[]> params,String whichClient, String userId, String openId, String ipAddress, String logType) {
        this.url = url;
        this.params = params;
        this.whichClient = whichClient;
        this.openId = openId;
        this.createUser = userId;
        this.ipAddress = ipAddress;
        this.logType = logType;
    }

    @Override
    public void run() {
        try {
            WebApplicationContext wac = ContextLoader.getCurrentWebApplicationContext();
            KeywordsLogService keywordsLogService = (KeywordsLogService) wac.getBean("KeywordsLogService");

            Map<String,Object> paramMap = new HashMap<String, Object>();
            paramMap.put("tenantId", tenantId);
            String sql = getInsertSql();
            keywordsLogService.insertOne(paramMap, sql);

            //打印日志
            logger.error("URLRequest："+sql.substring(sql.lastIndexOf("(")));
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    private String getInsertSql(){
        StringBuffer sqlHeader = new StringBuffer();
        StringBuffer sqlFooter = new StringBuffer();

        sqlHeader.append("INSERT INTO `sys_becurl_log` (");
        sqlFooter.append(" VALUES (");

        sqlHeader.append(" id, ");
        sqlFooter.append("'").append(UuidUtil.get20ID()).append("',");

        sqlHeader.append(" tenantId, ");
        sqlFooter.append("'").append( this.tenantId ).append("',");

        sqlHeader.append(" url, ");
        sqlFooter.append("'").append( this.url ).append("',");

        sqlHeader.append(" param, ");
        String queryString = "";
        for (String key : this.params.keySet()) {
            String[] values = this.params.get(key);
            for (int i = 0; i < values.length; i++) {
                String value = values[i];
                queryString += key + "=" + ("password".equalsIgnoreCase(key)?"******":value) + "&";
            }
        }
        // 去掉最后一个空格
        String postParam = StringUtils.isEmpty(queryString)?"":queryString.substring(0, queryString.length() - 1);
        sqlFooter.append("'").append( postParam ).append("',");

        sqlHeader.append(" whichClient, ");
        sqlFooter.append("'").append( this.whichClient ).append("',");

        sqlHeader.append(" openId, ");
        sqlFooter.append("'").append( this.openId ).append("',");

        sqlHeader.append(" ipAddress, ");
        sqlFooter.append("'").append( this.ipAddress ).append("',");


        if(StringUtil.isNotEmpty( this.ipAddress ) && !"127.0.0.1".equals( this.ipAddress )){

            try{
                Map<AddressUtils.ReturnKey,String> result = AddressUtils.getAddresses( this.ipAddress );

                if( result != null ){
                    sqlHeader.append(" province, ");
                    sqlFooter.append("'").append( result.get(AddressUtils.ReturnKey.region) ).append("',");

                    sqlHeader.append(" city, ");
                    sqlFooter.append("'").append( result.get(AddressUtils.ReturnKey.city) ).append("',");

                    sqlHeader.append(" county, ");
                    sqlFooter.append("'").append( result.get(AddressUtils.ReturnKey.county) ).append("',");
                }
            }catch (Exception e){

            }
        }


        sqlHeader.append(" logType, ");
        sqlFooter.append("'").append( this.logType ).append("',");

        sqlHeader.append(" createUser, ");
        sqlFooter.append("'").append( this.createUser ).append("',");

        sqlHeader.append(" createDate ");
        sqlFooter.append("'").append( DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss")).append("'");


        sqlHeader.append(" ) ");
        sqlFooter.append(" ) ");

        return sqlHeader.append( sqlFooter ).toString();
    }
}
