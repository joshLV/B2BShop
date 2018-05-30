<style>
    /*跨webview需要手动指定位置*/

    header.mui-bar {
        display: none!important;
    }
    .mui-bar-nav~.mui-content {
        padding: 0!important;
    }
    #topPopover {
        position: fixed;
        top: 16px;
        right: 6px;
    }
    #topPopover .mui-popover-arrow {
        left: auto;
        right: 6px;
    }
    p {
        text-indent: 22px;
    }
    span.mui-icon {
        font-size: 14px;
        color: #007aff;
        margin-left: -15px;
        padding-right: 10px;
    }
    .mui-popover {
        height: 90%;
        width: 90%;
    }
    .mui-content {
        padding: 10px;
    }
    .mui-table-view-radio .mui-table-view-cell .mui-navigate-right:after {
        font-size: 30px;
        font-weight: 600;
        right: 9px;
        content: '';
        color: #007aff;
        top: inherit;
    }
    .mui-table-view-radio .mui-table-view-cell.mui-selected .mui-navigate-right:after {
        content: '\e472'
    }
    .mui-navigate-right:after {
        font-family: Muiicons;
        font-size: inherit;
        line-height: 1;
        position: absolute;
        top: inherit;
        display: inline-block;
        -webkit-transform: translateY(-50%);
        transform: translateY(-50%);
        text-decoration: none;
        color: #aaa;
        -webkit-font-smoothing: antialiased;
        margin-top: 10px;
    }
