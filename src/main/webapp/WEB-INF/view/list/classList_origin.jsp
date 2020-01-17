<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>늘:솜씨 - 취미를만나일상이아름다워지다</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="responsiveslides.min.js"></script>
<style>
.img-slide-cont {
  position: relative;
  list-style: none;
  overflow: hidden;
  width: 100%;
  padding: 0;
  margin: 0;
  }

.img-slide-cont li {
  -webkit-backface-visibility: hidden;
  position: absolute;
  display: none;
  width: 100%;
  left: 0;
  top: 0;
  }

.img-slide-cont li:first-child {
  position: relative;
  display: block;
  float: left;
  }

.img-slide-cont img-slide img-slide-img {
  display: block;
  height: auto;
  float: left;
  width: 100%;
  border: 0;
  }
</style>
<script>
  $(function() {
    $(".img-slide-cont").responsiveSlides({
    	auto : true,
    	speed : 500,
    	timeout :4000,
    	random : false,
    	pause : true,
    	after : function(){}
    });
  });
</script>
<!-- <script type="text/javascript">
	$(document).ready(function() {
		// 첫번째 이미지가 화면에 출력되도록 설정됨
		moveSlider(0);
		var idx =0;
		var inc =-1;
		setInterval(function() {
			if(idx >=3) {
				inc =-1;
			}
			if(idx <=0) {
				inc =1;
			}
			idx +=inc;
			moveSlider(idx);
		}, 3000)
	});
	
	// 움직이고 보여주는 기능을 담당
	function moveSlider(index) {
		//var moveLeft = -(index *680);
		var moveLeft = -index *100+"%";
		$('.img-slide-cont').animate({left : moveLeft}, 'slow');
		$('.class-paging[idx = '+index+']').addClass('select');
		$('.class-paging[idx != '+index+']').removeClass('select');
	}
</script> -->
<!-- <script>
	$(document).ready(function() {
		// 첫번째 이미지가 화면에 출력되도록 설정됨
		move(0);
		var idx = 0;
		var inc = -1;
		setInterval(function() {
			if (idx >= 3) {
				inc = -1;
			}
			if (idx <= 0) {
				inc = 1;
			}
			idx += inc;
			move(idx);
		}, 3000)
	});

	function move(idx) {
		var ul = document.querySelector('.img-slide-cont');
		setInterval(function() {
			ul.style.transform = "translate3d(-" + idx *100 + "%, 0px, 0px)";
		}, 2000);
	}

</script> -->

</head>

