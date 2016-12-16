<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="mypao.MyJDBC"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>javabean的应用</title>
</head>
<body bgcolor="#9900FF">
<center>
<p><h3>下面用javabean显示：</h3></p>
<jsp:useBean id="hh" class="mypao.MyJDBC" scope="page"> </jsp:useBean>
<%hh.start();%>
</body>
</html>