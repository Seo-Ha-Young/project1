<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../header/header.jsp"%>
<html>
<head>
<title>shoppingBasket</title>
</head>
<style>
body {
	margin: 0;
}

* {
	box-sizing: border-box;
}

p, span {
	margin: 0;
}

a {
	color: black;
}

img {
	display: block;
	width: 80%;
	height: 80px;
	margin: auto;
}

.cart {
	width: 80%;
	margin: auto;
	padding: 30px;
}

.cart ul {
	background-color: whitesmoke;
	padding: 30px;
	margin-bottom: 50px;
	border: whitesmoke solid 1px;
	border-radius: 5px;
	font-size: 13px;
	font-weight: 300;
}

.cart ul :first-child {
	color: limegreen;
}

table {
	border-top: solid 1.5px black;
	border-collapse: collapse;
	width: 100%;
	font-size: 14px;
}

thead {
	text-align: center;
	font-weight: bold;
}

tbody {
	font-size: 12px;
}

td {
	padding: 15px 0px;
	border-bottom: 1px solid lightgrey;
	text-align: center;
}
table tr td input{
	border:none;
	border-right:0px; 
	border-top:0px; 
	boder-left:0px; 
	boder-bottom:0px;
	text-align: center;
	white-space: normal;
}

.cart__list__option {
	vertical-align: top;
	padding: 20px;
}

.cart__list__option p {
	margin-bottom: 25px;
	position: relative;
}

.cart__list__option p::after {
	content: "";
	width: 90%;
	height: 1px;
	background-color: lightgrey;
	left: 0px;
	top: 25px;
	position: absolute;
}

.cart__list__optionbtn {
	background-color: white;
	font-size: 10px;
	border: lightgrey solid 1px;
	padding: 7px;
}

.cart__list__detail :nth-child(3), .cart__list__detail :nth-child(4),
	.cart__list__detail :nth-child(5), .cart__list__detail :nth-child(6) {
	border-left: 2px solid whitesmoke;
}

.cart__list__detail :nth-child(5), .cart__list__detail :nth-child(6) {
	text-align: center;
}

.cart__list__detail :nth-child(5) button {
	background-color: limegreen;
	color: white;
	border: none;
	border-radius: 5px;
	padding: 4px 8px;
	font-size: 12px;
	margin-top: 5px;
}

.price {
	font-weight: bold;
}

.cart__mainbtns {
	width: 420px;
	height: 200px;
	padding-top: 40px;
	display: block;
	margin: auto;
}

.cart__bigorderbtn {
	width: 200px;
	height: 50px;
	font-size: 16px;
	margin: auto;
	border-radius: 5px;
}

.cart__bigorderbtn.left {
	background-color: white;
	border: 1px lightgray solid;
}

.cart__bigorderbtn.right {
	background-color: limegreen;
	color: white;
	border: none;
}

#click {
	text-align: left;
}

</style>
<script type="text/javascript">
	$(document).ready(function() {
		(function() {

			$(".image_wrap").each(function(i, obj){
				
				const bobj = $(obj);
				
				if(bobj.data("p_no")){
					const uploadPath = bobj.data("path");
					const uuid = bobj.data("uuid");
					const fileName = bobj.data("filename");
					const extensionName = fileName.substring(fileName.lastIndexOf("."));
					const pureFileName = fileName.substring(0, fileName.lastIndexOf("."));
					const fileCallPath = encodeURIComponent(uploadPath + "/" + pureFileName + "_" + uuid + "_s" + extensionName);
					$(this).find("img").attr('src', '/project1/display?fileName=' + fileCallPath);
				} else {
					$(this).find("img").attr('src', './resources/img/goodsNoImage.png');
				}
				
			});		
		})();
		$(function() {
			$("#chkAll").click(function() {
				$(".chkGrp").attr("checked", this.checked);
			});
		});


		

/* 		function deleteAction() {
 */
			$(".delete_btn").on("click", function(e) {
				e.preventDefault();
				const b_no = $(this).data("b_no");
				$(".delete_b_no").val(b_no);
				$(".quantity_delete_form").submit();
			});
		/* } */
		
	});
</script>
<body>
	<section class="cart">
		<div class="cart__information">
			<ul>
				<li>장바구니 상품은 최대 30일간 저장됩니다.</li>
				<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
			</ul>
		</div>
		<div class="all_check_input_div">
			<input type="checkbox" id="chkAll">
		</div>
		<table class="cart__list">
		   <thead>
			<tr>
				<th></th>
				<th>상품이미지</th>
				<th>바구니번호</th>
				<th>상품번호</th>
				<th>상품명</th>
				<th>카트에 담은 날짜</th>
				<th>상품수량</th>
				<th>상품가격</th>
				<th>총금액</th>
			</tr>
		   </thead>
			<c:forEach items="${list}" var="basket">
			<tbody>
				<tr>
					<td class="td_width_2"> 
						<div class="image_wrap" data-p_no="${basket.productVO.imageVO[0].p_no}" data-path="${basket.productVO.imageVO[0].uploadPath}" data-uuid="${basket.productVO.imageVO[0].uuid}" data-filename="${basket.productVO.imageVO[0].fileName}">
							<img>
						</div>
					</td>
					<td>
						<input type="text" value="${basket.b_no}" disabled >
					</td>
					<td>
						<input type="text" value="${basket.p_no}" disabled>
					</td>
					<td>
					 <input	type="text" value="${basket.productVO.p_name}" disabled>
					 </td>
					 <td>
					 	 <fmt:formatDate pattern="yyyy년MM월dd일" value="${basket.b_regDate}" />
					 </td>
					 <td>
					 	 <input	type="number" value="${basket.quantity}" disabled>
					 </td>
					 <td>
					  	 <input type="number" value="${basket.productVO.price}" disabled>
					 </td>
					 <td>
						<input type="number" value="${basket.totalPrice}" disabled>
					</td>
				</tr>
			</tbody>
			<tfooter>
					<td><input type="checkbox">
					<button class="delete_btn" data-b_no="${basket.b_no}">선택상품
							삭제</button>
						<button class="cart__list__optionbtn">선택상품 선택</button> 총금액</td>
			</tfooter>
			</c:forEach>

		</table>

		<form action="/project1/home/delete" method="post" class="quantity_delete_form">
			<input type="hidden" name="b_no" class="delete_b_no">
		</form>
		<div class="cart__mainbtns">
			<button class="cart__bigorderbtn left"
				onclick="location.href='/project1/home/list'">쇼핑 계속하기</button>
			<button class="cart__bigorderbtn right">주문하기</button>
		</div>
	</section>
</body>
</html>