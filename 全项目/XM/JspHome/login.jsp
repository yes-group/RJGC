<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="db.Condb"%>
<jsp:useBean id="db" class="db.Condb" scope="page"></jsp:useBean>
<%
if(request.getMethod().equals("POST")){
	try{
		String user=request.getParameter("user");
		String pw=request.getParameter("password");
		String id=request.getParameter("ID");
		int u=Integer.parseInt(user);
		int i=Integer.parseInt(id);
		if(i>=0&&i<=2){
			if(db.initialize()){
				String cookie=db.login(u,pw,i);
				if(cookie!=null&&db.finish()){
					Cookie newCookie=new Cookie("cookie",cookie);
					newCookie.setPath("/");
					newCookie.setMaxAge(60*60*24*30);
					response.addCookie(newCookie);
					switch(i){
						case 0:
							%>{"msg":"guanliyuan.jsp","code":"2"}<%
							break;
						case 1:
							%>{"msg":"jiaoshi.html","code":"2"}<%
							break;
						case 2:
							%>{"msg":"xuesheng.jsp","code":"2"}<%
							break;
					}
				}else{
					%>{"msg":"用户名或密码错误。","code":"1"}<%
				}
			}else{
				%>{"msg":"服务器故障，请稍后重试。","code":"1"}<%
			}
			db.close();
		}else{
			%>{"msg":"格式有误。","code":"1"}<%
		}
	}catch(Exception e){
		%>{"msg":"输入格式有误。","code":"1"}<%
		System.out.println(e.getMessage());
	}
}else{
	%><script>alert("请先登录！");window.location.href="LoginFrom.jsp";</script><%
}
%>