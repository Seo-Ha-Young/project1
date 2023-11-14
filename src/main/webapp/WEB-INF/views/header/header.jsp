<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
header {
  position: relative;
}

nav {
  position: relative;
  top: 10;
  right: 150;
  padding: 20px;
}

h1 {
  display: inline-block;
  vertical-align: middle;
  color: white;
  margin: 0.5rem;
  padding: 0;
}

nav {
  display: inline-block;
  vertical-align: middle;
}

ul {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex; 
}

li.icon {
  flex-basis: 25%;
}

header {
  background: cadetblue;
  padding: 20px;
}

a {
  display: block;
  text-align: center;
  margin: .25rem;
  padding: .5rem 1rem;
  text-decoration: none;
  font-weight: bold;
  color: white;
  background: teal;
}

a:hover {
  background: yellowgreen;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

a.button {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	 position: absolute;
	 top:50%;
  right: 0;
   margin: 0;
  padding: 0;
}

a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}

    </style> 
<script>
$(document).ready(function(e) {
	$("#logout").click(function(){
		//alert("버튼 작동");
		$.ajax({
			type:"POST",
			url:"/project1/member/logout",
			success:function(data){
				alert("로그아웃 성공");
				document.location.href="../../home/list"
			} 
		}); // ajax 
	});
	
});
</script>
<header>
 <c:if test="${member_authority == null}">
	  <h1>쇼핑몰 이름</h1>
	  <nav>
	    <ul>
	      <li><a href="/project1/home/list/">제품 목록</a></li>
	    </ul>
	  </nav>
	  <a class="button"  onclick="location.href='/project1/member/login';">로그인</a>
  </c:if>
<c:if test="${member_authority!=null}">
<c:if test="${member_authority=='user'}">
	  <h1>쇼핑몰 이름</h1>
	  <nav>
	    <ul>
	      <li><a href="/project1/home/list/">제품 목록</a></li>
	      <li><a href="/project1/home/shoppingBasket/">장바구니</a></li>
	      <li><a href="#">회원 정보 수정</a></li>
	    </ul>
	  </nav>
	  <a class='button' id='logout'>로그아웃</a>
	  	  </c:if>
<c:if test="${member_authority=='admin'}">
	  <h1>쇼핑몰 이름</h1>
	  <nav>
	    <ul>
	      <li><a href="/project1/home/list/">제품 목록</a></li>
	      <li><a href="/project1/home/shoppingBasket/">장바구니</a></li>
	      <li><a href="#">회원 정보 수정</a></li>
	      <li><a href="#">회원 목록</a></li>
	      <li><a href="/project1/home/register/">제품 등록</a></li>
	    </ul>
	  </nav>
	  <a class='button' id='logout'>로그아웃</a>
</c:if>
</c:if>

</header>