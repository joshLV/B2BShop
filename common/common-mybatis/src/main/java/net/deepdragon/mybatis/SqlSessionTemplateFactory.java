package net.deepdragon.mybatis;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;

import javax.annotation.Resource;

public class SqlSessionTemplateFactory implements Serializable {
    private static final long serialVersionUID = 1621882198618774168L;
    private final Map<ExecutorType, SqlSessionTemplate> sqlSessionTemplateMap = new HashMap();
    private SqlSessionFactory sqlSessionFactory;

    @Resource(name = "sqlSessionFactory")
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    public SqlSessionTemplateFactory() {
    }

    public SqlSessionTemplate getSqlSessionTemplate() {
        return this.getSqlSessionTemplate(ExecutorType.SIMPLE);
    }

    public SqlSessionFactory getSqlSessionFactory() {
        return this.sqlSessionFactory;
    }

    public SqlSessionTemplate getSqlSessionTemplate(ExecutorType executorType) {
        SqlSessionTemplate sqlSessionTemplate = (SqlSessionTemplate)this.sqlSessionTemplateMap.get(executorType);
        if(sqlSessionTemplate == null) {
            this.createSqlSessionTemplate(executorType);
            return (SqlSessionTemplate)this.sqlSessionTemplateMap.get(executorType);
        } else {
            return sqlSessionTemplate;
        }
    }

    protected synchronized void createSqlSessionTemplate(ExecutorType executorType) {
        if(this.sqlSessionTemplateMap.get(executorType) == null) {
            SqlSessionTemplate sqlSessionTemplate = new SqlSessionTemplate(this.sqlSessionFactory, executorType);
            this.sqlSessionTemplateMap.put(executorType, sqlSessionTemplate);
        }

    }
}
