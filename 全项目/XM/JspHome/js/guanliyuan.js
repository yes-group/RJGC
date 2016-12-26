$(window).resize(function() {
	tableresize();
});

function tableresize() {
	$(".colw").attr("width", Math.ceil($(".active .bk")[0].offsetWidth / 7) + "px");
	$(".colwe").attr("width", Math.ceil($(".active .bk")[0].offsetWidth / 8) + "px");
}
tableresize();
$(".js")[0].hdata = false; //初始没有数据
$(".js")[0].tdata = ""; //放置数据
$(".js")[0].nextclick = true; //允许刷新数据
$(".xs")[0].hdata = false; //初始没有数据
$(".xs")[0].tdata = ""; //放置数据
$(".xs")[0].nextclick = true; //允许刷新数据
$(".refresh").click(function() {
	refesh($(".active"));
});
err = null;
jdmax = 0;
jdnow = 0;
$(".change").click(function() {
	var chang = $(this);
	var target = chang.parents(".xx");
	var canw = target.find(".canw");
	var jdtc = target.find(".jdtc");
	var jdt = target.find(".jdt");
	if(target[0].hdata == false) {
		alert("没有加载数据，或数据还未加载完成！");
		return;
	}
	if(chang.text() == "修改") {
		chang.text("保存");
		canw.removeAttr("readonly");
		alert("请在表内修改后再次按下保存修改！");
	}
	else {
		chang.text("修改");
		canw.attr("readonly", "true");
		target[0].hdata = false;
		target[0].nextclick = false;
		alert("正在进行保存操作，请不要关闭浏览器，保存成功或失败都会收到提示！");
		target[0].jdnow = 0;
		target[0].jdmax = target[0].tdata.length * 7;
		setTimeout(function() {
			jdtc.css("width", "0px");
			jdt.css("display", "block");
			jdchange(target);
		}, 1);
		target[0].err = new Array();
		target[0].udatetimes = 0;
		for(var i = 0; i < target[0].tdata.length; i++) {
			for(var j = 1; j < target[0].tdata[i].length; j++) {
				if(target.find(".d" + i + "d" + j).val() != target[0].tdata[i][j]) {
					target[0].udatetimes++;
					change(target[0].tdata[i][0], j, target.find(".d" + i + "d" + j).val(), target);
				}
				else {
					target[0].jdnow++;
				}
			}
		}
		setTimeout(function() {
			waitsuccess(target);
		}, 1000);
	}
});

function jdchange(target) {
	if(target[0].nextclick) {
		target.find(".jdt").css("display", "none");
	}
	else {
		target.find(".jdtc").css("width", (target[0].jdnow / target[0].jdmax * 400) + "px");
		setTimeout(function() {
			jdchange(target);
		}, 20);
	}
}

function refesh(target) {
	if(target[0].nextclick == false) {
		return;
	}
	target[0].nextclick = false;
	target[0].hdata = false;
	target.find(".change").text("修改");
	target.find(".canw").attr("readonly", "true");
	var targeturl = "selectTea.jsp";
	var dv = target.find(".dataview");
	if($(".xs")[0] == target[0]) {
		targeturl = "selectStu.jsp";
	}
	$.ajax({
		type: "POST",
		url: targeturl,
		data: {
			"data": "-1"
		},
		success: function(data) {
			if(msgcheak(data)) {
				dv.empty();
				target[0].tdata = data.data;
				for(var i = 0; i < data.data.length; i++) {
					var tr = $("<tr></tr>");
					for(var j = 0; j < data.data[i].length; j++) {
						var td = $("<td></td>");
						var inp;
						if(j == 0) {
							inp = $('<input class="d' + i + 'd' + j + ' xxinput" readonly type="text" />');
						}
						else {
							inp = $('<input class="d' + i + 'd' + j + ' xxinput canw" readonly type="text" />');
						}
						inp.val(data.data[i][j]);
						td.append(inp);
						tr.append(td);
					}
					dv.append(tr);
				}
				target[0].hdata = true;
			}
			target[0].nextclick = true;
		},
		error: function(event) {
			alert("请求失败！");
			target[0].nextclick = true;
		},
		dataType: "json"
	});
}

