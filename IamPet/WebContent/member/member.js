
function loading(form) {
	form.id.focus();
}
function idCheck(form) {
	if (is_null(form.id.value)) {
		alert("검색할 아이디를 입력하시고 중복체크를 확인하셔요....");
		form.id.focus();
		return true;
	}

	if (!isID(form.id)) {
		alert("아이디가 적절하지 않습니다...\n" + "영문과 숫자를 사용하셔요...");
		return;
	}

	var url = "id_check.jsp?id=" + form.id.value;
	
	//window.open("http://m.naver.com", "a", "toolbar='no',resizable='no',width=500,height=300,left=250,top=200");
	
	sp_window_open(url, "중복확인",
			"toolbar='no',resizable='no',width=500,height=300,left=250,top=200");
}

function form_submit(form, action) {
	if (is_null_field(form))
		return;

	if (!isID(form.id)) {
		alert("아이디가 적절하지 않습니다...\n" + "영문과 숫자 사용");
		return;
	}

	if (!isSame(form.passwd1, form.passwd2)) {
		alert("비밀번호와 재입력이 일치하지 않습니다..");
		return;
	}

	if (!isEmail(form.email)) {
		alert("E-mail 주소가 적절하지 않습니다..");
		return;
	}
	if (!isSSN(form.ssn1, form.ssn2)) {
		alert("주민등록 번호가 적절하지 않습니다..");
		return;
	}

	sp_form_submit(form, action, 'POST', '', '');
}

function is_null_field(form) {

	if (is_null(form.id.value) || is_space(form.id.value)) {
		alert("아이디를 입력하여 주십시요.");
		form.id.focus();
		return true;
	}
	if (is_null(form.passwd1.value) || is_space(form.passwd1.value)) {
		alert("비밀번호를 입력하여 주십시요.");
		form.passwd1.focus();
		return true;
	}
	if (is_null(form.name.value) || is_space(form.name.value)) {
		alert("이름을 입력하여 주십시요.");
		form.name.focus();
		return true;
	}
	if (is_null(form.ssn1.value) || is_space(form.ssn1.value)) {
		alert("주민등록번호를 입력하여 주십시요.");
		form.ssn1.focus();
		return true;
	}
	if (is_null(form.email.value) || is_space(form.email.value)) {
		alert("이메일을 입력하여 주십시요.");
		form.email.focus();
		return true;
	}
	if (is_null(form.ddd.value) || is_space(form.ddd.value)) {
		alert("지역번호를 입력하여 주십시요.");
		form.ddd.focus();
		return true;
	}
	if (is_null(form.no1.value) || is_space(form.no1.value)) {
		alert("전화번호를 입력하여 주십시요.");
		form.no1.focus();
		return true;
	}
	if (is_null(form.no2.value) || is_space(form.no2.value)) {
		alert("전화번호를 입력하여 주십시요.");
		form.no2.focus();
		return true;
	}
	if (is_null(form.mobile2.value) || is_space(form.mobile2.value)) {
		alert("전화번호를 입력하여 주십시요.");
		form.mobile2.focus();
		return true;
	}
	if (is_null(form.mobile3.value) || is_space(form.mobile3.value)) {
		alert("핸드폰 번호를 입력하여 주십시요.");
		form.mobile3.focus();
		return true;
	} else if (is_null(form.address.value) || is_space(form.address.value)) {
		alert("핸드폰 번호를 입력하여 주십시요.");
		form.address.focus();
		return true;
	}
}
window.onload=function(){
	document.join.id.focus();
}











