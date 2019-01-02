<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" type="text/css" href="/resources/css/mainCss.css">
  <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css">
  <title>The Moonlight of the City - main</title>
    <!-- Bootstrap 3.3.4 -->
    <link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="../resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="../resources/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />
<style>
<!--
button.btn.btn-info {
    width: 435px;
    height: 50px;
    font-size: 25px;
}
-->
</style>

</head>

<body>
  <div class="wrapper">

    <div class="mainSection" id="section_1">


      <form action="/user/loginPost" method="post">

        <div class="login-div">
          <span id="starttext" align="center">
            <p>Let's get Start!</p>
          </span>

          <div class="form-group has-feedback">
            <input type="text" name="uid" class="form-control" id="exampleInputEmail1" placeholder="이메일을 입력하세요">
          	<span class="glyphicon-envelope form-control-feedback"></span>
          </div>

          <div class="form-group has-feedback">
            <input type="password" name="upw" class="form-control" id="exampleInputPassword1" placeholder="비밀번호">
        	<span class="glyphicon-lock form-control-feedback"></span>
          </div>

          <div>
            <button type="submit" class="btn btn-info" id="login-btn">Login</button>
          </div>

          <div align="center">
	        <div class="col-xs-8" style="width: 150px; float: left;">
				<div class="checkbox icheck">
					<label style="color: white;">
						<input type="checkbox" name="useCookie"> Remember Me
					</label>
				</div>
			</div><!-- /.col -->
            <span>
              <a href="/user/join" id="signInAndFind">Sign In</a>
              <a href="/user/findForm" id="signInAndFind">Find ID / Password</a>
            </span>
          </div>



        </div>

      </form>

    </div>




    <div class="mainSection" id="section_2">
      <div>

        <span id="mainTextArea">
          <div>
            <p>우리 아파트를 한눈에 알 수 있습니다.</p>
            <p>택배 알림 서비스, 차량 관리, 이웃들과의 소통</p>
            <p>모바일을 통한 내 집 관리 등</p>
            <p>아파트 거주를 위한 모든 것을 담았습니다.</p>
            <button type="button" class="btn btn-default" onclick="location.href='##'">더 알아보기</button>
          </div>

        </span>


        <div id="imgdiv">
          <img src="/resources/image/tablet.png"></img>
        </div>

      </div>
    </div>

    <div class="mainSection" id="section_3">
      <div id="imgdiv_2">
        <img src="/resources/image/kitchen_2.png"></img>
      </div>

      <span id="mainTextArea">
        <div>
          <p>더욱 편리해진 시스템, 도시의 달밤.</p>
          <p>아아아아아아아아아아아아아아아아아</p>
          <p>아아아아아아아아아아아아아아아아아</p>
          <p>아아아아아아아아아아아아아아아아아</p>
          <button type="button" class="btn btn-default" onclick="location.href='##'">더 알아보기</button>
        </div>

      </span>
    </div>


    <footer class="footer">

      <div id="footerTop">
        <span>© Makers Corp</span>
        <a href="#">팀 소개</a>
        <a href="#">이용약관</a>
        <a href="#">개인정보처리방침</a>
        <a href="#">고객센터</a>

      </div>

      <hr class="footerline">

      <div id="footerMid" align="center">
        고객선터 : 010-9391-6597 (평일 09:00 ~ 19:00 토요일 09:00 ~ 15:00) &nbsp;&nbsp;|&nbsp;&nbsp; FAX : 051-000-0000 &nbsp;&nbsp;|&nbsp;&nbsp; Email : payjay6597@gmail.com<br>
        부산광역시 금정구 금샘로 485번길 65 I동 4층 I425호 Makers &nbsp;&nbsp;|&nbsp;&nbsp; 대표 : 박종억 &nbsp;&nbsp;|&nbsp;&nbsp; 사업자등록번호:읎다!<br>
      </div>

      <div id="footerBottom" align="center">
        <span>copyright © Makers Corp. All Right Reserved</span>
      </div>

    </footer>



  </div>


 <!-- jQuery 2.1.4 -->
    <script src="../resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="../resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="../resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <script>
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        });
      });
    </script>
</body>

</html>