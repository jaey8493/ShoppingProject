<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
session.removeAttribute("adminKey");
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="shortcut icon" href="../images/favicon.ico" />
<link rel="icon" href="../images/favicon.ico">
<body>
<script type="text/javascript">
alert("로그아웃 성공!!");
location.href="../index.jsp"; // 메인으로 이동함
</script>
</body>
</html>