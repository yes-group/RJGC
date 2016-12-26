<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="db.Condb"%>
<jsp:useBean id="db" class="db.Condb" scope="page"></jsp:useBean>
<%
if(request.getMethod().equals("POST")){
	String sno = request.getParameter("no");
	try{
		Cookie cookies[]=request.getCookies();
		int no=Integer.parseInt(sno);
		if(no<0){
			%>{"msg":"学号不能为负数！","code":"1"}<%
		}else{
			for(Cookie sCookie:cookies){
				if(sCookie!=null){
					if(("cookie").equals(sCookie.getName())){
						if(db.initialize()&&db.cheakislogin(sCookie.getValue())){
							if (db.cookieid()==0){
								if (db.add(no,2)){
									if (db.finish()){
										%>{"code":"0"}<%
							    	}else{
										%>{"msg":"增加<%=no%>学号失败！","code":"1"}<%
									}
								}else{
									%>{"msg":"增加<%=no%>学号失败！请检查是否与其他工号或学号相同！","code":"1"}<%
								}
							}else {
								%>{"msg":"没有权限！","code":"1"}<%
							}
						}else {
							%>{"msg":"LoginFrom.jsp","code":"3"}<%
						}
						return;
					}
				}
			}
			%>{"msg":"LoginFrom.jsp","code":"3"}<%
		}
	}catch(Exception e){
		%>{"msg":"数据出错！","code":"1"}<%
	}
}else{
	%><script>alert("请先登录！");window.location.href = "LoginFrom.jsp";</script><%
}
%>