<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    <%@include file="../header/header.jsp"%>
           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product</title>
<style>
h1 {
	color: black;
}
</style>
</head>
<body>

<div class="wrapper">
	<div class="wrap">
		
		<div class="content_area">
			<div class="line">
			</div>			
			<div class="content_top">
				<div class="ct_left_area">
					<div class="image_wrap" data-p_no="${productInfo.imageVO[0].p_no}" data-path="${productInfo.imageVO[0].uploadPath}" data-uuid="${productInfo.imageVO[0].uuid}" data-filename="${productInfo.imageVO[0].fileName}">
						<img>
					</div>			
				</div>
				<div class="ct_right_area">
					<div class="title">
						<h1>
							${productInfo.p_name}
						</h1>
					</div>
					<div class="line">
					</div>
					<div class="p_producer">
						 <span>
						 	${productInfo.p_producer} 제작
						 </span>
						 <span>|</span>
						 <span>
						 	${productInfo.p_type}
						 </span>
						 <span>|</span>
						 <span class="publeyear">
						 	<fmt:formatDate pattern="yyyy년MM월dd일" value="${productInfo.regdate}" />
						 </span>
					</div>
					<div class="line">
					</div>	
					<div class="price">
						<div class="sale_price">정가 : <fmt:formatNumber value="${productInfo.price}" pattern="#,### 원" /></div>
						<div class="discount_price">
						<%-- 	판매가 : <span class="discount_price_number"><fmt:formatNumber value="${goodsInfo.bookPrice - (goodsInfo.bookPrice*goodsInfo.bookDiscount)}" pattern="#,### 원" /></span> 
							[<fmt:formatNumber value="${goodsInfo.bookDiscount*100}" pattern="###" />% 
							<fmt:formatNumber value="${goodsInfo.bookPrice*goodsInfo.bookDiscount}" pattern="#,### 원" /> 할인] --%>
						</div>						
					</div>			
					<div class="line">
					</div>	
					<div class="button">						
						<div class="button_quantity">
							주문수량
							<input type="text" class="quantity_input" value="1">
							<span>
								<button class="plus_btn">+</button>
								<button class="minus_btn">-</button>
							</span>
						</div>
						<div class="button_set">
							<a class="btn_basket">장바구니 담기</a>
							<a class="btn_buy">바로구매</a>
						</div>
					</div>
				</div>
			</div>
			<div class="line">
			</div>				
			<div class="content_middle">
				<div class="product_content">
					${productInfo.p_content}
				</div>
			</div>
			<div class="line">
			</div>				
	
				
			
				<div class="repy_pageInfo_div"> 
					<ul class="pageMaker">
					<!--					
						<li class="pageMaker_btn prev">
							<a>이전</a>
						</li>
						<li class="pageMaker_btn">
							<a>1</a>
						</li>
						<li class="pageMaker_btn">
							<a>2</a>
						</li>
						<li class="pageMaker_btn active">
							<a>3</a>
						</li>													
						<li class="pageMaker_btn next">
							<a>다음</a>
						</li>
					 -->						
					</ul>
				</div>
					
				
			</div>
			<!-- 주문 form -->
			<%-- <form action="/order/${member.memberId}" method="get" class="order_form">
				<input type="hidden" name="orders[0].bookId" value="${goodsInfo.bookId}">
				<input type="hidden" name="orders[0].bookCount" value="">
			</form>	 --%>
		</div>
		

<script>
$(document).ready(function(){
	
	/* 이미지 삽입 */
	const bobj = $(".image_wrap");
	
	if(bobj.data("p_no")){
		const uploadPath = bobj.data("path");
		const uuid = bobj.data("uuid");
		const fileName = bobj.data("filename");
		const extensionName = fileName.substring(fileName.lastIndexOf("."));
		const pureFileName = fileName.substring(0, fileName.lastIndexOf("."));
		const fileCallPath = encodeURIComponent(uploadPath + "/" + pureFileName + "_" + uuid + "_s" + extensionName);

		bobj.find("img").attr('src', '/project1/display?fileName=' + fileCallPath);
	} else {
		bobj.find("img").attr('src', '/resources/img/goodsNoImage.png');
	}	
	
	
	
});	//$(document).ready(function(){


// 수량 버튼 조작
	var quantity = $(".quantity_input").val();
	$(".plus_btn").on("click", function(){
		$(".quantity_input").val(++quantity);
	});
	$(".minus_btn").on("click", function(){
		if(quantity > 1){
			$(".quantity_input").val(--quantity);	
		}
	});	

// 서버로 전송할 데이터
	var form = {
			p_no : '${productInfo.p_no}',
			u_id : 'user0',
			quantity : ''
	}
// 장바구니 추가 버튼
	$(".btn_basket").on("click", function(e){
		form.quantity = $(".quantity_input").val();
		$.ajax({
			url: '/project1/home/add/',
			type: 'POST',
			data: form,
			success: function(result){
				basketAlert(result);
			}
		})
	});
	
	function basketAlert(result){
		if(result == '0'){
			alert("장바구니에 추가를 하지 못하였습니다.");
		} else if(result == '1'){
			alert("장바구니에 추가되었습니다.");
		} else if(result == '2'){
			alert("장바구니에 이미 추가되어져 있습니다.");
		} else if(result == '5'){
			alert("로그인이 필요합니다.");	
		}
	}

	/* 바로구매 버튼 */
	$(".btn_buy").on("click", function(){
		let bookCount = $(".quantity_input").val();
		$(".order_form").find("input[name='orders[0].bookCount']").val(bookCount);
		$(".order_form").submit();
	});


			
/* 			/* 페이지 버튼 
			
			let reply_pageMaker = '';	
			
				/* prev 
				if(pf.prev){
					let prev_num = pf.pageStart -1;
					reply_pageMaker += '<li class="pageMaker_btn prev">';
					reply_pageMaker += '<a href="'+ prev_num +'">이전</a>';
					reply_pageMaker += '</li>';	
				}
				/* numbre btn 
				for(let i = pf.pageStart; i < pf.pageEnd+1; i++){
					reply_pageMaker += '<li class="pageMaker_btn ';
					if(pf.cri.pageNum === i){
						reply_pageMaker += 'active';
					}
					reply_pageMaker += '">';
					reply_pageMaker += '<a href="'+i+'">'+i+'</a>';
					reply_pageMaker += '</li>';
				}
				/* next 
				if(pf.next){
					let next_num = pf.pageEnd +1;
					reply_pageMaker += '<li class="pageMaker_btn next">';
					reply_pageMaker += '<a href="'+ next_num +'">다음</a>';
					reply_pageMaker += '</li>';	
				}	
				
				console.log(reply_pageMaker);
			$(".pageMaker").html(reply_pageMaker);				
			
		}	
	}*/
		
	
	
	
	
</script>

</body>
</html>