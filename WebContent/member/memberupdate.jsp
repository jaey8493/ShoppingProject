<%@page import="pack.member.MemberBean"%>
<%@page import="pack.member.MemberMgr" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberMgr" class="pack.member.MemberMgr"/>

<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("idKey"); // 세션 값을 읽어오면 됨

MemberBean bean = memberMgr.getMember(id);


if(bean == null){
	response.sendRedirect("../guest/guest_index.jsp");
	return; //세션이 없을 경우 service 메소드를 탈출하는 것
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="../images/favicon.ico" />
<link rel="icon" href="../images/favicon.ico">

<script src="../js/script.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">


window.onload = function(){
	document.getElementById("btnUpdateOk").onclick = memberUpdateOk;
	document.getElementById("btnUpdateCancel").onclick = memberUpdateCancel;
	document.getElementById("btnDelete").onclick = memberMgr.deleteMember(request.getParameter("id"));
}
</script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</head>
<body>
<form action="memberupdateproc.jsp" name="updateForm" method="post">
<table style="width: 90%; text-align:left;">
	<tr>
		<td colspan="2" style="color:blue">
		<%= bean.getname() %> 회원님의 정보를 수정합니다.
		</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><%=bean.getId() %></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
		<input size="70" type="password" name="passwd" value="<%=bean.getId() %>">
		</td>
	</tr>
	<tr>
	<td>비밀번호 재확인</td>
	<td>
	<input type="password"
					name="repasswd" size="70">
					</td>
	</tr>
	<tr>
		<td>회원명</td>
		<td>
		<input size="70" type="text" name="name" value="<%=bean.getname() %>">
		</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>
		<input size="70" type="text" name="email" value="<%=bean.getEmail() %>">
		</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td>
		<input size="70" type="text" name="phone" value="<%=bean.getPhone() %>">
		</td>
	</tr>
			<tr>
				<td>우편번호</td>
				<td><input style="text-align: center;" type="text" name="zipcode" id="zipcode"
					value="<%=bean.getZipcode() %>"> <button class="reg_btn"
					onclick="sample6_execDaumPostcode()" value="우편번호 찾기">우편번호</button><br>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input size="30px" type="text" name="address" id="address"
					value="<%=bean.getAddress() %>"> <input type="text" name="extraAddress"
					id="sample6_extraAddress" value="<%=bean.getExtraAddress() %>"> <input
					type="text" name="detailAddress" id="sample6_detailAddress"
					value="<%=bean.getDetailAddress() %>"></td>
			</tr>
			<tr>
				<td>직업</td>
				<td><select name="job">
						<option value="<%=bean.getJob()%>"><%=bean.getJob() %></option>
						<option value="회사원">회사원</option>
						<option value="학생">학생</option>
						<option value="자영업">자영업</option>
						<option value="주부">주부</option>
						<option value="기타">기타</option>
				</select></td>
			</tr>
			<br>
		<tr>
			<td colspan ="2" style="text-align:left;">
				<button class="reg_btn" id="btnUpdateOk">수정완료</button>
				<button class="reg_btn" id="btnUpdateCancel">수정취소</button>
				<button class="reg_btn" id="btnDelete">회원탈퇴</button>
			</td>
</table>
</form>

</body>
</html>