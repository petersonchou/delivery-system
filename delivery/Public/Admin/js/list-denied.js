//判断上一页和下一页是否可用
function judge(pageNow, totalPages){
    if(totalPages==1){
        $(".btn_prev").addClass('disabled');
        $(".btn_next").addClass('disabled');
        $(".btn_front").addClass('disabled');
        $(".btn_end").addClass('disabled');
    }else if(pageNow == 1){
        $(".btn_next").removeClass('disabled');
        $(".btn_prev").addClass('disabled');
        $(".btn_front").addClass('disabled');
        $(".btn_end").removeClass('disabled');
    }else if(pageNow == totalPages){
        $(".btn_next").addClass('disabled');
        $(".btn_prev").removeClass('disabled');
        $(".btn_front").removeClass('disabled');
        $(".btn_end").addClass('disabled');
    }else{
        $(".btn_next").removeClass('disabled');
        $(".btn_prev").removeClass('disabled');
        $(".btn_front").removeClass('disabled');
        $(".btn_end").removeClass('disabled');
    }
};

//无刷新基于动态数据来显示数据
function list_dynamic(dynamic, pagenow, pagesize){
    $(".tablebody").html("");
    if(dynamic.length==0){
        layer.msg('暂时没有相关数据！', function(){});
    }else{
        var totalrows = dynamic.length;
        var totalpages = Math.ceil(totalrows/pagesize);
        var start_row = (pagenow-1)*pagesize + 1;
        if(pagenow < totalpages){
            var end_row = start_row + pagesize - 1;
        }else{
            var end_row = totalrows;
        }
        for(var i=start_row-1; i<end_row; i++){
            var part = "<td style='color:red'><b>未通过</b></td><td><button class='btn btn-default btn_look' title='查看'><i class='icon-camera'></i></button>&nbsp;&nbsp;<button class='btn btn-default btn_recover' title='重审'><i class='icon-hand-up'></i></button>&nbsp;&nbsp;<button class='btn btn-default btn_admit' title='通过'><i class='icon-thumbs-up'></i></button></td></tr>";
            var title = dynamic[i]["title"];
            if(dynamic[i]["title"].length>10){
                title = title.substring(0, 10) + "...";
            }
            var row = $("<tr><td class='rowid' style='display:none'>"+dynamic[i]["id"]+"</td><td>"+(i+1)+"</td><td>"+title+"</td><td>"+dynamic[i]["username"]+"</td><td>"+dynamic[i]["author"]+"</td><td>"+dynamic[i]["postdate"]+"</td>"+part);
            $(".tablebody").append(row);
        }
    }
    
}

//对分页控件进行更新操作
function show_pagenum(dynamic, pagenow, pagesize, pageulsize){
    $(".ulpage").children(".pageNum").remove();
    if(dynamic.length==0){
        $(".ulpage").hide();
    }else{
        $(".ulpage").show();
        var totalrows = dynamic.length;
        var totalpages = Math.ceil(totalrows/pagesize);
        var group_size = Math.ceil(totalpages / pageulsize);
        var group_index = Math.ceil(pagenow / pageulsize);
        if(group_index != group_size){
            for(var i=(group_index-1)*pageulsize+1;i<=group_index*pageulsize;i++){                        
                if(i == pagenow){
                    var pageNum = $("<li class='pageNum active'><a href='javascript:void(0)'>"+i+"</a></li>");
                }else{
                    var pageNum = $("<li class='pageNum'><a href='javascript:void(0)'>"+i+"</a></li>");
                }
                $(".btn_next").before(pageNum);
            }
        }else{
            for(var i=(group_index-1)*pageulsize+1;i<=totalpages;i++){
                if(i == pagenow){
                    var pageNum = $("<li class='pageNum active'><a href='javascript:void(0)'>"+i+"</a></li>");
                }else{
                    var pageNum = $("<li class='pageNum'><a href='javascript:void(0)'>"+i+"</a></li>");
                }                        
                $(".btn_next").before(pageNum);
            }
        }
        $(".pn").text(pagenow);
        $(".totalpages").text(totalpages);
        $(".totalrows").text(totalrows);
        judge(pagenow, totalpages);
    }    
}

