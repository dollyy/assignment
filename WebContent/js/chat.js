//==================弹窗提示====================//
$(function(){
    //=============提交成功提示=================//
    $(".submit_stu1, .submit_stu2").click(function(){
        $(".fix_confirm").show(0);
    })
    $(".submit_tea1, .submit_tea2").click(function(){
        $(".fix_confirm").show(0);
    })
    $(".sub").click(function(){
        $(".fix_confirm1").show(0);
    })
    
    //===============关闭提示===================//
    $(".close").click(function(){
        $(".fix_confirm").hide(0);
    })
     $(".close1").click(function(){
        $(".fix_confirm1").hide(0);
    })
    $(".confirm").click(function(){
        $(".fix_confirm").hide(0);
    })
    $(".confirm1").click(function(){
        $(".fix_confirm1").hide(0);
    })
})

//===================鼠标点击文本框事件=====================//

$(function(){
    
    $(".comment_stu1").focus(function(){
        var test = $(".comment_stu1").val();
        if (test == "同学交流:"){
            $(".comment_stu1").attr("value","");
        }
    })
    $(".comment_stu2").focus(function(){
        var test = $(".comment_stu2").val();
        if (test == "同学交流:"){
            $(".comment_stu2").attr("value","");
        }
    })
    
    //------------------------------------//
    $(".comment_stu1").blur(function(){
        var test = $(".comment_stu1").val();
        if (test == "" || test == null){
            $(".comment_stu1").attr("value","同学交流:");
        }
    })
    $(".comment_stu2").blur(function(){
        var test = $(".comment_stu2").val();
        if (test == "" || test == null){
            $(".comment_stu2").attr("value","同学交流:");
        }
    })

//------------------------------------//
    $(".comment_tea1").focus(function(){
        var test = $(".comment_tea1").val();
        if (test == "老师解答："){
            $(".comment_tea1").attr("value","");
        }
    })
    $(".comment_tea2").focus(function(){
        var test = $(".comment_tea2").val();
        if (test == "老师解答："){
            $(".comment_tea2").attr("value","");
        }
    })

//--------------------------------------//
    $(".comment_tea1").blur(function(){
        var test = $(".comment_tea1").val();
        if (test == "" || test == null){
            $(".comment_tea1").attr("value","老师解答：");
        }
    })
    $(".comment_tea2").blur(function(){
        var test = $(".comment_tea2").val();
        if (test == "" || test == null){
            $(".comment_tea2").attr("value","老师解答：");
        }
    })    
})

//=================鼠标拖拽文本框===============//

/*
$(function(){
    var x,y;
    var status = 0;      //鼠标初始状态为0，不可拖拽
    $(".fix_confirm").mousedown(function(e){
        status = 1;      //鼠标状态置为1，可以移动
       
        x = e.pageX - $(".fix_confirm").offset().left;
        y = e.pageY - $(".fix_confirm").offset().top;
        $(".fix_confirm").mousemove(function(e){
            if( status == 1){
                $(".fix_confirm").css({"left" : e.pageX - x + "px","top" : e.pageY - y + "px"})
            }
        }).mouseup(function(){
            status = 0;
        })
    })
})
*/