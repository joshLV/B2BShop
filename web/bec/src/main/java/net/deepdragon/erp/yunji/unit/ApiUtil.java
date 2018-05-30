package net.deepdragon.erp.yunji.unit;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.ByteArrayRequestEntity;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.PutMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;

/**
 * 云集API接口调用工具类
 * 
 * @author ZGT
 * 
 */
public class ApiUtil {

	protected static Logger logger = LoggerFactory.getLogger(ApiUtil.class);

	public static final String TOKEN_KEY = "tokenCode";
	public static String TOKEN_CODE = null;

	/**
	 * post方式
	 * 
	 * @param actionurl
	 *            访问地址
	 * @param jsonReqContent
	 *            对象json字符串
	 * @return
	 */
	public static String sendPostAPI(String actionurl, String jsonReqContent) {



		String result = "";
		HttpClient client = new HttpClient();
		PostMethod http = new PostMethod(actionurl);
		http.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(1, false));
		http.setRequestEntity(new ByteArrayRequestEntity(jsonReqContent.getBytes(), MediaType.APPLICATION_JSON.toString()));
		appendTokenCode(client);
		try {
			client.executeMethod(http);
			if (http.getStatusCode() == 200 && http.getStatusText().equals("OK")) {
				result = http.getResponseBodyAsString();
				persistTokenCode(http);
			} else {
				result = " httpCode = " + http.getStatusCode() + "   httpStatus= " + http.getStatusText() + " \r\n" + http.getResponseBodyAsString();
			}
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			http.releaseConnection();
		}
		logger.debug("xsy 添加:EC访问ERP接口地址："+actionurl+";result:"+result);
		return result;

	}

	/**
	 * put方式
	 * 
	 * @param actionurl
	 *            访问地址
	 * @param jsonReqContent
	 *            对象json字符串
	 * @return
	 */
	public static String sendPutAPI(String actionurl, String jsonReqContent) {
		String result = "";
		HttpClient client = new HttpClient();
		PutMethod http = new PutMethod(actionurl);
		http.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(1, false));
		http.setRequestEntity(new ByteArrayRequestEntity(jsonReqContent.getBytes(), MediaType.APPLICATION_JSON.toString()));
		appendTokenCode(client);
		try {
			client.executeMethod(http);
			if (http.getStatusCode() == 200 && http.getStatusText().equals("OK")) {
				result = http.getResponseBodyAsString();
				persistTokenCode(http);
			} else {
				result = " httpCode = " + http.getStatusCode() + "   httpStatus= " + http.getStatusText() + " \r\n" + http.getResponseBodyAsString();
			}
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			http.releaseConnection();
		}
		return result;

	}

	public static void appendTokenCode(HttpClient client) {
		List<Header> headers = new ArrayList<Header>();
		String tokenCode = null;
		tokenCode = TOKEN_CODE;
		System.out.println(" tokenCode ==> " + tokenCode);
		if (StringUtils.isNotEmpty(tokenCode)) {
			headers.add(new Header(TOKEN_KEY, tokenCode));
			client.getHostConfiguration().getParams().setParameter("http.default-headers", headers);
		}
	}

	public static void persistTokenCode(HttpMethod httpMethod) {
		Header header = httpMethod.getResponseHeader(TOKEN_KEY);
		if (header != null && StringUtils.isNotEmpty(header.getValue())) {
			TOKEN_CODE = header.getValue();
		}
	}

}
