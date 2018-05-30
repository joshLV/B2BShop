package net.deepdragon.util;

import java.util.Collection;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;

/**
 * 用以支持ognl判断的表达式工具类<br/>
 * 主要是根据对象的实际类型，使用合适的方法进行判定
 */
public class OgnlUtils {
   
	/**
	 * 生成主键ID
	 * @return
	 */
	public static long generateId(){
		IdWorker idWorker = SpringUtils.getApplicationContext().getBean(IdWorker.class);
		return idWorker.getId();
	}
	
   /**
     * 判断入参数是否为空<br/>
     * " "不会被判定为false<br/>
     * <功能详细描述>
     * @param obj
     * @return [参数说明]
     * 
     * @return boolean [返回类型说明]
     * @exception throws [异常类型] [异常说明]
     * @see [类、类#方法、类#成员]
    */
   public static boolean isEmpty(Object obj){
       //为空时认为是empty的
       if(obj == null){
           return true;
       }else if(obj instanceof String){
           return StringUtils.isEmpty((String)obj);
       }else if(obj instanceof Collection<?>){
           return CollectionUtils.isEmpty((Collection<?>)obj);
       }else if(obj instanceof Map<?, ?>){
           return MapUtils.isEmpty((Map<?, ?>)obj);
       }else if(obj instanceof Object[]){
           return ArrayUtils.isEmpty((Object[])obj);
       }else{
           return false;
       }
   }
   
   /**
     * 判断对象是否不为空
     * <功能详细描述>
     * @param obj
     * @return [参数说明]
     * 
     * @return boolean [返回类型说明]
     * @exception throws [异常类型] [异常说明]
     * @see [类、类#方法、类#成员]
    */
   public static boolean isNotEmpty(Object obj){
       return !isEmpty(obj);
   }
   
}