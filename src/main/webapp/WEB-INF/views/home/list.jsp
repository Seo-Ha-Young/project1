<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../header/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
  color: #666;
  font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;
}
table {
  border-collapse: separate;
  border-spacing: 0;
  width: 100%;
}
th,
td {
  padding: 6px 15px;
}
th {
  background: #42444e;
  color: #fff;
  text-align: left;
}
tr:first-child th:first-child {
  border-top-left-radius: 6px;
}
tr:first-child th:last-child {
  border-top-right-radius: 6px;
}
td {
  border-right: 1px solid #c6c9cc;
  border-bottom: 1px solid #c6c9cc;
}
td:first-child {
  border-left: 1px solid #c6c9cc;
}
tr:nth-child(even) td {
  background: #eaeaed;
}
tr:last-child td:first-child {
  border-bottom-left-radius: 6px;
}
tr:last-child td:last-child {
  border-bottom-right-radius: 6px;
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
	

	
	

});
</script>

</head>
<body>

<table>
  <thead>
    <tr>
      <th>상품 번호</th>
      <th>상품이미지</th>
      <th>상품이름</th>
      <th>가격</th>

    </tr>
  </thead>
  <tbody>
  	<c:forEach items="${list}" var="product">
		<tr>
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
</body>
</html>