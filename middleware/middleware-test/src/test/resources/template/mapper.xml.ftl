<#macro mapperEl value>${r"#{"}${value}}</#macro>
<#macro jspEl value>${r"${"}${value}}</#macro>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${basePackage}.entity<#if sign != "shared">.${sign}</#if>.${scode}Mapper">

	<sql id="columnList">
		<#list columns as column>`${column.scode}`<#if column_has_next>,</#if></#list>
	</sql>

	<select id="get" resultType="${basePackage}.entity<#if sign != "shared">.${sign}</#if>.${scode}">
		select
		<include refid="columnList" />
		from ${code}
		where id = <@mapperEl 'id'/>
	</select>

	<select id="find" resultType="${basePackage}.entity<#if sign != "shared">.${sign}</#if>.${scode}">
		select
		<include refid="columnList" />
		from ${code}
		where tenantId = <@mapperEl 'tenantId'/> and <@jspEl 'property'/>=<@mapperEl 'value'/>
	</select>

	<select id="findList" resultType="${basePackage}.entity<#if sign != "shared">.${sign}</#if>.${scode}">
		select
		<include refid="columnList" />
		from ${code}
		where tenantId = <@mapperEl 'tenantId'/> and <@jspEl 'property'/>=<@mapperEl 'value'/>
	</select>
	
	<select id="findListByIds" parameterType="java.lang.String"
		resultType="${basePackage}.entity<#if sign != "shared">.${sign}</#if>.${scode}">
		select
		<include refid="columnList" />
		from ${code}
		where id in
		<foreach collection="list" item="id" index="index" open="("	close=")" separator=","><@mapperEl 'id'/></foreach>
	</select>
	
	<select id="getAll" resultType="${basePackage}.entity<#if sign != "shared">.${sign}</#if>.${scode}">
		select
		<include refid="columnList" />
		from ${code} 
		where tenantId = <@mapperEl 'tenantId'/>
	</select>
	
	<select id="getPager" resultType="${basePackage}.entity<#if sign != "shared">.${sign}</#if>.${scode}">
		select
		<include refid="columnList" />
		from ${code} 
		<if test="(@net.deepdragon.util.OgnlUtils@isEmpty(condition))!=null"><@jspEl 'condition'/></if>
	</select>
	
	<select id="getList" resultType="${basePackage}.entity<#if sign != "shared">.${sign}</#if>.${scode}">
		select
		<include refid="columnList" />
		from ${code} 
		<if test="(@net.deepdragon.util.OgnlUtils@isEmpty(condition))!=null"><@jspEl 'condition'/></if>
	</select>

	<select id="getTotalCount" resultType="java.lang.Long">
		select count(id) as result
		from ${code} where tenantId = <@mapperEl 'tenantId'/>
	</select>
	
	<select id="isExist" resultType="java.lang.Boolean">
		select count(id) as result from ${code} 
		where tenantId = <@mapperEl 'tenantId'/> and <@jspEl 'property'/>=<@mapperEl 'value'/>
	</select>
	
	<insert id="save" parameterType="${basePackage}.entity<#if sign != "shared">.${sign}</#if>.${scode}"
		useGeneratedKeys="true" keyProperty="id">
		insert into ${code}
		<trim prefix="(" suffix=")" suffixOverrides=",">
			`id`,`tenantId`
			<#assign ignore = ["id", "tenantId", "modifyUser", "modifyDate"]> 
			<#list columns as column>
			<#if ignore?seq_contains(column.scode)==false>
			<if test="${column.scode} != null">,`${column.scode}`</if>
			</#if>
			</#list>
		</trim>
		<trim prefix="values (" suffix=")" suffixOverrides=",">
			<@mapperEl 'id'/>,<@mapperEl 'tenantId'/>
			<#assign ignore = ["id", "tenantId", "modifyUser", "modifyDate"]> 
			<#list columns as column>
			<#if ignore?seq_contains(column.scode)==false>
			<if test="${column.scode} != null">,<@mapperEl '${column.scode}'/></if>
			</#if>
			</#list>
		</trim>
	</insert>

	<update id="update" parameterType="${basePackage}.entity<#if sign != "shared">.${sign}</#if>.${scode}">
		update ${code}
		<set>
			`tenantId` = <@mapperEl 'tenantId'/>
			<#assign ignore = ["id", "tenantId", "createUser", "createDate"]> 
			<#list columns as column>
			<#if ignore?seq_contains(column.scode)==false>
			<if test="${column.scode} != null">,`${column.scode}` = <@mapperEl '${column.scode}'/></if>
			</#if>
			</#list>
		</set>
		where id = <@mapperEl 'id'/>
	</update>

	<delete id="delete">
		delete from ${code}
		where id =	<@mapperEl 'id'/>
	</delete>
	
</mapper>