<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>我的店铺</title>
<meta name="description" content="我的店铺">
<meta name="Keywords" content="我的店铺">
<link href="${base}/static/mall/gwq/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/mall/css/list2.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"shop-店铺ID"
};
</script>
</head>
<body>
<#include "bec/ghdj/shortcut.ftl"/>
<#include "bec/ghdj/header.ftl"/>
<style>
    /*
     * -------------------------------------------------------
     * ******************** public.css ***********************
     * -------------------------------------------------------
     */

    #left { float: left; width: 208px;padding-left: 130px;margin-bottom: 50px; }
    #right { float: left; width: 780px;padding-left: 15px;}

    .clear { clear: both; height: 0; font-size: 1px; }

    .fontColor1 { color: #285bcc; }
    .fontColor2 { color: #fe5504; }
    .fontColor3 { font-size: 16px; color: #ff5400; }
    .fontColor4 { color: #3d8bd7; }
    .fontColor5 { color: #a3a3a3; }
    .fontColor6 { color: #f00; }
    .fontColor7 { color: #569636; }
    .fontColor8 { color: #3e3e3e; }
    .fontColor9 { color: #275bcb; }
    .fontColor10 { color: #656565; }
    .fontColor11 { color: #a8a8a8; }

    .letter1 { letter-spacing: 12px; }

    .bg1 {background: #f8f8f8;}
    .bg2 {background: #f8f8f8;}

    .text { border: 1px solid #c2c2c2; background: url(images/text.gif) repeat-x; padding: 2px 3px; font-family: Arial, Helvetica, sans-serif; color: #666; }

    .width1 { width: 40px; }
    .width2 { width: 200px; }
    .width3 { width: 120px; }
    .width4 { width: 140px; }

    /*
     * -------------------------------------------------------
     * ******************** end public.css *******************
     * -------------------------------------------------------
     */
    /*
     * -------------------------------------------------------
     * ******************** topbar.css ***********************
     * -------------------------------------------------------
     */
    #topbar { width: 1000px; height: 153px; margin: 0 auto 10px; position: relative; }
    #topbar .banner { width: 1000px; height: 120px; position: absolute; top: 0; left: 0; z-index: 1; }
    #topbar ul { width: 1000px; height: 30px; position: absolute; bottom: 0; left: 0; z-index: 3; }
    #topbar li { float: left; margin-right: 2px; }

    #topbar .active { display: block; font-size: 14px; font-weight: bold; color: #091427; text-decoration: none; background: url(images/active.gif) no-repeat right top; }
    #topbar .active span { display: block; padding: 7px 20px 4px 22px; background: url(${base}/static/img/active_span.gif) no-repeat left top; }

    #topbar .normal { display: block; font-size: 12px; font-weight: bold; color: #3d3f3e; text-decoration: none; background: url(images/normal.gif) no-repeat right top; }
    #topbar .normal:hover { color: red; }
    #topbar .normal span { display: block; padding: 8px 20px 5px 22px; background: url(${base}/static/img/normal_span.gif) no-repeat left top; }

    #topbar .collection { width: 75px; padding-left: 30px; height: 22px; color: #3d8bd7; line-height: 22px; text-decoration: none; background: url(${base}/static/img/btn.gif) no-repeat 0 -40px; position: absolute; top: 2px; right: 0; }
    #topbar .collection:hover { filter:alpha(opacity=60); -moz-opacity:0.6; }

    #topbar .topbar_bg { width: 1000px; height: 30px; border-bottom: 3px solid #ff8e00; background: #fff; position: absolute; bottom: 0; left: 0; z-index: 2; }
    /*
     * -------------------------------------------------------
     * ******************** end topbar.css *********************
     * -------------------------------------------------------
     */
    /*
           * -------------------------------------------------------
           * ******************** left.css ***********************
           * -------------------------------------------------------
           */
    #left .user { width: 206px; border: 1px solid #ffe3a4; margin-bottom: 5px; }
    #left .user_photo { width: 206px; text-align: center; }
    #left .user_photo h2 { margin-top: 13px; color: #3d3f3e; font-size: 14px; }
    #left .photo { margin-top: 10px; }
    #left .user_photo p { margin-top: 6px; }
    #left .user_photo p a { color: #285bcc; }
    #left .user_photo p a:hover { color: red; }

    #left .user_data { color: #666; width: 189px; margin: 20px 0 0 17px; padding-bottom:
    10px; }
    #left .user_data img { vertical-align:middle; }
    #left .user_data p { padding-bottom: 10px; }
    #left .user_data p .name { color: #258bbc; }
    #left .user_data p .name:hover { color: red; }

    .module_common { border: 1px solid #ffe3a4; margin-bottom: 5px;width: 206px; }

    .module_currency { margin-bottom: 5px; }

    .veins1 { background: url(${base}/static/img/veins.gif) repeat-x 0 0; }
    .veins1 .ico2 { color: #fff; }
    .veins2 { background: url(${base}/static/img//veins.gif) repeat-x 0 -37px; }
    .veins2 .ico2 { color: #3d3f3e; }

    .common_title { height: 27px; line-height: 25px; position: relative; }
    .common_title .ornament1 {}
    .common_title .ornament2 {}
    .common_title .ico1 {}
    .common_title .ico2 { padding-left: 10px; margin-left: 13px; font-size: 12px;
        background: url(images/ico.gif) no-repeat 0 -138px; }

    .message_link { color: #fff; position: absolute; top: 0px; right: 10px; word-spacing:5px; }
    .message_link a { color: #fff; text-decoration: none; font-size: 12px; }
    .message_link a:hover { position: relative; top: 1px; text-decoration: underline; }

    .web_search { margin: 20px 0 20px 15px; }
    .web_search .btn { border: 0; width: 21px; height: 21px; background: url(${base}/static/img/btn.gif) 0 -73px; }

    .submenu { width: 176px; margin: 15px; overflow: hidden; }
    .submenu li { line-height: 24px; }
    .submenu li a { padding-left: 22px; color: #666; text-decoration: none; }
    .submenu li a:hover { color: red; font-weight: bold; }
    .submenu ul { padding-left: 22px; }
    .submenu ul li {}
    .submenu ul li a { background: url(images/ico.gif) no-repeat 0 -241px; padding-left:10px; }

    .none_ico { background: url(images/ico.gif) no-repeat 0 -209px; }
    .block_ico { background: url(images/ico.gif) no-repeat 0 -179px; }
    .link_ico { background: url(images/ico.gif) no-repeat 3px -276px; }
    /*
         * -------------------------------------------------------
         * ******************** end left.css *********************
         * -------------------------------------------------------
         */
    /*





 * -------------------------------------------------------
            * ******************** right.css ***********************
            * -------------------------------------------------------
            */
    .default { margin-bottom: 10px; }
    .default dl { margin: 10px 0; }
    .default dd { margin-left: 40px; }
    .default ul { margin: 0 0 20px 40px; }
    .default ul li { list-style: outside disc; }
    .default ol { margin: 0 0 20px 40px; }
    .default ol li { list-style: outside decimal; }
    .default ol li ul li { list-style: outside disc; }
    .default p { margin: 16px 0; }
    .default h1, .default h2, .default h3, .default h4, .default h5, .default h6 { margin-bottom: 16px; }
    .default h1 { font-size: 32px; }
    .default h2 { font-size: 24px; }
    .default h3 { font-size: 20px; }
    .default h4 { font-size: 14px; }
    .default h5 { font-size: 12px; }
    .default h6 { font-size: 10px; }

    .major .list { width: 750px; margin: 15px; overflow: hidden; }
    .major .list li { width: 187px; height: 250px; float: left; }
    .major .pic { width: 164px; margin: 0 auto; }
    .major .pic img { width: 150px; height: 150px; }
    .major .pic a { display: block; width: 150px; height: 150px; padding: 7px; border: 1px solid #c4c4c4; }
    .major .pic a:hover { border: 1px solid #555; }
    .major h3 { width: 164px; height: 40px; text-align: center; overflow: hidden; margin: 10px auto; line-height: 18px; font-weight: normal; font-size: 12px; }
    .major h3 a { color: #666; text-decoration: none; }
    .major h3 a:hover { color: #f60; text-decoration: underline; }
    .major p { width: 164px; color: #fe5504; font-weight: bold; font-size: 14px; text-align: center; }

    .group_major .list { width: 750px; margin: 15px; overflow: hidden; }
    .group_major .list li { width: 187px; height: 270px; float: left; }
    .group_major .pic { width: 164px; margin: 0 auto; }
    .group_major .pic img { width: 150px; height: 150px; }
    .group_major .pic a { display: block; width: 150px; height: 150px; padding: 7px; border: 1px solid #c4c4c4; }
    .group_major .pic a:hover { border: 1px solid #555; }
    .group_major h3 { width: 164px; height: 40px; text-align: center; overflow: hidden; margin: 10px auto; line-height: 18px; font-weight: normal; font-size: 12px; }
    .group_major h3 a { color: #666; text-decoration: none; }
    .group_major h3 a:hover { color: #f60; text-decoration: underline; }
    .group_major p { width: 164px; color: #fe5504; font-weight: bold; font-size: 14px; text-align: center; }
    .group_major p span { font-weight: normal; color: #656565; font-size: 12px; }
    .group_major .time { width: 139px; padding-left: 25px; height: 30px; line-height: 30px; color: #5eb3a0; font-weight: bold; margin: 0 auto; }


    .major .more { font-family: "宋体"; text-align: right; padding-right: 30px; margin-bottom: 20px; }
    .major .more a { color: #285bcc; }
    .major .more a:hover { position: relative; top: 1px; }

    .general .list { width: 750px; margin: 15px; overflow: hidden; }
    .general .list li { width: 124px; height: 180px; float: left; float: left; }
    .general .pic { width: 102px; margin: 0 auto; }
    .general .pic img { width: 100px; height: 100px; }
    .general .pic a { display: block; width: 100px; height: 100px; border: 1px solid #c4c4c4; }
    .general .pic a:hover { border: 1px solid #555; }
    .general h3 { width: 102px; height: 36px; text-align: center; overflow: hidden; margin: 10px auto; line-height: 18px; font-weight: normal; font-size: 12px; }
    .general h3 a { color: #666; text-decoration: none; }
    .general h3 a:hover { text-decoration: underline; }
    .general p { width: 124px; color: #fe5504; font-weight: bold; font-size: 14px; text-align: center; }

    .credited { margin-bottom: 15px; }
    .credited table { width: 100%; border-collapse: collapse; line-height: 26px; }
    .credited th, .credited td { border-bottom: 1px solid #e1efd6; }
    .credited_css { border-right: 1px solid #e1efd6; margin: 3px 0; font-weight: bold; }
    .new_size th { font-weight: normal; color: #a9a9a9; }
    .credited td { text-align: center; color: #666; }


    .tab_table { width: 100%; border-collapse: collapse; table-layout: fixed; }
    .tab_table th { height: 25px; color: #a9a9a9; }
    .tab_table th, .tab_table td { border-bottom: 1px solid #e2e2e2; }
    .tab_align { text-align: center; }
    .tab_align_right { text-align: right; }
    .font_bold { font-weight: bold;}
    .tab_table_con { line-height: 18px; color: #295ad0; padding: 10px 20px 10px 0; }
    .money { color: #fd5500; font-weight: bold; font-size: 14px; }
    .ware_link { color: #666; text-decoration: none; line-height: 18px; }
    .ware_link:hover { color: #f60; text-decoration: underline; }




    .general .more { font-family: "宋体"; text-align: right; padding-right: 30px; margin-bottom: 20px; }
    .general .more a { color: #285bcc; }
    .general .more a:hover { position: relative; top: 1px; }

    .nothing { width: 780px; padding: 50px 0; text-align: center; }
    .nothing p { width: 278px; height: 50px; padding: 30px 0 0 40px; background: url(images/nothing.gif) no-repeat; font-weight: bold; font-size: 15px; color: #585858; margin: 0 auto; }

    .message_text { width: 730px; padding: 15px 25px; overflow: hidden; line-height: 24px; border-bottom: 1px dotted #bababa; position: relative; }
    .message_text .link1 { color: #666; }
    .message_text .link1:hover { color: red; }
    .message_text .link2 { color: #fe5504; }
    .message_text .gray { color: #a3a3a3; }
    .message_text .beat { position: absolute; top: 10px; right: 30px; }

    .message_text dd { color: #666; }

    .ware_title { text-align: center; color: #3e3e3e; line-height: 40px; border-bottom: 1px solid #ddd; margin-bottom: 25px; }
    .ware_info { width: 740px; margin: 0 auto 20px; position: relative; z-index: 1; }
    .ware_pic { float: left; width: 300px; }
    .ware_text { float: right; width: 380px; position: relative; z-index: 10; }

    .info_particular { width: 100%; border-bottom: 1px solid #e6e6e6; overflow: hidden; }
    .info_particular ul { width: 100%; overflow: hidden; }
    .info_particular li { width: 100%; overflow: hidden; padding-bottom: 12px; float: left; }
    .info_particular p { color: #666; float: left; }

    .info_particular .title { padding-top: 1-px; }
    .info_particular .con a { color: #275bcb; text-decoration: none; }
    .info_particular .con a:hover { color: #ff9b11; }

    .quantity { float: left; padding-right: 10px; }
    .ascertain { color: #ff9a12; }
    .inverse_proportion { float: left; width: 80px; height: 16px; overflow: hidden; background: url(images/inverse_proportion.gif) no-repeat -30px center; }

    .info_explain { padding: 15px 0 10px; }
    .info_table { border: 2px solid #e6e6e6; border-right: 0; border-left: 0; padding: 1px 0; }
    .info_table table { border-collapse: collapse; width: 100%; }
    .info_table th { font-weight: normal; color: #b5b5b5; background: #f5f5f5; height: 26px; }
    .info_table td { height: 40px; text-align: center; color: #666; border-bottom: 1px solid #e6e6e6; }
    .info_table .text { width: 50px; }

    .info_fun { padding: 10px 15px 0 0; position: relative; }
    .info_fun .align { text-align: right; }
    .info_fun .txt { color: #3d3f3e; font-weight: bold; padding-right: 15px; }
    .info_fun .btn { border: 0; width: 74px; height: 22px; background: url(images/info_fun_btn.gif); color: #3e3e3e; }
    .info_fun .big_btn { border: 0; width: 121px; height: 33px; background: url(images/info_fun_btn2.gif); }

    .ware_title span { line-height: 32px; }
    .ware_title .main { font-size: 16px; }
    .ware_title .time { font-size: 12px; background: #000; padding:0px; color: #23f5c6; position: relative; bottom: 4px; }

    .big_pic { width: 300px; height: 300px; background: #f1f1f1; margin-left: 20px; }

    .bottom_btn { width: 340px; height: 64px; position: relative; }
    .collect { width: 27px; height: 128px; background: url(${base}/static/img/btn.gif) 0 -113px; position: absolute; top: -300px; left: 322px; display: none; }

    #btn_list { padding-top: 20px; position: relative; left: 20px; }
    #btn_list1 , #btn_list2 { width: 146px; height: 29px; float: left; position: relative; cursor: pointer; }
    #btn_list1 { background: url(images/btn_list.gif) no-repeat; }
    #btn_list2 { background: url(images/btn_list.gif) no-repeat right 0; left: 10px; }
    #btn_list .drop_down { position: absolute; top: 29px; left: 0; width: 138px; padding: 6px 0 10px; border: 4px solid #dadada; background: #fff; display: none; }
    #btn_list .drop_down li { height: 30px; }
    #btn_list .drop_down li img { float: left; width: 16px; height: 16px; position: relative; top: 6px; left: 20px; }
    #btn_list .drop_down li a { color: #3e3e3e; float: left; height: 30px; line-height: 30px; padding-left: 30px; }
    #btn_list .drop_down li a:hover { color: #f00; font-weight: bold; }

    .left_btn { width: 8px; height: 53px; border: 1px solid #ccc; background: #f7f4f0 url(images/left_btn.gif) no-repeat center center; position: absolute; bottom: 0; left: 6px; cursor: pointer; }
    .right_btn { width: 8px; height: 53px; border: 1px solid #ccc; background: #f7f4f0 url(images/right_btn.gif) no-repeat center center; position: absolute; bottom: 0; right: 3px; cursor: pointer; }

    .ware_box { width: 305px; height: 64px; position: absolute; left: 19px; top: 3px; overflow: hidden; }
    .ware_box ul { width: 30000px; border: 1px sol9id #333; position: absolute; top: 0; left: 0; }
    .ware_box li { width: 55px; height: 55px; overflow: hidden; padding: 6px 3px 3px 3px; float: left; cursor: pointer; }

    .ware_pic_hover { background: url(images/ware_pic_hover.gif); }

    .rate { color: #666; line-height: 30px; width: 360px; padding-left: 20px; margin-bottom: 10px; overflow: hidden; }

    .handle { width: 340px; padding: 10px 20px; background: #f6f6f6; border: 1px solid #e8e8e8; overflow: hidden; }
    .handle ul { width: 360px; overflow: hidden; color: #7a7a7a; margin-bottom: 10px;}
    .handle li { float: left; cursor: pointer; }
    .handle_title { padding-top: 3px; }
    .solid { padding: 2px 4px; border: 1px solid #ff5400; color: #fff; margin-right: 8px; background: #ff8e56; }
    .dotted { padding: 2px 4px; border: 1px dotted #ff5400; margin-right: 8px; background: #fff; }
    .aggregate { color: #ff5400; }

    .ware_btn { width: 380px; margin-top: 20px; position: relative; }
    .ware_btn li { float: left; margin-right: 20px; cursor: pointer; }
    .btn_c1 a { display: block; width: 144px; height: 56px; background: url(${base}/static/img/btn.gif) 0 -268px; }
    .btn_c2 a { display: block; width: 144px; height: 56px; background: url(${base}/static/img/btn.gif) 0 -340px; }
    .btn_c3 a { display: block; width: 144px; height: 65px; background: url(images/default.gif); }

    .ware_cen { width: 333px; height: 129px; position: absolute; top: 50px; right: 10px; display: none-; }
    .ware_center { width: 316px; height: 112px; padding: 7px 4px 0; position: absolute; top: 0; left: 0; z-index: 2; background: #fff; border: 3px solid #dadada; }
    .ware_cen_bottom { width: 330px; height: 126px; position: absolute; bottom: -1px; right: -1px; z-index: 1; background: #8d8d8d; -moz-opacity: 0.5; opacity:.5; filter: alpha(opacity=50); }
    .ware_center h1 { background: url(images/login_h1.gif); height: 30px; }
    .dialog_title { background: #fff url(images/linebox_h1_span.gif) no-repeat 3px 3px; display: block; padding: 3px 10px 3px 15px; position: absolute; color: #656565; }

    .ware_cen_info_fun { width: 333px; height: 199px; position: absolute; top: 50px; right: 10px; display: none-; }
    .ware_center_info_fun { width: 316px; height: 182px; padding: 7px 4px 0; position: absolute; top: 0; left: 0; z-index: 2; background: #fff; border: 3px solid #dadada; }
    .ware_cen_bottom_info_fun { width: 330px; height: 196px; position: absolute; bottom: -1px; right: -1px; z-index: 1; background: #8d8d8d; -moz-opacity: 0.5; opacity:.5; filter: alpha(opacity=50); }
    .ware_cen_info_fun h1 { background: url(images/login_h1.gif); height: 30px; }

    .enter { width: 404px; height: 286px; position: absolute; top: 50%; left: 50%; margin: -142px 0 0 -202px; z-index: 1000; }
    .enter_ware_center { width: 386px; height: 269px; padding: 7px 4px 0; position: absolute; top: 0; left: 0; z-index: 2; background: #fff; border: 3px solid #dadada; }
    .enter_ware_center h1 { background: url(images/login_h1.gif); height: 30px; }
    .enter_ware_cen_bottom { width: 400px; height: 282px; position: absolute; bottom: 0; right: 0; z-index: 1; background: #8d8d8d; -moz-opacity: 0.5; opacity:.5; filter: alpha(opacity=50); }
    .enter .con { width: 83%; margin: 0 auto; }
    .suggestive { height: 28px; line-height: 28px; padding-left: 55px; background: #f4f4f4 url(images/suggestive.gif) no-repeat 20px 3px; border: 1px solid #ddd; color: #3f3f3f; margin: 10px 0; }
    .enter table { color: #676767; border-collapse: collapse; }
    .enter table td { padding: 5px 0; }
    .enter .text { border: 1px solid #c2c2c2; background: #fff url(images/text.gif) repeat-x; padding: 4px; font-family: Arial, Helvetica, sans-serif; color: #666; }
    .enter a { color: #c53900; }
    .enter a:hover { color: red; }
    .enter .btn1 { border: 0; width: 75px; height: 29px; background: url(images/enter_btn.gif) 0 0; }
    .enter .btn2 { border: 0; width: 75px; height: 29px; background: url(images/enter_btn.gif) -85px 0; }

    .close_link { width: 21px; height: 21px; padding-right: 10px; position: absolute; top: 7px; right: 4px; background: #fff url(images/dialog_close_button.gif) no-repeat right bottom; overflow: hidden; cursor: pointer; }
    .close_hover { width: 21px; height: 21px; padding-right: 10px; position: absolute; top: 7px; right: 4px; background: #fff url(images/dialog_close_button.gif) no-repeat right top; overflow: hidden; cursor: pointer; }

    .ware_cen_btn { padding: 10px 0 0 22px; }
    .ware_text_p { color: #666; margin-bottom: 8px; }
    .bold_num { font-weight: bold; font-size: 14px; color: #4a7911; }
    .bold_mly { font-weight: bold; font-size: 14px; color: #fc5b00; }
    .btn1 { width: 110px; height: 29px; border: 0; color: #c73702; font-weight: bold; font-size: 14px; font-size: 13px; background: url(${base}/static/img/btn.gif) 0 -410px; }
    .btn2 { width: 125px; height: 29px; border: 0; color: #4e4e4e; font-weight: bold; font-size: 14px; font-size: 13px; background: url(${base}/static/img/btn.gif) 0 -452px; }

    .float_layer_text { color: #b9b9b9; padding-bottom: 10px; }
    .fill_in_fun { width: 100%; overflow: hidden; padding-bottom: 10px; }
    .fill_in_fun li { width: 100%; overflow: hidden; float: left; padding-bottom: 10px; }
    .fill_in_fun li p { float: left; }
    .fill_in_fun .title { color: #666; padding-top: 4px; }
    .fill_in_fun .text { width: 165px; }
    .fill_in_fun .btn_fun { padding-left: 60px; }
    .fill_in_fun .btn_fun input { border: 0; width: 75px; height: 29px; font-weight: bold; color: #c53800; background: url(images/enter_btn.gif) no-repeat; }

    .user_menu { width: 760px; height: 30px; padding-left: 20px; background: url(images/user_menu.gif) repeat-x 0 bottom; position: relative; }
    .user_menu li { float: left; margin-right: 4px; }

    .user_menu .ornament1 { position: absolute; }
    .user_menu .ornament2 { position: absolute; }

    .user_menu .active { display: block; font-size: 12px; font-weight: bold; color: #3d3f3e; text-decoration: none; background: url(images/user_menu_nav.gif) no-repeat right -50px; }
    .user_menu .active span { display: block; padding: 8px 20px 8px 22px; background: url(images/user_menu_nav.gif) no-repeat left -100px; }
    .user_menu .normal { display: block; font-size: 12px; font-weight: bold; color: #3d3f3e; text-decoration: none; background: url(images/user_menu_nav.gif) no-repeat right 0; }
    .user_menu .normal:hover { color: red; }
    .user_menu .normal span { display: block; padding: 8px 20px 8px 22px; background: url(images/user_menu_nav.gif) no-repeat left -150px; }

    .option_box { width: 740px; padding: 0 20px; margin-bottom: 10px; _overflow-x:auto; }

    .grade { border: 1px solid #fee1b9; background: #fffcf3; margin-top: 15px; }

    .annals { padding: 15px 0 0 14px; width: 192px; overflow: hidden; }
    .annals li { float: left; padding: 0 8px 15px 0; }
    .annals li a { display: block; border: 1px solid #babcbb; width: 50px; height: 50px; padding: 1px; }
    .annals li a:hover { border: 1px solid #333; }

    .table_common { width: 780px; overflow: hidden; }
    .table_common table { width: 100%; border-collapse:collapse; }
    .table_common th { padding: 5px 0; color: #a3a3a3; font-weight: normal; }
    .table_common td { padding: 5px 0; text-align: center; color: #666; border-bottom: 1px dotted #d8d8d8; }

    .message_text2 { width: 100%; padding: 15px 0; line-height: 20px; overflow: hidden; border-bottom: 1px dotted #a99578;  }
    .message_text2 dl { width: 100%; position: relative; margin-bottom: 10px; overflow: hidden; }
    .message_text2 .light{ padding-left: 25px; }
    .leave_word dt { float: left; padding-left: 25px; font-weight: bold; color: #285bcc; }
    .leave_word dd { float: left; width: 500px; color: #3d3f3e; }
    .leave_word dd p { color: #888; }
    .leave_word p { position: absolute; top: 0; right: 20px; color: #666; }
    .leave_word .name { display: block; width: 175px; }
    .leave_word .date { display: block; width: 175px; }
    .revert_to dt { float: left; padding-left: 25px; font-weight: bold; color: #fe5504; }
    .revert_to dd { float: left; width: 500px; color: #fe5504; }
    .revert_to p { position: absolute; top: 0; right: 20px; color: #888; text-align: right; }
    .revert_to .name { display: block; width: 175px; }
    .revert_to .date { display: block; width: 175px; }

    .fill_in { width: 755px; padding: 10px 0 10px 25px; }
    .fill_in p { margin-bottom: 10px; }
    .fill_in textarea { width: 560px; height: 100px; overflow: auto; border: 1px solid #c2c2c2; background: #fff url(images/text.gif) repeat-x; padding: 4px; font-family: Arial, Helvetica, sans-serif; color: #666; }
    .fill_in .text { border: 1px solid #c2c2c2; background: #fff url(images/text.gif) repeat-x; padding: 4px; font-family: Arial, Helvetica, sans-serif; color: #666; }
    .fill_in .desc { float: left; }

    .buy_name { width: 92%; padding: 4%; overflow: hidden; }
    .buy_name li { width: 16.5%; line-height: 25px; float: left; color: #666; }
    /*
    * -------------------------------------------------------
    * ******************** end right.css *********************
    * -------------------------------------------------------
    */



</style>
<div id="shop">
    <div id="topbar">
        <div class="banner">
            <a href="${shop_index.link}" target="_blank"><img alt="${shop_index.name}" src="${shop_index.pic}" </a>
        </div>
        <div class="topbar_bg"></div>
    </div>
    <div id="left">
        <div class="user">
            <div class="user_photo">
                <h2>演示店铺</h2>
                <div class="photo"><a href="#"><img src="${merchant.pic}" width="100" height="100"></a></div>
                <p><a href="javascript:collect_store(3)">收藏该店铺</a></p>
            </div>

            <div class="user_data">
                <p>
                    <span>店主: </span>${merchantUser.userName}
                </p>
                <p>商品数量: ${size}</p>
                <p>所在地区: ${merchant.areaPath}</p>
                <p>创店时间: </p>
                <p>详细地址: ${merchant.address}</p>
                <p>联系电话: ${merchant.telphone}</p>
                <p>
                </p>
            </div>

            <div class="clear"></div>
        </div>

        <div class="module_common">
            <h2 class="common_title veins1">
                <div class="ornament1"></div>
                <div class="ornament2"></div>
                <span class="ico1"><span class="ico2">店内搜索</span></span>
            </h2>
            <div class="wrap">
                <div class="wrap_child">
                    <div class="web_search">
                        <form id="" name="" method="get" action="http://msj.pw/index.php">
                            <input type="hidden" name="app" value="store">
                            <input type="hidden" name="act" value="search">
                            <input type="hidden" name="id" value="3">
                            <input class="text width4" type="text" name="keyword">
                            <input class="btn" type="submit" value="">
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="module_common">
            <h2 class="common_title veins1">
                <div class="ornament1"></div>
                <div class="ornament2"></div>
                <span class="ico1"><span class="ico2">商品分类</span></span>
            </h2>
            <div class="wrap">
                <div class="wrap_child">
                    <ul class="submenu">
                        <li><a class="none_ico" href="#">全部商品</a></li>
                        <li>
                            <a class="block_ico" href="#">韩版女装</a>
                            <ul>
                                <li><a href="#">外套</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="module_common">
            <h2 class="common_title veins1">
                <div class="ornament1"></div>
                <div class="ornament2"></div>
                <span class="ico1"><span class="ico2">友情链接</span></span>
            </h2>
            <div class="wrap">
                <div class="wrap_child">
                    <ul class="submenu">
                        <li><a class="link_ico" href="#" target="_blank">ECMall</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div id="right">
        <div id="center" style=" height: 180px; border: 8px solid rgb(238, 238, 238);">

        </div>
        <div class="module_special">
            <h2 class="common_title veins2">
                <div class="ornament1"></div>
                <div class="ornament2"></div>
                <span class="ico1"><span class="ico2">全部商品</span></span>
            </h2>
            <div class="wrap">
                <div class="wrap_child">
                    <div class="major">
                        <ul class="list">
                            <#list goodsList as good>
                            <li>
                                <div class="pic"><a href="http://msj.pw/index.php?app=goods&id=1" target="_blank"><img src="${good.pic}" width="150" height="150"></a></div>
                                <h3><a href="http://msj.pw/index.php?app=goods&id=1" target="_blank">${good.name}</a></h3>
                                <p>￥${good.price}</p>
                            </li>
                            </#list>
                        </ul>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script type="text/javascript">
/*宽屏设置*/
pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
$(function () {
	
});
</script>
</html>