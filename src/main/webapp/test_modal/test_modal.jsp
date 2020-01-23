<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	function form_btn(n) {
		var quantity = document.getElementById("count");
		quan_value = parseInt(quantity.value);
		quan_value +=n;
		quantity.value = quan_value;
		if(quan_value <=0) {
			quantity.value = 1;
		}
		
		var price = document.getElementById("price");
		price_value = parseInt(price.value);
		price_value = price_value * quan_value; // 가격*수량
		price.value = price_value;
	}
	
	$('.modal').on('hidden.bs.modal', function () {
        $(this).removeData('bs.modal');
});
</script>
</head>

<body>
	<!-- 부트스트랩의 모달 창을 사용할려면 아래의 class 이름들을 그대로 사용해야 한다. 변경하면 모양이 달라진다.-->
	<!-- Modal -->
	<div class="modal fade" id="cart" role="dialog">
		<div class="modal-dialog hfc-modal s-big" style="overflow: unset;">
			<!-- Modal content-->
			<div class="modal-content hfe-container" >
				<div class="modal-header">
					<header>
						<h3 class="modal-title">클래스 옵션을 선택하세요</h3>
						<button class="hfe-header-close a-close close" data-dismiss="modal">창닫기</button>
					</header>
				</div>

				<div class="modal-body">
					<section class="hfe-content">
						<div class="hfe-option">
							<article class="s-select">
								<header>
									<h4>클래스 옵션</h4>
								</header>
								<ul class="option-list">
									<li><label> <input type="radio" name="listIndex"
											value="0">
											<div class="option-item">
												<h5>베이직 패키지</h5>
												<p class="prices">
													<span class="sale">35,000원</span>
												</p>
												<span class="desc">온라인 수강권(평생수강)<br>+ 기본 재료/도구
												</span> <img
													src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/product/85/762e61e0-cfcc-11e9-bf27-61bfe2459c00-resize.jpg"
													alt="">
											</div>
											<div class="option-item">
												<h5>베이직 패키지</h5>
												<p class="prices">
													<span class="sale">35,000원</span>
												</p>
												<span class="desc">온라인 수강권(평생수강)<br>+ 기본 재료/도구
												</span> <img
													src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/product/85/762e61e0-cfcc-11e9-bf27-61bfe2459c00-resize.jpg"
													alt="">
											</div>
									</label></li>
								</ul>
							</article>
						</div>
					</section>
				</div>
				<footer>
					<div class="hfe-orderinfo modal-footer">
						<div class="i-names">베이직 패키지</div>
						<div class="i-quantity">
							<div class="hfc-spinner">
								<button class="hfc-i-down" onclick="form_btn(-1)">줄이기</button>
								<input type="number" id="count" name="count" class="hfc-i-num" min="1" max="99" value="1">
								<button class="hfc-i-up" onclick="form_btn(1)">늘리기</button>
							</div>
						</div>
						<div class="i-price-sale">
							<span class="i-label">클래스 금액</span>
							<span class="i-num" id="price" value="35,000">${price.value * count.value}</span>
						</div>
					</div>
					<div class="hfe-btn-group s-twin">
						<button class="hfe-btn s-w5 a-cart">장바구니 담기</button>
						<button class="hfe-btn s-w5 a-buy s-active">바로 신청하기</button>
					</div>
				</footer>
			
			</div>
		</div>
	</div>

	<!-- 아래에서 data-toggle과 data-target 속성에서 data-toggle에는 modal 값을 data-target속성에는 모달 창 전체를 감싸는 div의 id 이름을 지정하면 된다. -->
	<button type="button" data-toggle="modal" data-target="#cart">모달창 열기</button>
	&nbsp;&nbsp;
	<a data-toggle="modal" href="#cart">모달 창 열기</a>
</body>

</html>