<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="db.Condb"%>
<jsp:useBean id="db" class="db.Condb" scope="page"></jsp:useBean>
<%
if(request.getMethod().equals("POST")){
	try{
		String data=request.getParameter("data");
		int no=Integer.parseInt(data);
		Cookie cookies[]=request.getCookies();
		for(Cookie sCookie:cookies){
			if(sCookie!=null){
				if(("cookie").equals(sCookie.getName())){
					if(db.initialize()&&db.cheakislogin(sCookie.getValue())){
						if(db.cookieid()==0){
							if(no==-1){
								String str=db.inquery(-2);
								if(str!=null){
									out.write(str);
								}else{
									%>{"msg":"查询信息失败！","code":"1"}<%
								}
							}else{
								%>{"msg":"暂未开放查询单人信息！","code":"1"}<%
							}
						}else if(db.cookieid()==2){
							if(no==db.cookieuser()){
								String str=db.inquery(-3);
								if(str!=null){
									out.write(str);
								}else{
									%>{"msg":"查询信息失败！","code":"1"}<%
								}
							}else{
								%>{"msg":"暂未开放查询他人信息！","code":"1"}<%
							}
						}else{
							%>{"msg":"权限不足！","code":"1"}<%
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