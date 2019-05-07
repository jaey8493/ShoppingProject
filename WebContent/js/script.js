function idCheck(){
	if(regForm.id.value === ""){
		alert("id를 입력하세요");
		regForm.id.focus();
	}else{
		url = "idcheck.jsp?id=" + regForm.id.value;
		window.open(url, "","width=300,height=150,left=150,top=150");
	}
}

function inputCheck(){
	var chk1=regForm.c1.checked;
	var chk2=regForm.c2.checked;
	if(regForm.id.value == ""){
		alert("id 입력하세요!");
		regForm.id.focus();
		return;
	}
	if(regForm.passwd.value !== regForm.repasswd.value){
		alert("비밀번호가 틀렸습니다!");
		regForm.passwd.focus();
		return;
	}
	if(regForm.name.value == ""){
		alert("이름을 다시 입력하세요");
		regForm.name.focus();
		return;
	}
	if(regForm.job.value =="0"){
		alert("직업을 선택해주세요");
		regForm.job.focus();
		return;
	}
	if(!chk1 || !chk2){
		alert("정보 이용을 확인해주세요")
		regForm.c1.focus();
		regForm.c2.focus();
		return;
	}
	
	// 이메일, 전화번호... 얘네들 입력자료 검사(정규 표현식 추천) 생략...
	document.regForm.submit();
}

	function memberUpdateOk(){
		if(regForm.passwd.value !== regForm.repasswd.value){
			alert("비밀번호가 틀렸습니다!");
			regForm.passwd.focus();
			return;
		}
		document.updateForm.submit();
		
	}
	
	function memberUpdateCancel(){
		location.href="../guest/guest_index.jsp"
	}
	
	/*function memberDelete(){
		if (confirm("정말 탈퇴하시겠습니까?")) {
			document.delForm.no.value = no;
			document.delForm.submit();
		}
	}*/
		
	// 관리자 관련 메뉴
	function func1AdminLogin(){
		if(adminloginform.adminid.value == ""){
			alert("id를 입력하시오");
			adminloginform.adminid.focus();
			return;
		}
		if(adminloginform.adminpasswd.value == ""){
			alert("Password를 입력하시오");
			adminloginform.adminpasswd.focus();
			return;
	}
		adminloginform.submit();
	}
	function func1AdminHome(){
		location.href="../index.jsp";
	}
	// 관리자 입장에서 각 회원 수정
	function memUpdate(id){ 
		//alert(id);
		document.updateFrm.id.value = id;
		document.updateFrm.submit(); // membermanager를 거쳐서 memberupdate_admin.jsp로 보냄
	}
	
	function memberUpdateAdmin(){
		document.updateFormAdmin.submit();
	}
	
	function memberUpdateCancelAdmin(){
		location.href ="membermanager.jsp";		
	}
	
	// 사용자에서 상품처리

	function productDetail_guest(no){
		document.detailFrm.no.value = no;
		document.detailFrm.submit();
	}
	
	// 관리자에서 상품 처리
	function productDetail(no){
		document.detailForm.no.value = no;
		document.detailForm.submit();
	}
	
	function ProductUpdate(no) { //productdetail.jsp 참고
		if(confirm("정말 수정하시겠습니까?")){
		document.updateForm.no.value = no;
		document.updateForm.submit();
		}
		
	}
	function ProductDelete(no) { //productdetail.jsp 참고
		if(confirm("정말 삭제하시겠습니까?")){
		document.delForm.no.value = no;
		document.delForm.submit();
		}
		
	}
	
// 카트 처리용
function cartUpdate(form){
		form.flag.value = "update";
		form.submit();
}

function cartDelete(form){
		form.flag.value = "del";
		form.submit();
}

// 관리자에서 주문 처리
function orderDetail(no){
	document.detailFrm.no.value = no; //detailFrm.은 ordermanager.jsp에서 확인 가능
	document.detailFrm.submit();
}

function orderUpdate(form){
	document.detailFrm.flag.value = "update";
	form.submit();
}

function orderDelete(form){
	document.detailFrm.flag.value = "delete";
	form.submit();
}