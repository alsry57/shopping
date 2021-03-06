<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&Aź²ģķ</title>

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- custom css file link  -->
<link rel="stylesheet" href="/control/resources/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
$(document).ready(function() {
	var fObject=$(".form");
	
	$(".btnList").on("click",function(){

		fObject.attr("method","get");
		fObject.attr("action","/control/usergesipan/usergesipanmain");
		fObject.submit();
		
	})			
	$(".btnRemove").on("click",function(){
		fObject.attr("action","/control/usergesipan/usergesipanremove");
		fObject.submit();
	})
	$(".btnModify").on("click",function(){
		fObject.attr("method","get");
		fObject.attr("action","/control/usergesipan/usergesipanmodify");
		fObject.submit();
	})
});
</script>

<style>
table {
	width : 50%;
	margin-left: auto;
	margin-right: auto;
}

tr th {
	height: 50px;
	text-align: center;
	border-bottom: solid 1px #ddd;
	font-size: 15px;
}

tr td {
	border-bottom: solid 1px #ddd;
	height: 50px;
}

.main h1 {
	width:50%;
	margin-left: auto;
	margin-right: auto;
	border-bottom : 1px solid #ddd;
	padding : 11px;
}

.main .reply {
	width : 50%;
	margin-left: auto;
	margin-right: auto;
}
.main .replyinsert{
	width : 50%;
	margin-left: auto;
	margin-right: auto;
}
.main .box-footer{
	padding : 5px;
	width : 50%;
	margin-left: auto;
	margin-right: auto;
}
ol {
background-color : #ddd;
border-bottom : 1px #c8c8c8 solid; 
}

ol p {
padding : 10px;
}

ol p a {
margin-left : 95%;
cursor: pointer;
}

</style>

</head>
<body>
<!-- header section starts ķģ“ģ§ ģµģėØ  -->
	<%@include file="../Header.jsp"%>

<!-- header section ends ķģ“ģ§ģµģėØģ¢ė£ -->

	<!-- home section starts ķģ“ģ§ģ¤ėØģģ  -->

	<!-- category section starts  -->

	<div class="main">
  
		<form class="form" method="post">
							<input type='hidden' name='bno' value="${userGesipanDTO.bno}"> 
							<input type='hidden' name='page' value="${pageMaker.page}"> 
							<input type='hidden' name='perPageNum' value="${pageMaker.perPageNum}">
							<input type='hidden' name='searchType' value="${pageMaker.searchType}">
							<input type='hidden' name='keyword' value="${pageMaker.keyword}">
		</form>
		
		<h1>Q&A</h1>
		<table>
			<tr>
				<th>${userGesipanDTO.title}</th>
			</tr>
			<tr>
				<td>ģģ±ģ:${userGesipanDTO.id}</td>
			</tr>
			<tr>
				<td style="height:400px;">${userGesipanDTO.content}</td>
			</tr>
		</table>
		
			<div class="box-footer">
				<button type="submit" class="btnModify">ģģ </button>
				<button type="submit" class="btnRemove">ģ­ģ </button>
				<button type="submit" class="btnList">ėŖ©ė”</button>
			</div>


		<div class="reply" id="reply">
		<c:forEach items="${replyList}" var="item">
			<ol class="replyList">
						
						ģģ±ģ : ${item.id} &nbsp;&nbsp;&nbsp;&nbsp;
						ģģ± ė ģ§: <fmt:formatDate value="${item.regdate}" pattern="yyyy-MM-dd" />
					<p>${item.content}</p>
					<p><a href="/control/usergesipan/usergesipanreadRemove?rno=${item.rno}&bno=${item.bno}">ģ­ģ </a></p>
			</ol>
		</c:forEach>
		</div>
		<br><br><br>
		<form method="post">
			<div class="replyinsert" id="replyinsert">
				<textarea name="content" rows="5" cols="70" placeholder="ėźøģė „" style="resize: none; border: solid 1px #ddd; width:100%;"></textarea>
				<input type='hidden' name="id" value="<%= id %>" readonly="readonly"> 

				<input type="submit" value="ģė „">
			</div>

			<br><br><br>
		
		</form>
		
	</div>


	<!-- product section ends -->







	<!-- footer section starts  -->

		<%@include file="../Footer.jsp"%>
</body>
</html>