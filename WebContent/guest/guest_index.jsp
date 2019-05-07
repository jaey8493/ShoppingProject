<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	String memid = (String) session.getAttribute("idKey"); //loginproc.jsp의 값(idKey)이 일치해야 됨

	String log = "";
	if (memid == null) {
		log = "<a href='login.jsp'>로그인</a>";
	} else {
		log = "<a href='logout.jsp'>로그아웃</a>";
	}

	String mem = "";
	if (memid == null) {
		mem = "<a href='../member/register.jsp'>회원가입</a>";
	} else {
		mem = "<a href='../member/memberupdate.jsp'>회원정보 수정</a>";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ムミンショップ</title>
<script src="https://code.jquery.com/jquery-2.2.1.js"></script>

<link rel="stylesheet" type="text/css" href="../css/board.css">
<link rel="stylesheet" href="../css/jquery.bxslider.css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="../images/favicon.ico" />
<link rel="icon" href="../images/favicon.ico">
<script src="../js/script.js"></script>
<script src="../js/jquery.bxslider.js"></script>
<script type="text/javascript"></script>


<script>
$(document).ready(function () {
    $('.bxslider').bxSlider({
        auto: true, // 자동으로 애니메이션 시작
        speed: 500,  // 애니메이션 속도
        pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)
        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
        autoControls: false, // 시작 및 중지버튼 보여짐
        pager: false, // 페이지 표시 보여짐
        captions: true, // 이미지 위에 텍스트를 넣을 수 있음
    });
});</script>

</head>


<body>
<jsp:include page="guest_top.jsp"/>
	<table>
<% if(memid != null){%>
		<tr style="text-align:center;">
		<td style="background-color: #d99f9d">
		<li style="list-style: none; height: 150px; color: white;font-size: 50px; line-height: 140%; "><%= memid %>様! <br>ご訪問を歓迎します。</li>
			
			<div id="slider">
	<ul class="bxslider">
       <li><a href="productlist.jsp"><img src="../images/메인포스터1.png" title="이미지을 클릭하시면 상품을 보실수 있습니다."></a></li>
       <li><a href="productlist.jsp"><img src="../images/메인포스터2.png" title="이미지을 클릭하시면 상품을 보실수 있습니다."></a></li>
        <li><a href="productlist.jsp"><img src="../images/메인포스터3.png" title="이미지을 클릭하시면 상품을 보실수 있습니다."></a></li>
        <li><a href="productlist.jsp"><img src="../images/메인포스터4.jpg" title="이미지을 클릭하시면 상품을 보실수 있습니다."></a></li>   
        </ul>
    </div>
		</td>
	<tr>
<%}else{%>
		<tr style="text-align:center;">
		<td style="background-color:#0e6ad3">
		<!-- <td style="background-image: url(../images/pic.jpg); background-size: 100%;
					background-size:100% font-size:20px;">  // 셀 배경으로 이미지 사용 가능-->
			<li style="list-style: none; height: 150px; color: white;font-size: 50px; line-height: 140%; ">お客様 いらっしゃいませ!<br>ログイン後で使ってください!</li>
	<div id="slider">
	<ul class="bxslider">
       <li><a href="productlist.jsp"><img src="../images/메인포스터1.png" title="이미지을 클릭하시면 상품을 보실수 있습니다."></a></li>
       <li><a href="productlist.jsp"><img src="../images/메인포스터2.png" title="이미지을 클릭하시면 상품을 보실수 있습니다."></a></li>
        <li><a href="productlist.jsp"><img src="../images/메인포스터3.png" title="이미지을 클릭하시면 상품을 보실수 있습니다."></a></li>
        <li><a href="productlist.jsp"><img src="../images/메인포스터4.jpg" title="이미지을 클릭하시면 상품을 보실수 있습니다."></a></li>   
        </ul>
    </div>
		</td>
	<tr>
<%}%>
</table>
<%@ include file="guest_bottom.jsp" %>		
</body>


</html>

