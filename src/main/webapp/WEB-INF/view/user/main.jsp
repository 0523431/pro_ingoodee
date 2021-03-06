<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head lang="ko" id="hobbyful">
<title>늘:솜씨</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path}/jquery/js/responsiveslides.min.js"></script>
<style>
.rslides {
  position: relative;
  list-style: none;
  overflow: hidden;
  width: 100%;
  padding: 0;
  margin: 0;
  }

.rslides li {
  -webkit-backface-visibility: hidden;
  position: absolute;
  display: none;
  width: 100%;
  left: 0;
  top: 0;
  }

.rslides li:first-child {
  position: relative;
  display: block;
  float: left;
  }

.rslides img {
  display: block;
  height: auto;
  float: left;
  width: 100%;
  border: 0;
  }
</style>
<script>
  $(function() {
    $(".rslides").responsiveSlides({
    	auto : true,
    	speed : 500,
    	timeout :4000,
    	random : false,
    	pause : true,
    	/* pager: true, */
    	after : function(){}
    });
  });
  
  $(document).ready(function() {
	  recoslide();
  });

	// 슬라이드 
	function recoslide() {
	  var wid = 0;
	  var now_num = 0;
	  var slide_length = 0;
	  var auto = null;
	  var $dotli = $('.dot>li');
	  var $panel = $('.panel');
	  var $panelLi = $panel.children('li');

	  // 변수 초기화
	  function init() {
	    wid = $('.slide').width();
	    now_num = $('.dot>li.on').index();
	    slide_length = $dotli.length;
	  }

	  // 이벤트 묶음
	  function slideEvent() {

	    /* // 슬라이드 하단 dot버튼 클릭했을때
	    $dotli.click(function() {
	      now_num = $(this).index();
	      slideMove();
	    }); */

	    // 이후 버튼 클릭했을때
	    $('.next').click(function() {
	      nextChkPlay();
	    });

	    // 이전 버튼 클릭했을때
	    $('.prev').click(function() {
	      prevChkPlay();
	    });

	    // 오토플레이
	    autoPlay();

	    // 오토플레이 멈춤
	    autoPlayStop();

	    // 오토플레이 재시작
	    autoPlayRestart();

	    // 화면크기 재설정 되었을때
	    resize();
	  }

	  // 자동실행 함수
	  function autoPlay() {
	    auto = setInterval(function() {
	      nextChkPlay();
	    }, 3000);
	  }

	  // 자동실행 멈춤
	  function autoPlayStop() {
	    $panelLi.mouseenter(function() {
	      clearInterval(auto);
	    });
	  }


	  // 자동실행 멈췄다가 재실행
	  function autoPlayRestart() {
	    $panelLi.mouseleave(function() {
	      auto = setInterval(function() {
	        nextChkPlay();
	      }, 3000);
	    });
	  }

	  // 이전 버튼 클릭시 조건 검사후 슬라이드 무브
	  function prevChkPlay() {
	    if (now_num == 0) {
	      now_num = slide_length - 1;
	    } else {
	      now_num--;
	    }
	    slideMove();
	  }

	  // 이후 버튼 클릭시 조건 검사후 슬라이드 무브
	  function nextChkPlay() {
	    if (now_num == slide_length - 1) {
	      now_num = 0;
	    } else {
	      now_num++;
	    }
	    slideMove();
	  }

	  // 슬라이드 무브
	  function slideMove() {
	    $panel.stop().animate({
	      'margin-left': -wid * now_num
	    });
	    $dotli.removeClass('on');
	    $dotli.eq(now_num).addClass('on');
	  }

	  // 화면크기 조정시 화면 재설정
	  function resize() {
	    $(window).resize(function() {
	      init();
	      $panel.css({
	        'margin-left': -wid * now_num
	      });
	    });
	  }
	  init();
	  slideEvent();
	}
