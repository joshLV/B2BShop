package net.deepdragon.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.*;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;   
import org.dom4j.Element;   

/**
 * 通过短信接口发送短信
 */
public class SmsUtil {

	private static Map<String,String> failedMessage = new HashMap<String, String>();

	public static void main(String [] args) throws Exception{
		/*Map<String,Object> result=sendSms("18602991698", "您的验证码是：778899，请不要把验证码泄露给其他人。");
		*//**//*List<PageData> more=new ArrayList<>();
		PageData pd=new PageData();
		pd.put("mobile","18602991698");
		pd.put("content","您的验证码是：665528，请不要把验证码泄露给其他人。");
		more.add(pd);
		PageData pd1=new PageData();
		pd1.put("mobile","18629191687");
		pd1.put("content","您的验证码是：125632，请不要把验证码泄露给其他人。");
		more.add(pd1);
		sendSmsAll(more);*//**//*
		//String xml="<?xml version=\"1.0\" encoding=\"utf-8\" ?><returnsms><returnstatus>Success</returnstatus><message>没有包含屏蔽词</message><checkCounts>您的验证码是：778899，请不要把验证码泄露给其他人。【陕西深龙】</checkCounts></returnsms>";
		//Document doc = DocumentHelper.parseText(xml);
		//Element root = doc.getRootElement();
		System.out.println(result.toString());
		//System.out.println(root.elementText("message"));*/
		SendSMSByAli();
	}


	public static Map<String,Object> sendSms(Map<String, Object> paramMap,String mobile,String content, Map<String, String> configMap) {
		if("gwq".equals(configMap.get("smsType"))){
			Map<String,Object> pd = new HashMap<String,Object>();
			try {
				pd = sendSmsByGWQ(paramMap,mobile,content,configMap);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				pd.put("messgae","短信发送失败");
			}
			return pd;
		}else if("cl".equals(configMap.get("smsType"))) {
			return sendSmsByCL(paramMap,mobile,content,configMap);
		}else {
			return sendSmsByBLT(paramMap,mobile,content,configMap);
		}
	}
	public static Map<String,Object> sendSmsByCL(Map<String, Object> paramMap, String mobile, String content, Map<String, String> configMap){
		failedMessage.put("0","提交成功");
		failedMessage.put("101","无此用户");
		failedMessage.put("102","密码错");
		failedMessage.put("103","提交过快（提交速度超过流速限制）");
		failedMessage.put("104","系统忙（因平台侧原因，暂时无法处理提交的短信）");
		failedMessage.put("105","敏感短信（短信内容包含敏感词）");
		failedMessage.put("106","消息长度错（>536或<=0）");
		failedMessage.put("107","包含错误的手机号码");
		failedMessage.put("108","手机号码个数错（群发>50000或<=0;单发>200或<=0）");
		failedMessage.put("109","无发送额度（该用户可用短信数已使用完）");
		failedMessage.put("110","不在发送时间内");
		failedMessage.put("111","超出该账户当月发送额度限制");
		failedMessage.put("112","无此产品，用户没有订购该产品");
		failedMessage.put("113","extno格式错（非数字或者长度不对）");
		failedMessage.put("115","自动审核驳回");
		failedMessage.put("116","签名不合法，未带签名（用户必须带签名的前提下）");
		failedMessage.put("117","IP地址认证错,请求调用的IP地址不是系统登记的IP地址");
		failedMessage.put("118","用户没有相应的发送权限");
		failedMessage.put("119","用户已过期");
		failedMessage.put("120","测试内容不是白名单");
		Map<String,Object> pd=new HashMap<String,Object>();
		configMap = getConfigure(configMap);
		pd.put("status", "failed");
		try {
			String data="account="+configMap.get("account")+"&pswd="+configMap.get("password")+"&mobile="+mobile+"&msg="+URLEncoder.encode("【"+configMap.get("sign")+"】"+content,"utf-8")+"&needstatus=true";
			Map<String, String> result = postData(configMap.get("smsurl"), data, "GB2312");
			if(result.get("status")=="failed"){
				pd.put("message","连接短信网关失败!ERROR:"+result.get("message"));
			}else {
				String responseInfo = result.get("message");
				String taskId="0";
				String[] tmp = responseInfo.split(",");
				if(tmp[1].indexOf("0")>=0){
					taskId = tmp[1].substring(1,tmp[1].length());
				}
				if (!"0".equals(taskId)) {
					pd.put("id", UuidUtil.get20ID());
					pd.put("returnstatus", "0");
					pd.put("message", failedMessage.get("0"));
					pd.put("taskID", taskId);
					pd.put("remainpoint", "0");
					pd.put("successCounts", "0");
					pd.put("content", content);
					pd.put("faildCounts", "0");
					pd.put("sendtime", DateUtil.getTime());
					pd.put("status", "success");
					String sql = "insert into sms_log(id,tenantId,mobile,content,taskid,returnstatus,message,remainpoint,successCounts,faildCounts,sendtime) values('" + pd.get("id") + "','" + paramMap.get("tenantId") + "','" + mobile + "','" + content + "','" + pd.get("taskID") + "','" + pd.get("returnstatus") + "','" + pd.get("message") + "','" + pd.get("remainpoint") + "','" + pd.get("successCounts") + "','" + pd.get("faildCounts") + "','" + pd.get("sendtime") + "')";
					SunLog.i("发送短信记录到数据库中sql", sql);
					pd.put("smslogSql", sql);
					SunLog.d("sms_success","手机号："+pd.get("mobile")+"内容:"+pd.get("content")+"状态:" + responseInfo);
				}else{
					pd.put("message",failedMessage.get(responseInfo));
					SunLog.d("sms_failed","手机号："+mobile+"内容:"+content);
				}
			}
		}catch (Exception e){
			e.printStackTrace();
			pd.put("messgae","短信发送失败!ERROR:"+e.getMessage().toString());
			SunLog.d("sms_failed","手机号："+mobile+"内容:"+content);
		}
		return pd;
	}


