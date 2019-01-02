<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
form {
	width: 500px;
}

		#container {
			margin-top: 100px ;
			margin-left : 500px;
			width:960px;
			text-align:center;
		}
		.tab {
			list-style: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
		}
		
			/* Float the list items side by side */
		.tab li {
			float: left;
		}
			/* Style the links inside the list items */
		.tab li a {
			display: inline-block;
			color: #000;
			text-align: center;
			text-decoration: none;
			padding: 14px 16px;
			font-size: 17px;
			transition:0.3s;
		}
				/* Style the tab content */
		.tabcontent {
			display: none;
			padding: 6px 12px;
		}
		ul.tab li.current{
		}
		.tabcontent.current {
			display: block;
		}
		button.btn.btn-primary.btn-block.btn-flat {
		    color: #ffffff;
		    background-color: #ff2b67;
		}
		
		div.tabcontent.current {
		    background-color: #ffffff;
		    font-size: 25px;
		    color: #000000;
		    width: 550px;
		    height: 400px;
		}
		
		#container {
		    width: 550px;
		    margin-left: 700px;
		}
		
		div.row div {
		    margin-left: 15px;
		    margin-top: 50px;
		}
		
		div.tabcontent.current p {
		    margin-bottom: 50px;
		    margin-top: 30px;
		}
		
		#container h2 {
		    margin-bottom: 40px;
		    font-weight: bold;
		    font-size: 40px;
		}
		
		ul.tab li a {
		    font-size: 20px;
		    font-weight: bold;
		}
		
		input.form-control {
		    font-size: 20px;
		}
		div.tabcontent.current h3 {
		    margin-bottom: 50px;
		}

</style>
<meta charset="UTF-8">
<title>Join</title>
 <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
	<script type="text/javascript">
		
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
		$(document).on('click','#findId',function(){
			var uemail1 = $('#uemail1').val();
		 	var uemail2 = $('#uemail2').val();

		 	var postData = {'uemail1' : uemail1 , 'uemail2' : uemail2 };

			$.ajax({
		        url:'/user/findId',
		        type:'POST',
		        data: postData,
		        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        dataType : "json",

		        success:function(data){
		        	var userid = data.user_id;
		       	 		 $("#IdList").append("<h1>"+"회원님의 정보로 등록된 아이디는 : "+userid+" 입니다.</h1>"+"<br>"+"<a href='/user/login' style='font-size: 30px;'>로그인 하러 가기</a>")
									
		        },
		        error: function (XMLHttpRequest, textStatus, errorThrown){

		        	alert('정보를 다시 입력해주시길 바랍니다.' );
		        }
		    });
		});
		
		$(document).on('click','#findPwd',function(){
			var uid = $('#uid').val();

		 	var postData = {'uid' : uid };

			$.ajax({
		        url:'/user/findPwd',
		        type:'POST',
		        data: postData,
		        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        dataType : "json",

		        success:function(data){
		        	var findPwd = data.findPwd;
		        	
		        	if(findPwd=='OK'){
		       	 		$("#PwdList").append("<h1>메일을 확인해주세요.</h1>"+"<br>"+"<a href='/user/login' style='font-size: 30px;'>로그인 하러 가기</a>")
		        	}
		        },
		        error: function (XMLHttpRequest, textStatus, errorThrown){

		        	alert('정보를 다시 입력해주시길 바랍니다.' );
		        	$("#PwdList").append("<h1>가입되어 있지 않은 ID입니다.</h1>")
		        }
		    });
		});
	</script>
    <!-- Bootstrap 3.3.4 -->
    <link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="../resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="../resources/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />
	
	  <!-- Bootstrap CSS CDN -->
	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
	  <!-- Our Custom CSS -->
	  <link rel="stylesheet" href="/resources/css/mainCss.css">
	
	  <!-- Font Awesome JS -->
	  <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	  <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>


