package net.deepdragon.bean;

import java.util.Map.Entry;
import java.util.Properties;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

public class PropertyPlaceholderConfigurerExt extends
		PropertyPlaceholderConfigurer {

	private final String PREFIX="$KEY";
	
	@Override
	protected void convertProperties(Properties props) {
		for (Entry<Object, Object> entry : props.entrySet()) {
			String value = String.valueOf(entry.getValue());
			// 参数加密标识，解密过程尚未添加
			if (value.startsWith(PREFIX)) {
				
			}
			props.put(String.valueOf(entry.getKey()), value);
		}
		super.convertProperties(props);
	}

}
