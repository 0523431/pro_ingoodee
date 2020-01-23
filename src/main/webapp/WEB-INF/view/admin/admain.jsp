<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
ul {list-style:none;}
ul ul{display:none;}
ul ul li li{text-decoration:none;}
ul li:hover > ul {display:block;}
</style>

<body>
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-green w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container">
    <h3 class="w3-padding-64"><b>Hability<br>관리자</b></h3>
  </div>
  <div class="w3-bar-block">
  <ul>
    <li class="menu"><a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">회원관리</a>
    	<ul class="hide">
    		<li><a href="#">회원 목록</a></li>
    	</ul>
    </li>
    <li  class="menu"><a href="#showcase" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">배송관리</a>
        <ul class="hide">
    		<li><a href="#">배송 목록</a></li>
    	</ul>
    </li>
    <li  class="menu"><a href="#services" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">게시판관리</a>
        <ul class="hide">
    		<li><a href="#">게시물 관리</a></li>
    		<li><a href="#">댓글/후기 관리</a></li>
    	</ul>
    </li>	
    <li  class="menu"><a href="#designers" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">고객센터관리</a>
        <ul class="hide">
    		<li><a href="#">공지사항</a></li>
    		<li><a href="#">1:1 문의내역</a></li>
    	</ul>
    </li>
    <li  class="menu"><a href="#packages" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">매출관리</a>
    	<ul class="hide">
    	    <li><a href="#">클래스/스토어 매출</a></li>
    		<li><a href="#">월별 매출</a></li>
    		<li><a href="#">하빌리티 매출</a></li>
    	</ul>
    </li>
    <li><a href="../user/main.shop" onclick="w3_close()" class="w3-bar-item w3-button w3-text-navy">관리자 모드 종료</a></li>
  </ul>
  </div>
</nav>

<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-hide-large w3-purple w3-xlarge w3-padding">
  <a href="javascript:void(0)" class="w3-button w3-red w3-margin-right" onclick="w3_open()">☰</a>
  <span>Hability<br>Administration Page</span>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">

  <!-- Header -->
  <div class="w3-container" style="margin-top:80px" id="showcase">
    <h1 class="w3-jumbo"></h1>
    <h1 class="w3-xxxlarge w3-text-purple"><b>Showcase.</b></h1>
    <hr style="width:50px;border:5px solid purple" class="w3-round">
  </div>
  
  <!-- Photo grid (modal) -->
  <div class="w3-row-padding">
    <div class="w3-half">
      <img src="/w3images/kitchenconcrete.jpg" style="width:100%" onclick="onClick(this)" alt="Concrete meets bricks">
      <img src="/w3images/livingroom.jpg" style="width:100%" onclick="onClick(this)" alt="Light, white and tight scandinavian design">
      <img src="/w3images/diningroom.jpg" style="width:100%" onclick="onClick(this)" alt="White walls with designer chairs">
    </div>

    <div class="w3-half">
      <img src="/w3images/atrium.jpg" style="width:100%" onclick="onClick(this)" alt="Windows for the atrium">
      <img src="/w3images/bedroom.jpg" style="width:100%" onclick="onClick(this)" alt="Bedroom and office in one space">
      <img src="/w3images/livingroom2.jpg" style="width:100%" onclick="onClick(this)" alt="Scandinavian design">
    </div>
  </div>

  <!-- Modal for full size images on click-->
  <div id="modal01" class="w3-modal w3-black" style="padding-top:0" onclick="this.style.display='none'">
    <span class="w3-button w3-black w3-xxlarge w3-display-topright">×</span>
    <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
      <img id="img01" class="w3-image">
      <p id="caption"></p>
    </div>
  </div>

  <!-- Services -->
  <div class="w3-container" id="services" style="margin-top:75px">
    <h1 class="w3-xxxlarge w3-text-purple"><b>Services.</b></h1>
    <hr style="width:50px;border:5px solid purple" class="w3-round">
  </div>
  
  <!-- Designers -->
  <div class="w3-container" id="designers" style="margin-top:75px">
    <h1 class="w3-xxxlarge w3-text-purple"><b>Designers.</b></h1>
    <hr style="width:50px;border:5px solid purple" class="w3-round">
  </div>

  <!-- Packages / Pricing Tables -->
  <div class="w3-container" id="packages" style="margin-top:75px">
    <h1 class="w3-xxxlarge w3-text-purple"><b>Packages.</b></h1>
    <hr style="width:50px;border:5px solid purple" class="w3-round">
  </div>

  
  <!-- Contact -->
  <div class="w3-container" id="contact" style="margin-top:75px">
    <h1 class="w3-xxxlarge w3-text-purple"><b>Contact.</b></h1>
    <hr style="width:50px;border:5px solid purple" class="w3-round">
  </div>

<!-- End page content -->
</div>

<!-- W3.CSS Container -->
<div class="w3-light-grey w3-container w3-padding-32" style="margin-top:75px;padding-right:58px"><p class="w3-right">Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a></p></div>

<script>
// Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}

// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}

</script>

</body>
</html>
