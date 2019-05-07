<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberMgr" class="pack.member.MemberMgr"/>

<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
boolean b = memberMgr.checkId(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id 중복 검사</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="../images/favicon.ico" />
<link rel="icon" href="../images/favicon.ico">
<script src="../js/script.js"></script>

</head>
<body style="width: 300px;">
<div style="text-align: center;">
입력하신 <b><%=id %></b>
<%
if(b){
%>
	는(은) 이미 사용중인 id입니다.
	<br>
	<button style="margin-top: 30%;" onclick="opener.document.regForm.id.focus(); window.close();">닫기</button>
<%}else{%>
	는(은) 사용 가능한 id입니다.
	<br>
	<button style="margin-top: 30%;" onclick="opener.document.regForm.passwd.focus(); window.close();">닫기</button>
<%	
}
%>
</div>
</body>
</html>