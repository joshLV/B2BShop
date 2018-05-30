package net.deepdragon.service.weipu;

import net.deepdragon.entity.SystemSet;

import java.util.List;
import java.util.Map;

/**
 * Created by gzj on 15-12-8.
 */
public interface SMSLogService{
     /**
      * 发送短信
      * @param paramMap
      * @param mobile 手机号
      * @param content 短信内容
      * @param sets 短信配置
      * @return
      */
     Map<String,Object> sendSMS(Map<String,Object> paramMap,String mobile,String content,List<SystemSet> sets);
}
