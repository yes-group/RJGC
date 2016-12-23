$('.datetimepicker').datetimepicker({
	format: 'yyyy-MM-dd',
	language: 'cn',
	pickDate: true,
	weekStart: 0,
	pickTime: false,
	inputMask: false,
	startDate: new Date(new Date().getFullYear() - 25, 0, 1, 8, 0, 0),
	endDate: new Date(new Date().getFullYear() - 15, 0, 1),
	initialDate: new Date(new Date().getFullYear() - 20, 0, 1, 8, 0, 0)
});
/*
datetimepicker使用参考文档，源自于bootstrap-datetimepicker，备注是我写的
 * format
String. 默认值: 'mm/dd/yyyy'

日期格式， p, P, h, hh, i, ii, s, ss, d, dd, m, mm, M, MM, yy, yyyy 的任意组合。
p : meridian in lower case ('am' or 'pm') - according to locale file
P : meridian in upper case ('AM' or 'PM') - according to locale file
s : seconds without leading zeros
ss : seconds, 2 digits with leading zeros
i : minutes without leading zeros
ii : minutes, 2 digits with leading zeros
h : hour without leading zeros - 24-hour format
hh : hour, 2 digits with leading zeros - 24-hour format
H : hour without leading zeros - 12-hour format
HH : hour, 2 digits with leading zeros - 12-hour format
d : day of the month without leading zeros
dd : day of the month, 2 digits with leading zeros
m : numeric representation of month without leading zeros
mm : numeric representation of the month, 2 digits with leading zeros
M : short textual representation of a month, three letters
MM : full textual representation of a month, such as January or March
yy : two digit representation of a year
yyyy : full numeric representation of a year, 4 digits

 * weekStart
Integer. 默认值：0

一周从哪一天开始。0（星期日）到6（星期六）

 * startDate
Date. 默认值：开始时间

The earliest date that may be selected; all earlier dates will be disabled.

 * endDate
Date. 默认值：结束时间

The latest date that may be selected; all later dates will be disabled.

 * daysOfWeekDisabled
String, Array. 默认值: '', []

Days of the week that should be disabled. Values are 0 (Sunday) to 6 (Saturday). 
Multiple values should be comma-separated. Example: disable weekends: '0,6' or [0,6].

 * autoclose
Boolean. 默认值：false

当选择一个日期之后是否立即关闭此日期时间选择器。

 * startView
Number, String. 默认值：2, 'month'

日期时间选择器打开之后首先显示的视图。 可接受的值：

0 or 'hour' for the hour view
1 or 'day' for the day view
2 or 'month' for month view (the default)
3 or 'year' for the 12-month overview
4 or 'decade' for the 10-year overview. Useful for date-of-birth datetimepickers.

 * minView
Number, String. 默认值：0, 'hour'

日期时间选择器所能够提供的最精确的时间选择视图。

 * maxView
Number, String. 默认值：4, 'decade'

日期时间选择器最高能展示的选择范围视图。

 * todayBtn
Boolean, "linked". 默认值: false

如果此值为true 或 "linked"，则在日期时间选择器组件的底部显示一个 "Today" 按钮用以选择当前日期。
如果是true的话，"Today" 按钮仅仅将视图转到当天的日期，如果是"linked"，当天日期将会被选中。

 * todayHighlight
Boolean. 默认值: false

如果为true, 高亮当前日期。

 * keyboardNavigation
Boolean. 默认值: true

是否允许通过方向键改变日期。

 * language
String. 默认值: 'en'(备注：'cn'是我手动加进去的，所以可以使用)

The two-letter code of the language to use for month and day names.
These will also be used as the input's value (and subsequently sent to the server in the case of form submissions). 
Currently ships with English ('en'), German ('de'), Brazilian ('br'), 
and Spanish ('es') translations, but others can be added (see I18N below).
If an unknown language code is given, English will be used.

 * forceParse
Boolean. 默认值: true

当选择器关闭的时候，是否强制解析输入框中的值。也就是说，当用户在输入框中输入了不正确的日期，选择器将会尽量解析输入的值，
并将解析后的正确值按照给定的格式format设置到输入框中。

 * minuteStep
Number. 默认值: 5

此数值被当做步进值用于构建小时视图。对于每个 minuteStep 都会生成一组预设时间（分钟）用于选择。

 * pickerReferer : 不建议使用
String. 默认值: 'default' (other value available : 'input')

The referer element to place the picker for the component implementation.
If you want to place the picker just under the input field, just specify input.

 * pickerPosition
String. 默认值: 'bottom-right' (还支持 : 'bottom-left')

此选项当前只在组件实现中提供支持。通过设置选项可以讲选择器放倒输入框下方。

 * viewSelect
Number or String. 默认值: same as minView (supported values are: 'decade', 'year', 'month', 'day', 'hour')

With this option you can select the view from which the date will be selected. By default it's the last one, 
however you can choose the first one, so at each click the date will be updated.

 * showMeridian
Boolean. 默认值: false

This option will enable meridian views for day and hour views.

 * initialDate
Date or String. 默认值: new Date()

You can initialize the viewer with a date. By default it's now, so you can specify yesterday or today at midnight.
(备注：这个值决定了在最开始打开显示的时间，new Date()用于获取当前时间，即使这个值不在时间范围允许内，
也会默认选中这个时间，只是无法确认选择这个时间。
PS:这个属性官方文档有记录，然而我下载的并没有支持，所以此属性的功能是我自己补上去的，可能存在不稳定情况！！！出现问题即不要提供此属性！！！)
* */
function refesh() {
	$.ajax({
		type: "POST",
		url: "selectStu.jsp",
		data: {
			"data": $("#user").text()
		},
		success: function(data) {
			if(msgcheak(data)) {
				$("#no").text(data.data[0][0]);
				$("#name").text(data.data[0][1]);
				$("#sex").val(data.data[0][2]);
				$("#bday").val(data.data[0][3]);
				$("#date").text(data.data[0][4]);
				$("#class").text(data.data[0][5]);
				$("#zzmm").val(data.data[0][6]);
				$("#jg").val(data.data[0][7]);
				msgalert(0, "数据加载完成！");
			}
		},
		error: function(data) {

		},
		dataType: "json"
	});
}
times=0;
function save() {
	msgalert(0,"正在保存到服务器！");
	var adata = new Object();
	adata["2"] = $("#sex").val();
	adata["3"] = $("#bday").val();
	adata["6"] = $("#zzmm").val();
	adata["7"] = $("#jg").val();
	times=4;
	for (i in adata) {
		$.ajax({
			type: "POST",
			url: "updateStu.jsp",
			data: {
				"no":$("#user").text(),
				"index":i,
				"data":adata[i]
			},
			success: function(data) {
				if (msgcheak(data)) {
					times--;
				}else{
					times=-1;
					msgalert(2,'保存“'+data.data+'”失败！');
				}
			},
			error: function(data) {
				times=-1;
				msgalert(2,"保存"+bdata+"失败！");
			},
			dataType: "json"
		});
		
	}
	setTimeout(waitsucess,500);
}
function waitsucess () {
	if (times>0) {
		setTimeout(waitsucess,500);
	} else if(times==0){
		msgalert(1,"保存成功！");
	}
}
$("#save").click(function() {
	save();
});
$("#refesh").click(function() {
	refesh();
});

function msgalert(index, msg) {
	var form = "info";
	var tip = "信息：";
	switch(index) {
		case 1:
			form = "success";
			tip = "成功：";
			break;
		case 2:
			form = "danger";
			tip = "警告：";
			break;
	}
	var temp = $('<div class="alert alert-' +
		form +
		' fristAlert clearfix fade in"><a class="close" data-dismiss="alert">×</a><strong>' +
		tip +
		'</strong>' +
		msg +
		'</div>');
	$("body").append(temp);
}
refesh();
$("#logout").click(function() {
	var no=$("#user").text();
	$.ajax({
		type: "POST",
		url: "logout.jsp",
		data: {
			"no": no
		},
		success: function(data) {
			if(msgcheak(data)==false) {
			}
		},
		error: function(data) {
			alert("登出失败！请稍后重试！");
		},
		dataType: "json"
	});
});