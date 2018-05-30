package net.deepdragon.service.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.entity.SystemSet;
import net.deepdragon.service.weipu.SMSLogService;
import net.deepdragon.util.SmsUtil;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by gzj on 15-12-8.
 */
@Service(Weipu.SIGN + "SMSLogServiceImpl")
public class SMSLogServiceImpl implements SMSLogService {

    @Override
    public Map<String, Object> sendSMS(Map<String,Object> paramMap,String mobile, String content,List<SystemSet> sets) {
        Map<String, String> configMap = new HashMap<String,String>();

        for(SystemSet systemSet : sets ){
            configMap.put(systemSet.getSetkey(), systemSet.getSetvalue());
        }


        return SmsUtil.sendSms(paramMap,mobile,content,configMap);
    }
}
