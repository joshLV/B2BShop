package net.deepdragon.router.datasource;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidPooledConnection;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import net.deepdragon.exceptions.DataSourceDescriptorException;
import net.deepdragon.router.datasource.DataSourceDescriptor;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.jdbc.datasource.AbstractDataSource;
import org.springframework.util.Assert;

public abstract class AbstractRoutingDataSource extends AbstractDataSource implements InitializingBean {
    private Map<Object, Object> targetDataSources;
    private Map<Object, DataSourceDescriptor> resolvedDataSources;
    private Map<Object, Object> resolvedTenants;

    public AbstractRoutingDataSource() {
    }

    public void setTargetDataSources(Map<Object, Object> targetDataSources) {
        this.targetDataSources = targetDataSources;
    }

    public Map<Object, Object> getResolvedTenants() {
        return this.resolvedTenants;
    }

    public void setResolvedTenants(Map<Object, Object> resolvedTenants) {
        this.resolvedTenants = resolvedTenants;
    }

    public void afterPropertiesSet() {
        if(this.targetDataSources == null) {
            throw new IllegalArgumentException("Property \'targetDataSources\' is required");
        } else {
            this.resolvedDataSources = new HashMap(this.targetDataSources.size());
            this.resolvedTenants = new HashMap();
            Iterator var2 = this.targetDataSources.entrySet().iterator();

            while(var2.hasNext()) {
                Entry entry = (Entry)var2.next();
                Object lookupKey = this.resolveSpecifiedLookupKey(entry.getKey());
                DataSourceDescriptor dataSourceDescriptor = this.resolveSpecifiedDataSource(entry.getValue());
                this.resolvedDataSources.put(lookupKey, dataSourceDescriptor);
            }

        }
    }

    protected Object resolveSpecifiedIdentity(Object tenantId) {
        Object identity = this.resolvedTenants.get(tenantId);
        if(identity == null) {
            throw new DataSourceDescriptorException("Cannot found target DataSourceDescriptor for tenantId [" + tenantId + "]");
        } else {
            return identity;
        }
    }

    protected Object resolveSpecifiedLookupKey(Object lookupKey) {
        return lookupKey;
    }

    protected DataSourceDescriptor resolveSpecifiedDataSource(Object dataSource) throws IllegalArgumentException {
        if(dataSource instanceof DataSourceDescriptor) {
            return (DataSourceDescriptor)dataSource;
        } else {
            throw new IllegalArgumentException("Illegal data source value - only [com.baoyuan.routing4db.datasource.DataSourceDescriptor] supported: " + dataSource);
        }
    }

    public Connection getConnection() throws SQLException {
        DruidPooledConnection connection = this.determineTargetDataSource().getConnection();
        return connection;
    }

    public Connection getConnection(String username, String password) throws SQLException {
        return this.determineTargetDataSource().getConnection(username, password);
    }

    public <T> T unwrap(Class<T> iface) throws SQLException {
        return iface.isInstance(this)? (T) this :this.determineTargetDataSource().unwrap(iface);
    }

    public boolean isWrapperFor(Class<?> iface) throws SQLException {
        return iface.isInstance(this) || this.determineTargetDataSource().isWrapperFor(iface);
    }

    protected DruidDataSource determineTargetDataSource() {
        Assert.notNull(this.resolvedDataSources, "DataSource router not initialized");
        Object lookupKey = this.determineCurrentLookupKey();
        DataSourceDescriptor dataSourceDescriptor = (DataSourceDescriptor)this.resolvedDataSources.get(lookupKey);
        if(dataSourceDescriptor == null) {
            throw new IllegalStateException("Cannot determine target DataSourceDescriptor for lookup key [" + lookupKey + "]");
        } else {
            DruidDataSource dataSource = this.determineCurrentDataSource(dataSourceDescriptor);
            if(dataSource == null) {
                throw new IllegalStateException("Cannot determine target DataSource for lookup key [" + lookupKey + "]");
            } else {
                return dataSource;
            }
        }
    }

    protected abstract Object determineCurrentLookupKey();

    protected abstract DruidDataSource determineCurrentDataSource(DataSourceDescriptor var1);
}