</script>
</head>
<body class="">
<div class="container" id="top">

	<!-- 좌우 버튼 or 하단 페이징 버튼 클릭 시 img-slide-wrap01 ~ img-slide-wrap03 클레스 추가&변경 -->
	<div id="mainSlide" class="swiper-container hf-tracker-group swiper-container-initialized swiper-container-horizontal" data-tracker-type="promotion" data-tracker-id="Main Banner">

		<ul id="mainSlideContent" class="rslides">
			<!-- 1 -->
			<li class="swiper-slide swiper-slide-duplicate">
				<a href="https://hobbyful.co.kr/view-magazine.html?id=244" title="이번주 취미코드 마법의 산타 주머니">
					<picture>
						<source media="(max-width: 970px)" srcset="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/banners/d81c8a00-25ec-11ea-be70-61e81fa988df-resize.jpg" alt="이번주 취미코드 마법의 산타 주머니">
						<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/banners/d81bc6b0-25ec-11ea-be70-61e81fa988df-resize.jpg" alt="이번주 취미코드 마법의 산타 주머니">
					</picture>
				</a>
			</li>
			<!-- 2 -->
			<li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev">
				<a href="https://hobbyful.co.kr/product/traveldigital" title="유수빈의 올인원 여행 디지털드로잉 클래스">
					<picture>
						<source media="(max-width: 970px)" srcset="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/banners/8f49ca30-20a2-11ea-be70-61e81fa988df-resize.jpg" alt="유수빈의 올인원 여행 디지털드로잉 클래스">
						<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/banners/8f48b8c0-20a2-11ea-be70-61e81fa988df-resize.jpg" alt="유수빈의 올인원 여행 디지털드로잉 클래스">
					</picture>
				</a>
			</li>
			<!-- 3 -->
			<li class="swiper-slide hf-tracker-item swiper-slide-duplicate swiper-slide-duplicate-active" style="background:#FFFFFF" data-tracker-id="107" data-swiper-slide-index="2">
				<a href="https://hobbyful.co.kr/product/merryhobbyfulmas" title="크리스마스 홈클래스 한정판 에디션">
					<picture>
						<source media="(max-width: 970px)" srcset="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/banners/873d3a10-1fe5-11ea-be70-61e81fa988df-resize.jpg" alt="크리스마스 홈클래스 한정판 에디션">
						<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/banners/873c76c0-1fe5-11ea-be70-61e81fa988df-resize.jpg" alt="크리스마스 홈클래스 한정판 에디션">
					</picture>
				</a>
			</li>
			<!-- 4 -->
			<li class="swiper-slide hf-tracker-item swiper-slide-duplicate swiper-slide-duplicate-next" style="background:#9a603e" data-tracker-id="105" data-swiper-slide-index="3">
				<a href="https://hobbyful.co.kr/product/Bo2uDp6tLZ" title="반곰이의 추억여행 스킬자수 카펫매트 클래스">
					<picture>
						<source media="(max-width: 970px)" srcset="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/banners/2048c750-1be6-11ea-add4-09214dce28ac-resize.jpg" alt="반곰이의 추억여행 스킬자수 카펫매트 클래스">
						<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/banners/20478ed0-1be6-11ea-add4-09214dce28ac-resize.jpg" alt="반곰이의 추억여행 스킬자수 카펫매트 클래스">
					</picture>
				</a>
			</li>
			<!-- 5 -->
			<li class="swiper-slide hf-tracker-item swiper-slide-duplicate" style="background:#e8d19c" data-tracker-id="102" data-swiper-slide-index="4">
				<a href="https://hobbyful.co.kr/product/yjK3fHoLPQ" title="스티치랩의 재봉틀 입문 클래스">
					<picture>
						<source media="(max-width: 970px)" srcset="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/banners/1e9b2ed0-1258-11ea-931a-2fe27e77a6ff-resize.jpg" alt="스티치랩의 재봉틀 입문 클래스">
						<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/banners/1e9ab9a0-1258-11ea-931a-2fe27e77a6ff-resize.jpg" alt="스티치랩의 재봉틀 입문 클래스">
					</picture>
				</a>
			</li>
		</ul>

		<!-- <div class="paging-wrap">
			<button type="button" class="paging-btn-prev" tabindex="0" role="button" aria-label="Previous slide">이전</button>
			<div class="paging-cont swiper-pagination-bullets">
				<span class="paging-btn"></span>
				<span class="paging-btn"></span>
				<span class="paging-btn active"></span>
				<span class="paging-btn"></span>
				<span class="paging-btn"></span>
			</div>
			<button type="button" class="paging-btn-next" tabindex="0" role="button" aria-label="Next slide">다음</button>
		</div>
		<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span> -->
	</div>
	
	<!-- small main -->
	<div class="float-wrap">
		<!-- 배송시작일 -->
		<div class="delivery-info-wrap">
			<div class="delivery-info-txt">지금 주문하시면</div>
			<div class="delivery-info-tit">12월 30일(D-3)</div>
			<div class="delivery-info-txt">부터 취미 배송이 시작됩니다.</div>
		</div>
		<!-- 인사 박스 -->
		<div class="hf-info-wrap">
			<div class="hf-info-cont">
				<div class="hf-info-txt">
					<a href="/mypage.html">
						<div class="photo-thumb block">
							<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/profile/basic.png?0.6152530793205171" onerror="this.src='../static/img/ico-profile.svg'">
						</div>
					</a>
					안녕하세요 
					<a class="bold underline" style="color: #f1645d" href="/mypage.html">서현-</a>님,
					<br>아직 구독중인 취미가 없으시군요!
					<br>하비풀과 함께 원하는 취미를 찾아보세요.
				</div>
				<a href="/class.html" class="btn-hf-info" title="취미 클래스 둘러보기">취미 클래스 둘러보기</a>
			</div>
		</div>
	</div>
	
	<!-- 추천 리스트 시작 -->
	<div id="recommendSlideList">
		<!-- BEST 지금 가장 인기있는 취미  -->
		<section class="hfb-categorySlideList hf-tracker-group swiper-container-initialized swiper-container-horizontal">
			<header>
				<a href="/list/recommend/best">
					<h4>BEST 지금 가장 인기있는 취미</h4>
				</a>
			</header>
			
			<button type="button" class="f-nav i-prev prev" role="button" aria-label="Previous slide">이전</button>
			<button type="button" class="f-nav i-next next" tabindex="0" role="button" aria-label="Next slide">다음</button>
			
			<ul class="swiper-wrapper panel">
				<!-- 1 -->
				<li class="swiper-slide" style="width: 290.25px; margin-right: 18px;">
					<a href="/product/906965c18d">
						<p class="i-img">
							<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/class/thumbs/a7468c10-0f20-11ea-83c9-99a92107598f-resize.jpg" alt="">
						</p>
						<p class="i-desc">
							<span class="i-type">정규 클래스</span>
							<span class="i-seller">by 메리진</span>
						</p>
						<p class="i-name">메리진의 스마트폰 드로잉 클래스</p>
					</a>
				</li>
				<!-- 2 -->
				<li class="swiper-slide" style="width: 290.25px; margin-right: 18px;">
					<a href="/product/traveldigital">
						<p class="i-img">
							<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/class/thumbs/42649440-218b-11ea-9cb3-c70fccd5674e-resize.jpg" alt="">
						</p>
						<p class="i-desc">
							<span class="i-type">정규 클래스</span>
							<span class="i-seller">by 유수빈</span>
						</p>
						<p class="i-name">유수빈의 올인원 여행 디지털 드로잉 클래스</p>
					</a>
				</li>
				<li class="swiper-slide" style="width: 290.25px; margin-right: 18px;">
					<a href="/product/QMeAha5VgU">
						<p class="i-img">
							<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/class/thumbs/852ae460-09b6-11ea-952c-efccbb50f547-resize.jpg" alt="">
						</p>
						<p class="i-desc">
							<span class="i-type">정규 클래스</span>
							<span class="i-seller">by 메리데이</span>
						</p>
						<p class="i-name">메리데이의 채색 자수 클래스</p>
					</a>
				</li>
				<li class="swiper-slide" style="width: 290.25px; margin-right: 18px;">
					<a href="/product/92LvaquM5a">
						<p class="i-img">
							<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/class/thumbs/d914c600-1b12-11ea-add4-09214dce28ac-resize.jpg" alt="">
						</p>
						<p class="i-desc">
							<span class="i-type">DIY 키트</span>
							<span class="i-seller">by 부쉬아로마</span>
						</p>
						<p class="i-name">하트 곰돌이비누 DIY 키트</p>
					</a>
				</li>
				<li class="swiper-slide" style="width: 290.25px; margin-right: 18px;">
					<a href="/product/Bo2uDp6tLZ">
						<p class="i-img">
							<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/class/thumbs/c0605900-1be2-11ea-add4-09214dce28ac-resize.jpg" alt="">
						</p>
						<p class="i-desc">
							<span class="i-type">원데이 클래스</span>
							<span class="i-seller">by 하비풀</span>
						</p>
						<p class="i-name">반곰이의 추억여행 스킬자수 카펫매트 클래스</p>
					</a>
				</li>
			</ul>
			<!-- <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span> -->
		</section>
		
		<!-- NEW 따끈따끈 새로나온 취미 -->
		<section class="hfb-categorySlideList hf-tracker-group swiper-container-initialized swiper-container-horizontal" data-tracker-type="impression" data-tracker-id="/list/recommend/new">
			<header>
				<a href="/list/recommend/new">
					<h4>NEW 따끈따끈 새로나온 취미</h4>
					<span class="i-desc"></span>
				</a>
			</header>
			<button type="button" class="f-nav i-prev swiper-button-disabled" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true">이전</button>
			<button type="button" class="f-nav i-next" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false">다음</button>
			
			<ul class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
				<li class="swiper-slide hf-tracker-item swiper-slide-active" data-tracker-id="FE-M-0006" style="width: 290.25px; margin-right: 18px;">
					<a href="/product/h9VewXf18y">
						<p class="i-img">
							<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/class/thumbs/490b45e0-2213-11ea-9cb3-c70fccd5674e-resize.jpg" alt="">
						</p>
						<p class="i-desc">
							<span class="i-type">DIY 키트</span>
							<span class="i-seller">by 림자수공방</span>
						</p>
						<p class="i-name">장미정원 자수 끈파우치 만들기</p>
					</a>
				</li>
			</ul>
			<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
		</section>
	</div>
	
	<!-- 매거진 -->
	<div class="thumb-slide-wrap thumb-slide-type02">
		<div class="thumb-slide-tit">추천 매거진</div>
		<div class="thumb-slide-txt">MAGAZINE</div>
		<ul	class="thumb-slide-list recommend-magazine-class swiper-container swiper-container-initialized swiper-container-horizontal">
			<div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
				<li class="swiper-slide thumb-slide swiper-slide-active" style="width: 334.75px; margin-right: 50px;">
					<a href="view-magazine.html?id=244" class="thumb-slide-link" title="이번주, 적립금을 사용해도 줄지 않아요!"> 
						<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/magazine/cc089080-2531-11ea-be70-61e81fa988df-resize.jpg" class="thumb-slide-img" alt="이번주, 적립금을 사용해도 줄지 않아요!"> 
						<span class="thumb-slide-play">재생</span>
					</a> 
					<span class="thumb-slide-link-type">취미코드 [마법의산타주머니]</span> 
					<span class="thumb-slide-link-tit">이번주, 적립금을 사용해도 줄지 않아요!</span>
				</li>
				
				<li class="swiper-slide thumb-slide" style="width: 334.75px; margin-right: 50px;">
					<a href="view-magazine.html?id=242" class="thumb-slide-link" title="회원 환급 이벤트 " 풀네임을 외쳐주세요 "">
						<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/magazine/b86aa440-27b2-11ea-be70-61e81fa988df-resize.jpg" class="thumb-slide-img" alt="회원 환급 이벤트 "> 
						<span class="thumb-slide-play">재생</span>
					</a>
					<span class="thumb-slide-link-type">멤버십 등급에 따른 파격 환급 이벤트 (-50%)</span>
					<span class="thumb-slide-link-tit">회원 환급 이벤트 "풀네임을 외쳐주세요"</span>
				</li>
				
				<li class="swiper-slide thumb-slide" style="width: 334.75px; margin-right: 50px;">
					<a href="view-magazine.html?id=239" class="thumb-slide-link" title="그때그시절 동심찾기! 스킬자수 런칭 이벤트">
						<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/magazine/9da2ee60-1a2e-11ea-add4-09214dce28ac-resize.jpg" class="thumb-slide-img" alt="그때그시절 동심찾기! 스킬자수 런칭 이벤트">
						<span class="thumb-slide-play">재생</span>
					</a>
					<span class="thumb-slide-link-type">취미코드 [빽투더초딩]</span>
					<span class="thumb-slide-link-tit">그때그시절 동심찾기! 스킬자수 런칭 이벤트</span>
				</li>
				
				<li class="swiper-slide thumb-slide" style="width: 334.75px; margin-right: 50px;">
					<a href="view-magazine.html?id=233" class="thumb-slide-link" title="재봉틀 클래스 런칭 행운 이벤트!">
						<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/magazine/b72c0550-14d0-11ea-af2a-6372aa0ef6f4-resize.jpg" class="thumb-slide-img" alt="재봉틀 클래스 런칭 행운 이벤트!">
						<span class="thumb-slide-play">재생</span>
					</a>
					<span class="thumb-slide-link-type">취미코드 [행운의재봉틀]</span>
					<span class="thumb-slide-link-tit">재봉틀 클래스 런칭 행운 이벤트!</span>
				</li>
			</div>
			<span class="swiper-notification" aria-live="assertive"	aria-atomic="true"></span>
		</ul>
		<div class="thumb-slide-btn-wrap">
			<button type="button" class="thumb-slide-btn thumb-btn-prev magazine-btn-prev">이전</button>
			<button type="button" class="thumb-slide-btn thumb-btn-next magazine-btn-next">다음</button>
		</div>
	</div>
	
	<!--  인스타그램 -->
	<div class="hf-thumb-wrap">
		<div class="hf-thumb-tit-wrap">
			<div class="hf-thumb-tit">#hobbyful</div>
			<div class="hf-thumb-txt">INSTAGRAM</div>
		</div>
		<!-- 인스타그램 시작 -->
		<ul class="hf-thumb-list">
			<!-- 1번 -->
			<li class="hf-thumb">
				<a href="https://www.instagram.com/p/B6kfDm0HPbO" target="_blank" class="thumb-link" title>
					<img src="https://scontent-gmp1-1.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s640x640/74396237_2672156873071062_391885237737659200_n.jpg?_nc_ht=scontent-gmp1-1.cdninstagram.com&amp;_nc_cat=106&amp;_nc_ohc=qFFQZPxjONcAX859v7P&amp;oh=6c34295ab1e2cc13b6f5b91e89e7f2a9&amp;oe=5E9DC0D7" class="thumb-img">
				</a>
			</li>
	
			<!-- 2번 -->
			<li class="hf-thumb">
				<a href="https://www.instagram.com/p/B6hs4KeHdoB" target="_blank" class="thumb-link" title>
					<img src="https://scontent-gmp1-1.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s640x640/78964845_548509246004107_8921889499077506650_n.jpg?_nc_ht=scontent-gmp1-1.cdninstagram.com&amp;_nc_cat=107&amp;_nc_ohc=knVtlHE7zREAX9S-qXp&amp;oh=3db0277d5cc4d3146a3556745ee37a8a&amp;oe=5E8D51E3" class="thumb-img">
				</a>
			</li>
	
			<!-- 3번 -->
			<li class="hf-thumb">
				<a href="https://www.instagram.com/p/B6gMNLpBdXn" target="_blank" class="thumb-link" title>
					<img src="https://scontent-gmp1-1.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s640x640/79188020_187213869076286_8053696300353194058_n.jpg?_nc_ht=scontent-gmp1-1.cdninstagram.com&amp;_nc_cat=102&amp;_nc_ohc=DnOXiE9xrAcAX_e4lBp&amp;oh=91887c41245fb08258fd498eacb46a57&amp;oe=5E94FF51" class="thumb-img">
				</a>
			</li>
	
			<!-- 4번 -->
			<li class="hf-thumb">
				<a href="https://www.instagram.com/p/B6f7_TWJNM9" target="_blank" class="thumb-link" title>
					<img src="https://scontent-gmp1-1.cdninstagram.com/v/t51.2885-15/sh0.08/e35/c180.0.1080.1080a/s640x640/79585428_214429429557123_4953305897266218443_n.jpg?_nc_ht=scontent-gmp1-1.cdninstagram.com&amp;_nc_cat=103&amp;_nc_ohc=2fnSSsK3pDEAX_Sh9gk&amp;oh=31cc22aa2f7e22eefb1cade846a3c226&amp;oe=5E9F9446" class="thumb-img">
				</a>
			</li>
		</ul>
	</div>
</div>

<!-- footer있던 자리 -->
<script id="mainSlideTemplate" type="text/x-jsrender-template" data-jsv-tmpl="jsvTmpl">
{{for list}}
<li class="swiper-slide hf-tracker-item" style="background:{{:hb_bgcolor}}" data-tracker-id="{{:hb_idx}}">
{{if hb_link}}<a href="{{:hb_link}}" title="{{:hb_title}}">{{/if}}
<picture>
<source media="(max-width: 970px)" srcset="{{:img_url_mobile}}" alt="{{:hb_title}}">
<img src="{{:img_url_pc}}" alt="{{:hb_title}}">
</picture>
{{if hb_link}}</a>{{/if}}
</li>
{{/for}}
	</script>

</body>
</html>