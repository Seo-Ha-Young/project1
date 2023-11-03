<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header/header.jsp"%>


<html>
<head>
<title>상품 상세 정보</title>
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

	// 장바구니 추가 버튼
	$(".btn_cart").on("click", function(e){
		form.p_noCount = $(".quantity_input").val();
		$.ajax({
			url: '/cart/add',
			type: 'POST',
			data: form,
			success: function(result){
				condole.log(result);
				cartAlert(result);
			}
		})
	});
	
</script>
</head>
<body>

	<div class="container">
  <thead>
  	<div class="row">
	
			<div class="col-md-8">
				<br>
				<p>
					<b>상품번호 : </b><span >${productInfo.p_no}</span>
				<p>
					<b>상품이름</b> : ${productInfo.p_name}
				<p>
					<b>상품 타입</b> : ${productInfo.p_type}
				<p>
					<b>상품 제작회사</b> : ${productInfo.p_producer}
				<p>
					<b>상품크기</b> : ${productInfo.p_size}
					<p>
					<b>상품가격</b> : ${productInfo.price}
					<p>
					<b>상품설명</b> : ${productInfo.p_content}
					<p>
					<b>상품수량</b> : ${productInfo.stock}
					<p>
					<b>상품 판매유무</b> : ${productInfo.sale}
				<p>
					<b>상품 등록날짜</b> : <fmt:formatDate pattern="yyyy년MM월dd일" value="${productInfo.regdate}" />
			<%-- 	<h4>${book.unitPrice}원</h4>
				<br>
				<form:form name="addForm" method="put">
					<p>
						<a href="javascript:addToCart('../cart/add/${book.bookId}')"
							class="btn btn-primary">도서주문 &raquo;</a> <a
							href="<c:url value="/cart"/>" class="btn btn-warning">장바구니
							&raquo;</a> <a href="<c:url value="/books"/>"
							class="btn btn-secondary">도서 목록 &raquo;</a>
						<sec:authorize access="isAuthenticated()">
							<a href="<c:url value="/books/update?id=${book.bookId}" />"
								class="btn btn-success">수정 &raquo;</a>
							<a href="<c:url value="javascript:deleteConfirm('${book.bookId}')" />"
								class="btn btn-success">삭제 &raquo;</a>
						</sec:authorize>
					</p>
				</form:form>
			</div>
		</div>
    <tr>
      <th><input type="checkbox" class='chkAll'></th>
      <th>상품 번호</th>
      <th>상품이미지</th>
      <th>상품이름</th>
      <th>가격</th>

    </tr>
  </thead>
  <tbody>
  	<c:forEach items="${list}" var="product">
		<tr>
			<td>
				<input type="checkbox" class='chkGrp'>
			</td>
			<td><c:out value="${product.p_no}" /></td>
			<td>
				<div class="image_wrap" data-p_no="${product.imageVO[0].p_no}" data-path="${product.imageVO[0].uploadPath}" data-uuid="${product.imageVO[0].uuid}" data-filename="${product.imageVO[0].fileName}">
					<img>
				</div>									
		 	</td>
			<td><c:out value="${product.p_name}" /></td>
			<td><c:out value="${product.price}" /></td>		
		</tr>
	</c:forEach>
  </tbody>
</table>
<div>
	<a class="btn_cart">장바구니 담기</a>
</div>
</body> --%>
</body>
</html>