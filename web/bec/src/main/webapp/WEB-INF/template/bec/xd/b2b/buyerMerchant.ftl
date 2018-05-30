igurations.
					editor = CKEDITOR.replace( 'editor1',
						{
							language : languageCode,

							on :
							{
								instanceReady : function()
								{
									// Wait for the editor to be ready to set
									// the language combo.
									var languages = document.getElementById( 'languages' );
									languages.value = this.langCode;
									languages.disabled = false;
								}
							}
						} );
				}

				// At page startup, load the default language:
				createEditor( '' );

			//]]>
			</script>
		</p>
	</form>
	<div id="footer">
		<hr />
		<p>
			CKEditor - The text editor for the Internet - <a class="samples" href="http://ckeditor.com/">http://ckeditor.com</a>
		</p>
		<p id="copy">
			Copyright &copy; 2003-2012, <a class="samples" href="http://cksource.com/">CKSource</a> - Frederico
			Knabben. All rights reserved.
		</p>
	</div>
</body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            p>
                    </td>
                </tr>
            </table>
          </#list>
        </div>
        <#-- 分页条 -->
        <div class="m clearfix">
            <div class="pagin fr">
            <#if pager!false && pager.list?size &gt; 0>
                <#import "bec/xd/pager.ftl" as p>
                <@p.pager pager = pager baseUrl = "/buyerMerchant/list.html?search_mechantName=${search_mechantName}" />
            <#else>
                <div class="noRecord">你还没有供应商！</div>
            </#if>
            </div>
        </div>
        <div class="clr"></div>
    </div>
</div>
<#--弹出层开始-->
<#include "bec/xd/service.ftl"/>
<#include "bec/xd/footer.ftl"/>
<script src="${base}/static/js/jquery.lSelect.js" type="text/javascript"></script>
<script type="text/javascript">
    //pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
    $(function () {
        //关闭
        $(".close_btn").hover(function () { $(this).css({ color: 'black' }) }, function () { $(this).css({ color: '#999' }) }).on('click', function () {
            $("#LoginBox").fadeOut("fast");
            $("#mask").css({ display: 'none' });
        });
        //左侧菜单折叠操作
        $("#leftMenu dt").click(function(){
            $parent=$(this).parent();
            if($parent.hasClass("close")){
                $parent.removeClass("close");
            }else{
                $parent.addClass("close");
            }
        });
    });
    function alertAddAddressDiag(type){
        if(type=="update"){
            $("#oper").text("修改收货地址");
        }else{
            $("#oper").text("添加收货地址");
        }
        // 地区选择菜单
        $(".lSelect").remove();//移除之前生成的
        $(".areaSelect").lSelect({
            url: "${base}/area/ajaxChildren"// Json数据获取url
        });
        var num =$("#addressNum_top").text();
        if(num>5){
            alert("抱歉，地址信息最多可创建6条。");
            return;
        }
        //弹出地址框
        $("#type").attr("value","uptate");
        $("body").append("<div id='mask'></div>");
        $("#mask").addClass("mask").fadeIn("slow");
        $("#LoginBox").css("top",$(document).scrollTop()+150+"px");
        $("#LoginBox").fadeIn("slow");
    }

    function show_addMerchant(){
        $("#show_merchant").addClass("sup_search");
        $("#show_merchant").show();
        $("#old_search").hide();
    }

    function submit_merchantName(){
        var merchantName = $("#merchantName").val();
        if(isEmpty(merchantName)){
            alert('供应商名称不能为空!');
            return;
        }

        if(merchantName.length >20){
            alert('供应商名称长度不超过10!');
            return;
        }

        $.ajax({
            type: "post",
            url: "${base}/buyerMerchant/findMerchant",
            data:{'merchantName':merchantName},
            datatype: 'json',
            error: function () {
                alert('err');
            },
            success: function(result) {
                $("#show_merchant").hide();
                $("#show_addM").addClass("sup_list_namets");
                $("#show_addM").show();
                $("#old_search").show();
                var jsonObj=eval(result.list);
                var html = "<span class='choose_gys'>请从以下列表选择要添加的供应商</span>";
                html += "<table border='0' cellpadding='0' cellspacing='0' class='sup_mycgs'>";
                       html+="<tr>";
                         html+="<td align='center' width='100'>序号</td>";
                         html+="<td width='500'>采购商名称</td>";
                         html+="<td width='100'>操作</td>";
                       html+="</tr>";


                $.each(jsonObj, function (i, item) {
                    html+="<tr>";
                      html+="<td align='center'>"+(i+1)+"</td>";
                      html+="<td>"+item.name+"</td>";
                      html+="<td><button class='sup_button' onclick='submit_addMer(\""+item.id+"\");'>确定</button></td>";
                    html+="</tr>";
                });
                $("#show_addM").html(html);
            }
        });
    }

    function submit_addMer(merchantId){
        if(isEmpty(merchantId)){
            alert('请选择供应商!');
            return;
        }
        $("#show_addM").hide();
        $.ajax({
            type: "post",
            url: "${base}/buyerMerchant/save",
            data:{'merchantId':merchantId},
            datatype: 'json',
            error: function () {
                alert('error');
            },
            success: function(result) {
                if("success"==result.status){
                    alert('添加成功!');
                    window.location="${base}/buyerMerchant/list";
                }else if("report"==result.status){
                    alert(result.message);
                }else{
                    alert('error')
                }
            }
        });

    }

    function search_mechantName(){
        var search_mechantName = $("#search_mechantName").val();
//        if(isEmpty(search_mechantName)){
//            alert('供应商名称不能为空!');
//            return;
//        }

        if(search_mechantName.length >20){
            alert('供应商名称长度不超过10!');
            return;
        }
        window.location="${base}/buyerMerchant/list?search_mechantName="+search_mechantName;
    }

    function delete_merchant(merchantId){
        $.ajax({
            type: "post",
            url: "${base}/buyerMerchant/delete",
            data:{'merchantId':merchantId},
            datatype: 'json',
            error: function () {
                alert('error');
            },
            success: function(result) {
                if("success"==result.status){
                    alert('删除成功!');
                    window.location="${base}/buyerMerchant/list";
                }else{
                    alert('error')
                }
            }
        });
    }

    /**
     * 判断是否是空
     * @param value
     */
    function isEmpty(value){
        if(value == null || value == "" || value == "undefined" || value == undefined || value == "null"){
            return true;
        }
        else{
            value = (value+"").replace(/\s/g,'');
            if(value == ""){
                return true;
            }
            return false;
        }
    }
</script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/easybuy.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
</body>
</html>