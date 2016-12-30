<%@ page language="java"   pageEncoding="UTF-8" contentType="text/html"%>
<%@ page import="com.bean.Teacher"%>
<html>
<head>
<script src="./js/jquery-3.1.1.min.js"></script>
<script src="./js/Teacher.js"></script>
<link rel="stylesheet" type="text/css" href="css/Teacher.css" />
</head>
<body>
<div id="div0">
<div id="div1">
<p class="pp">教师界面</p>
</div>
<img src="img/head0.jpg" class="bgimg"/>
<jsp:useBean id="h" class="com.bean.Teacher" scope="page"></jsp:useBean>
<%
if(request.getMethod().equals("POST")){
String sj = request.getParameter("sj");
String key = request.getParameter("key");
int lie = Integer.parseInt(request.getParameter("lie"));
if(h.update(sj,key,lie)){}
}
String tno1 = request.getParameter("tno1");
String tno2 = request.getParameter("tno2");

if(tno1!=null){
h.insert(tno1);
}
if(tno2!=null){
h.delete(tno2);
}

%>
<div id="ss">
<div id="ii">
   <ul class="u">
      <li class="l"><a class="i" href="index.html">首页</a></li>
      <li class="l"><a class="i" href="###">教师信息</a></li>
      <li class="l"><a class="i" href="###">成绩维护</a></li>
      <li class="l"><a class="i" href="###">成绩查询</a></li>
   </ul>
</div>
<div id="zz">
<button class="aa">请点击这里</button>
</div>
<div id="xx">
<table border="1"  width="800" height="35" class="tb">
<tr>
<td class="td2"><input class="ll" value="工号" readonly/></td>
<td class="td2"><input class="ll" value="姓名" readonly/></td>
<td class="td2"><input class="ll" value="性别" readonly/></td>
<td class="td2"><input class="ll" value="出生日期" readonly/></td>
<td class="td2"><input class="ll" value="开始工作日期" readonly/></td>
<td class="td2"><input class="ll" value="政治面貌" readonly/></td>
<td class="td2"><input class="ll" value="籍贯" readonly/></td>
<tr>
</table>
<table border="1"  width="800" height="35" class="tb">
<%=h.getAll()%>
</table>
</div>
<input type="button" value="修改" id="btn" class="b"></input>
<p class="p2">操作提示:</p>
<input type="text"  value="" id="inde" class="b" placeholder="请输入工号"></input>
<input type="button" value="增加" id="inde0" ></input>
<input type="text"  value="" id="inde3" class="b" placeholder="请输入工号"></input>
<input type="button" value="删除" id="inde1" ></input>
</div>
</div>
</body>

</html>