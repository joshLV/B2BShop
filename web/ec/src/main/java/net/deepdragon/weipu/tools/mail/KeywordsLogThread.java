package net.deepdragon.weipu.tools.mail;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.entity.weipu.KeywordsLog;
import net.deepdragon.entity.weipu.Member;
import net.deepdragon.service.weipu.KeywordsLogService;
import net.deepdragon.util.Constant;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Explain: 搜索时保存关键字线程
 * FileName:
 * Author: TianYu
 * Time: 2016-01-05 16:59
 * Desc: 搜索时保存关键字线程
 * Version: V1.0
 */
public class KeywordsLogThread extends Thread{
    /** 关键字 */
    private String keywords;
    /** 创建、更新人 */
    private String user;
    /** tenantId */
    private String tenantId;
    /** 创建、更新人 */
    private Integer platform;

    private Map<String,Object> paramMap;

    private KeywordsLogThread(){}

    public KeywordsLogThread(String keywords, String user, Map<String, Object> paramMap) {
        this.keywords = keywords;
        this.user = user;
        this.paramMap = paramMap;
        this.tenantId = (String)paramMap.get( Constant.TENANTID_KEY );
        this.platform = (Integer)paramMap.get( Constant.PLATFORM_KEY );
    }

    @Override
    public synchronized void run() {
        try {
            WebApplicationContext wac = ContextLoader.getCurrentWebApplicationContext();
            KeywordsLogService keywordsLogService = (KeywordsLogService) wac.getBean("KeywordsLogService");
            List<KeywordsLog> keywordsLogs = keywordsLogService.findList(paramMap, "keywords", keywords);
            if (keywordsLogs != null && keywordsLogs.size() > 0) {//如果存在，更新查询次数
                KeywordsLog keywordsLog = keywordsLogs.get(0);
                keywordsLog.setSearchCount(keywordsLog.getSearchCount() + 1);
                keywordsLog.setModifyDate(new Date());
                keywordsLog.setModifyUser(user);
                keywordsLogService.update(paramMap, keywordsLog);
            } else {//如果不存在，保存
                KeywordsLog keywordsLog = new KeywordsLog();
                keywordsLog.setTenantId(tenantId);
                keywordsLog.setPlatform(platform);
                keywordsLog.setKeywords(keywords);
                keywordsLog.setSearchCount(0);
                keywordsLog.setCreateDate(new Date());
                keywordsLog.setCreateUser(user);

                keywordsLogService.save(paramMap, keywordsLog);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
