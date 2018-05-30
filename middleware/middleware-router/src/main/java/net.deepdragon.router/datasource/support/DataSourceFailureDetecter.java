package net.deepdragon.router.datasource.support;

import com.alibaba.druid.pool.DruidDataSource;

public interface DataSourceFailureDetecter {
    boolean isValid(DruidDataSource var1);
}
