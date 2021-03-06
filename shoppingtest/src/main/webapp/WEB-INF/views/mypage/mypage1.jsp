<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- custom css file link  -->
    <link rel="stylesheet" href="/control/resources/css/style.css">
    
    <style type="text/css">
.mypage-box {
	display: flex;
	padding: 1rem 7%;
}

.mypage-box .sidebar {
	width: 15%;
	font-size: 17px;
}

.mypage-box .sidebar div {
	width: 100%;
	border: 1px solid #2B975A;
	text-align: center;
	padding: 20px 0px;
	background-color: #27ae60;
	color: #fff;
	font-weight: bold;
}

.mypage-box .sidebar div:hover {
	background-color: #2D9058;
	border: 1px solid #327642;
}

.mypage-box .sidebar .selected {
	background-color: #2D9058;
	border: 1px solid #327642;
}

.mypage-box .mypage-content {
	width: 100%;
	padding-left: 20px;
	padding-top: 20px;
	color: #2c2c54;
}
.mypage-content h4{
	font-size: 2rem;
}
.mypage-content table{
	font-size: 1.5rem;
	text-align: center;
}
.mypage-content table .info{
	display: flex;
    align-items: center;
    justify-content: space-between;
}
.mypage-content table img{
	width: 100px;
	padding: 0px 10px;	
}

/* table css*/
.customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

.customers tr td:not(td.noclick){
	cursor:pointer;
}

.customers td, .customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

.customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  background-color: #04AA6D;
  color: white;
}

.mypage-box .mypage-content hr {
	margin: 10px 0px 10px 0px;
}

.info-div{
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
}
.order-cancel{
	border: 1px solid #dddddd;
	border-radius: 5px;
	background-color: #04AA6D;	
	color:white;
	padding: 5px;
	display: block;
}

.order-cancel:hover{
	font-weight: bolder;
	cursor: pointer;
	background-color: #2b975a;
}

</style>

	<script>
		
	$(document).ready(function(){

		// ????????? ???????????? ?????? ??????????????? ?????? ????????? ????????? ??????
		$('.customers tr td:not(.noclick)').click(function(){
			
			var str = $(this).parent().attr("id");
			var leng = $('.'+str).length;

			if( $('.'+str).find('div').css('display') === 'none' ){
				// ????????????
				$('.'+str).find('div').slideDown(500);
				
				//???????????? td ????????? 
				$(this).parent().find('td').not('.info').attr('rowspan',leng+1);
				
				//?????? ?????? ???????????? ?????????
				$('.'+str).find('td').not('.info').hide();
				
			}else{
				$('.'+str).find('div').slideUp(500);
				// ?????????
				
			}			
				
		})
			
	})
	
	function remove(ordernum){

			if (confirm("????????? ?????????????????????????") == true){    //??????
				var link = "/control/mypage/remove?ordernum="+ordernum;
			    location.href = link;

			}else{   //??????

			    return;

			}
		}
	function cash(ordernum){

		if (confirm("?????? ???????????????????") == true){    //??????
			var link = "/control/mypage/cash?ordernum="+ordernum;
		    location.href = link;

		}else{   //??????

		    return;

		}
	}
			
	</script>

</head>
<body>
	<%@include file="../Header.jsp"%>

<!-- header section ends ???????????????????????? -->

<!-- home section starts ?????????????????????  -->
	<div class="mypage-box">
		<div class="sidebar">
			<a href="/control/mypage/mypage1">
				<div class="selected">????????????</div>
			</a> <a href="/control/mypage/mypage2">
				<div>????????????</div>
			</a> <a href="/control/mypage/mypage3">
				<div>??????????????????</div>
			</a>
			<a href="/control/mypage/mypage4">
				<div>????????????</div>
			</a>
		</div>
		<div class="mypage-content">
			<h4>
				<div style="width: 5px; height: 25px; background-color: #27ae60; display: inline-block; vertical-align: bottom;">
				</div>
				????????????
			</h4>
			<hr>
			
<!-- ???????????? ????????? -->

			<table class="customers" width="100%">
				<tr>
					<th style="width: 120px">??????</th>
					<th>????????????</th>
					<th style="width: 100px">??????</th>
					<th style="width: 100px">????????????</th>
					<th style="width: 100px">????????????</th>
					<th style="display: none"></th>
				</tr>
				<c:set var="prevOrdernum" value="0"/>
				<c:forEach items="${orderList}" var="dto">
				<fmt:parseNumber value="${prevOrdernum}" var="i" type="number"/>
					<c:if test="${dto.ordernum != i }">
					<tr id="orderid${dto.ordernum}" >
						<td>${dto.orderdate}</td>
						<td class="info">
						<span style="display: flex; align-items: center;">
							<img src="/control/resources/img/${dto.productkind}/${dto.productimage}.PNG"> ${dto.productname}</span>
						 <span>${dto.ordercount}???</span> 
						</td>
						<td><fmt:formatNumber value="${dto.orderprice}" type = "currency"/></td>
						<td>${dto.paycheck}</td>
						<td >${dto.delivery }</td>
						<td class="noclick" style="border: none; width: 100px;">
						<a class="order-cancel" onclick="cash(${dto.ordernum})">????????????</a><br/>
						<a class="order-cancel" onclick="remove(${dto.ordernum})">????????????</a></td>
					</tr>
					</c:if>
					<c:if test="${dto.ordernum == i }">
					<tr class="orderid${dto.ordernum}">
						<td style="padding:0"><div style="display:none"></div></td>
						<td class="info noclick" style="padding:0px 8px">
						<div class="info-div" style="display: none;">
							<span style="display: flex; align-items: center;">
							<img src="/control/resources/img/${dto.productkind}/${dto.productimage}.PNG"> ${dto.productname}</span>
						 <span>${dto.ordercount}???</span>
						</div>
						</td>
						<td style="padding:0"><div style="display:none"></div></td>
						<td style="padding:0"><div style="display:none"></div></td>
						<td style="padding:0"><div style="display:none"></div></td>
						<td style="padding:0; border: none;"><div style="display:none"></div></td>
					</tr>
					
					</c:if>
					
					<fmt:parseNumber value="${dto.ordernum}" var="prevOrdernum" type="number"/>
				</c:forEach>
			</table>
		</div>
	</div>



	<%@include file="../Footer.jsp"%>

<!-- footer section ends -->

</body>
</html>