</head>
  <body class="">
  
  <div class="wrapper">
    <!-- Sidebar -->
    <nav id="sidebar">

      <div id="dismiss">
        <i class="fas fa-arrow-left"></i>
      </div>

      <div class="sidebar-header">
        <h3>Makers</h3>
      </div>

      <ul class="list-unstyled components">
        <p>Menu</p>


        <li class="active">
          <a href="/user/login">Home</a>
        </li>
        <li>
          <a href="#">공지사항</a>
        </li>
        <li>
          <a href="/user/login">My Page</a>
        </li>
        <li>
          <a href="/user/login">My Home</a>
        </li>


        <li>
          <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">Chat</a>
          <ul class="collapse list-unstyled" id="pageSubmenu">
            <li>
              <a href="/user/login">개인 채팅</a>
            </li>
            <li>
              <a href="/user/login">우리 동 채팅</a>
            </li>
          </ul>
        </li>

        <li>
          <a href="#">Q&A</a>
        </li>
        <li>
          <a href="/user/logout">로그아웃</a>
        </li>
      </ul>
    </nav>

    <!-- Page Content -->
    <div id="content">

      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">

          <button type="button" id="sidebarCollapse" class="btn btn-info">
            <i class="fas fa-align-left"></i>
            <span>Menu</span>
          </button>
          <span id="myroom-logo">
            <p>Makers</p>
          </span>
        </div>
      </nav>
  
  
	<div id="container" >
		
		<h2>What do you need?</h2>
		<ul class="tab">
			<li class="current" data-tab="tab1"><a href="#">Find ID</a></li>
			<li data-tab="tab2"><a href="#">Find Password</a></li>
		</ul>

		<div id="tab1" class="tabcontent current">
			<p class="">Please enter your email address.</p>
			
			<form action="/user/findId" method="get">
			
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
				
				<div class="row">
				
					<div >
						<button type="button" id="findId" class="signupbtn btn btn-primary btn-block btn-flat"  style="width: 500px;  height: 50px;">FindId</button>
						<button type="button" id="cancelbtn" class="btn btn-primary btn-block btn-flat" onclick='$("#joinsung").css("display", "none")' style="width: 500px;  height: 50px; background-color: red;">Cancel</button>
					</div> <!-- /.col -->
				</div>
			</form>
			        <span id="IdList"></span>  
						
		</div>

		<div id="tab2" class="tabcontent">
			<h3>Please enter your ID.</h3>
			
			<form action="/user/findPwd" method="post">
			
				<div class="form-group has-feedback">
					<input type="text" name="uid" id="uid" class="form-control" placeholder="USER ID" style="width: 500px; float: left;" oninput="checkId()" />
					<span class="glyphicon form-control-feedback"></span>
				</div>
				<br>
				<br>
				<h5 style="color: #FE2E2E;" id="emCheckMessage"></h5>
				
				<div class="row">
				
					<div >
						<button type="button" id="findPwd" class="signupbtn btn btn-primary btn-block btn-flat"  style="width: 500px; height: 50px;">FindId</button>
					</div> <!-- /.col -->
				</div>
			</form>
			   <span id="PwdList"></span>  
						
		</div>

	</div>


    </div>
    <!-- Dark Overlay element -->
    <div class="overlay"></div>
  </div>

    <!-- jQuery 2.1.4 -->
    <script src="../resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="../resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="../resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>


<script>
	
	$(function() {
		$('ul.tab li').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('ul.tab li').removeClass('current');
			$('.tabcontent').removeClass('current');
			$(this).addClass('current');
			$('#' + activeTab).addClass('current');
		})
	});

    //캔슬버튼 눌렀을 눌렀을시 인풋박스 클리어
    $("#cancelbtn").click(function(){
            $("#uemail1").val(null);
            $("#uemail2").val(null);
    });
</script>


  <!-- jQuery CDN - Slim version (=without AJAX) -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <!-- Popper.JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
  <!-- Bootstrap JS -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
  <script src="/resources/js/jquery.mCustomScrollbar.min.css"></script>




  <script type="text/javascript">
    $(document).ready(function() {
      $("#sidebar").mCustomScrollbar({
        theme: "minimal"
      });

      $('#dismiss, .overlay').on('click', function() {
        // hide sidebar
        $('#sidebar').removeClass('active');
        // hide overlay
        $('.overlay').removeClass('active');
      });

      $('#sidebarCollapse').on('click', function() {
        // open sidebar
        $('#sidebar').addClass('active');
        // fade in the overlay
        $('.overlay').addClass('active');
        $('.collapse.in').toggleClass('in');
        $('a[aria-expanded=true]').attr('aria-expanded', 'false');
      });
    });
  </script>
</body>
</html>