<#-- 分页（Pager对象、链接URL、参数Map、最大页码显示数） -->
<#macro pager pager baseUrl parameterMap = {} maxShowPageCount = 6>
	<#local pageNumber = pager.pageNumber />
	<#local pageSize = pager.pageSize />
	<#local pageCount = pager.pageCount />
	<#local property = pager.property />
	<#local keyword = pager.keyword />
	<#local orderBy = pager.orderBy />
	<#local orderType = pager.orderType />
	<#local parameter = "" />
	<#if (pageSize != "")!>
		<#local parameter = parameter + "&pageSize=" + pageSize />
	</#if>
	<#if (property != "")!>
		<#local parameter = parameter + "&property=" + property />
	</#if>
	<#if (keyword != "")!>
		<#local parameter = parameter + "&keyword=" + keyword />
	</#if>
	<#if (orderBy != "")!>
		<#local parameter = parameter + "&orderBy=" + orderBy />
	</#if>
	<#if (orderType != "")!>
		<#local parameter = parameter + "&orderType=" + orderType />
	</#if>
	<#list parameterMap?keys as key>
		<#if parameterMap[key] != null && parameterMap[key] != "">
			<#local parameter = parameter + "&" + key + "=" + parameterMap[key] />
		</#if>
	</#list>
	
	<#if baseUrl?contains("?")>
		<#local baseUrl = baseUrl + "&" />
	<#else>
		<#local baseUrl = baseUrl + "?" />
	</#if>
	<#local firstPageUrl = baseUrl + "pageNumber=1" + parameter />
	<#local lastPageUrl = baseUrl + "pageNumber=" + pageCount + parameter />
	<#local prePageUrl = baseUrl + "pageNumber=" + (pageNumber - 1) + parameter />
	<#local nextPageUrl = baseUrl + "pageNumber=" + (pageNumber + 1) + parameter />

	<#if maxShowPageCount <= 0>
		<#local maxShowPageCount = 6>
	</#if>
	
	<#local segment = ((pageNumber - 1) / maxShowPageCount)?int + 1 />
	<#local startPageNumber = (segment - 1) * maxShowPageCount + 1 />
	<#local endPageNumber = segment * maxShowPageCount />
	<#if (startPageNumber < 1)>
		<#local startPageNumber = 1 />
	</#if>
	<#if (endPageNumber > pageCount)>
		<#local endPageNumber = pageCount />
	</#if>
	<#if (pageCount > 1)>
		<ul class="pager">
			<#-- 上一页 -->
			<#if (pageNumber > 1)>
                <a href="${base}${baseUrl + "pageNumber=1" + parameter}" class="prev">首页</a>
				<a href="${base}${prePageUrl}" class="prev">上一页</a>
			<#else>
				<span class="prev-disabled">首页</span>
				<span class="prev-disabled">上一页</span>
			</#if>
			
			<#if (startPageNumber > 1)>
				<a href="${base}${baseUrl + "pageNumber=" + (pageNumber - 2) + parameter}">...</a>
			</#if>
			
			<#list startPageNumber .. endPageNumber as index>
				<#if pageNumber != index>
					<a href="${base}${baseUrl + "pageNumber=" + index + parameter}">${index}</a>
				<#else>
					<span class="current">${index}</span>
				</#if>
			</#list>
			
			<#if (endPageNumber < pageCount)>
				<a href="${base}${baseUrl + "pageNumber=" + (pageNumber + 2) + parameter}">...</a>
			</#if>
		    
			<#-- 下一页 -->
			<#if (pageNumber < pageCount)>
				<a href="${base}${nextPageUrl}" class="next">下一页</a>
                <a href="${base}${baseUrl + "pageNumber=" + pageCount +parameter}" class="prev">尾页</a>
			<#else>
				<span class="next-disabled">下一页</span>
				<span class="next-disabled">尾页</span>
			</#if>

			共 ${pageCount} 页
			&nbsp;&nbsp;&nbsp;&nbsp;

			<a href="javascript:void(0)" onclick="jumpPage();"style="float: none;height: 20px;padding: 3px 10px;border: 1px solid #ccc; margin-left: 2px;font-family: arial; line-height: 20px;font-size: 14px;" >跳转</a>
			到
			<span style="float: none;border: none;margin: 0px;padding: 0px;">
				<input type="text" id="pageLocaltion" name="pageLocaltion" style="width: 30px; text-align: center;"
					   value="1"
                       onkeyup="if(this.value.length==0){this.value=this.value.replace(/[^0-9]/g,'');}else{this.value=this.value.replace(/\D/g,'');}"
						/>
			</span>
			页&nbsp;&nbsp;
		</ul>
	</#if>

<script type="text/javascript">
	function jumpPage() {
		var targetPage = $("#pageLocaltion").val();
		if(targetPage=='' || targetPage==null) {
            $("#pageLocaltion").val('1');
            targetPage=1;
		}
		if(targetPage>${pageCount}) {
            $("#pageLocaltion").val(${pageCount});
            targetPage = ${pageCount};
		}
        window.location.href="${base}${baseUrl}pageNumber="+targetPage+"${parameter}"
	}
</script>

</#macro>