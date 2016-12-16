setTimeout(a, 3000);
var num=0;
var picnum=2;
var maxpicnum=5;
function a() {
    $(".img3_1").fadeToggle(1000);
    setTimeout(b,1000);
    setTimeout(a, 3000);
}
function b(){
    $(".img3_1")[num].src="./img/head"+picnum+".jpg";
    picnum++;
    if((++num)==2){
        num=0;
    }
    if(picnum>maxpicnum){
        picnum=0;
    }
}
$(".login").click(function(){
for(var i=0;i<3;i++){
  if(  $(this)[0]  ==  $(".login")[i]  )
  {
     window.localStorage.setItem("ID",i);
     window.location.href="LoginFrom.jsp";
  }
}
});