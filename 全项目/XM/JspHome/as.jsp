<%@ page language="java"   pageEncoding="UTF-8" contentType="text/html"%>
<%@ page import="com.bean.Student"%>
<html>
<head>
<script src="./js/jquery-3.1.1.min.js"></script>
<script src="./js/a.js"></script>
</head>
<style>
#div0{min-width:900px;width:100%;height:700px;border:1px red solid;min-height:700px;}
#div1{position:absolute;z-index:0;heigth:80px;}
.pp{color:yellow;font-size:30px;font-weight:bold;margin-left:50px}
.bgimg{position:absolute;z-index:-1;width:100%;height:700px;min-width:900px;}
#ss{margin:80px auto;width:885px;height:500px;}
#xx{border:1px #BEBEBE solid;overflow:auto;width:885px;height:500px;display:none}
.b{margin-top:1px;width:100;height:30px;float:left}
input.b:hover{background-color:#FFFFB9}
#td1{display:none}
.td2{width:120px;height:35px;border-bottom:0px}
.tb{background-color:yellow;border-color:yellow;}
.ll{height:inherit;width:inherit;border:0;text-align:center;border:0;outline:0;background-color:yellow;font-weight:bold}
.lll{height:inherit;width:inherit;border:0;text-align:center;}
.lab{margin-left:100px;}
.p2{margin-left:10px;}
#zz{height:30px;overflow:hidden}
.aa{width:885px;height:30px;background-color:yellow;}
#ii{height:30px;overflow:hidden;margin-bottom:1px;border-radius:5px}
.u{list-style-type:none;margin:1px;height:inherit;padding:0px;}
.l{display:block;}
.i{background-color:#FFCC33;padding:6px 82px 10px 82px;float:left;text-decoration:none;}
a.i:hover{background-color:yellow;}
</style>
<body>
<div id="div0">
<div id="div1">
<p class="pp">教师界面</p>
</div>
<img src="img/head0.jpg" class="bgimg"/>
<jsp:useBean id="h" class="com.bean.Student" scope="page"></jsp:useBean>
<%
if(request.getMethod().equals("POST")){
String sj = request.getParameter("sj");
String key = request.getParameter("key");
int lie = Integer.parseInt(request.getParameter("lie"));
if(h.update(sj,key,lie)){}
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
</div>
</div>
</body>

</html>