	public static Map<String,Object> sendSmsByGWQ(Map<String, Object> paramMap, String mobile, String content, Map<String, String> configMap) throws UnsupportedEncodingException{
		failedMessage.put("-1","账号或密码错误");
		failedMessage.put("-2","还没开通短信通道，充值即可开通");
		failedMessage.put("-3","短信内容含有敏感字符");
		failedMessage.put("-4","短信内容字数超过了限值");
		failedMessage.put("-5","手机号码有错误");
		failedMessage.put("-6","该通道余额不足，不能满足本次发送");
		failedMessage.put("-7","手机号码数量超过100个");
		failedMessage.put("-8","手机号码为空");
		failedMessage.put("-9","内容为空");
		failedMessage.put("-10","由于平台的原因，批量提交出错，请与管理员联系");
		failedMessage.put("-11","定时时间格式不对");
		failedMessage.put("-12","用户已被锁定");
		Map<String,Object> pd=new HashMap<String,Object>();
		configMap = getConfigure(configMap);
		pd.put("status", "failed");
		try {
			String data = "Account=" + configMap.get("account") + "&Password=" + configMap.get("password") + "&Phones=" + mobile + "&Content=" + URLEncoder.encode(content + "【" + configMap.get("sign") + "】", "GB2312") + "&Channel=1&SendTime=";
			Map<String, String> result = postData(configMap.get("smsurl"), data, "GB2312");
			if(result.get("status")=="failed"){
				pd.put("message","连接短信网关失败!ERROR:"+result.get("message"));
			}else {
				String responseInfo = result.get("message");
				int taskId = Integer.parseInt(responseInfo);
				if (taskId > 0) {
					pd.put("id", UuidUtil.get20ID());
					pd.put("returnstatus", "gwq");
					pd.put("message", "gwq");
					pd.put("taskID", responseInfo);
					pd.put("remainpoint", "0");
					pd.put("successCounts", "0");
					pd.put("content", content);
					pd.put("faildCounts", "0");
					pd.put("sendtime", DateUtil.getTime());
					pd.put("status", "success");
					String sql = "insert into sms_log(id,tenantId,mobile,content,taskid,returnstatus,message,remainpoint,successCounts,faildCounts,sendtime) values('" + pd.get("id") + "','" + paramMap.get("tenantId") + "','" + mobile + "','" + content + "','" + pd.get("taskID") + "','" + pd.get("returnstatus") + "','" + pd.get("message") + "','" + pd.get("remainpoint") + "','" + pd.get("successCounts") + "','" + pd.get("faildCounts") + "','" + pd.get("sendtime") + "')";
					SunLog.i("发送短信记录到数据库中sql", sql);
					pd.put("smslogSql", sql);
					SunLog.d("sms_success","手机号："+pd.get("mobile")+"内容:"+pd.get("content")+"状态:" + responseInfo);
				}else{
					pd.put("message",failedMessage.get(responseInfo));
					SunLog.d("sms_failed","手机号："+mobile+"内容:"+content);
				}
			}
		}catch (Exception e){
			e.printStackTrace();
			pd.put("messgae","短信发送失败!ERROR:"+e.getMessage().toString());
			SunLog.d("sms_failed","手机号："+mobile+"内容:"+content);
		}
		return pd;
	}