<body>
<div class="container">
	<div class="class-wrap">
				
		<div class="layout-wrap">
			<!-- 광고 슬라이드 3개 -->
			<div class="img-slide-wrap img-slide-wrap01" id="img-slide-wrap">
				
				<ul class="img-slide-cont">
					<!-- 1번 광고 -->
					<li class="img-slide" inx="0">
						<a href="https://hobbyful.co.kr/view-magazine.html?id=178" title="하비풀만의 특별한 스티커맵" class="btn-img-slide">
							<span class="img-slide-img" style="background-image:url(https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/classbanner/6134d530-d369-11e9-beb7-c79511ad1cb5-resize.jpg);"></span>
							<div class="img-slide-area2 img-slide-type02">
								<strong class="img-slide-tit">ONLY HOBBYFUL(스트롱태그)</strong>
								<span class="img-slide-txt">정규 클래스에서 누리는 소소한 재미<span class="bold">하비풀만의 특별한 스티커맵</span></span>
								<button type="button" class="btn-slide-go">자세히 보기</button>
							</div>
						</a>
					</li>
					<!-- 2번 광고 -->
					<li class="img-slide" inx="1">
						<a href="https://hobbyful.co.kr/view-magazine.html?id=191" title="#뿌듯챌린지 2차 오픈" class="btn-img-slide">
							<span class="img-slide-img" style="background-image:url(https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/classbanner/5c2d36b0-d367-11e9-beb7-c79511ad1cb5-resize.jpg);"></span>
							<div class="img-slide-area2 img-slide-type02">
								<strong class="img-slide-tit">완성하고뿌듯, 환급받고 뿌듯(스트롱태그)</strong>
								<span class="img-slide-txt">매주 5명 클래스 100% 환급<span class="bold">#뿌듯챌린지 2차 오픈</span></span>
								<button type="button" class="btn-slide-go">자세히 보기</button>
							</div>
						</a>
					</li>
					<!-- 3번 광고 -->	
					<li class="img-slide" inx="2">
						<a href="https://hobbyful.co.kr/view-magazine.html?id=164" title="기업/단체 신청하고 할인받자!(마우스오버)" class="btn-img-slide">
							<span class="img-slide-img" style="background-image:url(https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/classbanner/f6ef3180-4154-11e9-8c9b-07247cd7ad1a-resize.jpg);"></span>
							<div class="img-slide-area2 img-slide-type02">
								<strong class="img-slide-tit">단체주문 할인 신청</strong>
								<span class="img-slide-txt">함께하면 더 즐거운 취미<span class="bold">기업/단체 신청하고 할인받자!</span></span>
								<button type="button" class="btn-slide-go">자세히 보기</button>
							</div>
						</a>
					</li>
				</ul>
			
				<div class="paging-wrap">
					<div class="class-paging paging-cont">
						<button type="button" class="paging-btn idx=1">0</button>
						<button type="button" class="paging-btn idx=2">1</button>
						<button type="button" class="paging-btn idx=3">2</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 작은 navigation -->
		<div class="layout-wrap">
			<ul class="tab-class-list">
				<li class="tab-class">
					<a href="/list/class" data-path="class" data-fullpath="class" title="전체" class="btn-tab-class btn-tab-on">
						전체
					</a>
				</li>
				<li class="tab-class">
					<a href="/list/class/regular" data-path="regular" data-fullpath="class/regular" class="btn-tab-class">
						전체 정규클래스
					</a>
				</li>
				<li class="tab-class">
					<a href="/list/class/macrame" data-path="macrame" data-fullpath="class/macrame" class="btn-tab-class">
						마크라메
					</a>
				</li>
				<li class="tab-class">
					<a href="/list/class/french-embroidery" data-path="french-embroidery" data-fullpath="class/french-embroidery" class="btn-tab-class">
						프랑스자수
					</a>
				</li>
				<li class="tab-class">
					<a href="/list/class/drawing" data-path="drawing" data-fullpath="class/drawing" class="btn-tab-class">
						수채화/드로잉
					</a>
				</li>
				<li class="tab-class">
					<a href="/list/class/knitting" data-path="knitting" data-fullpath="class/knitting" class="btn-tab-class">
						뜨개질/위빙
					</a>
				</li>
				<li class="tab-class">
					<a href="/list/class/leather" data-path="leather" data-fullpath="class/leather" class="btn-tab-class">
						가죽공예
					</a>
				</li>
				<li class="tab-class">
					<a href="/list/class/soap-candle" data-path="soap-candle" data-fullpath="class/soap-candle" class="btn-tab-class">
						비누/캔들
					</a>
				</li>
				<li class="tab-class">
					<a href="/list/class/jewelry-neonsign" data-path="jewelry-neonsign" data-fullpath="class/jewelry-neonsign" class="btn-tab-class">
						쥬얼리/네온사인
					</a>
				</li>
				<li class="tab-class">
					<a href="/list/class/etc" data-path="etc" data-fullpath="class/etc" class="btn-tab-class">
						다양한 취미
					</a>
				</li>
			</ul>
		</div>
		<!-- 작은 navigation The end -->
		
		<!-- 클래스 list -->
		<div class="layout-wrap">
			<ul id="allList" class="class-list-wrap hf-tracker-group" data-tracker-type="impression" data-tracker-id="/list/">
				
				<!-- 정규 클래스 -->
				<li class="class-list hf-tracker-item" data-tracker-id="DW-R-0005">
					<a href="/product/traveldigital">
						<div class="class-list-thumb">
							<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/class/thumbs/42649440-218b-11ea-9cb3-c70fccd5674e-resize.jpg" alt="" class="thumb-class-list">
						</div>
						<div class="class-list-cont">
							<p class="class-list-lecturer-name">[정규 클래스] 유수빈</p>
							<p class="class-list-name" style="padding:0 150px 0 0;">유수빈의 올인원 여행 디지털 드로잉 클래스</p>
							<p class="class-list-discount">
								<span class="i-percent">10%</span>
								<span class="i-regular">180,000원</span>
							</p>
							<p class="class-list-price">
								<span class="i-won">월</span>36,000<span class="i-won">원</span>
								<span class="i-installment">X 5개월</span>
							</p>
						</div>
					</a>
				</li>
				
				<!-- 원데이 클래스  -->
				<li class="class-list hf-tracker-item" data-tracker-id="SE-K-0001">
					<a href="/product/Bo2uDp6tLZ">
						<div class="class-list-thumb">
							<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/class/thumbs/c0605900-1be2-11ea-add4-09214dce28ac-resize.jpg" alt="" class="thumb-class-list">
						</div>
						<div class="class-list-cont">
							<p class="class-list-lecturer-name">[원데이 클래스] 하비풀</p>
							<p class="class-list-name" style="padding:0 100px 0 0;">반곰이의 추억여행 스킬자수 카펫매트 클래스</p>
							<p class="class-list-discount">
								<span class="i-percent">10%</span>
								<span class="i-regular"><s>38,000원</s></span>
							</p>
							<p class="class-list-price">34,200<span class="i-won">원</span></p>
						</div>
					</a>
				</li>
				
				<!-- 원데이 클래스  -->
				<li class="class-list hf-tracker-item" data-tracker-id="NOK0001000S1">
					<a href="/product/2ca6faa382">
						<div class="class-list-thumb">
							<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/class/thumbs/36107460-efc3-11e9-ac24-737b6e1628bf-resize.jpg" alt="" class="thumb-class-list">
						</div>
						<div class="class-list-cont">
							<p class="class-list-lecturer-name">[원데이 클래스] 더베러라이프</p>
							<p class="class-list-name" style="padding:0 100px 0 0;">밤바다 고래의 꿈 네온사인 클래스</p>
							<p class="class-list-discount">
								<span class="i-percent">10%</span>
								<span class="i-regular"><s>43,500원</s></span>
							</p>
							<p class="class-list-price">39,150<span class="i-won">원</span></p>
						</div>
					</a>
				</li>
				
				<!-- 품절 -->
				<li class="class-list hf-tracker-item" data-tracker-id="NS-K-0001">
					<a href="/product/9fb76748cf">
						<div class="class-list-thumb">
							<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/class/thumbs/5a605ae0-55b0-11e9-9509-fd4eca7b3294-resize.jpg" alt="" class="thumb-class-list">
							<p class="i-soldout"><span>일시 품절</span></p>
						</div>
						<div class="class-list-cont">
							<p class="class-list-lecturer-name">[원데이 클래스] 콩페티</p>
							<p class="class-list-name" style="padding:0 100px 0 0;">숲속 산책 비누 클래스</p>
							<p class="class-list-discount">
								<span class="i-percent">10%</span>
								<span class="i-regular"><s>34,000원</s></span>
							</p>
							<p class="class-list-price">30,600<span class="i-won">원</span></p>
						</div>
					</a>
				</li>
				
				<li class="class-list hf-tracker-item" data-tracker-id="LT-K-0006">
					<a href="/product/53ea1a6b8b">
						<div class="class-list-thumb">
						<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/class/thumbs/6179e8f0-39a4-11e9-9148-65480c11ba0a-resize.jpg" alt="" class="thumb-class-list">
						</div>
						<div class="class-list-cont">
							<p class="class-list-lecturer-name">[원데이 클래스] 트리비아</p>
							<p class="class-list-name" style="padding:0 100px 0 0;">가죽 미니 버킷백 만들기 클래스</p>
							<p class="class-list-discount">
								<span class="i-percent">10%</span>
								<span class="i-regular"><s>62,000원</s></span>
							</p>
							<p class="class-list-price">55,800<span class="i-won">원</span></p>
						</div>
					</a>
				</li>
							
				<li class="class-list hf-tracker-item" data-tracker-id="CA-K-0001">
					<a href="/product/sIFR8YyVhz">
						<div class="class-list-thumb">
							<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/class/thumbs/64cd5070-fb85-11e9-bce7-bb5409fe61d5-resize.jpg" alt="" class="thumb-class-list">
						</div>
						<div class="class-list-cont">
							<p class="class-list-lecturer-name">[원데이 클래스] 오브유</p>
							<p class="class-list-name" style="padding:0 100px 0 0;">컬러오브유 커플머그 도자 클래스</p>
							<p class="class-list-discount">
								<span class="i-percent">10%</span>
								<span class="i-regular"><s>50,000원</s></span>
							</p>
							<p class="class-list-price">45,000<span class="i-won">원</span></p>
						</div>
					</a>
				</li>
								
				<!-- 정규 클래스 -->
				<li class="class-list hf-tracker-item" data-tracker-id="FE-R-0002">
					<a href="/product/3d6fc1a6a2">
						<div class="class-list-thumb">
							<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/class/thumbs/b9183250-09b6-11ea-952c-efccbb50f547-resize.jpg" alt="" class="thumb-class-list">
						</div>
						<div class="class-list-cont">
							<p class="class-list-lecturer-name">[정규 클래스] 실버스노우</p>
							<p class="class-list-name" style="padding:0 150px 0 0;">실버스노우의 프랑스자수 기초 산책 클래스</p>
							<p class="class-list-discount">
								<span class="i-percent">10%</span>
								<span class="i-regular">138,600원</span>
							</p>
							<p class="class-list-price">
								<span class="i-won">월</span>27,720<span class="i-won">원</span>
								<span class="i-installment">X 5개월</span>
							</p>
						</div>
					</a>
				</li>
				
				<!-- 원데이 클래스 -->
				<li class="class-list hf-tracker-item" data-tracker-id="FE-K-0001">
					<a href="/product/c2c2658b0f">
						<div class="class-list-thumb">
							<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/class/thumbs/c4f0ec10-09b7-11ea-952c-efccbb50f547-resize.jpg" alt="" class="thumb-class-list">
						</div>
						<div class="class-list-cont">
							<p class="class-list-lecturer-name">[원데이 클래스] 꽃보다 자수, 안성희</p>
							<p class="class-list-name" style="padding:0 100px 0 0;">프랑스자수 카페 에코백 클래스</p>
							<p class="class-list-discount">
								<span class="i-percent">10%</span>
								<span class="i-regular"><s>30,000원</s></span>
							</p>
							<p class="class-list-price">27,000<span class="i-won">원</span></p>
						</div>
					</a>
				</li>
			</ul>
		</div>
		
		<div class="class-list-more-btn">
			<a href="javascript:;" title="more" class="btn-more" style="display: none;">more</a>
		</div>
	</div>
</div>

</body>
</html>