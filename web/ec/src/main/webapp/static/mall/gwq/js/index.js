// JavaScript Document
$(function () {
    $("#formlogin").Validform({
        tiptype: 4,
        tipSweep: true,
        ajaxPost: true,
        tipSweep: true,
        beforeSubmit:function(curform){
            $(".Validform_checktip").hide();
        },
        callback:function(data) {

            $("#msgdemo").text("");
            if("error"==data.status){
                //layer.alert(data.message, {icon: 2, title: "温馨提示"});
                $("#msgdemo").text(data.message);
            }else{
                window.location.href=base+data.url;
            }
        }
    });
    $("#banner-img").kinMaxShow({
        height: 400,
        button: {
            normal: {
                width: '18px',
                height: '18px',
                lineHeight: '18px',
                right: '21px',
                bottom: '21px',
                fontSize: '12px',
                opacity: 0.8,
                background: "#999999",
                border: "1px solid #999999",
                color: "#999999",
                marginRight: "10px"
            }, focus: {background: "#86c226", border: "1px solid #86c226", color: "#000000"}
        }
    });
    $(".tabindex").idTabs("!mouseover");
    $(".tabs").mouseover(function () {
        $(".tabindex .tabs").removeClass("selected");
        $(this).addClass("selected");
    });


});

