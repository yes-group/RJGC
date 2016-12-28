<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="db.Condb"%>
<jsp:useBean id="db" class="db.Condb" scope="page"></jsp:useBean>
<%
Cookie cookies[]=request.getCookies();
if(cookies!=null){
	for(Cookie sCookie:cookies){
		if(sCookie!=null){
			if(("cookie").equals(sCookie.getName())){
				if(db.initialize()&&db.cheakislogin(sCookie.getValue())&&db.cookieid()==2){
%><!DOCTYPE >
<html lang="zh-CN">
	<head>
		<meta charset="utf-8" />
		<title>学生管理界面</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- 引入 Bootstrap -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/bootstrap-datetimepicker.min.css" />
		<link rel="stylesheet" type="text/css" href="css/xuesheng.css" />
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap-datetimepicker.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/bootstrap.min.js"></script>
		<style type="text/css">
			*{
				z-index: 5;
			}
			.bg {
				position: fixed;
				margin-left: 800px;
				height: auto;
				width: 400px;
			}
			.bgleft {
				position: fixed;
				padding: 0;
				z-index: -1;
			}
			.bgleft > img {
				position: relative;
				padding: 0;
			}
			.alert{
				position: relative;
			}
			.dropdown.open{
				z-index: 6;
			}
			.tab-pane{
				position: relative;
			}
		</style>
	</head>
	<body>
		<canvas id="animation" width="1000px" height="1000px" style=" left:0px;position: absolute;z-index: 2;"></canvas>
		<div class="col-sm-pull-1 col-lg-pull-0 col-lg-push-1 col-lg-12 bgleft" style="z-index: 1;">
			<img src="img/bgleft.jpg" class="col-sm-push-4 col-md-push-2 col-lg-push-0 col-lg-pull-1 col-lg-12" />
		</div>
		<div style="height: 100px;"></div>
		<div style="position: relative;">
			<a id="logout" class="pull-right" style="position: relative;">退出系统</a>
			同学，<strong id="user"><%=db.cookieuser()%></strong>
		</div>
		<ul id="myTab" class="nav nav-tabs">
			<li class="active">
				<a href="#grxx" data-toggle="tab">
					个人信息
				</a>
			</li>
			<li class="dropdown">
				<a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown">成绩查询
					<b class="caret"></b>
				</a>
				<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
					<li>
						<a href="#jmeter" tabindex="-1" data-toggle="tab">第一次</a>
					</li>
					<li>
						<a href="#ejb" tabindex="-1" data-toggle="tab">第二次</a>
					</li>
				</ul>
			</li>
			<li>
				<a href="#kcxx" data-toggle="tab">课程查询</a>
			</li>
			<li>
				<a href="#xgmm" data-toggle="tab">修改密码</a>
			</li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade in active" id="grxx">
				<!--
					作者：林嘉豪
					时间：2016-12-20
					描述：TODO 个人信息界面定义
				-->
				<form class="form-horizontal" role="form">
					<div class="form-group col-xs-12 col-sm-6">
						<label class="col-xs-5 form-control-static text-right">学号：</label>
						<div class="col-xs-7">
							<p id="no" class="form-control-static"></p>
						</div>
					</div>
					<div class="form-group col-xs-12 col-sm-6">
						<label class="col-xs-5 form-control-static text-right">姓名：</label>
						<div class="col-xs-7">
							<p id="name" class="form-control-static"></p>
						</div>
					</div>
					<div class="form-group col-xs-12 col-sm-6">
						<label class="col-xs-5 form-control-static text-right">性别：</label>
						<div class="col-xs-7">
							<select id="sex" class="form-control">
								<option>男</option>
								<option>女</option>
							</select>
						</div>
					</div>
					<div class="form-group col-xs-12 col-sm-6">
						<label class="col-xs-5 form-control-static text-right">班级：</label>
						<div class="col-xs-7">
							<p id="class" class="form-control-static">15软件一班</p>
						</div>
					</div>
					<div class="form-group col-xs-12 col-sm-6">
						<label class="col-xs-5 form-control-static text-right">入学日期：</label>
						<div class="col-xs-7">
							<p id="date" class="form-control-static">这里是日期</p>
						</div>
					</div>
					<div class="form-group col-xs-12 col-sm-6">
						<label for="lastname" class="col-xs-5 form-control-static text-right">生日：</label>
						<div class="datetimepicker col-xs-7">
							<input id="bday" class="add-on col-xs-12 form-control" type="text"></input>
						</div>
					</div>
					<div class="form-group col-xs-12 col-sm-6">
						<label class="col-xs-5 form-control-static text-right">政治面貌：</label>
						<div class="col-xs-7">
							<input id="zzmm" type="text" class="form-control" id="lastname" placeholder="请输入政治面貌">
						</div>
					</div>
					<div class="form-group col-xs-12 col-sm-6">
						<label class="col-xs-5 form-control-static text-right">籍贯：</label>
						<div class="col-xs-7">
							<input id="jg" type="text" class="form-control" id="lastname" placeholder="请输入籍贯">
						</div>
					</div>
					<div class="form-group col-xs-12">
						<button id="refesh" type="button" class="btn btn-default col-sm-1 col-sm-offset-4 col-xs-2 col-xs-offset-4">刷新</button>
						<button id="save" type="button" class="btn btn-primary col-sm-1 col-sm-offset-2 col-xs-2 col-xs-offset-1">保存</button>
					</div>
				</form>
			</div>
			<div class="tab-pane fade" id="kcxx">
				<p>暂未开放课程查询</p>
			</div>
			<div class="tab-pane fade" id="jmeter">
				<p>暂未开放成绩查询</p>
			</div>
			<div class="tab-pane fade" id="ejb">
				<p>暂未开放成绩查询</p>
			</div>
			<div class="tab-pane fade" id="xgmm">
				<form class="form-horizontal" role="form">
					<div class="form-group col-xs-12">
						<label class="col-xs-12 form-control-static">原密码：</label>
						<input id="original" type="password" class="form-control" placeholder="请输入原密码">
					</div>
					<div class="form-group col-xs-12">
						<label class="col-xs-12 form-control-static">新密码：</label>
						<input id="password" type="password" class="form-control" placeholder="请输入新密码">
					</div>
					<div class="form-group col-xs-12">
						<label class="col-xs-12 form-control-static label-danger">如修改密码后无法登录，请联系管理员。</label>
					</div>
					<div class="form-group col-xs-12 text-center">
						<button type="button" class="btn btn-default mmqr">确认修改</button>
					</div>
				</form>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="alert alert-info fristAlert clearfix fade in">
			<a class="close" data-dismiss="alert">×</a>
			<strong>信息：</strong>正在加载数据。
		</div>
	</body>
</html>
<script src="js/allshare.js" type="text/javascript" charset="utf-8"></script>
<script src="js/xuesheng.js" type="text/javascript" charset="utf-8"></script>
<script src="js/animation.js" type="text/javascript" charset="utf-8"></script><%
					db.close();
					return;
				}
				db.close();
			}
		}
	}
}
%><script>alert("请先登录！");window.location.href="LoginFrom.jsp";</script>