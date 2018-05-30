package net.deepdragon.weipu.staticize;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Created by yanchao on 2015/12/30.
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Staticize {


    //静态html保存地址名称
    String name() default "";

    //该地址下对应多个页面
    String list() default "";

    //是否APP
    boolean isApp() default false;
}
