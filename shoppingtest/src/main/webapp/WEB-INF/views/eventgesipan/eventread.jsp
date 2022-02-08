<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event</title>

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- custom css file link  -->
<link rel="stylesheet" href="/control/resources/css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	$(document).ready(function() {
		var fObject = $(".form");

		$(".btnList").on("click", function() {

			fObject.attr("method", "get");
			fObject.attr("action", "/control/eventgesipan/eventmain");
			fObject.submit();

		})
		$(".btnRemove").on("click", function() {
			fObject.attr("action", "/control/eventgesipan/eventremove");
			fObject.submit();
		})
		$(".btnModify").on("click", function() {
			fObject.attr("method", "get");
			fObject.attr("action", "/control/eventgesipan/eventmodify");
			fObject.submit();
		})
	});
</script>

<style>
#eventtitle{
margin: 20px 0px 0px 50%;
}
</style>
</head>
<body>
	<!-- header section starts 페이지 최상단  -->

	<header>

		<div class="header-1">

			<a href="http://localhost:8081/control/" class="logo"><i
				class="fas fa-shopping-basket"></i>FECS#</a>

			<form action="" class="search-box-container">
				<input type="search" id="search-box" placeholder="search here...">
				<label for="search-box" class="fas fa-search"></label>
			</form>

			<div class="icons">
				<a href="#" class="fas fa-shopping-cart"></a>
            	<a href="/control/eventgesipan/eventmain" class="fas fa-gift"></a>
            	<a href="../mypage/mypage1" class="fas fa-user-circle"></a>
			</div>


		</div>

		<div class="header-2">

			<div id="menu-bar" class="fas fa-bars"></div>

			<nav class="navbar">
				<a href="/control/appliances"><b>가전제품</b></a> <a
					href="/control/cloth" style="margin-left: 10px;"><b>의류</b></a> <a
					href="/control/food" style="margin-left: 10px;"><b>식품</b></a> <a
					href="/control/sports" style="margin-left: 10px;"><b>스포츠</b></a>
			</nav>
        <div class="login">
            <a href="../login/login">로그인 </a>&puncsp;
            <a href="../login/signUp"> 회원가입 </a>&puncsp;
            <a href="../usergesipan/usergesipanmain"> 고객센터</a>
			</div>
		</div>

	</header>

	<!-- header section ends 페이지최상단종료 -->

	<!-- home section starts 페이지중단시작  -->

	<!-- category section starts  -->

	<div class="main">

		<form class="form" method="GET">
			<input type='hidden' name='bno' value="${eventDTO.bno}"> <input
				type='hidden' name='page' value="${pageMaker.page}"> <input
				type='hidden' name='perPageNum' value="${pageMaker.perPageNum}">
			<input type='hidden' name='searchType'
				value="${pageMaker.searchType}"> <input type='hidden'
				name='keyword' value="${pageMaker.keyword}">
		</form>
		<h1 id="eventtitle">글 제목</h1>
			<input type="text" name='title' style="width: 100%;font-size:20px; font-weight:bolder; text-align:center;"
				value="${eventDTO.title}" readonly="readonly" >

		<h2>
			내용
					<div class="box">
						<img src="../resources/img/event/${eventDTO.image}.PNG" style="width:100%;">
					</div>
			</h2>
			<h2>
				<textarea style="width: 100%; font-size:14px; text-align:center" name="content" rows="4"
					readonly="readonly">${eventDTO.content}</textarea>
			</h2>
			<h2>
				작성자 <input type="text" name="id" style="width: 100%"
					value="${eventDTO.id}" readonly="readonly">
				</h2>

					<!-- /.box-body -->
					<div class="box-footer">
						<button type="submit" class="btnModify">수정</button>
						<button type="submit" class="btnRemove">삭제</button>
						<button type="submit" class="btnList">목록</button>
					</div>
					<br>
					<div id="reply">
					<ol class="replyList">
					<c:forEach items="${replyList}" var="item">
					작성자 : ${item.id}<br/>
					작성 날짜: <fmt:formatDate value="${item.regdate}" pattern="yyyy-MM-dd" />
							</p><p>${item.content}</p>
							</li>
							
						</c:forEach>
					</ol>
					
					</div> 
					
					


<%-- 					<div id="reply">
					<ol class="replyList">
						<c:forEach items="${replyList}">
							<li>
							<p>
							작성자 : ${replyList.id}<br/>
							작성 날짜: <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
							</p><p>${replyList.content}</p>
							</li>
							
						</c:forEach>
					</ol>
					
					</div>  --%>

	</div>


	<!-- product section ends -->







	<!-- footer section starts  -->

	<section class="footer" style="background-color: #EEEEEE;">

		<div class="box-container">

			<div class="box">
				<a href="#" class="logo"><i class="fas fa-shopping-basket"></i>FECS#</a>
				<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit.
					Ullam culpa sit enim nesciunt rerum laborum illum quam error ut
					alias!</p>
				<div class="share">
					<a href="#" class="btn fab fa-facebook-f"></a> <a href="#"
						class="btn fab fa-twitter"></a> <a href="#"
						class="btn fab fa-instagram"></a> <a href="#"
						class="btn fab fa-linkedin"></a>
				</div>
			</div>

			<div class="box">
				<h3>our location</h3>
				<div class="links">
					<a href="#">india</a> <a href="#">USA</a> <a href="#">france</a> <a
						href="#">japan</a> <a href="#">russia</a>
				</div>
			</div>

			<div class="box">
				<h3>quick links</h3>
				<div class="links">
					<a href="#">home</a> <a href="#">category</a> <a href="#">product</a>
					<a href="#">deal</a> <a href="#">contact</a>
				</div>
			</div>

			<div class="box">
				<h3>download app</h3>
				<div class="links">
					<a href="#">google play</a> <a href="#">window xp</a> <a href="#">app
						store</a>
				</div>
			</div>

		</div>

		<h1 class="credit">
			created by <span> mr. web designer </span> | all rights reserved!
		</h1>

	</section>
</body>
</html>