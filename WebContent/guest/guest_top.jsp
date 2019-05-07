<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String memid = (String)session.getAttribute("idKey"); //loginproc.jsp의 값(idKey)이 일치해야 됨

String log = "";
if(memid == null){
	log = "<a href='login.jsp'>로그인</a>"; 
}else{
	log = "<a href='logout.jsp'>로그아웃</a>";
}

String mem ="";
if(memid == null){
	mem = "<a href='../member/register.jsp'>회원가입</a>"; 
}else{
	mem = "<a href='../member/memberupdate.jsp'>회원정보수정</a>";
}

%>

<header>
	<h1><a href="../index.jsp"><img src="../images/moominshop.png"
		height="100px" /></a></h1>
		<nav>
			<ul id="gnb" style="list-style: none;">
				<li><%=log%></li>
				<li><%=mem%></li>
				<li><a href="cartlist.jsp" type="submit">장바구니</a></li>
				<li><a href="orderlist.jsp">구매목록</a></li>
			</ul>
		</nav>
</header>
<hr style="width: 100%; float: left;">
