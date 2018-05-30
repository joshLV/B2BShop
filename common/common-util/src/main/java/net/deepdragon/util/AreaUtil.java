package net.deepdragon.util;

import java.util.Map;

import net.deepdragon.http.WS;

import org.apache.http.HttpResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 同步腾讯提供的中国标准行政区划数据
 */
public class AreaUtil {

	private static final Logger logger = LoggerFactory
			.getLogger(AreaUtil.class);

	private static final int[] count = new int[3];
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static void main(String[] args) {
		// 本接口提供中国标准行政区划数据，可用于生成城市列表控件等功能时使用：
		// http://open.map.qq.com/webservice_v1/guide-region.html
		// http://apis.map.qq.com/ws/district/v1/list?key=OB4BZ-D4W3U-B7VVO-4PJWW-6TKDJ-WPB77

		HttpResponse response = WS
				.url("http://apis.map.qq.com/ws/district/v1/list")
				.queryParam("key", "OB4BZ-D4W3U-B7VVO-4PJWW-6TKDJ-WPB77").get();
		String body = WS.getResponseAsString(response);
		
		JSONObject data = JSON.parseObject(body);
		int status = data.getIntValue("status");
		String message = data.getString("message");
		if (status != 0) {
			logger.warn("status:" + status + ",message:" + message);
			return;
		}

		String result = data.getString("result");
		//logger.debug(result);

		JSONArray dataArray = JSON.parseArray(result);
		logger.debug("dataArray.size:" + dataArray.size());

		JSONArray provinceArray = dataArray.getJSONArray(0);
		logger.debug("provinceArray.size:" + provinceArray.size());
		
		JSONArray cityArray = dataArray.getJSONArray(1);
		logger.debug("cityArray.size:" + cityArray.size());
		
		JSONArray countyArray = dataArray.getJSONArray(2);
		logger.debug("countyArray.size:" + countyArray.size());
		
		for (int i = 0; i < provinceArray.size(); i++) {
			count[0] = count[0] + 1;
			Map province = provinceArray.getObject(i, Map.class);
			logger.info("province:" + province);
			
			
			Map location = JSON.parseObject(province.get("location").toString(),Map.class);
			province.put("fullName", province.get("fullname").toString());
			province.put("path", province.get("id").toString());
			province.put("lng", location.get("lng"));
			province.put("lat", location.get("lat"));
			getSQL(province);
			
			Object cidx4p = province.get("cidx");
			logger.info("cidx4p:" + cidx4p);
			if (cidx4p != null) {
				JSONArray cidx4pArray = JSON.parseArray(province.get("cidx").toString());
				int cityStart = cidx4pArray.getIntValue(0);
				int cityEnd = cidx4pArray.getIntValue(1);
				logger.info("city index :" + cityStart+","+cityEnd);
				for (int j = cityStart; j <= cityEnd; j++) {
					count[1] = count[1] + 1;
					Map city = cityArray.getObject(j, Map.class);
					logger.info(j + "city:" + city);
					
					location = JSON.parseObject(city.get("location").toString(), Map.class);
					city.put("name", city.get("fullname").toString());
					city.put("fullName", province.get("fullname").toString() + city.get("fullname").toString());
					city.put("parentId", province.get("id").toString());
					city.put("path", province.get("id").toString() + "," + city.get("id").toString());
					city.put("lng", location.get("lng"));
					city.put("lat", location.get("lat"));
					getSQL(city);
					
					Object cidx4c = city.get("cidx");
					logger.info("cidx4c :" + cidx4c);
					if(cidx4c!=null){
						JSONArray cidx4cArray = JSON.parseArray(city.get("cidx").toString());
						int countyStart = cidx4cArray.getIntValue(0);
						int countyEnd = cidx4cArray.getIntValue(1);
						logger.info("county index :" + countyStart+","+countyEnd);
						
						for (int k = countyStart; k <= countyEnd; k++) {
							count[2] = count[2] + 1;
							Map county = countyArray.getObject(k, Map.class);
							logger.info("county:" + county);
							
							location = JSON.parseObject(county.get("location").toString(), Map.class);
							county.put("name", county.get("fullname").toString());
							county.put("fullName", province.get("fullname").toString() + city.get("fullname").toString() + county.get("fullname").toString());
							county.put("parentId", city.get("id").toString());
							county.put("path", province.get("id").toString() + "," + city.get("id").toString() + "," + county.get("id").toString());
							county.put("lng", location.get("lng"));
							county.put("lat", location.get("lat"));
							getSQL(county);
							
						}
						
					}
				}
				
			}
			
		}
		
		
		for (int i : count) {
			logger.info("  --->  " + i);
		}
		
	}
	
	@SuppressWarnings("rawtypes")
	private static void getSQL(Map data) {
		String sql = "insert into `shared_area`(`id`,`name`,`fullName`,`parentId`,`path`,`lng`,`lat`,`createUser`,`createDate`,`modifyUser`,`modifyDate`) "
				+ "values "
				+ "( '#id#','#name#','#fullName#',#parentId#,'#path#','#lng#','#lat#','admin',CURRENT_TIMESTAMP,NULL,NULL);";
		sql = sql.replace("#id#", data.get("id").toString());
		sql = sql.replace("#name#", data.get("name").toString());
		sql = sql.replace("#fullName#", data.get("fullName").toString());
		
		sql = sql.replace("#parentId#", data.get("parentId") == null ? "null"
				: "'" + data.get("parentId").toString() + "'");
		sql = sql.replace("#path#", data.get("path").toString());
		sql = sql.replace("#lng#", data.get("lng").toString());
		sql = sql.replace("#lat#", data.get("lat").toString());
		
		logger.error(sql);
		
	}
	
}
