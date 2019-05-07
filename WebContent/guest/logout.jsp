<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//session.removeAttribute("idKey");
session.invalidate();
%>


<!DOCTYPE html>
<html>
<link rel="shortcut icon" href="../images/favicon.ico" />
<link rel="icon" href="../images/favicon.ico">
<head>
<meta charset="UTF-8">
<title>ログアウト</title>
</head>
<body>
<script type="text/javascript">
alert("ログアウト成功!!");
location.href="guest_index.jsp"; // 메인으로 이동함
</script>
</body>
</html>