</style>
<a href=" #popover">OPEM</a>
<div id="popover" class="mui-popover">
    <div class="mui-popover-arrow"></div>
    <#--
    <div style="position: absolute;z-index: 1000;top: -21px;border-top-left-radius:7px;border-top-right-radius:7px;left: 0;overflow: hidden;width: 100%;height: 26px;text-align:center;background-color:#f7f7f7;"><div style="padding-top: 5px;width: 90%;float: left">选择经营地址</div><div style="width:8%;float: right;padding-top: 5px;" onclick="mui('.mui-popover').popover('toggle');"><span style="font-size: 22px;color: #8f8f94;padding-right: 0px;" class="mui-icon mui-icon-close"></span></div></div>
    -->
    <div class="mui-scroll-wrapper">
        <div class="mui-scroll">
                <ul class="mui-table-view" >
                    <li style="border-bottom-right-radius:12xp;border-bottom-left-radius:12px;padding:13px 15px;overflow:hidden;list-style-type:none;">
                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 10%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                        <a class="mui-navigate-right" href="javascript:;" style="width: 90%;float: right;">东北</a>
                        <div style="clear: both"></div>
                        <ul >
                            <li class="mui-table-view-cell" style="padding-right:0px;padding-left: 30px;">
                                <div class="mui-input-row mui-checkbox" style="position:initial;width: 13%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                                <a class="mui-navigate-right" href="javascript:;" style="width: 80%;float: right;">黑龙江 </a>
                                <div style="clear: both"></div>
                                <ul style="display: none1">
                                    <li class="mui-table-view-cell" style="padding-right:0px;padding-left: 35px;">
                                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 13%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                                        <a class="mui-navigate-right" href="javascript:;" style="width: 80%;float: right;">哈尔滨</a>
                                    </li>
                                    <li class="mui-table-view-cell" style="padding-right:0px;padding-left: 35px;">
                                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 13%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                                        <a class="mui-navigate-right" href="javascript:;" style="width: 80%;float: right;">齐齐哈尔</a>
                                    </li>
                                    <li class="mui-table-view-cell" style="padding-right:0px;padding-left: 35px;">
                                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 13%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                                        <a class="mui-navigate-right" href="javascript:;" style="width: 80%;float: right;">鹤岗</a>
                                    </li>
                                    <li class="mui-table-view-cell" style="padding-right:0px;padding-left: 35px;">
                                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 13%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                                        <a class="mui-navigate-right" href="javascript:;" style="width: 80%;float: right;">双鸭山</a>
                                    </li>
                                    <li class="mui-table-view-cell" style="padding-right:0px;padding-left: 35px;">
                                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 13%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                                        <a class="mui-navigate-right" href="javascript:;" style="width: 80%;float: right;">鸡西</a>
                                    </li>
                                    <li class="mui-table-view-cell" style="padding-right:0px;padding-left: 35px;">
                                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 13%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                                        <a class="mui-navigate-right" href="javascript:;" style="width: 80%;float: right;">大庆</a>
                                    </li>
                                    <li class="mui-table-view-cell" style="padding-right:0px;padding-left: 35px;">
                                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 13%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                                        <a class="mui-navigate-right" href="javascript:;" style="width: 80%;float: right;">伊春</a>
                                    </li>
                                    <li class="mui-table-view-cell" style="padding-right:0px;padding-left: 35px;">
                                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 13%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                                        <a class="mui-navigate-right" href="javascript:;" style="width: 80%;float: right;">牡丹江</a>
                                    </li>
                                    <li class="mui-table-view-cell" style="padding-right:0px;padding-left: 35px;">
                                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 13%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                                        <a class="mui-navigate-right" href="javascript:;" style="width: 80%;float: right;">佳木斯</a>
                                    </li>
                                    <li class="mui-table-view-cell" style="padding-right:0px;padding-left: 35px;">
                                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 13%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                                        <a class="mui-navigate-right" href="javascript:;" style="width: 80%;float: right;">七台河</a>
                                    </li>
                                    <li class="mui-table-view-cell" style="padding-right:0px;padding-left: 35px;">
                                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 13%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                                        <a class="mui-navigate-right" href="javascript:;" style="width: 80%;float: right;">黑河</a>
                                    </li>
                                    <li class="mui-table-view-cell" style="padding-right:0px;padding-left: 35px;">
                                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 13%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                                        <a class="mui-navigate-right" href="javascript:;" style="width: 80%;float: right;">绥化</a>
                                    </li>
                                    <li class="mui-table-view-cell" style="padding-right:0px;padding-left: 35px;">
                                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 13%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                                        <a class="mui-navigate-right" href="javascript:;" style="width: 80%;float: right;"> 大兴安岭</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="mui-table-view-cell" style="padding-right:0px;padding-left: 30px;">
                                <div class="mui-input-row mui-checkbox" style="position:initial;width: 13%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                                <a class="mui-navigate-right" href="javascript:;" style="width: 80%;float: right;">吉林 </a>
                                <div style="clear: both"></div>
                                <ul style="display: none">
                                    <li class="mui-table-view-cell" style="padding-right:0px;padding-left: 30px;">
                                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 13%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                                        <a class="mui-navigate-right" href="javascript:;" style="width: 80%;float: right;">东北11</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="mui-table-view-cell" style="padding-right:0px;padding-left: 30px;">
                                <div class="mui-input-row mui-checkbox" style="position:initial;width: 13%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                                <a class="mui-navigate-right" href="javascript:;" style="width: 80%;float: right;">辽宁</a>
                                <div style="clear: both"></div>
                                <ul style="display: none">
                                    <li class="mui-table-view-cell" style="padding-right:0px;padding-left: 30px;">
                                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 13%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                                        <a class="mui-navigate-right" href="javascript:;" style="width: 80%;float: right;">东北11</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>

                    <li style="border-bottom-right-radius:12xp;border-bottom-left-radius:12px;padding:13px 15px;overflow:hidden;list-style-type:none;">
                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 10%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                        <a class="mui-navigate-right" href="javascript:;" style="width: 90%;float: right;">港澳台</a>
                    </li>
                    <li style="border-bottom-right-radius:12xp;border-bottom-left-radius:12px;padding:13px 15px;overflow:hidden;list-style-type:none;">
                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 10%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                        <a class="mui-navigate-right" href="javascript:;" style="width: 90%;float: right;">华北</a>
                    </li>
                    <li style="border-bottom-right-radius:12xp;border-bottom-left-radius:12px;padding:13px 15px;overflow:hidden;list-style-type:none;">
                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 10%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                        <a class="mui-navigate-right" href="javascript:;" style="width: 90%;float: right;">华东</a>
                    </li>
                    <li style="border-bottom-right-radius:12xp;border-bottom-left-radius:12px;padding:13px 15px;overflow:hidden;list-style-type:none;">
                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 10%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                        <a class="mui-navigate-right" href="javascript:;" style="width: 90%;float: right;">华南</a>
                    </li>
                    <li style="border-bottom-right-radius:12xp;border-bottom-left-radius:12px;padding:13px 15px;overflow:hidden;list-style-type:none;">
                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 10%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                        <a class="mui-navigate-right" href="javascript:;" style="width: 90%;float: right;">华中</a>
                    </li>
                    <li style="border-bottom-right-radius:12xp;border-bottom-left-radius:12px;padding:13px 15px;overflow:hidden;list-style-type:none;">
                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 10%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                        <a class="mui-navigate-right" href="javascript:;" style="width: 90%;float: right;">江浙沪</a>
                    </li>
                    <li style="border-bottom-right-radius:12xp;border-bottom-left-radius:12px;padding:13px 15px;overflow:hidden;list-style-type:none;">
                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 10%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                        <a class="mui-navigate-right" href="javascript:;" style="width: 90%;float: right;">西北</a>
                    </li>
                    <li style="border-bottom-right-radius:12xp;border-bottom-left-radius:12px;padding:13px 15px;overflow:hidden;list-style-type:none;">
                        <div class="mui-input-row mui-checkbox" style="position:initial;width: 10%;float: left"><input style="position:initial;" name="checkbox1" value="Item 1" type="checkbox" ></div>
                        <a class="mui-navigate-right" href="javascript:;" style="width: 90%;float: right;">西南</a>
                    </li>
                </ul>
        </div>
    </div>
</div>
<script>
    function popoverView(){
        alert();
        mui('.mui-popover').popover('popover');
    }
</script>