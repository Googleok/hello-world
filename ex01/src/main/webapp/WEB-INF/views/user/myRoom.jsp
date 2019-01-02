<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title>My Home</title>

  <!-- Bootstrap CSS CDN -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
  <!-- Our Custom CSS -->
  <link rel="stylesheet" href="/resources/css/mainCss.css">

  <!-- Font Awesome JS -->
  <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
  <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
</head>

<body>

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
          <a href="#">Home</a>
        </li>
        <li>
          <a href="#">공지사항</a>
        </li>
        <li>
          <a href="#">My Page</a>
        </li>
        <li>
          <a href="#">My Home</a>
        </li>


        <li>
          <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">Chat</a>
          <ul class="collapse list-unstyled" id="pageSubmenu">
            <li>
              <a href="#">개인 채팅</a>
            </li>
            <li>
              <a href="#">우리 동 채팅</a>
            </li>
          </ul>
        </li>

        <li>
          <a href="#">Q&A</a>
        </li>
        <li>
          <a href="#">로그아웃</a>
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




      <div class="roomarea">

        <div class="img-btn">
          <img src="/resources/image/computer.png" id="img-computer" onclick="location.href='##'">
        </div>
        <div class="img-btn">
          <img src="/resources/image/sofa_1.png" id="img-sofa">
        </div>
        <div class="img-btn">
          <img src="/resources/image/plant.png" id="img-plant">
        </div>
        <div class="img-btn">
          <img src="/resources/image/cctv.png" id="img-cctv" onclick="location.href='##'">
        </div>
        <div class="img-btn">
          <img src="/resources/image/controller_1.png" id="img-controller" onclick="location.href='##'">
        </div>

      </div>

    </div>
    <!-- Dark Overlay element -->
    <div class="overlay"></div>
  </div>



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
