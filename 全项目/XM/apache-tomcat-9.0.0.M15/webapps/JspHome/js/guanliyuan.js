$(window).resize(function() {
	tableresize();
});

function tableresize() {
	$(".active .colw").attr("width", Math.ceil($(".bk")[0].offsetWidth / 8) + "px");
}
tableresize();
hdata = false;
tdata = "";
nextclick = true;
$("#xxrefresh").click(function() {
	refesh();
});
err=null;
$("#xxchange").click(function() {
	if(hdata == false) {
		alert("没有加载数据，或数据还未加载完成！");
		return;
	}
	if($("#xxchange").text() == "修改") {
		$("#xxchange").text("保存");
		$(".canw").removeAttr("readonly");
		alert("现在可以修改了，请修改后再次按下保存修改！");
	}
	else {
		$("#xxchange").text("修改");
		$('.canw').attr("readonly", "true");
		hdata=false;
		nextclick=false;
		alert("正在进行保存操作，请不要关闭浏览器，保存成功或失败都会收到提示！");
		$(".jdtc").css("width","0px");
		$(".jdt").css("display","block");
		err=new Array();
		udatetimes=0;
		for (var i=0;i<tdata.length;i++) {
			for (var j=1;j<tdata[i].length;j++) {
				if ($("#d"+i+"d"+j).val()!=tdata[i][j]) {
					$(".jdtc").css("width",((i*7+j)/(tdata.length*7)*400)+"px");
					udatetimes++;
					change(tdata[i][0],j,$("#d"+i+"d"+j).val());
				}
			}
		}
		setTimeout(waitsuccess,1000);
	}
});
function refesh(){
	if(nextclick == false) {
		return;
	}
	nextclick = false;
	hdata = false;
	$("#xxchange").text("修改");
	$('.canw').attr("readonly", "true");
	$.ajax({
		type: "POST",
		url: "selectTea.jsp",
		data: {
			"name": "1",
			"data": "1"
		},
		success: function(data) {
			if(msgcheak(data)) {
				$("#dataview").empty();
				tdata = new Array();
				for(var i = 0; i < data.data.length; i++) {
					var tr = $("<tr></tr>");
					tdata[i] = new Array();
					for(var j = 0; j < 8; j++) {
						tdata[i][j] = data.data[i][j];
						var td = $("<td></td>");
						var inp;
						if(j == 0) {
							inp = $('<input id="d' + i + 'd' + j + '" class="xxinput" readonly type="text" />');
						}
						else {
							inp = $('<input id="d' + i + 'd' + j + '" class="xxinput canw" readonly type="text" />');
						}
						inp.val(data.data[i][j]);
						td.append(inp);
						tr.append(td);
					}
					$('#dataview').append(tr);
				}
				hdata = true;
			}
			nextclick = true;
		},
		error: function(data) {
			alert("请求失败！");
			nextclick = true;
		},
		dataType: "json"
	});
}
function waitsuccess(){
	if (udatetimes==0) {
		$(".jdt").css("display","none");
		nextclick=true;
		if (err.length!=0) {
			var ans=prompt("本次提交有部分数据未成功提交，输入0放弃操作，输入1进行逐一尝试。","0");
			if(ans=="1"){
				var er=err;
				err=new Array();
				udatetimes=0;
				for (var i=0;i<er.length;i++) {
					ans=prompt("出错的教师编号："+er[i].no+"\n出错的列号："+(er[i].index+1)+"\n出错的数据："+er[i].data+"\n输入0放弃操作，输入1重新提交，输入2更改数据。","1");
					switch (ans){
						case "1":
							udatetimes++;
							change(er[i].no,er[i].index,er[i].data);
							break;
						case "2":
							var an=prompt("请输入新数据并提交。","");
							udatetimes++;
							change(er[i].no,er[i].index,an);
							break;
						default:
							break;
					}
				}
				setTimeout(waitsuccess,1000);
			}else{
				refesh();
				alert("修改完成！");
				nextclick=true;
			}
		} else{			
			refesh();
			alert("修改成功！");
		}
	} else{
		setTimeout(waitsuccess,1000);
	}
}
function change(no,index,dat){
	$.ajax({
		type: "POST",
		url: "updateTea.jsp",
		data: {
			"tno": no,
			"index":index,
			"data": dat
		},
		success: function(data) {
			if(msgcheak(data)==false) {
				var i=err.length;
				err[i]=new Object();
				err[i].no=no;
				err[i].index=index;
				err[i].data=dat;
			}
			udatetimes--;
		},
		error: function(data) {
			var i=err.length;
			err[i]=new Object();
			err[i].no=no;
			err[i].index=index;
			err[i].data=dat;
			udatetimes--;
		},
		dataType: "json"
	});
}
$(".daoh").click(function() {
	$(".xx.active").removeClass("active");
	$("."+$(this)[0].id).addClass("active");
});