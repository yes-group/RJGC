<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="db.Condb"%>
<jsp:useBean id="db" class="db.Condb" scope="page"></jsp:useBean>
<%
if(request.getMethod().equals("POST")){
	try{
		String tno = request.getParameter("no");
		String index = request.getParameter("index");
		String data = request.getParameter("data");
		int no=Integer.parseInt(tno);
		int ind=Integer.parseInt(index);
		Cookie cookies[]=request.getCookies();
		for(Cookie sCookie:cookies){
			if(sCookie!=null){
				if(("cookie").equals(sCookie.getName())){
					if(db.initialize()&&db.cheakislogin(sCookie.getValue())){
						if (db.cookieid()==0){
							if (db.inchange(ind, data, no, -1)){
								if (db.finish()){
									%>{"code":"0"}<%
						    	}else{
									%>{"no":"<%=tno%>","index":"<%=index%>","data":"<%=data%>","code":"5"}<%
								}
							}else{
								%>{"no":"<%=tno%>","index":"<%=index%>","data":"<%=data%>","code":"5"}<%
							}
						}else if(db.cookieid()==1){
							if(db.cookieuser()==no){
								if (db.inchange(ind, data, no, -1)){
									if (db.finish()){
										%>{"code":"0"}<%
						    		}else{
										%>{"no":"<%=tno%>","index":"<%=index%>","data":"<%=data%>","code":"5"}<%
									}
								}else{
									%>{"no":"<%=tno%>","index":"<%=index%>","data":"<%=data%>","code":"5"}<%
								}
							}else{
								%>{"msg":"没有权限！","code":"1"}<%
							}
						}else{
							%>{"msg":"没有权限！","code":"1"}<%
						}
					}
					return;
				}
			}
		}
		%>{"msg":"LoginFrom.jsp","code":"3"}<%
	}catch(Exception e){
		%>{"msg":"数据出错！","code":"1"}<%
		System.out.println(e.getMessage());
	}
}else{
	%><script>alert("请先登录！");window.location.href = "LoginFrom.jsp";</script><%
}
%>