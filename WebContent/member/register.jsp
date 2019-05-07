<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입 정보입력</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="../images/favicon.ico" />
<link rel="icon" href="../images/favicon.ico">
<script src="../js/script.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
window.onload = function(){
	regForm.id.focus();
	document.getElementById("btnId").onclick = idCheck;
	document.getElementById("btnSubmit").onclick = inputCheck;
}
</script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
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
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
</head>
<body>
	<form name="regForm" method="post" action="registerproc.jsp">
		<div>
			<div id=dvh>
				<h1
					style="text-align: left; font-family: gulim; background-color: #333333; color: white; margin: 9px 0; padding: 20px 0;">회원가입</h1>
			</div>
			<div id=dvl style="padding: 32px 0 2px;">
				<h3 style="padding-left: 20px;">정보 입력</h3>
			</div>
			<div id=dvr style="padding: 32px 0 2px; list-style: none;">
				<li style="padding-bottom: 18px;"><input type="text" name="id"
					size="70" placeholder="아이디">
					<button class="reg_btn" type="button" value="ID중복확인" id="btnId">ID중복확인</button>
				</li>

				<li style="padding-bottom: 18px;"><input type="password"
					name="passwd" size="70" placeholder="비밀번호"></li>
				<li style="padding-bottom: 18px;"><input type="password"
					name="repasswd" size="70" placeholder="비밀번호 재입력"></li>
				<li style="padding-bottom: 18px;"><input type="text"
					name="name" size="70" placeholder="이름"></li>
				<li style="padding-bottom: 18px;"><input type="text"
					name="email" size="70" placeholder="이메일"></li>
				<li style="padding-bottom: 18px;"><input type="text"
					name="phone" size="70" placeholder="휴대폰 번호입력"></li>
				<li style="padding-bottom: 18px;"><input type="text"
					name="zipcode" id="zipcode" placeholder="우편번호">
					<button class="reg_btn" type="button"
						onclick="sample6_execDaumPostcode()" value="우편번호 찾기">우편번호</button>
				</li>
				<li style="padding-bottom: 18px;"><input type="text"
					name="address" id="address" placeholder="주소"> <input
					type="text" name="extraAddress" id="sample6_extraAddress"
					placeholder="참고항목"> <input type="text" name="detailAddress"
					id="sample6_detailAddress" placeholder="상세주소"></li>
				<td style="padding-bottom: 18px;"><select name="job" >
						<option value="0">직업을 선택해주세요
						<option value="회사원">회사원
						<option value="학생">학생
						<option value="자영업">자영업
						<option value="주부">주부
						<option value="기타">기타
				</select></td>
			</div>
			<div id=dvl style="padding: 32px 0 2px;">
				<h3 style="padding-left: 20px;">약관 동의</h3>
			</div>
			<div id=dvr style="padding: 32px 0 2px; list-style: none;">
				<li style="padding-bottom: 18px;">
					<p>필수 동의 항목</p>
					<p>
						<input type="checkbox" id="c1" name="c1" /> <label for="c1"><span></span>전자금융서비스
							이용약관</label>
					</p>
					<p>
						<input type="checkbox" id="c2" name="c2" /> <label for="c2"><span></span>개인정보
							수집 및 이용</label>
					</p>
				</li>
			</div>
			<div id=dvb>
				<button class="reg_btn" type="button" value="회원가입" id="btnSubmit">회원가입</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="reg_btn" type="reset" value="다시쓰기">다시쓰기</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="reg_btn" type="button" value="메인으로"
					onclick="location.href='../index.jsp'">메인으로</button>
			</div>
		</div>
	</form>
</body>
</html>