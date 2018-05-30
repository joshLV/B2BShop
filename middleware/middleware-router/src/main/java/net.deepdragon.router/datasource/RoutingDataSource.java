package net.deepdragon.router.datasource;

import com.alibaba.druid.pool.DruidDataSource;
import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import javax.annotation.Resource;
import net.deepdragon.exceptions.RoutingException;
import net.deepdragon.router.datasource.AbstractRoutingDataSource;
import net.deepdragon.router.datasource.DataSourceDescriptor;
import net.deepdragon.router.holder.RoutingHolder;
import net.deepdragon.util.RegexUtils;
import net.deepdragon.util.TenantMapperUtils;
import net.deepdragon.util.ini.BasicIniFile;
import net.deepdragon.util.ini.IniFileReader;
import net.deepdragon.util.ini.IniSection;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.beans.factory.xml.ResourceEntityResolver;
import org.springframework.beans.factory.xml.XmlBeanDefinitionReader;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Component;

@Component
@DependsOn({"systemProperties"})
public class RoutingDataSource extends AbstractRoutingDataSource implements ApplicationContextAware {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    private ConfigurableApplicationContext applicationContext = null;
    @Resource(
            name = "readMethodPatterns"
    )
    private List<String> readMethodPatterns;

    public RoutingDataSource() {
    }

    protected Object determineCurrentLookupKey() {
        String tenantId = RoutingHolder.getRoutingIdentity().getTenantId();
        Object dataSourceKey = this.resolveSpecifiedIdentity(tenantId);
        if(this.logger.isDebugEnabled()) {
            if(dataSourceKey == null) {
                this.logger.debug("none routing key, choose defaultDataSource for current connection");
            } else {
                this.logger.debug("choose dataSource for current connection by routing key " + dataSourceKey);
            }
        }

        return dataSourceKey;
    }

    protected Properties convert(String section, File file) {
        Properties properties = new Properties();

        try {
            BasicIniFile e = new BasicIniFile(false);
            IniFileReader reader = new IniFileReader(e, file);
            reader.read();
            IniSection sections = e.getSection(section);
            Collection names = sections.getItemNames();
            Iterator var9 = names.iterator();

            while(var9.hasNext()) {
                String name = (String)var9.next();
                String value = e.getItemValue(section, name);
                properties.put(name, value);
            }

            return properties;
        } catch (IOException var11) {
            var11.printStackTrace();
            return null;
        }
    }

    public void afterPropertiesSet() {
        String configLocation = System.getProperty("middleware.database.config");
        XmlBeanDefinitionReader beanDefinitionReader = new XmlBeanDefinitionReader((BeanDefinitionRegistry)this.applicationContext.getBeanFactory());
        beanDefinitionReader.setResourceLoader(this.applicationContext);
        beanDefinitionReader.setEntityResolver(new ResourceEntityResolver(this.applicationContext));
        HashMap targetDataSources = new HashMap();
        HashMap resolvedTenants = new HashMap();

        try {
            String[] e = new String[]{configLocation};

            for(int i = 0; i < e.length; ++i) {
                org.springframework.core.io.Resource[] resources = this.applicationContext.getResources(e[i]);
                org.springframework.core.io.Resource[] var11 = resources;
                int var10 = resources.length;

                for(int var9 = 0; var9 < var10; ++var9) {
                    org.springframework.core.io.Resource resource = var11[var9];
                    String fileName = resource.getFilename();
                    int start = fileName.indexOf("-") + 1;
                    int end = fileName.lastIndexOf("-");
                    String dataSourceIdentity = fileName.substring(start, end);
                    beanDefinitionReader.loadBeanDefinitions(resource);
                    targetDataSources.put(dataSourceIdentity, this.applicationContext.getBean("dataSource_" + dataSourceIdentity));
                    String tenantIds = TenantMapperUtils.getValue(dataSourceIdentity);
                    if(StringUtils.isNotEmpty(tenantIds)) {
                        String[] values = StringUtils.split(tenantIds, TenantMapperUtils.TENANTS_SPLIT_CHAR);
                        String[] var22 = values;
                        int var21 = values.length;

                        for(int var20 = 0; var20 < var21; ++var20) {
                            String tenantId = var22[var20];
                            if(resolvedTenants.containsKey(tenantId) && resolvedTenants.get(tenantId) != null) {
                                throw new RoutingException("The tenantId \'" + tenantId + "\' is already define to the value \'" + resolvedTenants.get(tenantId) + "\'.");
                            }

                            resolvedTenants.put(tenantId, dataSourceIdentity);
                        }
                    }
                }
            }
        } catch (BeansException var23) {
            this.logger.error("registerBean BeansExcption", var23);
        } catch (IOException var24) {
            this.logger.error("registerBean IOExcption", var24);
        } catch (Exception var25) {
            this.logger.error("registerBean Excption", var25);
        }

        this.setTargetDataSources(targetDataSources);
        super.afterPropertiesSet();
        this.setResolvedTenants(resolvedTenants);
    }

    protected DruidDataSource determineCurrentDataSource(DataSourceDescriptor dataSourceDescriptor) {
        if(dataSourceDescriptor == null) {
            throw new IllegalArgumentException("DataSourceDescriptor can\'t be null.");
        } else {
            if(dataSourceDescriptor.isEnableMasterSlave()) {
                String methodName = RoutingHolder.getRoutingIdentity().getMethodName();
                boolean isMatch = false;
                Iterator var5 = this.readMethodPatterns.iterator();

                while(var5.hasNext()) {
                    String methodPatterns = (String)var5.next();
                    if(RegexUtils.isMatch(methodName, methodPatterns)) {
                        isMatch = true;
                        break;
                    }
                }

                if(isMatch && dataSourceDescriptor.isSlaveAvailable()) {
                    this.logger.debug("changed to slaveDataSource ");
                    return dataSourceDescriptor.getSlaveDataSource();
                }
            }

            if(dataSourceDescriptor.isEnableMasterStandby()) {
                if(!dataSourceDescriptor.isMasterAvailable() && !dataSourceDescriptor.isStandbyAvailable()) {
                    throw new IllegalArgumentException("masterDataSource or standbyDataSource can\'t be available.");
                } else if(dataSourceDescriptor.isMasterAvailable()) {
                    this.logger.debug("changed to masterDataSource ");
                    return dataSourceDescriptor.getMasterDataSource();
                } else {
                    this.logger.debug("changed to standbyDataSource ");
                    return dataSourceDescriptor.getStandbyDataSource();
                }
            } else {
                return dataSourceDescriptor.getMasterDataSource();
            }
        }
    }

    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = (ConfigurableApplicationContext)applicationContext;
    }
}
