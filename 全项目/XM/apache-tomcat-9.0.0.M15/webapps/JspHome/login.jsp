﻿<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="jdbc.Jdbc"%>
<jsp:useBean id="hh" class="jdbc.Jdbc" scope="page"> </jsp:useBean>
<%
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
				response.addCookie(NewCookie);
				switch (i) {
					case 0:%>{"msg":"guanliyuan.jsp","code":"2"}<%
					break;
					case 1:%>{"msg":"jiaoshi.html","code":"2"}<%
					break;
					case 2:%>{"msg":"xuesheng.html","code":"2"}<%
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
}
%>
<%--
	out.write(e.getMessage());
	Cookie deleteNewCookie=new Cookie("newcookie",null);
	deleteNewCookie.setMaxAge(0);
	deleteNewCookie.setPath("/");
	response.addCookie(deleteNewCookie);
	System.out.println("Debugging message");--%>