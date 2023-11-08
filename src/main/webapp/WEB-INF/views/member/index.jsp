<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header/header.jsp"%>
   
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style>
	/* 중복아이디 존재하지 않는경우 */
	.id_input_re_1{
		color : green;
		display : none;
	}
	/* 중복아이디 존재하는 경우 */
	.id_input_re_2{
		color : red;
		display : none;
	}
	span {
		display:none;
	}
	</style>
<!-- 	<link rel="stylesheet" href="../css/bootstrap.css">
	<link rel="stylesheet" href="../css/custom.css"> -->
	<title>회원가입 페이지</title>
	<Script src="https://code.jquery.com/jquery-3.1.1.min.js"></Script>
<!-- 	<script src="js/bootstrap.js"></script> -->
	<script>
	 /* 유효성 검사 통과유무 변수 */
	 var idCheck = false;			// 아이디
	 var idckCheck = false;			// 아이디 중복 검사
	 var pwCheck = false;			// 비번
	 var pwckCheck = false;			// 비번 확인
	 var pwckcorCheck = false;		// 비번 확인 일치 확인
	 var nameCheck = false;			// 이름
	 var p_numberCheck = false;			// 전화번호
	 var emailCheck = false;			// 이메일
	 var addressCheck = false 		// 주소
	
		$(document).ready(function(){
			//회원가입 버튼(회원가입 기능 작동)
			$(".join_button").click(function(){
				
				/* 입력값 변수 */
				var id = $('#id').val(); 				// id 입력란
				var pw = $('#pw').val();				// 비밀번호 입력란
				var pwck = $('#pwck').val();			// 비밀번호 확인 입력란
				var name = $('#name').val();			// 이름 입력란
				var p_number = $('#p_number').val();			// 전화번호 입력란
				var email = $('#email').val();			// 이메일 입력란
				var addr = $('#address').val();		// 주소 입력란
				
				/* 아이디 유효성검사 */
				if(id == ""){
					$('.final_id_ck').css('display','block');
					idCheck = false;
				}else{
					$('.final_id_ck').css('display', 'none');
					idCheck = true;
				}
				
				/* 비밀번호 유효성 검사 */
				if(pw == ""){
					$('.final_pw_ck').css('display','block');
					pwCheck = false;
				}else{
					$('.final_pw_ck').css('display', 'none');
					pwCheck = true;
				}
				
				/* 비밀번호 확인 유효성 검사 */
				if(pwck == ""){
					$('.final_pwck_ck').css('display','block');
					pwckCheck = false;
				}else{
					$('.final_pwck_ck').css('display', 'none');
					pwckCheck = true;
				}
				
				/* 이름 유효성 검사 */
				if(name == ""){
					$('.final_name_ck').css('display','block');
					nameCheck = false;
				}else{
					$('.final_name_ck').css('display', 'none');
					nameCheck = true;
				}	
				
				/* 전화번호 유효성 검사 */
				if(p_number == ""){
					$('.final_p_number_ck').css('display','block');
					p_numberCheck = false;
				}else{
					$('.final_p_number_ck').css('display', 'none');
					p_numberCheck = true;
				}		
				
				/* 이메일 유효성 검사 */
				if(email == ""){
					$('.final_email_ck').css('display','block');
					emailCheck = false;
				}else{
					$('.final_email_ck').css('display', 'none');
					emailCheck = true;
				}		
				
				/* 주소 유효성 검사 */
				if(addr == ""){
					$('.final_address_ck').css('display','block');
					addressCheck = false;
				}else{
					$('.final_address_ck').css('display', 'none');
					addressCheck = true;
				}		
				console.log("통과?");

				/* 최종 유효성 검사 */
				if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&p_numberCheck&&emailCheck&&addressCheck ){
					console.log("통과?");
					$("#join_form").attr("action", "/project1/member/userRegister");
					$("#join_form").submit();			
					$("#join_button").submit();			

				}		
				
				return false;

			});
			
			//아이디 중복 검사
			$(".checkId").click(function(){
				var Id = $("#id").val();
				console.log(Id);
				var data = {id : Id} // '컨트롤에 넘길 데이터 이름' : '데이터(id에 입력되는 값)'
				console.log(data);
				$.ajax({
					type : "post",
					url : "/project1/member/memberIdChk",
					data : data,
					dataType: 'text',
					success : function(result){
						console.log("성공 여부" + result);
						if(result != 'fail'){
							$('.id_input_re_1').css("display","inline-block");
							$('.id_input_re_2').css("display", "none");	
							idckCheck = true;
						} else {
							$('.id_input_re_2').css("display","inline-block");
							$('.id_input_re_1').css("display", "none");
							idckCheck = false;
						}	
					}// success 종료
				}); // ajax 종료	
			});
			
			
			/* 비밀번호 확인 일치 유효성 검사 */

			$('#pwck').on('propertychange change keyup paste input',function(){
				
				var pw = $('#pw').val();
				var pwck = $('#pwck').val();
				$('.final_pwck_ck').css('display', 'none');
				
				if(pw == pwck){
					$('.pwck_input_re_1').css('display','block');
					$('.pwck_input_re_2').css('display','none');
					pwckcorCheck = true;
				}else{
					$('.pwck_input_re_1').css('display','none');
					$('.pwck_input_re_2').css('display','block');
					pwckcorCheck = false;
				}
				
				
			});
			
		});
	</script>
