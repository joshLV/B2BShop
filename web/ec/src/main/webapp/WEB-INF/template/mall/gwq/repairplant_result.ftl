<#escape x as x?html>
	<#include "mall/gwq/top.ftl"/>
	<#include "mall/gwq/header_new.ftl"/>
    <link href="${base}/static/mall/gwq/css/base.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript">window.pageConfig={compatible:true,navId:"search"};</script>
<style type="text/css">
<#--分页样式-->
.pagin .prev-disabled, .pagin .next-disabled {
    color: #ccc;
    cursor: default;
}
.pagin .prev-disabled, .pagin .next-disabled {
    position: relative;
    padding-top: 5px;
    height: 18px;
    line-height: 18px;
}
.pagin .current, .pagin .current:link, .pagin .current:visited {
    color: #f60;
    font-weight: 700;
}
.current {
    font-family: verdana;
}
.pagin a, .pagin span {
    border-radius: 3px;
}
.pagin a, .pagin span {
    float: left;
    height: 20px;
    padding: 3px 10px;
    border: 1px solid #ccc;
    margin-left: 2px;
    font-family: arial;
    line-height: 20px;
    font-size: 14px;
    overflow: hidden;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
}
.pagin .next, .pagin .next-disabled {
    padding-right: 12px;
}
pagin .prev, .pagin .next, .pagin .prev-disabled, .pagin .next-disabled {
    position: relative;
    padding-top: 5px;
    height: 18px;
    line-height: 18px;
}
<#--分页样式结束-->
<#--维修厂path-->
.path {
	height: 32px;
	line-height: 32px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #000;
}
<#--path结束-->
<#--维修厂搜索框-->
.searchbox1 {
	height: 42px;
	border-left: #ccc 1px solid;
	border-top: #ccc 1px solid;
	border-right: #ccc 1px solid;
	background: url(${base}/static/mall/img/sbg.gif) repeat-x;
}
.sinput {
	width: 275px;
	height: 26px;
	margin-top: 7px;
	margin-left: 7px;
	border: #bebebe 1px solid;
	background: url(${base}/static/mall/img/ssearch.gif) no-repeat 5px center;
	float: left;
}
.sinput .sinput_txt {
	width: 230px;
	height: 24px;
	line-height: 24px;
	margin-left: 30px;
	border: 0 none!important;
	color: #656565;
}
.sinput_btn {
	width: 94px;
	height: 28px;
	line-height: 28px;
	display: block;
	background: url(${base}/static/mall/img/ssbtn.gif) no-repeat;
	color: #fff;
	font-weight: bold;
	text-decoration: none;
	font-size: 12px;
	text-align: center;
	float: left;
	margin-top: 7px;
	margin-left: 10px;
}
<#--搜索框结束-->
<#--条件框开始-->
.search {
	background: #fcfdfd;
	border: #d9d9d9 1px solid;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #000;
}
.search_title {
	height: 34px;
	line-height: 34px;
	padding-left: 15px;
	border-bottom: #d9d9d9 1px solid;
	background: -webkit-linear-gradient(top, #fbfafa, #f5f3f3);
}
.floatleft {
	float: left;
}
.search_ctn {
	padding: 5px 15px;
	display: inline-block;
}
.search_exp {
	display: inline-block;
	line-height: 30px;
}
.search_l {
	width: 40px;
	float: left;
	font-weight: bold;
	color: #f20000;
}
.search_r {
	width: 876px;
	float: left;
}
.srh_exp1 {
	width: 876px;
}
.search_a {
	cursor: pointer;
	color: #000;
	margin-right: 10px;
	padding: 3px;
	white-space: nowrap;
}

<#--条件框结束-->
<#--维修厂列表-->
.slist {
	margin-top: 0px;
}
.slist h1 {
	width: 123px;
	height: 36px;
	line-height: 36px;
	text-align: center;
	background: url(${base}/static/mall/img/slist_bg.gif) no-repeat;
	font-size: 14px;
	color: #fff;
	font-weight: bold;
}
.HYslist {
	background: #f9f9f9;
	border-top: 2px solid #f66d39;
	border-bottom: 1px solid #959190;
	border-left: 1px solid #959190;
	border-right: 1px solid #959190;
}
.HYlist_header {
	height: 30px;
	background: #fff3e3;
	border-bottom: 1px solid #f5c08e;
	font-size: 12px;
	font-family: "宋体";
	line-height: 30px;
	text-align: center;
}
.HYlist_left {
	float: left;
	width: 785px;
	height: 30px;
	float: left;
}
.HYlist_right {
	float: right;
	height: 30px;
	width: 163px;
}
.droplist {
	border-width: 1px;
	border-style: solid;
	border-color: #F5C08E;
	margin-top: 5px;
}
.HYmid {
	border-bottom: 1px dashed #c3c3c3;
	height: 107px;
}
.HYmid_left {
	width: 785px;
	height: 107px;
	float: left;
}
.HYmid_left_h3 {
	height: 40px;
	line-height: 40px;
	padding-left: 20px;
}
.HYmid_left_h3 a {
	color: #820200;
	font-size: 14px;
	font-weight: bold;
	font-family: "宋体";
}
.HYcont {
	font-family: "宋体";
	font-size: 12px;
	color: #5b5b5b;
	float: left;
	height: 60px;
	list-style: none;
	padding-left: 20px;
}
.HYcont li {
	word-break: keep-all;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	float: left;
	width: 375px;
	line-height: 28px;
	height: 28px;
}
.HYmid_right {
	width: 165px;
	height: 107px;
	float: right;
	text-align: center;
}
.HYmid_right img {
	margin-top: 50px;
	border: 0;
}
<#--维修厂列表结束 -->
</style>
<div class="content">
	<div class="path">
      	 您所在的位置：<a href="${base}" class="black">首页</a> &nbsp;&gt;&nbsp;维修厂
    </div>
    <div class="searchbox1">
        <div class="sinput">
            <input name="ctl00$ContentPlaceHolder1$SearchText" type="text" value="请输入维修厂名称" id="ContentPlaceHolder1_SearchText" class="sinput_txt">
        </div>
        <input type="submit" name="ctl00$ContentPlaceHolder1$SearchManuBtn" value="搜维修厂" id="ContentPlaceHolder1_SearchManuBtn" class="sinput_btn">
    </div>
    <div class="search">
	    <div id="ContentPlaceHolder1_soubox" class="search_title">
	        <span class="floatleft">您已选择：</span>
	    </div>
        <div class="search_ctn">
            <div id="ContentPlaceHolder1_typedash" class="search_exp">
                <p class="search_l">车型：</p>
                <div class="search_r srh1">
                    <div id="ContentPlaceHolder1_typename" class="srh_exp1">
                        <span id="ContentPlaceHolder1_TypeList1">
							<#list cartypeList as cartype>
							<span>
	                            <a id="cartype_${cartype.id}" class="search_a srh_exp_a01" href="">${cartype.name}</a>
	                        </span>
	                        </#list>
						</span>
                    </div>
                </div>
            </div>
            <div class="search_exp">
                <p class="search_l">地区：</p>
                <div class="search_r srh01">
                    <div class="search_r1">
                        <div id="ContentPlaceHolder1_provincename" class="srh_exp01">
                            <span id="ContentPlaceHolder1_ProvinceList1">
                            <#list areaList as area>
                                <span>
								<a id="area_${area.id}" class="search_a srh_exp_a01" href="${base}/repairplant/areaSearch/${area.id}">${area.name}</a>
						  	</span>
                            </#list>
							</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<div class="slist">
    <h1>维修厂列表</h1>
    <div class="HYslist">
		<div class="HYlist_header">
		    <div class="HYlist_left">基本信息</div>
		    	<div class="HYlist_right">
				    <select name="ctl00$ContentPlaceHolder1$DropDownList1" onchange="javascript:setTimeout('__doPostBack(\'ctl00$ContentPlaceHolder1$DropDownList1\',\'\')', 0)" id="ContentPlaceHolder1_DropDownList1" class="droplist">
						<option selected="selected" value="2">查看全部</option>
						<option value="1">已 核 实</option>
						<option value="0">未 核 实</option>
				
					</select>
		        </div>
		    </div>
		    <#list list as repairplant>
		    <div class="HYmid">
		        <div class="HYmid_left">
		            <h3 class="HYmid_left_h3">
		                <img src="${base}/static/mall/img/list.png" width="14" height="11">&nbsp; <a href="javascript:void(0);" target="_blank">
		                    ${repairplant.name}</a>
		            </h3>
		            <ul class="HYcont">
		                <li title="主修车型：${repairplant.business}">主修车型：${repairplant.business}</li>
		                <li title="${repairplant.phone}">联系电话：${repairplant.phone}</li>
		                <li title="${repairplant.address}">地址：${repairplant.address}</li>
		            </ul>
		        </div>
		        <div class="HYmid_right"><img src="<#if repairplant.status =="1">${base}/static/mall/img/yiheshi.png<#else>${base}/static/mall/img/weiheshi.png</#if>" width="42" height="17"></div>
		    </div>
		    </#list>
        </div>
    </div>
	<div class="m clearfix">
	    <div class="pagin fr">
 			<#if (pager.list?size > 0)>
 				<#import "mall/gwq/pager.ftl" as p>
 				<@p.pager pager = pager baseUrl = "/repairplant/list" />
 			<#else>
			<div class="noRecord">
				尚未发布任何信息!
			</div>
			</#if>
		</div>
	</div>
</div>
<script type="text/javascript">
    /**
     * 全站搜索
     */
    function s() {
        var key=$('#ContentPlaceHolder1_SearchText').val()
        if (key != undefined && key != "") {
            window.location.href = "${base}/repairplant/s/" + key;
        }
    }
		<#include "mall/gwq/service_new.ftl"/>
		<#include "mall/gwq/footer_new.ftl"/>
</#escape>