<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="jdbc.Jdbc"%>
<jsp:useBean id="hh" class="jdbc.Jdbc" scope="page"></jsp:useBean>
<%
	if(request.getMethod().equals("POST")){
		try{
		String data = request.getParameter("no");
		int no=Integer.parseInt(data);
		Cookie cookies[]=request.getCookies();
		Cookie sCookie=null; 
		for(int i=0;i<cookies.length;i++){
			sCookie=cookies[i];
			if(sCookie!=null){
				if(("cookie").equals(sCookie.getName())){
					if(hh.getcookieuser(sCookie.getValue()).equals("")==false){
						hh.logout(no);
						%>{"msg":"LoginFrom.jsp","code":"2"}<%
						return;
					}
				}
			}
		}%>{"msg":"LoginFrom.jsp|请重新登录！","code":"4"}<%
		}catch(Exception e){%>{"msg":"数据出错！","code":"1"}<%
			System.out.println(e.getMessage());
		}
		return;
	}%>
<script>
	alert("请先登录！");
	window.location.href = "LoginFrom.jsp";
</script>