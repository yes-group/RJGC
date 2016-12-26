<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="db.Condb"%>
<jsp:useBean id="db" class="db.Condb" scope="page"></jsp:useBean>
<%
Cookie cookies[]=request.getCookies();
if(cookies!=null){
	for(Cookie sCookie:cookies){
		if(sCookie!=null){
			if(("cookie").equals(sCookie.getName())){
				if(db.initialize()&&db.cheakislogin(sCookie.getValue())&&db.cookieid()==0){
%><!DOCTYPE>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8" />
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
		<title>管理员界面</title>
		<link rel="stylesheet" href="css/guanliyuan.css" />
	</head>
	<body>
		<div class="top">
			<div>
				<a id="logout" class="fr">退出系统</a>
				<div>
					管理员：<strong id="user"><%=db.cookieuser()%></strong>
				</div>
			</div>
			<img style="position: absolute;" src="img/guanliwelcome.jpg" />
			<div class="bianse"></div>
		</div>
		<div class="daohang">
			<center id="js" class="daoh">教师信息查询与修改</center>
			<center id="xs" class="daoh">学生信息查询与修改</center>
			<center id="kc" class="daoh">课程信息查询与修改</center>
			<center id="cj" class="daoh">成绩信息查询与修改</center>
			<center id="ks" class="daoh">考试信息录入</center>
			<center id="bj" class="daoh">班级信息管理</center>
			<center id="xg" class="daoh">用户密码修改</center>
		</div>
		<!--
			作者：林嘉豪
			时间：2016-12-16
			描述：TODO 教师信息界面
		-->
		<div class="xx js active">
			<div class="bk">
				<table width="100%" border="1" cellspacing="0" cellpadding="0">
					<caption class="title">
						教师信息表
					</caption>
					<colgroup>
						<col class="colw" width="12%">
						<col class="colw" width="12%">
						<col class="colw" width="12%">
						<col class="colw" width="12%">
						<col class="colw" width="12%">
						<col class="colw" width="12%">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td class="d0">工号</td>
							<td class="d1">姓名</td>
							<td class="d2">性别</td>
							<td class="d3">生日</td>
							<td class="d4">入职日期</td>
							<td class="d5">政治面貌</td>
							<td class="d6">籍贯</td>
						</tr>
					</tbody>
				</table>
				<div class="gundong">
					<table width="100%" border="1" cellspacing="0" cellpadding="0">
						<colgroup>
							<col class="colw" width="12%">
							<col class="colw" width="12%">
							<col class="colw" width="12%">
							<col class="colw" width="12%">
							<col class="colw" width="12%">
							<col class="colw" width="12%">
							<col>
						</colgroup>
						<tbody class="dataview">
						</tbody>
					</table>
				</div>
			</div>
			<div>
				<button class="refresh">刷新</button>
				<button class="change">修改</button>
				<div class="fr">
					<a>工号：</a>
					<input type="text" class="gh" value="" />
					<button class="add">增加</button>
					<button class="del">删除</button>
				</div>
			</div>
			<div class="jdt">
				<div class="jdty"></div>
				<div class="jdtc"></div>
			</div>
		</div>
		<!--
			作者：林嘉豪
			时间：2016-12-16
			描述：TODO 学生信息界面
		-->
		<div class="xx xs">
			<div class="bk">
				<table width="100%" border="1" cellspacing="0" cellpadding="0">
					<caption class="title">
						学生信息表
					</caption>
					<colgroup>
						<col class="colwe" width="100px">
						<col class="colwe" width="100px">
						<col class="colwe" width="100px">
						<col class="colwe" width="100px">
						<col class="colwe" width="100px">
						<col class="colwe" width="100px">
						<col class="colwe" width="100px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td class="d0">学号</td>
							<td class="d1">姓名</td>
							<td class="d2">性别</td>
							<td class="d3">生日</td>
							<td class="d4">入学日期</td>
							<td class="d5">班级</td>
							<td class="d6">政治面貌</td>
							<td class="d7">籍贯</td>
						</tr>
					</tbody>
				</table>
				<div class="gundong">
					<table width="100%" border="1" cellspacing="0" cellpadding="0">
						<colgroup>
							<col class="colwe" width="100px">
							<col class="colwe" width="100px">
							<col class="colwe" width="100px">
							<col class="colwe" width="100px">
							<col class="colwe" width="100px">
							<col class="colwe" width="100px">
							<col class="colwe" width="100px">
							<col>
						</colgroup>
						<tbody class="dataview">
						</tbody>
					</table>
				</div>
			</div>
			<div>
				<button class="refresh">刷新</button>
				<button class="change">修改</button>
				<div class="fr">
					<a>学号：</a>
					<input type="text" class="gh" value="" />
					<button class="add">增加</button>
					<button class="del">删除</button>
				</div>
			</div>
			<div class="jdt">
				<div class="jdty"></div>
				<div class="jdtc"></div>
			</div>
		</div>
		<!--
			作者：林嘉豪
			时间：2016-12-16
			描述：TODO 密码修改
		-->
		<div class="xx js active">
			<div class="bk">
				<table width="100%" border="1" cellspacing="0" cellpadding="0">
					<caption class="title">
						教师信息表
					</caption>
					<colgroup>
						<col class="colw" width="12%">
						<col class="colw" width="12%">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td class="d0">身份</td>
							<td class="d1">用户名</td>
							<td class="d2">密码</td>
						</tr>
					</tbody>
				</table>
				<div class="gundong">
					<table width="100%" border="1" cellspacing="0" cellpadding="0">
						<colgroup>
							<col class="colw" width="12%">
							<col class="colw" width="12%">
							<col>
						</colgroup>
						<tbody class="dataview">
						</tbody>
					</table>
				</div>
			</div>
			<div>
				<button class="refresh">刷新</button>
				<button class="change">修改</button>
				<div class="fr">
					<a>工号：</a>
					<input type="text" class="gh" value="" />
					<button class="add">增加</button>
					<button class="del">删除</button>
				</div>
			</div>
			<div class="jdt">
				<div class="jdty"></div>
				<div class="jdtc"></div>
			</div>
		</div>
	</body>
</html>
<script type="text/javascript" src="js/allshare.js"></script>
<script type="text/javascript" src="js/guanliyuan.js"></script><%
					db.close();
					return;
				}
				db.close();
			}
		}
	}
}
%><script>alert("请先登录！");window.location.href="LoginFrom.jsp";</script>