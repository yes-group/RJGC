$(function(){
  var e=$("");
$(".lll").change(function(){
e=e.add($(this));
});

$(document).ready(function(){
$(".aa").click(function(){
    $("#xx").slideToggle("slow");
  });
});


  $("#btn").click(function(){
var str="";
for(var i=0;i<e.length;i++){
var j=0;
var temp=e.eq(i).parent().siblings().add(e.eq(i).parent());
for(var k in temp){
if(e.eq(i).parent()[0]==temp[k]){
         break;
     }
j++;
}

$.ajax({
type: 'post',
url:"Teacher.jsp",
 data: {   
     sj:e.eq(i).val(),
     key:e.eq(i).parent().siblings().add(e.eq(i).parent()).first().children().val(),
     lie:j
 }

});
$(".p2").html("操作提示：信息修改成功！");
$(".td2").click(function(){$(".p2").html("操作提示：");});
}
});
});

$(document).ready(function(){
 $("#inde0").click(function(){
   $.ajax({
    url:"Teacher.jsp",
    data:{
    tno1:$("#inde").val()
}
});
$(".p2").html("操作提示：添加信息修改成功！");
window.location.reload();
});

});
$(document).ready(function(){
$("#inde").click(function(){$(".p2").html("操作提示：");});
$("#inde3").click(function(){$(".p2").html("操作提示：");});
});
$(document).ready(function(){
 $("#inde1").click(function(){
   $.ajax({ 
    url:"Teacher.jsp",
    data:{
    tno2:$("#inde3").val()
}
});
$(".p2").html("操作提示：删除信息修改成功！");
window.location.reload();
});
});