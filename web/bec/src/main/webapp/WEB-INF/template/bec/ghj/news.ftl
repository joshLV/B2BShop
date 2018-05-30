<#escape x as x?html>


<div class="news">
    <div class="main">

            <#--<div class="f-fl left">
                <div class="newtitle"> <a href="javascript:void(0)">最新动态</a> </div>
                <ul class="list f-cb" id="news">
                </ul>
            </div>-->

        <div class="gydt">
            <div class="newslist">
                <div class="newtitle"><a href="javascript:void(0)">销量排行</a></div>
               <#--<div class="f-fl"><a href="javascript:void(0);">供应动态</a></div>-->
                <#--<div class="f-fr"><a href="javascript:getNewGoods();">换一批<i class="icon-refresh"></i></a><input type="hidden" id="goodsPageNumber" value="1"/></div>-->
            </div>

            <div class="top-list">
                <div class="top-list-tit">
                    <span>采购排名</span><span class="span2">采购商品</span><span>月成交量</span>
                </div>
                <div id="top-con">
                <ul id="ajaxPurchase">
                    <#--<li><span >1</span><span class="span2"><a href="#" target="_blank">北京蓝迈经典小麦王 320ml</a></span><span class="red">130000 笔</span></li>
                    <li><span>2</span><span class="span2"><a href="#" target="_blank">海天味极鲜酱油 750ml</a></span><span class="red">7884 笔</span></li>
                    <li><span>3</span><span class="span2"><a href="#" target="_blank">北京蓝迈经典小麦王 320ml</a></span><span class="red">63000 笔</span></li>
                    <li><span>4</span><span class="span2"><a href="#" target="_blank">海天味极鲜酱油 750ml</a></span><span class="red">4884 笔</span></li>
                    <li><span>5</span><span class="span2"><a href="#" target="_blank">北京蓝迈经典小麦王 320ml</a></span><span class="red">3884 笔</span></li>
                    <li><span>6</span><span class="span2"><a href="#" target="_blank">海天味极鲜酱油 750ml</a></span><span class="red">2884 笔</span></li>-->

                </ul>
                </div>




            </div>



           <#-- <ul class="content" id="newGoods">
            </ul>-->
        </div>
        <div class="newslist f-cb">
        <div class="f-fr right">
            <div class="newtitle"><a href="javascript:void(0)">品牌入驻</a></div>
            <div class="pprz-list">
            <div id="myscroll">
                <ul id="goodsBrands">
                    <#--<li><span>[ 2016-07-26 ]</span>恭贺海天品牌入驻</li>
                    <li><span>[ 2016-07-26 ]</span>恭贺康师傅品牌入驻</li>
                    <li><span>[ 2016-07-26 ]</span>恭贺蓝月亮品牌入驻</li>
                    <li><span>[ 2016-07-26 ]</span>恭贺海天品牌入驻</li>
                    <li><span>[ 2016-07-26 ]</span>恭贺康师傅品牌入驻</li>
                    <li><span>[ 2016-07-26 ]</span>恭贺蓝月亮品牌入驻</li>
                    <li><span>[ 2016-07-26 ]</span>恭贺海天品牌入驻</li>
                    <li><span>[ 2016-07-26 ]</span>恭贺康师傅品牌入驻</li>
                    <li><span>[ 2016-07-26 ]</span>恭贺蓝月亮品牌入驻</li>
                    <li><span>[ 2016-07-26 ]</span>恭贺海天品牌入驻</li>-->
                </ul>
            </div>
            </div>
            <#--<table width="100%" border="0" cellspacing="0" cellpadding="0">
                <thead>
                <tr>
                    <th scope="col">采购产品</th>
                    <th scope="col">采购数量</th>
                    <th scope="col">采购人数</th>
                   &lt;#&ndash; <th scope="col">采购产品</th>
                    <th scope="col">采购数量</th>
                    <th scope="col">采购人数</th>&ndash;&gt;
                </tr>
                </thead>
                <tbody id="newPurchase">

                </tbody>
            </table>-->


        </div>
        </div>
    </div>
</div><#-- news end -->
<script type="text/javascript" src="${base}/static/bec/project/ghj/js/YLMarquee-1.1.min.js"></script>
<script type="text/javascript">
    /*$("#myscroll").YlMarquee({
        visible:19,
        vertical: true,
        step:1
    });*/
    /*$("#top-con").YlMarquee({
        visible:5,
        vertical: true,
        step:1
    });*/
</script>


