<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<style type="text/css">
form {
	width: 500px;
}
</style>
<meta charset="UTF-8">
<title>Join</title>
 <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="../resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="../resources/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<script type="text/javascript">
		function passwordCheckFunction() {
			var pwCheck = /^[a-zA-Z0-9]{4,12}$/; // 소문자, 대문자, 숫자 4자리에서~12자리까지 입력가능
			var userPassword1 = $('#upw').val();
			var userPassword2 = $('#repwd').val();
			var pwOK = pwCheck.exec(userPassword1); 
			if(userPassword1 != userPassword2){
				$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
			}else if(!pwOK){
				$('#passwordCheckMessage').html('소문자, 대문자, 숫자 4자리에서~12자리까지 입력해주세요.');
			}else {
				$('#passwordCheckMessage').html('');
			}			
		}

		function idCheckFunction() {
			var idCheck = /^[a-zA-Z0-9]{4,12}$/; // 소문자, 대문자, 숫자 4자리에서~12자리까지 입력가능
			var userId = $('#checkaa').val();
			var idOK = idCheck.exec(userId);
			if(!idOK){
				$('#idCheckMessage').html('소문자, 대문자, 숫자 4자리에서~12자리까지 입력해주세요.');
			}else {
				$('#idCheckMessage').html('');
			}
		}

		function adCheckFunction() {
			var uad = $('#uaddress4').val();
			if(uad==""){
				$('#adCheckMessage').html('상세주소를 입력해주세요.');
			}else {
				$('#adCheckMessage').html('');
			}
		}
		
		function emCheckFunction() {
			var emCheck = /^[a-zA-Z0-9]{4,20}$/; // 소문자, 대문자, 숫자 4자리에서~20자리까지 입력가능
			var uemail = $('#uemail1').val();
			var emOK = emCheck.exec(uemail);
			if(!emOK){
				$('#emCheckMessage').html('메일 아이디를 확인 해주세요.');
			}else {
				$('#emCheckMessage').html('');
			}
		}

		function phoneCheckFunction() {
			var phCheck = /^[0-9]{4,20}$/; // 소문자, 대문자, 숫자 4자리에서~20자리까지 입력가능
			var uphone = $('#uphone').val();
			var phOK = phCheck.exec(uphone);
			if(!phOK){
				$('#phCheckMessage').html('번호를 확인 해주세요.');
			}else {
				$('#phCheckMessage').html('');
			}
		}
		
	</script>


</head>
  <body class="">
    <div class="" align="center" style="margin-top: 100px; margin-bottom: 100px;">
      <div class="">
        <a href="../resources/index2.html"><b>Makers</b>Project</a>
      </div><!-- /.login-logo -->
      <div class="">
        <p class="">Sign in to start your session</p>

<form action="/user/joinPost" method="post">
	<div class="form-group has-feedback">
		<input type="text" name="uid" class="form-control uid"  placeholder="USER ID" oninput="checkId()" id="checkaa" onkeyup="idCheckFunction();"/>
		<span  class="glyphicon-envelope form-control-feedback"></span>
	</div>
	
	<h5 style="color: #FE2E2E;" id="idCheckMessage"></h5>
	
	<div class="form-group has-feedback">
		<input type="password" name="upw" class="form-control upw" id="upw" placeholder="Password" oninput="checkPwd()" onkeyup="passwordCheckFunction();"/>
		<span class="glyphicon-lock form-control-feedback"></span>
	</div>
	<div class="form-group has-feedback">
		<input type="password" name="upw2" class="form-control upw" id="repwd"  placeholder="Password Check" oninput="checkPwd()" onkeyup="passwordCheckFunction();"/>
		<span class="glyphicon-lock form-control-feedback"></span>
	</div>
	
	<h5 style="color: #FE2E2E;" id="passwordCheckMessage"></h5>

	<div class="form-group has-feedback">
		<input type="text" name="uname" id="uname" class="form-control" placeholder="Name" oninput="checkId()"/>
		<span class="glyphicon form-control-feedback"></span>
	</div>
	
	<!-- 주소와 우편번호를 입력할 <input>들을 생성하고 적당한 name과 class를 부여한다 -->
	<div class="form-group has-feedback">
	<div>
	<input type="text" name="uaddress1" id="uaddress1" class="form-control postcodify_postcode5" value="" placeholder="주소란 1" style="width: 400px; float: left;" oninput="checkId()"/>
	<button type="button" id="postcodify_search_button" class="btn btn-primary btn-block btn-flat" style="width: 100px; float: right;">검색</button>
	</div>
	<input type="text" name="uaddress2" id="uaddress2" class="form-control postcodify_address" value="" placeholder="주소란 2" oninput="checkId()"/>
	<input type="text" name="uaddress3" id="uaddress3" class="form-control postcodify_extra_info" value="" placeholder="주소란 3" oninput="checkId()"/>
	<input type="text" name="uaddress4" id="uaddress4" class="form-control postcodify_details" value="" placeholder="상세주소를 입력해주세요." oninput="checkId()" onkeyup="adCheckFunction();"/><br />
	</div>
	
	<h5 style="color: #FE2E2E;" id="adCheckMessage"></h5>
	
	<div class="form-group has-feedback">
		<input type="text" name="uemail1" id="uemail1" class="form-control" placeholder="Email ID" style="width: 230px; float: left;" oninput="checkId()" onkeyup="emCheckFunction();"/>
		<span style="float: left; font-size: 20px;">@</span>
		<input type="text" name="uemail2" id="uemail2" class="form-control" placeholder="Email Address" style="width: 230px; float: left;" oninput="checkId()"/>
		   <select id="email_domain" onchange="$('#uemail2').val($('#email_domain').val());" style="width: 20px; height: 34px; float: right">
		     <option value="">직접입력</option>
		     <option value="naver.com"> naver.com</option>
		     <option value="nate.com" >nate.com</option>
		     <option value="gmail.com" >gmail.com</option>
		     <option value="hanmail.net" >hanmail.net</option>
		    </select>
		<span class="glyphicon form-control-feedback"></span>
	</div>
	<br>
	<br>
	<h5 style="color: #FE2E2E;" id="emCheckMessage"></h5>
	<div class="form-group has-feedback">
		<input type="text" name="uphone" id="uphone" class="form-control" placeholder="Phone Number" oninput="checkId()" onkeyup="phoneCheckFunction();"/>
		<span class="glyphicon form-control-feedback"></span>
	</div>
	<h5 style="color: #FE2E2E;" id="phCheckMessage"></h5>
	
	<div class="form-group has-feedback">
		<input type="text" name="uhometype" id="uhometype" class="form-control" placeholder="Home Type" oninput="checkId()"/>
		<span class="glyphicon form-control-feedback"></span>
	</div>
	<div class="form-group has-feedback">
		<input type="text" name="ustatus" id="ustatus" class="form-control" placeholder="Status" oninput="checkId()"/>
		<span class="glyphicon form-control-feedback"></span>
	</div>
	<div class="row">
	
		<div >
			<button type="submit" class="signupbtn btn btn-primary btn-block btn-flat" disabled="disabled" style="width: 500px;">Join</button>
			<button type="button" id="cancelbtn" class="btn btn-primary btn-block btn-flat" onclick='$("#joinsung").css("display", "none")' style="width: 500px; background-color: red;">Cancel</button>
		</div> <!-- /.col -->
	</div>
