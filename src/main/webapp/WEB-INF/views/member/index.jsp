<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	</style>
<!-- 	<link rel="stylesheet" href="../css/bootstrap.css">
	<link rel="stylesheet" href="../css/custom.css"> -->
	<title>회원가입 페이지</title>
	<Script src="https://code.jquery.com/jquery-3.1.1.min.js"></Script>
<!-- 	<script src="js/bootstrap.js"></script> -->
	<script>
		$(document).ready(function(){
		
			$(".checkId").click(function(){
				var Id = $("#id").val();
				console.log(Id);
				var data = {id : Id} // '컨트롤에 넘길 데이터 이름' : '데이터(id에 입력되는 값)'
				console.log(data);
				$.ajax({
					type : "post",
					url : "/project1/member/memberIdChk",
					data : data,
					dataType: 'json',
					success : function(result){
						console.log("성공 여부" + result);
						if(result != 'fail'){
							$('.id_input_re_1').css("display","inline-block");
							$('.id_input_re_2').css("display", "none");	
						} else {
							$('.id_input_re_2').css("display","inline-block");
							$('.id_input_re_1').css("display", "none");
						}	
					}// success 종료
				}); // ajax 종료	
			});
			
			
		});
	</script>
</head>
<body>
	<div class="container">
		<form method="post" action="./userRegister">
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
 						</td>
	 				</tr>
	 				<tr>
	 					<td style="width: 110px;"><h5>비밀번호</h5>></td>
	 					<td colspan="2"><input class="form-control" type="password" id="pw" name="pw" maxLength="20"></td>
	 				</tr>
	 				<tr>
	 					<td style="width: 110px;"><h5>비밀번호 확인</h5>></td>
	 					<td colspan="2"><input class="form-control" type="password" id="userPassword2" name="userPassword2" maxLength="20"></td>
	 				</tr>
	 				<tr>
	 					<td style="width: 110px;"><h5>이름</h5>></td>
	 					<td colspan="2"><input class="form-control" type="text" id="name" name="name" maxLength="20"></td>
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
	 					<td colspan="2"><input class="form-control" type="tel" id="p_number" name="p_number" maxLength="20"></td>
	 				</tr>
	 				<tr>
	 					<td style="width: 110px;"><h5>이메일</h5>></td>
	 					<td colspan="2"><input class="form-control" type="email" id="email" name="email" maxLength="20"></td>
	 				</tr>
	 				<tr>
	 					<td style="width: 110px;"><h5>주소</h5>></td>
	 					<td colspan="2"><input class="form-control" type="text" id="address" name="address"></td>
	 				</tr>
	 				<tr>
	 					<td style="text-align: Left" colspan="3"><input class="btn btn-primary pull-right" type="submit" value="회원가입"></td>
	 				</tr>
	 			</tbody>
	 		</table>
	 	</form>
	 </div>
</body>
</html>