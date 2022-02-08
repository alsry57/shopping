<%@page import="com.shop.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Event</title>

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- custom css file link  -->
<link rel="stylesheet" href="/control/resources/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
<!--게시판css-->
.main {
	-ms-flex: 70%; /* IE10 */
	flex: 70%;
	background-color: white;
	padding: 20px;
}

/* table css*/
.customers {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 80%;
	margin: auto;
}

.customers td, .customers th {
	border-bottom: 1px solid #ddd;
	padding: 8px;
	height: 55px;
	font-size : 15px;
}

.customers tr:hover {
	background-color: #ddd;
}

.customers th {
	padding-top: 10px;
	padding-bottom: 10px;
	text-align: left;
	background-color: white;
	color: black;
}
/*추가한부분*/
.mainBottom{
	margin-left: 10%;
	margin-bottom : 100px;
	margin-top : 25px
}

#keywordInput{
border-bottom: 1px solid black;
}

.main button{
 width: 65px;
 height : 28px;
 background : white;
 border : solid 1px #ddd;
}
.mainTitle h2{
	margin-left : 48%;
	font-size : 42px;
}
.mainTitle{
	padding-top : 50px;
 	height : 200px;
	
}

/*pagination*/
.pagination {
	display: inline-block;
	margin-left : 10%;
	margin-right : 25%;
}

.pagination a {
	border-radius: 5px;
	color: black;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
}

@media ( max-width :1100px) {
	.product .pagination {
		margin: 10px 0 0 41%;
	}
}
</style>
<SCRIPT>
	var result = '${msg}';

	if (result == 'success') {
		alert("처리되었습니다");
	}
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							alert("eventmain" + '${pageMaker.makePage(1)}'
									+ '&searchType='
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val());

							self.location = "eventmain" + '${pageMaker.makePage(1)}'
									+ '&searchType='
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						})

				$('.writeBtn').on("click", function(event) {
					location.href = "/control/eventgesipan/eventwrite";
				});
				$('#newBtn').on("click", function(event) {
					self.location = "write";
				});

			});
</SCRIPT>
</head>
<body>

	<!-- header section starts 페이지 최상단  -->
	<div id="main" style="width:100%; height:900px;">

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
            <a href="#" class="fas fa-gift"></a>
            <a href="../mypage/mypage1" class="fas fa-user-circle"></a>
        </div>


		</div>

		<div class="header-2">

			<div id="menu-bar" class="fas fa-bars"></div>

			<nav class="navbar">
            	<a href="/control/appliances"><b>가전제품</b></a>
            	<a href="/control/cloth" style="margin-left: 10px;"><b>의류</b></a>
            	<a href="/control/food" style="margin-left: 10px;"><b>식품</b></a>
            	<a href="/control/sports" style="margin-left: 10px;"><b>스포츠</b></a>
			</nav>
     	 <div class="login">
            <a href="../login/login">로그인 </a>&puncsp;
            <a href="../login/signUp">회원가입 </a>&puncsp;
            <a href="../usergesipan/usergesipanmain">고객센터</a>
			</div>
		</div>

	</header>

	<!-- header section ends 페이지최상단종료 -->

	<!-- home section starts 페이지중단시작  -->

	<!-- category section starts  -->

<div class="mainTitle">
	<h2>Event</h2>
	</div>
	
	<div class="main">
		

		<table class='customers' width=100%>
			<tr>
				<th style="width: 30px">No</th>
				<th>제목</th>
				<th style="width: 100px">작성자</th>
				<th style="width: 200px">작성날짜</th>
				<th style="width: 70px">조회수</th>
			</tr>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td style="width: 30px">${dto.bno}</td>
					<td><a
						href="/control/eventgesipan/eventread${pageMaker.makeSearch()}&bno=${dto.bno}">${dto.title}</a></td>
					<td style="width: 100px">${dto.id}</td>
					<td style="width: 200px"><fmt:formatDate
							pattern="yyyy-MM-dd HH:mm" value="${dto.regdate}" /></td>
					<td style="width: 50px">${dto.viewcnt }</td>
				</tr>
			</c:forEach>
		</table>
		<div class='mainBottom'>
			<select name="searchType">
				<option value="n"
					<c:out value="${pageMaker.searchType==null?'selected':'' }"/>>----</option>
				<!-- <option value="n" selected>----</option>
    		<option value="n">----</option> -->
				<option value="t"
					<c:out value="${pageMaker.searchType eq 't'?'selected':'' }"/>>제목</option>
				<option value="c"
					<c:out value="${pageMaker.searchType eq 'c'?'selected':'' }"/>>내용</option>
				<option value="i"
					<c:out value="${pageMaker.searchType eq 'i'?'selected':'' }"/>>작성자</option>
				<option value="tc"
					<c:out value="${pageMaker.searchType eq 'tc'?'selected':'' }"/>>제목/내용</option>
				<option value="ci"
					<c:out value="${pageMaker.searchType eq 'ci'?'selected':'' }"/>>내용/작성자
				</option>
				<option value="tci"
					<c:out value="${pageMaker.searchType eq 'tci'?'selected':'' }"/>>제목/내용/작성자
				</option>
			</select> <input type="text" name="keyword" id="keywordInput"
				value="${pageMaker.keyword}">
			<button id="searchBtn">검색</button>

			<div class="pagination">
				<c:if test="${pageMaker.page !=1}">
					<a href='eventmain${pageMaker.makeSearch(1)}'>&laquo;</a>
				</c:if>
				<c:if test="${pageMaker.prev }">
					<a
						href='eventmain${pageMaker.makeSearch(pageMaker.startPage-1)}'>&lt;</a>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage}" var="idx">
					<a href='eventmain${pageMaker.makeSearch(idx)}'
						<c:out value="${pageMaker.page==idx?' class=active ':'' }"/>>
						${idx}</a>
				</c:forEach>

				<%--<a href='#'>1</a>
    	 <a href='list${pageMaker.makeSearch(2)}'>2</a>
    	<a href='#' class="active">3</a> --%>

				<c:if test="${pageMaker.next }">
					<a
						href='eventmain${pageMaker.makeSearch(pageMaker.endPage+1)}'>&gt;</a>

				</c:if>


				<c:if test="${pageMaker.page != pageMaker.totalEndPage}">
					<a
						href='eventmain${pageMaker.makeSearch(pageMaker.totalEndPage)}'>&raquo;</a>
				</c:if>

			</div>
			<button class='writeBtn'>글쓰기</button>

		</div>

	</div>
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
	</div>
</body>

</html>