</head>
<body>
	<div class="container">
		<form method="post" id='join_form'>
			<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
	 			<thead>
	 				<tr>
	 					<th colspan="3"><h4>회원 등록 양식</h4></th>
	 				</tr>
	 			</thead>
	 			<tbody>
	 				<tr>
	 					<td style="width: 110px;"><h5>아이디</h5>></td>
	 					<td><input class="form-control" type="text" class="input_id" id="id" name="id"  maxLength="20"></td>
	 					<td style="width: 110px;">
	 						<button class="btn btn-primary checkId" type="button">중복 체크</button>
	 						<span class="id_input_re_1">사용 가능한 아이디입니다.</span>	
							<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
							<span class="final_id_ck">아이디를 입력해주세요</span>	
 						</td>
	 				</tr>
	 				<tr>
	 					<td style="width: 110px;"><h5>비밀번호</h5>></td>
	 					<td colspan="2"><input class="form-control" type="password" id="pw" name="pw" maxLength="20">
	 					<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
	 					</td>

	 				</tr>
	 				<tr>
	 					<td style="width: 110px;"><h5>비밀번호 확인</h5>></td>
	 					<td colspan="2"><input class="form-control" type="password" id="pwck" name="pwck" maxLength="20">
	 					<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
				<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
				<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
	 					</td>
	 				</tr>
	 				<tr>
	 					<td style="width: 110px;"><h5>이름</h5>></td>
	 					<td colspan="2"><input class="form-control" type="text" id="name" name="name" maxLength="20">
	 					<span class="final_name_ck">이름을 입력해주세요.</span>
	 					</td>
	 				</tr>
	 				<tr>
	 					<td style="width: 110px;"><h5>나이</h5>></td>
	 					<td colspan="2"><input class="form-control" type="text" id="age" name="age" maxLength="20"></td>
	 				</tr>
	 				<tr>
	 					<td style="width: 110px;"><h5>성별</h5></td>
	 					<td colspan="2">
	 						<div class="form-group" style="text-align: center; margin: 0 auto;">
	 							<div class="btn-group" data-toggle="buttons">
	 								<label class="btn btn-primary active">
	 									<input type="radio" name="gender" autocomplete="off" value="man" checked>남자
	 								</label>
	 							</div>
	 							<div class="form-group" style="text-align: center; margin: 0 auto;">
	 								<label class="btn btn-primary active">
	 									<input type="radio" name="gender" autocomplete="off" value="woman">여자
	 								</label>
	 							</div>
	 						</div>
	 					</td>
	 				</tr>
	 					<tr>
	 					<td style="width: 110px;"><h5>전화번호</h5>></td>
	 					<td colspan="2"><input class="form-control" type="tel" id="p_number" name="p_number" maxLength="20">
	 									<span class="final_p_number_ck">전회번호를 입력해주세요.</span>
	 					
	 					</td>
	 				</tr>
	 				<tr>
	 					<td style="width: 110px;"><h5>이메일</h5>></td>
	 					<td colspan="2"><input class="form-control" type="email" id="email" name="email" maxLength="20">
	 									<span class="final_email_ck">이메일을 입력해주세요.</span>
	 					
	 					</td>
	 				</tr>
	 				<tr>
	 					<td style="width: 110px;"><h5>주소</h5>></td>
	 					<td colspan="2"><input class="form-control" type="text" id="address" name="address">
	 									<span class="final_address_ck">주소를 입력해주세요.</span>
	 					
	 					</td>
	 				</tr>
	 				<tr>
	 					<td style="text-align: Left" colspan="3"><input class="btn btn-primary pull-right join_button" type="button" value="회원가입"></td>
	 				</tr>
	 			</tbody>
	 		</table>
	 	</form>
	 </div>
</body>
</html>