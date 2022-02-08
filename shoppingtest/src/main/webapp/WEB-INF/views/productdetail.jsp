<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String id=(String)session.getAttribute("id"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>complete responsive grocery website design tutorial</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="/control/resources/css/style.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
	<link rel="stylesheet" href="/control/resources/css/style.css">
	<link rel="stylesheet" href="/control/resources/css/style.css">
	<link rel="stylesheet" href="/control/resources/css/productdetail.css">
	<script src="/control/resources/jquery/jquery-3.3.1.min.js"></script>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

</head>
<body>

<!-- header section starts 페이지 최상단  -->
<header>
	

    <div class="header-1">

        <a href="#" class="logo"><i class="fas fa-shopping-basket"></i>FECS#</a>
        
        <form action="" class="search-box-container">
            <input type="search" id="search-box" placeholder="search here...">
            <label for="search-box" class="fas fa-search"></label>
        </form>

        <div class="icons">
            <a href="/control/cartList" class="fas fa-shopping-cart"></a>
            <a href="/control/eventgesipan/eventmain" class="fas fa-gift"></a>
            <a href="/control/mypage/mypage1?id=<%=id%>" class="fas fa-user-circle"></a>
        </div>


    </div>

    <div class="header-2">

        <div id="menu-bar" class="fas fa-bars"></div>

        <nav class="navbar">
            <a href="appliances"><b>가전제품</b></a>
            <a href="cloth" style="margin-left: 10px;"><b>의류</b></a>
            <a href="food" style="margin-left: 10px;"><b>식품</b></a>
            <a href="sports" style="margin-left: 10px;"><b>스포츠</b></a>
        </nav>
        <div class="login">
            <a href="/control/login/login">로그인 </a>&puncsp;
            <a href="/control/login/signUp"> 회원가입 </a>&puncsp;
            <a href="/control/usergesipan/usergesipanmain"> 고객센터</a>
        </div>
    </div>

</header>
	<div class="clear"></div>

	<div class="table1">
		<h2>${view.productname}</h2>
		<table>
			<colgroup>
				<col style="width: 173px;">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th>판매가</th>
					<td class="price"><fmt:formatNumber
							value="${view.productprice}" pattern="#,###" />원</td>
				</tr>
				<tr>
					<th>상품코드</th>
					<td>${view.productnum}</td>
				</tr>

				<tr>
					<th>구매수량</th>
					<td>
						<p class="tlength">
						 <button type="button" class="minus">-</button>
 						 <input type="number" class="numBox" min="1" max="10" value="1" readonly="readonly" style="width:55px;"/>
 						 <button type="button" class="plus">+</button>
 						 <script>
							$(".plus").click(function(){
							 var num = $(".numBox").val();
							 var plusNum = Number(num) + 1;
							
							 if(plusNum<=10){
								 $(".numBox").val(plusNum); 
							 } else {
								 $(".numBox").val(num); 
								 alert("최대 구매 수량을 초과하였습니다")
							 }
							             
							});
							
							$(".minus").click(function(){
							 var num = $(".numBox").val();
							 var minusNum = Number(num) - 1;
							 
							 if(minusNum <= 0) {
							  $(".numBox").val(num);
							 } else {
							  $(".numBox").val(minusNum);          
							 }
							});
						</script>
						</p>
					</td>
				</tr>
				<tr>
					<th>배송비</th>
					<td>무료배송</td>
				</tr>
				<tr>
					<th>상세설명</th>
					<td>${view.productcontent}</td>
				</tr>
				<tr>
					<th>결재금액</th>
					<td class="total">
					<script>
					$(".plus").click(function(){
					 var num = $(".numBox").val();
					 var doubleNum = Number(num)*${view.productprice};
					 
					 $(".price1").val(doubleNum)
					});
					
					$(".minus").click(function(){
					var num = $(".numBox").val();
					var doubleNum = Number(num)*${view.productprice};
						 
					$(".price1").val(doubleNum)
					});
					</script>
					<b><input type="text" class="price1" value="${view.productprice}" style="font-size:19px; color:#0a56a9; width:95px"/>원</b>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="img">
			<img src="resources/img/${view.productkind}/${view.productimage}.PNG">
		</div>
		<div class="tbtns">
			<a class="tbtn1">장바구니</a>
			<a href="#a" class="tbtn2">구매하기</a>
			 <script>
			 $(".tbtn1").click(function(){
			  var productnum = $("#productnum").val();
			  var cartStock = $(".numBox").val();
			           
			  var data = {
				productnum : productnum,
			    cartStock : cartStock
			    };
			  
			  $.ajax({
			   url : "/addCart",
			   type : "POST",
			   data : data,
			   success : function(result){
			    
			    if(result == 1) {
			     alert("카트 담기 성공");
			     $(".numBox").val("1");
			    } else {
			     alert("회원만 사용할 수 있습니다.")
			     $(".numBox").val("1");
			    }
			   },
			   error : function(){
			    alert("카트 담기 실패");
			   }
			  });
			 });
			</script>						  
		</div>
	</div>

	<div class="clear"></div>


	<div id="tkdtp">
		<h1 class="heading">
			<span>제품 상세보기</span>
		</h1>
		<img src="resources/img/${view.productkind}/${view.productimage}.PNG">
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

	<!-- footer section ends -->


</body>
</html>