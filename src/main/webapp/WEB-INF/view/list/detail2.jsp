<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hability-detail</title>
<script>
 
	function reset() {
		$('.modal').on('hidden.modal', function() {
			$(this).reset();
		})
	}
	
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
		totalprice.value = price_value;
	}
	
	function optionModal(cl_num) {
		$(".optionModal").show();
		// ajax 열어서 
		$.ajax({
			type : "POST",
			// 요청한 url
			url : "../ajax/optionModal.shop", // shop이니까 controller작동하고
			data : {
				// request로 요청하면 넘어갈 값
				"cl_num" : cl_num
				},
			success : function(data) {
				$(".optionModal").html(data);
			}
		})
	}

</script>

</head>
<body>
<div class="container">
	<div class="vod-wrap">
		<div class="vod-cont vimeohelper-92950 vimeohelper"
			data-vimeo-initialized="true">
			<div class="vod-cont-wrap"></div>
			<iframe src="https://player.vimeo.com/video/382550410?app_id=122963"
				width="426" height="240" frameborder="0"
				allow="autoplay; fullscreen" allowfullscreen=""
				title="intro_final03" data-ready="true" class="vimeohelper-player"></iframe>
		</div>
		<div class="vod-info-wrap">
			<div class="vod-info-tit view-class-title">
				<span class="i-lecturer">${classDetail.teacher}</span>
				${classDetail.cl_title}
			</div>
			<div class="vod-info-price-discount">
				 <span class="i-regularPrice view-class-discount-regularPrice">
				 	<fmt:formatNumber value="${classDetail.cl_price}" pattern="##,###" />원
				 </span>
			</div>
		
			<ul class="vod-info-list">
					<!--li class="vod-info">
<span class="vod-info-list-tit"></span>
<span class="vod-info-list-txt view-class-id"></span>
</li-->
				<li class="vod-info">
					<span class="vod-info-list-tit"> 적립	마일리지</span>
					<span class="vod-info-list-txt view-class-mileage">
						최대 <fmt:formatNumber value="${classDetail.cl_price *0.1}" pattern="##,###" />p
					</span>
				</li>
				<li class="vod-info">
					<span class="vod-info-list-tit">배송비</span>
					<span class="vod-info-list-txt">무료배송(도서산간지역 제외)</span>
				</li>
			</ul>
			<div class="vod-info2-wrap i-totalprice">
				<div class="vod-price">
					총 클래스 가격 <span class="txt-color-r s-totalprice"></span>원
				</div>
			</div>
			<div class="vod-btn-wrap">
				<a href="#like" title="좋아요" class="btn-like">좋아요</a>
				<c:if test="${empty sessionScope.loginUser}">
					<a href="javascript:dologin()" class="btn-get">클래스 신청하기</a>
				</c:if>
				<c:if test="${!empty sessionScope.loginUser}">
					<a href="javascript:optionModal(${classDetail.cl_num})" class="btn-get">클래스 신청하기</a>
				</c:if>
					<!-- <span class="btn-get-soldout" style="display: none">일시 품절</span> -->
			</div>
			</div>
		</div>
		<div class="tab-detail-wrap" id="tab-detail-explain">
			<ul class="tab-detail-list tab-on01" id="tab-detail-list">
				<li class="tab-detail"><a href="#detail-explain"
					class="btn-tab-detail">클래스 소개</a></li>
				<li class="tab-detail"><a href="#detail-intro"
					class="btn-tab-detail">하비풀 스토리</a></li>
				<li class="tab-detail"><a href="#detail-epilogue" title="후기"
					class="btn-tab-detail">후기 <span
						class="txt-color-r review-count">(12)</span></a></li>
				<li class="tab-detail tab-last"><a href="#detail-delivery"
					class="btn-tab-detail">배송/교환/환불</a></li>
			</ul>
		</div>
		<div class="class-detail-wrap block" id="detail-explain">
			<div class="detail-explain-wrap c-editor s-classintro">
				<p style="text-align: center;">${list.cl_info}</p>
				<p style="text-align: center;">&nbsp;</p>

				<p style="text-align: center;">&nbsp;</p>
			</div>
			<!-- 클래스일 경우, s-classintro 추가됨 -->
		</div>
		<div class="class-detail-wrap block" id="detail-intro">
			<div class="detail-explain-lecture-wrap">
				<p style="text-align: center">
<!-- 					<img style="max-width: 750px; width: 100%;"
						src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/class/contents/52d5e3c0-dce9-11e8-b590-238f99ca8336-resize.png"
						alt=""> -->
						${classDetail.cl_story }
				</p>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<!-- 모달 ajax으로 불러오기 -->
	<div class="modal fade optionModal" id="cart" role="dialog" style="display:none">
	
	</div>

</body>
</html>