<#--原供应动态和采购动态效果-->
<script type="text/javascript">
    $(function(){
        getNews();
        /*getNewGoods();
        getNewPurchase();*/
        myInterval()
    });

    var pagerNo = 0;
    function myInterval() {
        ajaxNewBuyer(pagerNo);
        getBrands(pagerNo);
        getPurchase(pagerNo);
    }
    /*
         * 2016-11-03 11:36:54 ty
         * 查询品牌信息
         */
    function ajaxNewBuyer(pagerNo) {
        var pagerSize = "30";
        $.ajax({
            type: "post",
            url: "${base}/ajaxNewBuyer?pagerNo="+pagerNo+"&pagerSize="+pagerSize,
//            data: '',
            success: function(data) {
                if (data.status == 'success') {
                    if( data.buyerList ){
                        var html = '';
                        $.each(data.buyerList,function(k,v){
//                            alert( v.companyName);
                        });
//                        $("#goodsBrands").html(html);
//
//                        $("#myscroll").YlMarquee({
//                            visible:7,
//                            vertical: true,
//                            step:1
//                        });
                    }
                }
            }
        });
    }

    /*
     * 20160726 dzz
     * 查询品牌信息
     */
    function getBrands(pagerNo) {
        var pagerSize = "30";
        $.ajax({
            type: "post",
            url: "${base}/ajaxBrands?pagerNo="+pagerNo+"&pagerSize="+pagerSize,
//            data: '',
            success: function(data) {
                if (data.status == 'success') {
                    if( data.brandList ){
                        var html = '';
                        $.each(data.brandList,function(k,v){
                            html += '<li><span>[ '+ v.modifyUser +' ]</span>恭贺[<font style="color: red;">' + v.name + '</font>]品牌入驻</li>';
                        });
                        $("#goodsBrands").html(html);

                        $("#myscroll").YlMarquee({
                            visible:7,
                            vertical: true,
                            step:1
                        });
                    }
                }
            }
        });
    }
    function getPurchase(pagerNo){
        var pagerSize = "30";
        $.ajax({
            type: "post",
            url: "${base}/ajaxPurchase?pagerNo="+pagerNo+"&pagerSize="+pagerSize,
            success: function(data) {
                if (data.status == 'success') {
                    if( data.podList ){
                        var html = '';
                        $.each(data.podList,function(k,v){
                            html += '<li><span >'+ (k+1) +'</span><span class="span2"><a href="#" target="_blank">'+ v.goodsName +'</a></span><span class="red">'+ v.quantity +' 笔</span></li>';
                        });
                        $("#ajaxPurchase").html(html);

                        $("#top-con").YlMarquee({
                            visible:5,
                            vertical: true,
                            step:1
                        });
                    }
                }
            }
        });
    }

    function getNews(){
        $.ajax({
            type: "post",
            url: "${base}/ajaxGetNews",
            data: {pageNumber: 1, pageSize: 4},
            success: function(data) {
                if (data.status == 'success') {
                    if( data.data ){
                        var html = '';
                       /* $.each(data.articlesList,function(k,v){
                            html += '<li class="f-fl textoverflow f-cb"><span class="f-fl"></span>';
                            html += '<a href="${base}/'+ v.id +'.html" title="'+ v.title +'">'+v.title+'</a>';
                            html += '</li>';
                        });*/
                        $.each(data.articlesList,function(k,v){
                            html += '<li>';
                            html += '<a href="${base}/help/question/'+ v.id +'.html" title="'+ v.title +'" target="_blank">'+v.title+'</a>';
                            html += '</li>';
                        });

                        $("#news").html(html);
                    }
                }
            }
        });
    }

   function getNewGoods(){
        $.ajax({
            type: "post",
            url: "${base}/ajaxGetNewGoods",
            data: {pageNumber: $("#goodsPageNumber").val()},
            success: function(data) {
                if (data.status == 'success') {
                    if( data.data ){
                        $("#goodsPageNumber").val(data.pageNumber);
                        var html = '';
                        $.each(data.goodsList,function(k,v){
                            html += '<li class="f-fl f-cb">';
                            html += '<div class="f-fl p-img"><a href="${base}/item/'+ v.id+'.html" target="_blank"><img src="'+ v.pic+'@80w_80h.png" width="80" height="80" alt="'+ v.fullName+'"/></a></div>';
                            html += '<div class="f-fr p-text">';
                            html += '<div class="f-cb name"><div class="f-fl pname textoverflowd"><a href="${base}/item/'+ v.id+'.html" target="_blank">'+ v.name +'</a></div><span class="f-fr">';
                            if(data.login == 'nologin'){
                                html += '仅会员可见！';
                            }else{
                                if(v.enableBatchPrice == '1'){
                                    html += '' + v.batchPrice;
                                }else{
                                    html += '' + v.price;
                                }
                                html +=  '元\/'+ ((v.unit=='' || typeof(v.unit) == 'undefined' )?'个': v.unit);
                            }
                            html += '</span></div>'
                            html += '<div class="textoverflowd"><a href="${base}/item/'+ v.id+'.html" target="_blank">'+ v.fullName + '</a></div>';
                            html += '<div class="f-cb com">'+ v.shopName+'<span class="f-fr">'+((v.modifyDate=='' || typeof(v.modifyDate) == 'undefined' )?'':new Date(v.modifyDate).Format('MM-dd hh:mm'))+'</span></div>';
                            html += '</div>';
                            html += '</li>';
                            if (k == 5) {
                                return false;
                            }
                        });

                        $("#newGoods").html(html);
                    }
                }
            }
        });
    }

    function getNewPurchase(){
        $.ajax({
            type: "post",
            url: "${base}/ajaxGetPurchase",
            data: {pageNumber: $("#purchasePageNumber").val()},
            success: function(data) {
                if (data.status == 'success') {
                    if( data.data ){
                        $("#purchasePageNumber").val(data.pageNumber);
                        var html = '';
                        $.each(data.podList,function(k,v){
                            html += '<tr>';
                            html += '<td>'+ ((v.goodsName=='' || typeof(v.goodsName) == 'undefined')?'':v.goodsName) +'</td>';
                            html += '<td>'+ ((v.quantity=='' || typeof(v.quantity) == 'undefined')?'':v.quantity) +'</td>';
                            html += '<td>'+ ((v.purchaseOrderId=='' || typeof(v.purchaseOrderId) == 'undefined')?'':v.purchaseOrderId) +'</td>';
                            html += '</tr>';
                        });

                        $("#newPurchase").html(html);
                    }
                }
            }
        });
    }
</script>
</#escape>