function getDepartInfo(dynamic, value){
    var new_arr = new Array();
    var index = 0;
    for(var i=0;i<dynamic.length;i++){
        if(dynamic[i]["username"]==value){
            new_arr[index] = dynamic[i];
            index = index + 1;
        }
    }
    return new_arr;
}

function sort_dynamic(dynamic, keyvalue){
        if(keyvalue == "postdate"){
            dynamic.sort(function(x, y){
                return y[keyvalue].localeCompare(x[keyvalue]);
            });
        }else{
            dynamic.sort(function(x, y){
                return x[keyvalue].localeCompare(y[keyvalue]);
            });
        }
        return dynamic;
}

function search_dynamic(dynamic, keyword){
    var new_arr = new Array();
    var index = 0;
    for(var i=0; i<dynamic.length; i++){
        if(dynamic[i]["id"].match(keyword)!=null || dynamic[i]["title"].match(keyword)!=null || dynamic[i]["author"].match(keyword)!=null || dynamic[i]["postdate"].match(keyword)!=null || dynamic[i]["username"].match(keyword)!=null ){
            new_arr[index] = dynamic[i];
            index = index + 1;
        }
    }
    return new_arr;
}

function checkStrLen(){
    var maxNum = 1200;
    var ie = jQuery.support.htmlSerialize;
    var tex = $("#modal_edit .mycontent");
    var but = $("#modal_edit .btn_save");
    var str = 0;
    var abcnum = 0;
    var texts= 0;
    tex.focus(function(){
        if($(this).val()==""){
            $("#modal_edit .tip").html("您总共可以输入600个字");
        }
    });
    if(ie){
        tex[0].oninput = changeNum;
    }else{
        tex[0].onpropertychange  = changeNum;
    }

    function changeNum(){
        //汉字的个数
        str = (tex.val().replace(/\w/g,"")).length;
        //非汉字的个数
        abcnum = tex.val().length-str;             
        total = str*2+abcnum;               
        if(total<maxNum || total == maxNum){
                texts =Math.ceil((maxNum - total)/2);
                $("#modal_edit .tip").html("您还可以输入的字数：<span>"+texts+"</span>").children().css({"color":"green"});
                $("#modal_edit .btn_save").removeClass("disabled");
        }else if(total>maxNum){
                but.addClass("grey");
                texts = Math.ceil((total-maxNum)/2);
                $("#modal_edit .tip").html("您输入的字符超过了<span>"+texts+"</span>").children("span").css({"color":"red"});
                $("#modal_edit .btn_save").addClass("disabled");
        }    
    }
}

function checkStrLen_add(){
    var maxNum = 1200;
    var ie = jQuery.support.htmlSerialize;
    var tex = $("#modal_add .mycontent");
    var but = $("#modal_add .btn_save");
    var str = 0;
    var abcnum = 0;
    var texts= 0;
    tex.focus(function(){
        if($(this).val()==""){
            $("#modal_add .tip").html("您总共可以输入600个字");
        }
    });
    if(ie){
        tex[0].oninput = changeNum;
    }else{
        tex[0].onpropertychange  = changeNum;
    }

    function changeNum(){
        //汉字的个数
        str = (tex.val().replace(/\w/g,"")).length;
        //非汉字的个数
        abcnum = tex.val().length-str;             
        total = str*2+abcnum;               
        if(total<maxNum || total == maxNum){
                texts =Math.ceil((maxNum - total)/2);
                $("#modal_add .tip").html("您还可以输入的字数：<span>"+texts+"</span>").children().css({"color":"green"});
                $("#modal_add .btn_post").removeClass("disabled");
        }else if(total>maxNum){
                but.addClass("grey");
                texts = Math.ceil((total-maxNum)/2);
                $("#modal_add .tip").html("您输入的字符超过了<span>"+texts+"</span>").children("span").css({"color":"red"});
                $("#modal_add .btn_post").addClass("disabled");
        }    
    }
}