</form>
             
	


      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->


    <!-- jQuery 2.1.4 -->
    <script src="../resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="../resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="../resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>



<!-- jQuery와 Postcodify를 로딩한다 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>


<script>
 
//     아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
    var idCheck = 0;
    var pwdCheck = 0;
    //아이디 체크하여 가입버튼 비활성화, 중복확인.
    function checkId() {
        var inputed = $('.uid').val();
        $.ajax({
            data : {
                uid : inputed
            },
            url : "/user/checkId",
            success : function(data) {
                if(inputed=="" && data=='0') {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checkaa").css("background-color", "#FFCECE");
                    $('#idCheckMessage').html('아이디를 입력해주세요.');
                    idCheck = 0;
                } else if (data == '0') {
                    $("#checkaa").css("background-color", "#B0F6AC");
                    idCheck = 1;
                    if(idCheck==1 && pwdCheck == 1) {
                        $(".signupbtn").prop("disabled", false);
                        $(".signupbtn").css("background-color", "#4CAF50");
                        signupCheck();
                    } 
                } else if (data == '1') {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checkaa").css("background-color", "#FFCECE");
                    idCheck = 0;
                } 
            }
        });
    }
    
  //재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
    function checkPwd() {
        var inputed = $('.upw').val();
        var reinputed = $('#repwd').val();
        var pwCheck = /^[a-zA-Z0-9]{4,12}$/; // 소문자, 대문자, 숫자 4자리에서~12자리까지 입력가능
        var pwOK = pwCheck.exec(inputed); 
        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#repwd").css("background-color", "#FFCECE");
        }
        else if (inputed == reinputed && pwOK) {
            $("#repwd").css("background-color", "#B0F6AC");
            pwdCheck = 1;
            if(idCheck==1 && pwdCheck == 1) {
                $(".signupbtn").prop("disabled", false);
                $(".signupbtn").css("background-color", "#4CAF50");
                signupCheck();
            }
        } else if (inputed != reinputed) {
            pwdCheck = 0;
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#repwd").css("background-color", "#FFCECE");
        }
    }
    //닉네임과 이메일 입력하지 않았을 경우 가입버튼 비활성화
    function signupCheck() {
        var uemail1 = $("#uemail1").val();
        var uemail2 = $("#uemail2").val();
        var uphone = $("#uphone").val();
        var uaddress1 = $("#uaddress1").val();
        var uaddress2 = $("#uaddress2").val();
        var uaddress3 = $("#uaddress3").val();
        var uaddress4 = $("#uaddress4").val();
        var uhometype = $("#uhometype").val();
        var ustatus = $("#ustatus").val();
        if(uemail1=="" || uemail2==""||uaddress1==""||uaddress2==""||uaddress3==""||uaddress4==""
        		||uphone==""||uhometype==""||ustatus=="") {
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
        } else {
        }
    }
    //캔슬버튼 눌렀을 눌렀을시 인풋박스 클리어
    $("#cancelbtn").click(function(){
            $(".uid").val(null);
            $(".upw").val('');
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
    });
</script>



</body>
</html>