function waitsuccess(target) {
	if(target[0].udatetimes == 0) {
		target[0].nextclick = true;
		var er = target[0].err;
		target[0].err = new Array();
		if(er.length != 0) {
			var ans = prompt("本次提交有部分数据未成功提交，输入0放弃操作，输入1进行逐一尝试。", "0");
			if(ans == "1") {
				target[0].udatetimes = 0;
				for(var i = 0; i < er.length; i++) {
					ans = prompt("出错的编号：" + er[i].no + "\n出错的列：" + target.find(".d" + er[i].index).text() + "\n出错的数据：" + er[i].data + "\n点击确定重新提交，点击取消保留原值。", er[i].data);
					if(ans!=null) {
						target[0].udatetimes++;
						change(er[i].no, er[i].index, ans,target);
					}
				}
				setTimeout(function() {
					waitsuccess(target);
				}, 1000);
			}
			else {
				refesh(target);
				alert("修改完成！");
				target[0].nextclick = true;
			}
		}
		else {
			refesh(target);
			alert("修改成功！");
		}
	}
	else {
		setTimeout(function() {
			waitsuccess(target);
		}, 1000);
	}
}

function change(no, index, dat,target) {
	var targeturl = "updateTea.jsp";
	if($(".xs")[0] == target[0]) {
		targeturl = "updateStu.jsp";
	}
	$.ajax({
		type: "POST",
		url: targeturl,
		data: {
			"no": no,
			"index": index,
			"data": dat
		},
		success: function(data) {
			if(msgcheak(data) == false) {
				var i = target[0].err.length;
				target[0].err[i] = new Object();
				target[0].err[i].no = no;
				target[0].err[i].index = index;
				target[0].err[i].data = dat;
			}
			target[0].udatetimes--;
			target[0].jdnow++;
		},
		error: function(data) {
			var i = target[0].err.length;
			target[0].err[i] = new Object();
			target[0].err[i].no = no;
			target[0].err[i].index = index;
			target[0].err[i].data = dat;
			target[0].udatetimes--;
			target[0].jdnow++;
		},
		dataType: "json"
	});
}
$(".daoh").click(function() {
	$(".xx.active").removeClass("active");
	$("." + $(this)[0].id).addClass("active");
	tableresize();
});
$(".add").click(function() {
	var add = $(this);
	var target = add.parents(".xx");
	var no=target.find(".gh").val();
	if(no>2147483647){
		alert("不能超过2147483647！");
		return;
	}
	var targeturl="insertTea.jsp";
	if (target[0]==$(".xs")[0]) {
		targeturl="insertStu.jsp";
	}
	$.ajax({
		type: "POST",
		url: targeturl,
		data: {
			"no": no
		},
		success: function(data) {
			if(msgcheak(data)) {
				refesh(target);
				alert("增加"+no+"成功！");
			}
		},
		error: function(data) {
			alert("增加"+no+"失败！");
		},
		dataType: "json"
	});
});
$(".del").click(function() {
	var del = $(this);
	var target = del.parents(".xx");
	var no=target.find(".gh").val();
	var targeturl="deleteTea.jsp";
	if (target[0]==$(".xs")[0]) {
		targeturl="deleteStu.jsp";
	}
	$.ajax({
		type: "POST",
		url: targeturl,
		data: {
			"no": no
		},
		success: function(data) {
			if(msgcheak(data)) {
				refesh(target);
				alert("删除"+no+"成功！");
			}
		},
		error: function(data) {
			alert("删除"+no+"失败！");
		},
		dataType: "json"
	});
});
$("#logout").click(function() {
	var no=$("#user").text();
	$.ajax({
		type: "POST",
		url: "logout.jsp",
		success: function(data) {
			if(msgcheak(data)==false) {
				alert("登出失败！请稍后重试！");
			}
		},
		error: function(data) {
			alert("登出失败！请稍后重试！");
		},
		dataType: "json"
	});
});