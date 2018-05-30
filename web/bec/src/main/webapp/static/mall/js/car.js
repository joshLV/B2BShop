function getSeries(){
        var t = $("#carbrandId").val();
        var option="<option>选择车系</option>";
    $("#carSeriesId").empty();
    $.ajax({
        url:base+"getSeriesList",    //请求的url地址
        dataType:"json",   //返回格式为json
        data:{"brandId":t},
        async:false,//请求是否异步，默认为异步，这也是ajax重要特性
        type:"post",   //请求方式
        success:function(req){
          //  alert(req.carSeriesList);
            var obj = req.carSeriesList;
            $.each(obj,function(n,value) {
                var trs = "";
                trs += " <option value="+value.id+">" + value.name +" </option>";
                option += trs;
            });
            $("#carSeriesId").append(option);
        }
    });

}
function getCartype(){
    var t = $("#carSeriesId").val();
    var option="<option>选择车型</option>";
    $("#carTypeId").empty();
    $.ajax({
        url:base+"getCartypeList",    //请求的url地址
        dataType:"json",   //返回格式为json
        data:{"seriesId":t},
        async:false,//请求是否异步，默认为异步，这也是ajax重要特性
        type:"post",   //请求方式
        success:function(req){
            var obj = req.cartypeList;
            $.each(obj,function(n,value) {
                var trs = "";
                trs += " <option value="+value.id+">" + value.name +" </option>";
                option += trs;
            });
            $("#carTypeId").append(option);
        }
    });

}
function getGoods(){
    var t = $("#carTypeId").val();
    if(t!="选择车型"){
        $("#btn").removeClass("btn-find-disable");
        $('#btn').attr('href',base+'search/cartype/'+t);
    }else{
        $("#btn").addClass("btn-find-disable");
        $('#btn').attr('href','javascript:void(0);');
    }

}