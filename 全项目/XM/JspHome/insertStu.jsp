<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="jdbc.Jdbc"%>
<jsp:useBean id="hh" class="jdbc.Jdbc" scope="page"></jsp:useBean>
<%
	if(request.getMethod().equals("POST")){
		String tno = request.getParameter("no");
		try{
			Cookie cookies[]=request.getCookies();
			Cookie sCookie=null;
			int no=Integer.parseInt(tno);
			if(no<0){
				%>{"msg":"学号不能为负数！","code":"1"}<%
				return;
			}
			for(int i=0;i<cookies.length;i++){
				sCookie=cookies[i];
				if(sCookie!=null){
					if(("cookie").equals(sCookie.getName())){
						if(hh.cheakcookie(sCookie.getValue(),0)){
							if(hh.insert(no,2)){%>{"code":"0"}<%
							}else{%>{"msg":"增加<%=no%>学号失败！请检查是否与其他工号或学号相同！","code":"1"}<%
							}
							return;
						}
					}
				}
			}
			%>{"msg":"没有权限！","code":"1"}<%
		}catch(Exception e){%>{"msg":"数据出错！","code":"1"}<%
		}
		return;
	}%>
<script>
	alert("请先登录！");
	window.location.href = "LoginFrom.jsp";
</script>