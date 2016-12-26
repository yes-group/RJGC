<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="db.Condb"%>
<jsp:useBean id="db" class="db.Condb" scope="page"></jsp:useBean>
<%
if(request.getMethod().equals("POST")){
	try{
		String user=request.getParameter("user");
		String password=request.getParameter("password");
		int no=Integer.parseInt(user);
		Cookie cookies[]=request.getCookies();
		for(Cookie sCookie:cookies){
			if(sCookie!=null){
				if(("cookie").equals(sCookie.getName())){
					if(db.initialize()&&db.cheakislogin(sCookie.getValue())){
						if(db.cookieid()==0){
							if(no>=0){
								if(db.changesignpassword(password,no)&&db.finish()){
									%>{"code":"0"}<%
								}else{
									%>{"msg":"修改密码失败！","code":"1"}<%
								}
							}else{
								%>{"msg":"不能为负数！","code":"1"}<%
							}
						}else{
							if(no==db.cookieuser()){
								out.write(db.inquery(-3));
							}else{
								%>{"msg":"禁止修改他人密码！","code":"1"}<%
							}
						}
					}else{
						%>{"msg":"LoginFrom.jsp|请重新登录！","code":"4"}<%
					}
					db.close();
					return;
				}
			}
		}
		%>{"msg":"LoginFrom.jsp|请重新登录！","code":"4"}<%
	}catch(Exception e){
		%>{"msg":"输入格式有误。","code":"1"}<%
		System.out.println(e.getMessage());
	}
}else{
	%><script>alert("请先登录！");window.location.href="LoginFrom.jsp";</script><%
}
%>