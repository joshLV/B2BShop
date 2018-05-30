                          <input class="span10" id="description" $!shreadonly name="description" type="text" value="$!pd.description" placeholder="这里输入促销描述" title="商品促销描述" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label for="introduction" class="span2">商品介绍:</label>
                                <script id="introduction" name="introduction" type="text/plain" style="width: 80%; height: 600px;margin: 0 auto;">
                                    $!pd.introduction
                                </script>
                                <script type="text/javascript">
                                    //var ue = UE.getEditor('content_div');//此处的参数为需要绑定富文本框的div的ID
                                        #if("$!shreadonly" != "")
                                        var ue = UE.getEditor('introduction',{
                                            readonly:true
                                        });
                                        #else
                                        var ue = UE.getEditor('introduction');//此处的参数为需要绑定富文本框的div的ID
                                        #end
                                </script>
                            </td>
                        </tr>

                        #if($!isEnable == 'YES')
                            <tr>
                                <td colspan="2">
                                    <label for="phoneIntroduction" class="span2">手机端商品介绍:</label>
                                    <script id="phoneIntroduction" name="phoneIntroduction" type="text/plain" style="width: 80%; height: 600px;margin: 0 auto;">
                                $!pd.phoneIntroduction
                            </script>
                                    <script type="text/javascript">
                                        //var ue = UE.getEditor('content_div');//此处的参数为需要绑定富文本框的div的ID
                                            #if("$!shreadonly" != "")
                                            var ue1 = UE.getEditor('phoneIntroduction',{
                                                readonly:true
                                            });
                                            #else
                                            var ue1 = UE.getEditor('phoneIntroduction');//此处的参数为需要绑定富文本框的div的ID
                                            #end
                                    </script>
                                </td>
                            </tr>
                        #end
                    </table>
                </div>
            </section>
        </div>

    ##增加商品相关证书 Auth:zhangqiang Time:2015-09-15 11:17:35   Start
        <div class="col-md-12" style="margin-top: 10px;">
            <section class="panel panel-info portlet-item">
                <header id="p8" style="cursor:pointer"class="panel-heading" ><label class="fa fa-rss-square" style="margin-left: 20px">资质证明文件</label></header>
                <div title="关单,检疫合格证,原产地证明" id="showDiv8" data-options="refreshable:false" style="display:block;color:#717171;">
                    <table id="table_desc" class="table table-striped table-bordered table-hover">
                        <tr>
                            <td colspan="2">
                                <label for="shippingOrderUrl" class="span2"></label>
                                <script id="shippingOrderUrl" name="shippingOrderUrl" type="text/plain" style="width: 80%; height: 600px;margin: 0 auto;">
                                    $!pd.shippingOrderUrl
                                </script>
                                <script type="text/javascript">
                                    //var ue = UE.getEditor('content_div');//此处的参数为需要绑定富文本框的div的ID
                                        #if("$!shreadonly" != "")
                                        var ue2 = UE.getEditor('shippingOrderUrl',{
                                            readonly:true
                                        });
                                        #else
                                        var ue2 = UE.getEditor('shippingOrderUrl',{
                                            serverUrl : window.UEDITOR_CONFIG.serverUrl + "?isWatermark=true"
                                        });//此处的参数为需要绑定富文本框的div的ID
                                        #end
                                </script>
                            </td>
                        </tr>
                    </table>
                </div>
            </section>
        </div>
    ##增加商品相关证书 Auth:zhangqiang Time:2015-09-14 17:17:35   End

    #*审批记录*#
        #if(($!PAGE_TYPE =="DETAIL" || $!PAGE_TYPE =="EDIT") && $!audits && $!audits.size() > 0)
            <div class="col-md-12" style="margin-top: 10px;">
                <section class="panel panel-info portlet-item">
                    <header id="p7" style="cursor:pointer" class="panel-heading" ><label class="fa fa-rss-square" style="margin-left: 20px">操作日志</label></header>
                    <div title="操作日志" id="showDiv7" data-options="refreshable:false" style="display:block;color:#717171;">
                        <table id="table_report" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <td>序号</td>
                                <td>操作类型</td>
                                <td>操作结果</td>
                                <td>操作意见</td>
                                <td>操作人</td>
                                <td>操作时间</td>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- 开始循环 -->
                                #if( $!audits && $!audits.size() > 0)
                                    #foreach($var in $!audits)
                                    <tr>
                                        <td style="text-align: center;">$velocityCount</td>
                                        <td>
                                            #if($!var.auditType == 1)
                                                商家审核
                                            #elseif($!var.auditType == 2)
                                                商城审核
                                            #elseif($!var.auditType == 3)
                                                商家编辑
                                            #end
                                        </td>
                                        <td>
                                            #if($!var.auditResult == 'Y')
                                                <span style="color: green;font-weight: bold;">通过</span>
                                            #elseif($!var.auditResult == 'N')
                                                <span style="color: red;font-weight: bold;">不通过</span>
                                            #end
                                        </td>
                                        <td>
                                            $!var.auditAdvise
                                        </td>
                                        <td>
                                            $!SYSBOX.getUserById($!var.createUser).name
                                        </td>
                                        <td>
                                            $!TBDATETIME.format($!var.createDate)
                                        </td>
                                    </tr>
                                    #end
                                #else
                                <tr class="main_info">
                                    <td colspan="100" class="center" >没有相关数据</td>
                                </tr>
                                #end
                            </tbody>
                        </table>
                    </div>
                </section>
            </div>
        #end
        <input type="reset" id="res" name="res" value="reset" style="display: none;">
    </form>
</div>
#end
#parse("/WEB-INF/jsp/vmbase/detailtemplete.vm")
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      