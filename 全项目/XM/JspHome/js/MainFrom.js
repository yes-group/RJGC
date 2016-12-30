
$(".login").click(function(){
for(var i=0;i<3;i++){
  if(  $(this)[0]  ==  $(".login")[i]  )
  {
     window.localStorage.setItem("ID",i);
     window.location.href="LoginFrom.jsp";
  }
}
});

$(document).ready(function(){
  $('#div3').owlCarousel({
    items:1,
    loop:true,
    autoplay:true,
    margin:0,
    autoplayTimeout:1500
});
});
 