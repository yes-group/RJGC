<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="jdbc.Jdbc"%>
<jsp:useBean id="hh" class="jdbc.Jdbc" scope="page"></jsp:useBean>
<%
String name = request.getParameter("name");
String data = request.getParameter("data");
Cookie cookies[]=request.getCookies();
Cookie sCookie=null; 
for(int i=0;i<cookies.length;i++){
	sCookie=cookies[i];
	if(sCookie!=null){
		if(("cookie").equals(sCookie.getName())){
			if(hh.cheakcookie(sCookie.getValue(),1)){
				String str=hh.select("tno as `0`,tname as `1`,sex as `2`,birthday as `3`,workday as `4`,position as `5`,pface as `6`,origin as `7`","tb_teacher",name+"="+data);
				if(str==""){%>{"msg":"服务器故障！","code":"1"}<%					
				}else{
					out.write(str);
				}
				return;
			}
		}
	}
}%>{"msg":"LoginFrom.jsp|请重新登录！","code":"4"}