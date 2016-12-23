<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="jdbc.Jdbc"%>
<jsp:useBean id="hh" class="jdbc.Jdbc" scope="page"></jsp:useBean>
<%
Cookie cookies[]=request.getCookies();
if (cookies!=null) {
	Cookie sCookie=null;
	for(int i=0;i<cookies.length;i++){
		sCookie=cookies[i];
		if(sCookie!=null){
			if(("cookie").equals(sCookie.getName())){
				if(hh.cheakcookie(sCookie.getValue(),0)){%><!DOCTYPE >
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
					管理员：
					<%=hh.getcookieuser(sCookie.getValue())%>
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
			<center id="xg" class="daoh">用户密码修改</center>
		</div>
		<!--
    	作者：offline
    	时间：2016-12-16
    	描述：TODO 教师信息修改
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
						<col class="colw" width="12%">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td id="d0">工号</td>
							<td id="d1">姓名</td>
							<td id="d2">性别</td>
							<td id="d3">生日</td>
							<td id="d4">入职日期</td>
							<td id="d5">职务</td>
							<td id="d6">政治面貌</td>
							<td id="d7">籍贯</td>
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
    	作者：offline
    	时间：2016-12-16
    	描述：TODO 增加与删除学生
    -->
		<div class="xx xs">
			<div class="bk">
				<table width="100%" border="1" cellspacing="0" cellpadding="0">
					<caption class="title">
						学生信息表
					</caption>
					<colgroup>
						<col class="colw" width="100px">
						<col class="colw" width="100px">
						<col class="colw" width="100px">
						<col class="colw" width="100px">
						<col class="colw" width="100px">
						<col class="colw" width="100px">
						<col class="colw" width="100px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td>学号</td>
							<td>姓名</td>
							<td>性别</td>
							<td>生日</td>
							<td>入学日期</td>
							<td>班级</td>
							<td>政治面貌</td>
							<td>籍贯</td>
						</tr>
					</tbody>
				</table>
				<div class="gundong">
					<table width="100%" border="1" cellspacing="0" cellpadding="0">
						<colgroup>
							<col class="colw" width="100px">
							<col class="colw" width="100px">
							<col class="colw" width="100px">
							<col class="colw" width="100px">
							<col class="colw" width="100px">
							<col class="colw" width="100px">
							<col class="colw" width="100px">
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
	</body>

</html>
<script type="text/javascript" src="js/allshare.js"></script>
<script type="text/javascript" src="js/guanliyuan.js"></script><%
					return;
				}
			}
		}
	}
}
%>
<script>
	alert("请先登录！");
	window.location.href = "LoginFrom.jsp";
</script>