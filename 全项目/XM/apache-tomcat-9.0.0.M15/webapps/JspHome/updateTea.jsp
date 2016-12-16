<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="jdbc.Jdbc"%>
<jsp:useBean id="hh" class="jdbc.Jdbc" scope="page"></jsp:useBean>
<%
String tno = request.getParameter("tno");
String index = request.getParameter("index");
String data = request.getParameter("data");
try{
Cookie cookies[]=request.getCookies();
Cookie sCookie=null;
int no=Integer.parseInt(tno);
int ind=Integer.parseInt(index);
String lie="";
switch (ind) {
	case 1:
	lie="tname";
	break;
	case 2:
	lie="sex";
	break;
	case 3:
	lie="birthday";
	break;
	case 4:
	lie="workday";
	break;
	case 5:
	lie="position";
	break;
	case 6:
	lie="pface";
	break;
	case 7:
	lie="origin";
	break;
	default:%>{"msg":"出错！","code":"1"}<%
	return;
}
for(int i=0;i<cookies.length;i++){
	sCookie=cookies[i];
	if(sCookie!=null){
		if(("cookie").equals(sCookie.getName())){
			if(hh.cheakcookie(sCookie.getValue(),0,no)){
				if(hh.update("tb_teacher",lie,data,"tno="+no)){%>{"code":"0"}<%
				}else{%>{"tno":"<%=tno%>","index":"<%=index%>","data":"<%=data%>","code":"5"}<%
				}
				return;
			}
		}
	}
}
%>{"msg":"没有权限！","code":"1"}<%
}catch(Exception e){%>{"tno":"<%=tno%>","index":"<%=index%>","data":"<%=data%>","code":"5"}<%
}
%>