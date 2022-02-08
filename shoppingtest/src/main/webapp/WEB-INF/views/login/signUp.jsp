<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>SignUp</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>complete responsive grocery website design tutorial</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="/control/resources/css/style.css">
    <link rel="stylesheet" href="/control/resources/css/signUp.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
	
	<script type="text/javascript" src="/control/resources/jquery/jquery-3.4.1.js"></script>
	<script src="/control/resources/jquery/memberRegister.js"></script>

</head>
<body>

<!-- header section starts 페이지 최상단  -->

<header>

    <div class="header-1">

        <a href="/control/" class="logo"><i class="fas fa-shopping-basket"></i>FECS#</a>
        
        <form action="" class="search-box-container">
            <input type="search" id="search-box" placeholder="search here...">
            <label for="search-box" class="fas fa-search"></label>
        </form>

        <div class="icons">
            <a href="#" class="fas fa-shopping-cart"></a>
            <a href="../eventgesipan/eventmain" class="fas fa-gift"></a>
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
            <a href="../login/signUp"> 회원가입 </a>&puncsp;
            <a href="../usergesipan/usergesipanmain"> 고객센터</a>
        </div>
    </div>

</header>

<!-- header section ends 페이지최상단종료 -->

<!-- home section starts 페이지중단시작  -->

 <div id="wrapper">
 	<form action="/control/login/signUp" method="POST">
 <div style="margin: 20px; text-align: center;"><h1><big>회원가입</big></h1></div>
<!--아이디-->
        <div id="content">
            <h3 class="join_title"><label for="id">아이디</label></h3>
            <div id="idDDiv">
                <div id="idDiv">                
                    <span class="box1 int_id" >
                    <input type="text" required="required" id="userId" name="id" class="int" maxlength="20">  
                    <span class="step_url">@shopping.com</span>
                    </span>
                    <label id="labelId"></label>             
                </div>
                
	             <button type="button" class="idCheck" disabled="disabled" id="idCheck">ID 중복검사</button>  
                <br>
                
            </div>
            
<!--비밀번호-->
            <div>
                <h3 class="join_title"><label for="pw">비밀번호</label></h3>
                <span class="box1 int_pass"><input type="password" required="required" id="userPw" name="pw" class="int" maxlength="20">
                    <span id="alertTxt">사용불가</span>    
                <img src="resources/img/lock.png"  id="pswd1_img1" class="pswdImg">
                <br>
                <label id="labelPw"></label>
            </span>
            <span clas="error_next_box"></span>
            </div>
<!--비밀번호재확인-->
			<br>
            <div>
                <h3 class="join_title"><label for="pw1">비밀번호 재확인</label></h3>
                <span class="box1 int_pass_check">
                    <input type="password" required="required" id="userPwCheck" name="userPwCheck" class="int" maxlength="20">
                    <img src="resources/img/unlock.png" id="pswd2_img1" class="pswdImg">
                    <br>
                    <label id="labelPwCheck"></label>                    
                </span>
                <span class="error_next_box"></span>
            </div>
<!--이름-->
			<br>            
            <div>
                <h3 class="join_title"><label for="membername">이름</label></h3>
                <span class="box1 int_name">
                    <input type="text" name="membername" class="int" maxlength="20">
                </span>
                <span class="error_next_box"></span>
            </div>

<!--생년월일-->
        <div>
            <h3><label for="yy">생년월일</label></h3>
            <div id="bir_wrap">
            <div id="bir_yy">
                <span class="box1">
                    <input type="text" name="year" class="int" maxlength="4" placeholder="년(4자)">
                </span>
            </div>

            <div id="bir_mm">
                <span class="box1">
                    <select name="month" class="sel">
                        <option>월</option>
                        <option value="01">1</option>
                        <option value="02">2</option>
                        <option value="03">3</option>
                        <option value="04">4</option>
                        <option value="05">5</option>
                        <option value="06">6</option>
                        <option value="07">7</option>
                        <option value="08">8</option>
                        <option value="09">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select>
                    </span>
            </div>

            <div id="bir_dd">
                <span class="box1">
                    <select name="day" class="sel">
                        <option>일</option>
                        <option value="01">1</option>
                        <option value="02">2</option>
                        <option value="03">3</option>
                        <option value="04">4</option>
                        <option value="05">5</option>
                        <option value="06">6</option>
                        <option value="07">7</option>
                        <option value="08">8</option>
                        <option value="09">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                         <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                        <option value="24">24</option>
                        <option value="25">25</option>
                        <option value="26">26</option>
                        <option value="27">27</option>
                        <option value="28">28</option>
                        <option value="29">29</option>
                        <option value="30">30</option>
                        <option value="31">31</option>
                    </select>
                 </span>
            </div>
        </div>
        <span class="error_next_box"></span>
    </div>
<!--성별-->
        <div>
            <h3 class="join_title"><label for="gender">성별</label></h3>
            <span class="box1 gender_code">
                <select name="gender" class="sel">
                    <option>성별</option>
                    <option value="M">남자</option>
                    <option value="W">여자</option>
                </select>
            </span>
            <span class="error_next_box">필수 정보 입니다.</span>
        </div>
<!--email-->
        <div>
            <h3 class="join_title"><label for="email">본인확인 이메일<span class="optional"></span></label></h3>
            <span class="box1_int_email">
                <input type="text" required="required" id="userEmail" name="email" class="int" maxlength="90" style="width : 100%;">
                <label id="labelEmail"></label>
            </span>
            <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>
        </div>
<!--주소-->            
            <div>
                <h3 class="join_title"><label for="address">주소</label></h3>
                <span class="box1 int_name">
                    <input type="text" name="address" class="int" maxlength="150">
                </span>
                <span class="error_next_box"></span>
            </div>
<!--휴대전화-->
        <div>
            <h3 class="join_title"><label for="phonenum">휴대전화</label></h3>
            <span class="box1 int_mobile">
                <input type="text" name="phonenum" class="int" maxlength="16" placeholder="전화번호 입력">
            </span>
            <span class="error_next_box"></span>
        </div>

    <div class="btn_area">
        <input type="submit" class="submit" id="signinForm" value="가입하기">
        </div>
    </div>
    </form>
</div>


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


<!-- custom js file link  -->
<script src="js/script.js"></script>

    
</body>
</html>