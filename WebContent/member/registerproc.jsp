<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="memberBean" class="pack.member.MemberBean"/>
<jsp:setProperty property="*" name="memberBean"/>
<jsp:useBean id="memberMgr" class="pack.member.MemberMgr"></jsp:useBean>
<%   
boolean b = memberMgr.memInsert(memberBean);
%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../images/favicon.ico" />
<link rel="icon" href="../images/favicon.ico">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(b){
	out.println(memberBean.getname()+"님의 회원가입을 축하합니다<br><br>");%>
	<button onclick="location.href='../guest/login.jsp'">로그인 창</button>
	<%
}else{
	out.println("회원가입 실패! 관리자에게 문의바랍니다.<br><br>관리자 번호 : 010-1234-5678<br><br>");
	out.println("<a href='register.jsp'>이전페이지로</a>");
}
%>
</body>
</html>