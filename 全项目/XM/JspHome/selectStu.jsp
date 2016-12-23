<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="jdbc.Jdbc"%>
<jsp:useBean id="hh" class="jdbc.Jdbc" scope="page"></jsp:useBean>
<%
	if(request.getMethod().equals("POST")){
		try{
		String data = request.getParameter("data");
		int no=Integer.parseInt(data);
		String where="";
		if(no==-1){
			where="1=1";
		}else{
			where="no="+no;
		}
		Cookie cookies[]=request.getCookies();
		Cookie sCookie=null; 
		for(int i=0;i<cookies.length;i++){
			sCookie=cookies[i];
			if(sCookie!=null){
				if(("cookie").equals(sCookie.getName())){
					if(hh.cheakcookie(sCookie.getValue(),0,no)){
						String str=hh.select("no as `0`,name as `1`,sex as `2`,birthday as `3`,studyday as `4`,class as `5`,pface as `6`,origin as `7`","tb_student",where);
						if(str==""){%>{"msg":"服务器故障！","code":"1"}<%					
						}else{
							out.write(str);
						}
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
<%---------------------------------------------------------

<%
if(request.getMethod().equals("POST")){
	String name = request.getParameter("name");
	String data = request.getParameter("data");
	Cookie cookies[]=request.getCookies();
	Cookie sCookie=null; 
	for(int i=0;i<cookies.length;i++){
		sCookie=cookies[i];
		if(sCookie!=null){
			if(("cookie").equals(sCookie.getName())){
				if(hh.cheakcookie(sCookie.getValue(),0)){
					//在这里打代码
				}
			}
		}
	}%>{"msg":"LoginFrom.jsp|请重新登录！","code":"4"}<%
	return;
}%>
<script>
	alert("请先登录！");
	window.location.href = "LoginFrom.jsp";
</script>

------------------------------------------------------------%>
