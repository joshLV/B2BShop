package net.deepdragon.weipu.timer;

import net.deepdragon.weipu.tools.StaticizeHtmlUtil;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

/**
 * Explain:定时任务
 * FileName:
 * Author: TianYu
 * Time: 2016-11-10 11:33
 * Desc:
 * Version: V1.0
 */
@Service
public class Timer {

    //项目路径名字
    private org.slf4j.Logger logger = LoggerFactory.getLogger(Timer.class);


    /**
     * 两小时删除一次的静态化页面
     */
    @Scheduled(cron = "0 0 0/2 * * ?")
    public void cleanStaticizeIndex(){
        String info = "每五分钟删除一次静态index页面";
        logger.info( info + "===========================Start===============================");
        StaticizeHtmlUtil.refrushAll();
//        StaticizeHtmlUtil.generateIndex();
        logger.info( info + "===========================End===============================");
    }
}
