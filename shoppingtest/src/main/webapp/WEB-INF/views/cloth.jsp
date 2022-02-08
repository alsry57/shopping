<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cloth</title>

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- custom css file link  -->
<link rel="stylesheet" href="/control/resources/css/style.css">
<script>
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							alert("list" + '${pageMaker.makePage(1)}'
									+ '&searchType='
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val());

							self.location = "list" + '${pageMaker.makePage(1)}'
									+ '&searchType='
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						})

				$('.writeBtn').on("click", function(event) {
					location.href = "/ex/sboard/write";
				});
				$('#newBtn').on("click", function(event) {
					self.location = "write";
				});

			});
</script>

<style>
.product .pagination {
	display: inline-block;
	margin: 10px 0 0 45%;
}

.product .pagination a {
	border-radius: 5px;
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
}

.product .pagination a.active {
	border-radius: 5px;
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}

.product .pagination a:hover:not (.active ) {
	background-color: #ddd;
}

@media ( max-width :1100px) {
	.product .pagination {
		margin: 10px 0 0 41%;
	}
}
</style>
</head>
<body>


<!-- header section starts 페이지 최상단  -->

   <header>

    <div class="header-1">

        <a href="http://localhost:8081/control/" class="logo"><i class="fas fa-shopping-basket"></i>FECS#</a>
        
        <form action="" class="search-box-container">
            <input type="search" id="search-box" placeholder="search here...">
            <label for="search-box" class="fas fa-search"></label>
        </form>

        <div class="icons">
            <a href="#" class="fas fa-shopping-cart"></a>
            <a href="/control/eventgesipan/eventmain" class="fas fa-gift"></a>
            <a href="/control/mypage/mypage1" class="fas fa-user-circle"></a>
        </div>


    </div>

    <div class="header-2">

        <div id="menu-bar" class="fas fa-bars"></div>

        <nav class="navbar">
            <a href="appliances"><b>가전제품</b></a>
            <a href="#" style="margin-left: 10px;"><b>의류</b></a>
            <a href="food" style="margin-left: 10px;"><b>식품</b></a>
            <a href="sports" style="margin-left: 10px;"><b>스포츠</b></a>
        </nav>
        <div class="login">
            <a href="/control/login/login">로그인 </a>&puncsp;
            <a href="/control/login/signUp"> 회원가입 </a>&puncsp;
            <a href="#custom"> 고객센터</a>
        </div>        <div class="login">
            <a href="/control/login/login">로그인 </a>&puncsp;
            <a href="/control/login/signUp"> 회원가입 </a>&puncsp;
            <a href="/control/usergesipan/usermain"> 고객센터</a>
        </div>
    </div>

</header>

	<!-- header section ends 페이지최상단종료 -->

	<!-- home section starts 페이지중단시작  -->

	<!-- category section starts  -->
	<section class="category" id="category">

		<h1 class="heading">
			제일 잘나가는상품</span>
		</h1>

		<div class="box-container">
			<c:forEach items="${ProductBestSales}" var="best">
				<div class="box">
					<h3>${best.productname}</h3>
					<img src="resources/img/cloth/${best.productimage}.PNG">
					<a href="/control/productdetail?productnum=${best.productnum}" class="btn">shop now</a>
				</div>
			</c:forEach>



		</div>

	</section>


	<section class="product" id="product">

		<h1 class="heading">
			latest <span>products</span>
		</h1>

		<div class="box-container">

			<c:forEach items="${list}" var="product">
				<c:if test="${product.productkind == 'cloth' }">
					<div class="box">
						<img src="resources/img/cloth/${product.productimage}.PNG">
						<h3>${product.productname}</h3>
						<div class="price">${product.productprice}원</div>

						<a href="/control/productdetail?productnum=${product.productnum}" class="btn">add to cart</a>
					</div>
				</c:if>
			</c:forEach>

		</div>
		<!-- 페이징 -->
		<div class="pagination">
			<c:if test="${pageMaker.page !=1}">
				<a href='cloth${pageMaker.makeSearch(1)}'>&laquo;</a>
			</c:if>
			<c:if test="${pageMaker.prev }">
				<a href='cloth${pageMaker.makeSearch(pageMaker.startPage-1)}'>&lt;</a>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${ pageMaker.endPage}" var="idx">
				<a href='cloth${pageMaker.makeSearch(idx)}'
					<c:out value="${pageMaker.page==idx?' class=active ':'' }"/>>
					${idx}</a>
			</c:forEach>

			<%--<a href='#'>1</a>
    	 <a href='list${pageMaker.makeSearch(2)}'>2</a>
    	<a href='#' class="active">3</a> --%>

			<c:if test="${pageMaker.next }">
				<a href='cloth${pageMaker.makeSearch(pageMaker.endPage+1)}'>&gt;</a>
			</c:if>

			<c:if test="${pageMaker.page != pageMaker.totalEndPage}">
				<a href='cloth${pageMaker.makeSearch(pageMaker.totalEndPage)}'>&raquo;</a>
			</c:if>

		</div>


	</section>
	<!-- product section ends -->






<!-- footer section starts  -->

<section class="footer" style="background-color: #EEEEEE;">

    <div class="box-container">

        <div class="box">
            <a href="#" class="logo"><i class="fas fa-shopping-basket"></i>FECS#</a>
            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ullam culpa sit enim nesciunt rerum laborum illum quam error ut alias!</p>
            <div class="share">
                <a href="#" class="btn fab fa-facebook-f"></a>
                <a href="#" class="btn fab fa-twitter"></a>
                <a href="#" class="btn fab fa-instagram"></a>
                <a href="#" class="btn fab fa-linkedin"></a>
            </div>
        </div>
        
        <div class="box">
            <h3>our location</h3>
            <div class="links">
                <a href="#">india</a>
                <a href="#">USA</a>
                <a href="#">france</a>
                <a href="#">japan</a>
                <a href="#">russia</a>
            </div>
        </div>

        <div class="box">
            <h3>quick links</h3>
            <div class="links">
                <a href="#">home</a>
                <a href="#">category</a>
                <a href="#">product</a>
                <a href="#">deal</a>
                <a href="#">contact</a>
            </div>
        </div>

        <div class="box">
            <h3>download app</h3>
            <div class="links">
                <a href="#">google play</a>
                <a href="#">window xp</a>
                <a href="#">app store</a>
            </div>
        </div>

    </div>

    <h1 class="credit"> created by <span> mr. web designer </span> | all rights reserved! </h1>

</section>

<!-- footer section ends -->






</body>
</html>

