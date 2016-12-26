<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="db.Condb"%>
<jsp:useBean id="db" class="db.Condb" scope="page"></jsp:useBean>
<%
if(request.getMethod().equals("POST")){
	try{
		Cookie cookies[]=request.getCookies();
		Cookie sCookie=null;
		for(int i=0;i<cookies.length;i++){
			sCookie=cookies[i];
			if(sCookie!=null){
				if(("cookie").equals(sCookie.getName())){
					if(db.initialize()&&db.cheakislogin(sCookie.getValue())){
						if(db.logout()){
							if(db.finish()){
								%>{"msg":"LoginFrom.jsp","code":"2"}<%
							}else{
								%>{"msg":"出错！","code":"1"}<%
							}
						}else{
							%>{"msg":"出错！","code":"1"}<%
						}
					}else{
						%>{"msg":"出错！","code":"1"}<%
					}
					db.close();
					return;
				}
			}
		}
		%>{"msg":"LoginFrom.jsp|请重新登录！","code":"4"}<%
	}catch(Exception e){
		%>{"msg":"数据出错！","code":"1"}<%
		System.out.println(e.getMessage());
	}
	return;
}else{
	%><script>alert("请先登录！");window.location.href="LoginFrom.jsp";</script><%
}%>