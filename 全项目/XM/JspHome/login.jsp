<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="jdbc.Jdbc"%>
<jsp:useBean id="hh" class="jdbc.Jdbc" scope="page"> </jsp:useBean>
<%
	if(request.getMethod().equals("POST")){
String user = request.getParameter("user");
String pw = request.getParameter("password");
String id = request.getParameter("ID");
try{
	int u=Integer.parseInt(user);
	int i=Integer.parseInt(id);
	if(i>=0&&i<=2){
		int re=hh.login(u,pw,i);
		switch (re) {
			case -2:%>{"msg":"服务器故障，请稍后重试。","code":"1"})<%
			break;
			case -1:%>{"msg":"用户名或密码错误。","code":"1"}<%
			break;
			case 0:
			String cookie=hh.makecookie(u);
			if(cookie==""){%>{"msg":"服务器繁忙，请稍后重试。","code":"1"}<%
			}else{
				Cookie NewCookie=new Cookie("cookie",cookie);
				NewCookie.setPath("/");
				NewCookie.setMaxAge(60*60*24*30);
				response.addCookie(NewCookie);
				switch (i) {
					case 0:%>{"msg":"guanliyuan.jsp","code":"2"}<%
					break;
					case 1:%>{"msg":"jiaoshi.html","code":"2"}<%
					break;
					case 2:%>{"msg":"xuesheng.jsp","code":"2"}<%
					break;
				}
			}
			break;
			case 1:%>{"msg":"身份选择错误。","code":"1"}<%
			break;
			default:%>{"msg":"未知错误。","code":"1"}<%
			break;
		}
		return;
	}else{%>{"msg":"格式有误。","code":"1"}<%
		
	}
}catch(Exception e){%>{"msg":"输入格式有误。","code":"1"}<%
	System.out.println(e.getMessage());
}return;
}%>
<script>
	alert("请先登录！");
	window.location.href = "LoginFrom.jsp";
</script>
<%--
---------------JSP笔记-scope范围-----------
Page范围：属性只在当前页有效，如果跳转到其他页面，则需要重新实例化
	使用与：Jsp页面操作资源时使用
Request范围：属性只保存在一次服务器跳转中
	前提：使用<jsp:forward>跳转才行
Session范围:属性值保存在一次会话中，可以使用任意方式连接其他页面，则此对象值实例化一次
	适用于：适用JSP直接开发购物车
Application范围：属性公有，此对象在整个服务器只实例化一次
	尽量少用，因为application会重用资源
	--%>