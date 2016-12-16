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
<html>
<head>
	<meta charset="uft-8" />
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<title>管理员界面</title>
	<link rel="stylesheet" href="css/guanliyuan.css" />
</head>
<body>
	<div class="top">
		<div>
			<a href="#" class="fr">退出系统</a>
			<div>
				<%=hh.getcookieuser(sCookie.getValue())%>
			</div>
		</div>
		<img style="position: absolute;" src="img/guanliwelcome.jpg" />
		<div class="bianse" style="margin-left: 650px;height: 177px;"></div>
	</div>
	<div class="daohang">
		<center id="jx" class="daoh">教师信息查询与修改</center>
		<center id="jc" class="daoh">增加与删除教师</center>
		<center id="xsx" class="daoh">学生信息查询与修改</center>
		<center id="xsc" class="daoh">增加与删除学生</center>
		<center id="xgmx" class="daoh">修改密码</center>
	</div>
	<!--
    	作者：offline
    	时间：2016-12-16
    	描述：TODO 教师信息修改
    -->
	<div class="xx jx active">
		<div class="bk">
			<table width="100%" border="1" cellspacing="0" cellpadding="0">
				<caption class="title">
					教师信息表
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
						<td>工号</td>
						<td>姓名</td>
						<td>性别</td>
						<td>生日</td>
						<td>入职日期</td>
						<td>职务</td>
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
					<tbody id="dataview">
					</tbody>
				</table>
			</div>

		</div>
		<div>
			<button id="xxrefresh">刷新</button>
			<button id="xxchange">修改</button>
		</div>
	</div>
	<!--
    	作者：offline
    	时间：2016-12-16
    	描述：TODO 增加与删除教师
    -->
	<div class="xx jc">
		<div class="bk">
			<table width="100%" border="1" cellspacing="0" cellpadding="0">
				<caption class="title">
					教师表
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
						<td>工号</td>
						<td>姓名</td>
						<td>性别</td>
						<td>生日</td>
						<td>入职日期</td>
						<td>职务</td>
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
					<tbody id="dataview">
					</tbody>
				</table>
			</div>
		</div>
		<div>
			<button id="xxrefresh">刷新</button>
			<button id="xxchange">增加</button>
		</div>
	</div>
	<div class="jdt">
		<div class="jdty"></div>
		<div class="jdtc"></div>
	</div>
</body>
</html>
<script type="text/javascript" src="js/allshare.js" ></script>
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