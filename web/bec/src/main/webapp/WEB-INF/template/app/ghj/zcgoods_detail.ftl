﻿/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.dialog.add('colordialog',function(a){var b=CKEDITOR.dom.element,c=CKEDITOR.document,d=a.lang.colordialog,e,f={type:'html',html:'&nbsp;'},g;function h(){c.getById(u).removeStyle('background-color');e.getContentElement('picker','selectedColor').setValue('');g&&g.removeAttribute('aria-selected');g=null;};function i(w){var x=w.data.getTarget(),y;if(x.getName()=='td'&&(y=x.getChild(0).getHtml())){g=x;g.setAttribute('aria-selected',true);e.getContentElement('picker','selectedColor').setValue(y);}};function j(w){w=w.replace(/^#/,'');for(var x=0,y=[];x<=2;x++)y[x]=parseInt(w.substr(x*2,2),16);var z=0.2126*y[0]+0.7152*y[1]+0.0722*y[2];return '#'+(z>=165?'000':'fff');};var k,l;function m(w){!w.name&&(w=new CKEDITOR.event(w));var x=!/mouse/.test(w.name),y=w.data.getTarget(),z;if(y.getName()=='td'&&(z=y.getChild(0).getHtml())){o(w);x?k=y:l=y;if(x){y.setStyle('border-color',j(z));y.setStyle('border-style','dotted');}c.getById(s).setStyle('background-color',z);c.getById(t).setHtml(z);}};function n(){var w=k.getChild(0).getHtml();k.setStyle('border-color',w);k.setStyle('border-style','solid');c.getById(s).removeStyle('background-color');c.getById(t).setHtml('&nbsp;');k=null;};function o(w){var x=!/mouse/.test(w.name),y=x&&k;if(y){var z=y.getChild(0).getHtml();y.setStyle('border-color',z);y.setStyle('border-style','solid');}if(!(k||l)){c.getById(s).removeStyle('background-color');c.getById(t).setHtml('&nbsp;');}};function p(w){var x=w.data,y=x.getTarget(),z,A,B=x.getKeystroke(),C=a.lang.dir=='rtl';switch(B){case 38:if(z=y.getParent().getPrevious()){A=z.getChild([y.getIndex()]);A.focus();}x.preventDefault();break;case 40:if(z=y.getParent().getNext()){A=z.getChild([y.getIndex()]);if(A&&A.type==1)A.focus();}x.preventDefault();break;case 32:case 13:i(w);x.preventDefault();break;case C?37:39:if(A=y.getNext()){if(A.type==1){A.focus();x.preventDefault(true);}}else if(z=y.getParent().getNext()){A=z.getChild([0]);if(A&&A.type==1){A.focus();x.preventDefault(true);}}break;case C?39:37:if(A=y.getPrevious()){A.focus();x.preventDefault(true);}else if(z=y.getParent().getPrevious()){A=z.getLast();A.focus();x.preventDefault(true);}break;default:return;}};function q(){v=CKEDITOR.dom.element.createFromHtml('<table tabIndex="-1" aria-label="'+d.options+'"'+' role="grid" style="border-collapse:separate;" cellspacing="0">'+'<caption class="cke_voice_label">'+d.options+'</caption>'+'<tbody role="presentation"></tbody></table>');v.on('mouseover',m);v.on('mouseout',o);var w=['00','33','66','99','cc','ff'];
function x(C,D){for(var E=C;E<C+3;E++){var F=new b(v.$.insertRow(-1));F.setAttribute('role','row');for(var G=D;G<D+3;G++)for(var H=0;H<6;H++)y(F.$,'#'+w[G]+w[H]+w[E]);}};function y(C,D){var E=new b(C.insertCell(-1));E.setAttribute('class','ColorCell');E.setAttribute('tabIndex',-1);E.setAttribute('role','gridcell');E.on('keydown',p);E.on('click',i);E.on('focus',m);E.on('blur',o);E.setStyle('background-color',D);E.setStyle('border','1px solid '+D);E.setStyle('width','14px');E.setStyle('height','14px');var F=r('color_table_cell');E.setAttribute('aria-labelledby',F);E.append(CKEDITOR.dom.element.createFromHtml('<span id="'+F+'" class="cke_voice_label">'+D+'</span>',CKEDITOR.document));};x(0,0);x(3,0);x(0,3);x(3,3);var z=new b(v.$.insertRow(-1));z.setAttribute('role','row');for(var A=0;A<6;A++)y(z.$,'#'+w[A]+w[A]+w[A]);for(var B=0;B<12;B++)y(z.$,'#000000');};var r=function(w){return CKEDITOR.tools.getNextId()+'_'+w;},s=r('hicolor'),t=r('hicolortext'),u=r('selhicolor'),v;q();return{title:d.title,minWidth:360,minHeight:220,onLoad:function(){e=this;},onHide:function(){h();n();},contents:[{id:'picker',label:d.title,accessKey:'I',elements:[{type:'hbox',padding:0,widths:['70%','10%','30%'],children:[{type:'html',html:'<div></div>',onLoad:function(){CKEDITOR.document.getById(this.domId).append(v);},focus:function(){(k||this.getElement().getElementsByTag('td').getItem(0)).focus();}},f,{type:'vbox',padding:0,widths:['70%','5%','25%'],children:[{type:'html',html:'<span>'+d.highlight+'</span>\t\t\t\t\t\t\t\t\t\t\t\t<div id="'+s+'" style="border: 1px solid; height: 74px; width: 74px;"></div>\t\t\t\t\t\t\t\t\t\t\t\t<div id="'+t+'">&nbsp;</div><span>'+d.selected+'</span>\t\t\t\t\t\t\t\t\t\t\t\t<div id="'+u+'" style="border: 1px solid; height: 20px; width: 74px;"></div>'},{type:'text',label:d.selected,labelStyle:'display:none',id:'selectedColor',style:'width: 74px',onChange:function(){try{c.getById(u).setStyle('background-color',this.getValue());}catch(w){h();}}},f,{type:'button',id:'clear',style:'margin-top: 5px',label:d.clear,onClick:h}]}]}]}]};});
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <#-- <img src="${path}/images/pic7.jpg">-->
        </div>
    </div>



</section>
<!---1_活动未开始，2_进行中，3_已结束-->
<div class="pro_but">
    <div class="fl">

        <div class="gz" onclick="addGoodsAttention('${goods.id}')"><strong>添加关注：</strong><i><img src="${path}/images/u_bg6.png"></i></div>
        <!--<div class="gz"><strong style="color:#e12f45;">已关注：</strong><i><img src="images/u_bg4.png"></i></div>-->
    </div>
    <a href="javascript:void(0)" onclick="<#if status ==1>popAlert('活动尚未开始,尽请期待！');</#if><#if status ==2>xdzc('${goods.id}')</#if><#if status ==3>popAlert('活动已经结束！');</#if>" class="fr mr10">下单支持</a>
</div>

<div class="return" style="bottom:70px;">
    <a id="backToTop" style="display: none;" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
</div>
</body>
<script type="text/javascript" src="${path}/js/circle.js"></script>
<script src="${path}/js/jquery.lazyload.min.js"></script>
<script>
    (function(mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack:true
        });
        jQuery("img[name='imgSilder']").lazyload({
            effect: "fadeIn"
        });
        jQuery('#backToTop').bind("tap", function () {
            jQuery('html,body').animate({scrollTop: '0px'}, 100);
        });
    }(mui, document));
    $(window).scroll(function(){
        if ($(window).scrollTop()>100){
            $("#backToTop").fadeIn(500);
        }else{
            $("#backToTop").fadeOut(500);
        }
    });
    //下单支持
    function xdzc(goodsId){
        //验证用户已购数量
        var maxNum = #{goods.buyMaxNum}; //允许购买最大数量,为0时为不限制
        var hadBuyNum = <#if zhongChouSumQuantity?exists>#{zhongChouSumQuantity}<#else>0</#if>; //当前用户已购买众筹
        if(parseInt(maxNum)!=0) {
            if(parseInt(hadBuyNum)>=parseInt(maxNum)) {
                popAlert('亲, 您已经购买了最大数量的众筹商品！');
                return;
            }
        }

        jumpto(fullpath + '/zcorder/ordercheck/${goods.id}.html?whichclient=whichapp');
    }
    /**
     * Desc:关注商品
     * Auth:liuxiaobing
     * Time:2015-12-7 10:50:35
     */
    function addGoodsAttention(goodsId) {
        $.ajax({
            type: "get",
            url: "${base}/goods/addToGoodsAttention",
            data: "goodsId="+goodsId,
            success: function(data) {
                if(data.status=='success'){
                    popAlert(data.message);
                    $(".gz").html('<strong style="color:#e12f45;">已关注：</strong><i><img src="${path}/images/u_bg4.png"></i>')
                }else if(data.status=='warn'){
                    popAlert(data.message);
                    $(".gz").html('<strong style="color:#e12f45;">已关注：</strong><i><img src="${path}/images/u_bg4.png"></i>')
                }else if(data.status=='NOLOGIN'){
                    popAlert('登录后才可关注商品');
                }else{
                    popAlert(data.message);
                }

            }
        });
    }
    window.onload=ck_gz('${goods.id}');
    function ck_gz(goodsId){
        $.ajax({
            type: "get",
            url: "${base}/goods/isGoodsAttention",
            data: "goodsId="+goodsId,
            success: function(data) {
                if(data.status=='warn'){
                    $(".gz").html('<strong style="color:#e12f45;">已关注：</strong><i><img src="${path}/images/u_bg4.png"></i>')
                }
            }
        });
    }

</script>
</html>