<#escape x as x?html>
	<#include "bec/gdnz/header.ftl"/>
<div id="container">
	<#include "bec/gdnz/top.ftl"/>
<style>
.breadcrumb {height: 20px;padding: 0 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

.left {float: left;width: 150px;margin-right: 10px;}
.right {float: right;width: 830px;}

.widepage .right {width: 980px;}

.right a:link, .right a:visited {color: #005ea7;}
.right a:link, .right a:visited {color: #005ea7;}
.ftx-03, a.flk-03:link, a.flk-03:visited, .flk-03 a:link, .flk-03 a:visited {color: #999999;}

.mod-main {padding: 10px;margin-bottom: 10px;}
.mod-comm {padding: 10px 20px 20px;}
.mod-comm .mc {line-height: 20px;overflow: visible;}
.fl {float: left;}
.user-info-cont .num {margin: 0 5px;}
.user-info-cont strong {font-size: 16px;font-family: "microsoft yahei";}
.ftx01, .ftx-01 {color: #e4393c;}
.ftx-05 {color: #005ea7;}
.ml20 {margin-left: 20px;}
.mod-comm .mt {padding: 10px 0;}
.mod-main .mt .extra-l {float: left;}
.lefta-box .mt .extra-l li {padding: 0;padding-right: 20px;}
.mod-main .mt .extra-l li {float: left;padding-left: 20px;}
.mod-main .mt .extra-l li a.curr {
	padding-bottom: 0;
	color: #e4393c;
	border-bottom: 2px solid #e4393c;
	font-weight: 700;
	cursor: default;
	text-decoration: none;
	}
.mod-comm .mc {line-height: 20px;}
.mod-main .mc {overflow: visible;}
.tb-void {
	line-height: 18px;
	text-align: center;
	border: 1px solid #f2f2f2;
	border-top: 0;
	color: #333;
	width: 100%;
	}
.tb-void th {
	background: #f5f5f5;
	height: 32px;
	line-height: 32px;
	padding: 0 5px;
	text-align: center;
	font-weight: 400;
	}
.tb-void td {
	border: 1px solid #f2f2f2;
	padding: 10px 5px;
	}
.mt10 {margin-top: 10px;}
.clearfix {display: block;}
.ar {text-align: center;}
</style>

<style>
.ftx-04 {color: #ff6600;}



</style>

<div class="content">
	<div class="breadcrumb">
    	<strong><a href="${base}/member/index">会员中心</a></strong><span>&nbsp;&gt;&nbsp;取消订单记录<span></span></span>
	</div><!--breadcrumb end-->
</div>

<div class="content">
	<div class="left">
		<#include "mall/gwq/member/menu.ftl"/>
	</div><!--left end-->
	<div class="right">
		<div class="mod-main mod-comm lefta-box" id="xfnotes2">
			<div class="mt">
				<ul class="extra-l">
					<li class="fore-1"><s></s><b></b><a class="curr" href="">近三个月记录</a></li>
				</ul>
			</div>
			<div class="mc">
				<div class="tb-void">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
						<tr>
								<th width="180">订单编号</th>
								<th width="125">涉及订单号</th>
								<th width="125"></th>
								<th width="125"></th>
								<th>备注</th>
						</tr>
						<#list orderList as list>
							<tr>
                                <td>${(list.createDate?string("yyyy-MM-dd HH:mm:ss"))!}</td>
								<td>${(list.orderSn)!}</td>
								<td><div class="ar">-</div></td>
								<td><div class="ar">￥${(list.totalAmount)!}</div></td>
								<td><div class="baklist">订单${(list.orderSn)!}完成</div></td>
	                        </tr>
                        </#list>
						</tbody>
					</table>
				</div>
				<div class="mt10 clearfix">
					<div class="pagin pagin-m fr">
	            		<div id="pagin-box">
							<div class="pagin pagin-m fr">
							<span class="prev-disabled">首页</span>
							<span class="prev-disabled">上一页<b></b></span>
							<a class="current">1</a>
							<span class="next-disabled">下一页<b></b></span>
							<span class="next-disabled">末页</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	    <div class="clr"></div>
	</div><!--right end-->
</div>
</div>
	<#include "bec/gdnz/service.ftl"/>
	<#include "bec/gdnz/foot.ftl"/>
</#escape>