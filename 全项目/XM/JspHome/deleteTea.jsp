﻿<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="db.Condb"%>
<jsp:useBean id="db" class="db.Condb" scope="page"></jsp:useBean>
<%
if(request.getMethod().equals("POST")){
	String tno=request.getParameter("no");
	try{
		Cookie cookies[]=request.getCookies();
		int no=Integer.parseInt(tno);
		for(Cookie sCookie:cookies){
			if(sCookie!=null){
				if(("cookie").equals(sCookie.getName())){
					if(db.initialize()&&db.cheakislogin(sCookie.getValue())){
						if(db.cookieid()==0){
							if(db.delete(no)){
								if(db.finish()){
									%>{"code":"0"}<%
								}else{
									%>{"msg":"删除<%=no%>教师失败！","code":"1"}<%
								}
							}else{
								%>{"msg":"删除<%=no%>教师失败！","code":"1"}<%
							}
						}else{
							%>{"msg":"没有权限！","code":"1"}<%
						}
					}else{
						%>{"msg":"LoginFrom.jsp","code":"3"}<%
					}
					db.close();
					return;
				}
			}
		}
		%>{"msg":"LoginFrom.jsp","code":"3"}<%
	}catch(Exception e){
		%>{"msg":"数据出错！","code":"1"}<%
	}
}else{
	%><script>alert("请先登录！");window.location.href="LoginFrom.jsp";</script><%
}
%>