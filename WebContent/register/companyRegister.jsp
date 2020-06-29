<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(function() {
		$('#name').keyup(function() {
			var name = $('#name').val();
			if (name.length == 0) {
				$('#nameCheckView').html("업체명을 입력해주세요.");
				return;
			} 
		}); // name keyup
		$('#email').keyup(function() {
			var email = $('#email').val();
			if (email.length == 0) {
				$('#emailCheckView').html("이메일을 입력해주세요.");
				return;
			} 
			$.ajax({
				type:'post',
				url:'comEmailExist.do',
				data:$('#registerFrm').serialize(),
				
				success:function(result) {
					if(result=='true')
						$('#emailCheckView').html("이미 사용중인  이메일입니다.");
					else
						$('#emailCheckView').html("사용 가능한 이메일입니다.");
				}
			}); // email ajax
		}); // email keyup
		$('#pass').keyup(function() {
			var pass = $('#pass').val();
			if (pass.length < 8) {
				$('#passCheckView').html("비밀번호는 8자 이상 입력해주세요.");
				 return;
			}
		}); // pass keyup
	}); // ready
</script>
</head>
<body>
<c:import url="http://localhost:8888/Fiesta/header.jsp" charEncoding="UTF-8"></c:import>

	<h1>Fiesta에 오신 것을 환영합니다.</h1>
	<form action="companyRegister.do" id="registerFrm">
		업체명 <br><input type="text" name="name" id="name" required="required"><br>
			<span id="nameCheckView"></span>
		이메일 <br><input type="text" name="email" id="email" required="required"><br>
			<span id="emailCheckView"></span>
		비밀번호 <br><input type="password" name="pass" id="pass" required="required"><br>
			<span id="passCheckView"></span>
		전화번호<br><input type="text" name="tel" id="tel"><br>
			<span id="telCheckView"></span>
		주소 <br><input type="text" name="addr" id="addr"><br>
			<span id="addrCheckView"></span>	
		업체로고등록<br><input type="text" name="img" id="img"><br>
			<span id="imgCheckView"></span>
		업체상세정보<br><input type="text" name="desc" id="desc"><br>
			<span id="descCheckView"></span>	
		업체분류 <select name="categoryCode" id="categoryCode">
			<option>선택해주세요</option>
			<option value=1>연예기획사</option>
			<option value=2>숙소</option>
			<option value=3>주류/렌탈</option>
			<option value=4>버스</option>
			<option value=5>음향조명</option>
			<option value=6>보험회사</option>
			<option value=7>푸드트럭</option>
			<option value=8>의류</option>
			<option value=9>현수막</option>
			<option value=10>협찬</option>		
		</select>
			<br><br>
		<input type="submit" value="회원가입" id="registerBtn">
	</form>
<c:import url="http://localhost:8888/Fiesta/footer.jsp" charEncoding="UTF-8"></c:import>
</body>
</html>


