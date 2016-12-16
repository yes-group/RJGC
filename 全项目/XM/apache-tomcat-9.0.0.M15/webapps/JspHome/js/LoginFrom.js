window.onload = function a() {
	$("#Sl").get(0).selectedIndex = window.localStorage.getItem("ID");
	$(".account").val(window.localStorage.getItem("us"));
	$(".password").val(window.localStorage.getItem("pw"));
}
$(".a2_2").click(function() {
	var save = $(".c2_1").get(0).checked;
	var us = $(".account").val();
	var pw = $(".password").val();
	var id = $("#Sl").get(0).selectedIndex;
	$.ajax({
		type: "POST",
		url: "login.jsp",
		data: {
			"user": us,
			"password": pw,
			"ID": id
		},
		success: function(data) {
			if(msgcheak(data)) {
				if(save) {
					window.localStorage.setItem("us", us);
					window.localStorage.setItem("pw", pw);
					window.localStorage.setItem("ID", id);
				}
				else {
					window.localStorage.removeItem("us");
					window.localStorage.removeItem("pw");
				}
			}
		},
		error: function(data) {
			alert("登录失败！");
		},
		dataType: "json"
	});
});