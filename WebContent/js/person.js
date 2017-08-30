$(function(){
    $(".index1").mouseover(function(){
        $(".index1").hide();
        $(".hover1").show();
    })
    $(".hover1").mouseleave(function(){
        $(".index1").show();
        $(".hover1").hide();
    })
    
    $(".index2").mouseover(function(){
        $(".index2").hide();
        $(".hover2").show();
    })
    $(".hover2").mouseleave(function(){
        $(".index2").show();
        $(".hover2").hide();
    })
    
    $(".index3").mouseover(function(){
        $(".index3").hide();
        $(".hover3").show();
    })
    $(".hover3").mouseleave(function(){
        $(".index3").show();
        $(".hover3").hide();
    })
    
    $(".index4").mouseover(function(){
        $(".index4").hide();
        $(".hover4").show();
    })
    $(".hover4").mouseleave(function(){
        $(".index4").show();
        $(".hover4").hide();
    })
    
    
    $(".hover1").click(function(){
        $(".index11").show().siblings().hide();
        $(".chart_").show().siblings().hide();
    })
    
    $(".hover2").click(function(){
        $(".index21").show().siblings().hide();
        $(".grade_").show().siblings().hide();
    })
    
    $(".hover3").click(function(){
        $(".index31").show().siblings().hide();
        $(".history_").show().siblings().hide();
    })
    
    $(".hover4").click(function(){
        $(".index41").show().siblings().hide();
        $(".message_").show().siblings().hide();
    })
})

function displaySubMenu(li) { 
	var subMenu = li.getElementsByTagName("ul")[0]; 
	subMenu.style.display = "block"; 
} 

function hideSubMenu(li) { 
	var subMenu = li.getElementsByTagName("ul")[0]; 
	subMenu.style.display = "none"; 
} 