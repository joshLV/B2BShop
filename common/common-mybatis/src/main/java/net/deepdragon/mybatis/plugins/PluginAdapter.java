package net.deepdragon.mybatis.plugins;

import java.util.Properties;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Plugin;

public abstract class PluginAdapter implements Interceptor {
    public PluginAdapter() {
    }

    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }

    public void setProperties(Properties properties) {
    }
}