	/**
	 * 给一个人发送单条短信
	 * @param mobile 手机号
	 * @param content  短信内容
	 * @param configMap 短信接口配置
	 */
 	public static Map<String,Object> sendSmsByBLT(Map<String, Object> paramMap, String mobile, String content, Map<String, String> configMap){
		Map<String,Object> pd=new HashMap<String,Object>();
		pd.put("status","failed");
//		Map<String,String> con= getConfigure();			//读取短信配置
		configMap = getConfigure(configMap);
//		PubDB pubDb = new PubDB();
		try {
			String PostData = "action=send&userid="+configMap.get("userid")+"&account="+configMap.get("account")+"&password="+configMap.get("password")+"&mobile="+mobile+"&content="+URLEncoder.encode(content+"【"+configMap.get("sign")+"】","utf-8");
			Map<String,Object> result=checkKeyword(content,configMap);
			if(result.get("isOk").equals(true)) {
				Element root = SMS(PostData, configMap.get("smsurl"));
				String mobiles[] = mobile.split(",");
				int faildCounts;
				int successCounts;
				successCounts = Integer.valueOf(root.elementText("successCounts"));
				faildCounts = mobiles.length - successCounts;
				pd.put("id", UuidUtil.get20ID());
				pd.put("returnstatus", root.elementText("returnstatus"));
				pd.put("message", root.elementText("message"));
				pd.put("remainpoint", root.elementText("remainpoint"));
				pd.put("taskID", root.elementText("taskID"));
				pd.put("successCounts", root.elementText("successCounts"));
				pd.put("mobile", mobile);
				pd.put("content", content);
				pd.put("faildCounts", faildCounts);
				pd.put("sendtime", net.deepdragon.util.DateUtil.getTime());
				//System.out.println("状态：" + root.elementText("returnstatus") + "\t返回消息：" + root.elementText("message") + "\t余额：" + root.elementText("remainpoint") + "\t任务ID：" + root.elementText("taskID") + "\t成功短信数：" + root.elementText("successCounts"));
				pd.put("status","success");
				String sql = "insert into sms_log values('"+pd.get("id")+"','"+paramMap.get("tenantId")+"','"+pd.get("mobile")+"','"+pd.get("content")+"','"+pd.get("taskID")+"','"+pd.get("returnstatus")+"','"+pd.get("message")+"','"+pd.get("remainpoint")+"','"+pd.get("successCounts")+"','"+pd.get("faildCounts")+"','"+pd.get("sendtime")+"','"+paramMap.get("platform")+"')";
				SunLog.i("发送短信记录到数据库中sql",sql);
				pd.put("smslogSql", sql);
				SunLog.e("msm_failed","手机号："+pd.get("mobile")+"内容:"+pd.get("content")+"状态：" + root.elementText("returnstatus") + "\t返回消息：" + root.elementText("message") + "\t余额：" + root.elementText("remainpoint") + "\t任务ID：" + root.elementText("taskID") + "\t成功短信数：" + root.elementText("successCounts"));
				/*String msg=pubDb.update(sql);
				if(msg.equals("")){
					pd.put("status","success");
				}else{
					pd.put("messgae",msg);
					SunLog.e("msm_failed","手机号："+pd.get("mobile")+"内容:"+pd.get("content")+"状态：" + root.elementText("returnstatus") + "\t返回消息：" + root.elementText("message") + "\t余额：" + root.elementText("remainpoint") + "\t任务ID：" + root.elementText("taskID") + "\t成功短信数：" + root.elementText("successCounts"));
				}*/
			}else{
				pd.put("messgae",result.get("message"));
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			pd.put("messgae","短信发送失败");
		} finally {
//			pubDb.close();
		}
		return pd;
	}
	
	 public static Element SMS(String data, String smsUrl) {
		 Element root=null;
		 try {
	            //发送POST请求
				Map<String,String> res=postData(smsUrl, data , "UTF-8");
			 	if(res.get("status").equals("success")) {
					Document doc = DocumentHelper.parseText(res.get("message"));
					root = doc.getRootElement();
				}
	        } catch (Exception e) {
	            e.printStackTrace(System.out);
	        }
	        return root;
	 }

	public static Map<String,Object> checkKeyword(String content, Map<String, String> configMap){
		HashMap<String,Object> result = new HashMap<String,Object>();
		result.put("isOk",true);
		try{
			String PostData = "action=checkkeyword&userid="+configMap.get("userid")+"&account="+configMap.get("account")+"&password="+configMap.get("password")+"&content="+URLEncoder.encode(content + "【" + configMap.get("sign") + "】", "utf-8");
			Map<String,String> res=postData(configMap.get("smsurl"), PostData ,"UTF-8");
			if(res.get("status").equals("success")) {
				Document doc = DocumentHelper.parseText(res.get("message"));
				Element root = doc.getRootElement();
				String message=root.elementText("message");
				if (!message.equals("没有包含屏蔽词")) {
					result.put("isOk", false);
					result.put("message", message);
				}
			}
		}catch (Exception e){
			e.printStackTrace();
			result.put("isOk", false);
			result.put("message","检查是否包含非法关键此时发生异常！");
		}
		return result;
	}

	public static Map<String,String> postData(String smsurl,String data,String code) throws Exception{
		HashMap<String,String> result = new HashMap<>();
		result.put("status","success");
		URL url = new URL(smsurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		conn.setRequestProperty("Connection", "Keep-Alive");
		conn.setUseCaches(false);
		conn.setDoOutput(true);
		conn.setRequestProperty("Content-Length", "" + data.length());
		OutputStreamWriter out = new OutputStreamWriter(conn.getOutputStream(), code);
		out.write(data);
		out.flush();
		out.close();
		//获取响应状态
		if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
			result.put("status","failed");
			result.put("message","connect failed!");
		}
		//获取响应内容体
		String line,res="";
		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), code));
		while ((line = in.readLine()) != null) {
			res += line;
		}
		in.close();
		//System.out.println(res);
		result.put("message", res);
		return result;
	}
	/**
	 * 获取短信平台配置信息
	 * */
	public static Map<String,String> getConfigure(Map<String, String> configMap){
		HashMap<String, String> con = new HashMap<String, String>();
		if(configMap.containsKey("smsUrl")) {
			con.put("smsurl", configMap.get("smsUrl"));
			con.put("userid", configMap.get("smsUserId"));
			con.put("account", configMap.get("smsAccount"));
			con.put("password", configMap.get("smsPassword"));
			con.put("sign", configMap.get("smsSign"));
			con.put("smsType", configMap.get("smsType"));
		}else{
			String strSMS1 = PropertiesUtil.getValue("sysConfig.properties", "SMS");			//读取短信配置
			if(null != strSMS1 && !"".equals(strSMS1)){
				String strS1[] = strSMS1.split(",dd,");
				if(strS1.length == 5){
					con.put("smsurl",strS1[0]);
					con.put("userid",strS1[1]);
					con.put("account",strS1[2]);
					con.put("password",strS1[3]);
					con.put("sign",strS1[4]);
					con.put("smsType",strS1[5]);
				}
			}
		}
		return con;
	}

	public static void  SendSMSByAli() {
		String url="https://eco.taobao.com/router/rest";  //正式URL
		//String url="https://gw.api.tbsandbox.com/router/rest"; //测试URL
		String appkey="23334349";  //APP key
		String secret="cb8308830824bdaaf5556f6dd7f47fd4"; //App Secret:
		TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setSmsType("normal");
		req.setSmsFreeSignName("大鱼测试");
		req.setSmsParamString("{code:'895412',product:'深龙O2O平台'}");
		req.setRecNum("18091814072");
		req.setSmsTemplateCode("SMS_6691268");
		AlibabaAliqinFcSmsNumSendResponse rsp = null;
		try {
			rsp = client.execute(req);
		} catch (ApiException e) {
			e.printStackTrace();
		}
		System.out.println(rsp.getBody());
	}

}

