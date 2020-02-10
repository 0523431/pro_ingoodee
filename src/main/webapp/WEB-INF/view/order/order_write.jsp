<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취미주문신청서 :)</title>

<!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	   
	</script>
</head>
<body>
<div class="container">
	<div class="write-regular-wrap">
	<h2 class="layer-tit">취미주문 신청서</h2>
		<div class="write-regular-cont">
<form:form name="order">
<input type="hidden" id="emailid2" value="${loginUser.emailid}" >
<input type="hidden" id="cl_num" name="cl_num" value="${classDetail.cl_num}" >
<input type="hidden" id="kit_num" name="kit_num" value="${kitDetail.kit_num}" >
<input type="hidden" id="count" name="lastcount" value="${count}" >
		<div class="float-wrap">
			<div class="write-regular-area i-cart">
				<!-- 주문정보 -->
					<div class="title">주문 정보</div>
						<ul id="cartList" class="list-product s-vertical">
								<c:forEach var="blist" items="${blist}">
									<li class="row">
										<ul class="columns">
											<li class="c-thumb">
												<img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/class/thumbs/c3988ac0-cd2c-11e9-a6c1-1379508efc05-square.jpg" alt="">
											</li>
											<li class="c-name">${blist.cls.cl_title}</li>
											<li class="c-options">${blist.kit.kit_name}</li>
											<li class="c-quantity">수량 : ${blist.count}개</li>
											<li class="c-price">
												<fmt:formatNumber value="${blist.count * blist.kit.kit_price}" pattern="##,###" /><span class="i-won">원</span>
											</li>
										</ul>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="write-regular-area i-sender">
<!-- 주문자정보 -->
					<div class="title">주문자 정보</div>
					<colgoup></colgoup>
					<table class="table-input" summary="주문자 입력 테이블">
						<colgroup>
							<col class="col01">
							<col class="col02">
						</colgroup>
						<tbody>
							<tr class="tr">
								<th class="th">주문자명</th>
								<td class="td">
									<div class="input-wrap">
									<input value="${user.name}" name="name" type="text" class="name input order_name" placeholder="">
									</div>
								</td>
							</tr>
							<tr class="tr">
								<th class="th">이메일</th>
								<td class="td">
									<div class="input-wrap">
									<input value="${user.emailid}" name="emailid" type="text" class="emailid input order_email" placeholder="">
									</div>
									<div class="table-txt txt-color-r email-error-msg"></div>
								</td>
							</tr>
							<tr class="tr">
								<th class="th">휴대전화</th>
								<td class="td">
									<div class="input-wrap input-phone">
									<input value="${user.phone}" name="phone" type="text" class="phone input order_phone" placeholder="">
									</div>
									<!-- <button type="button" title="인증" id="auth" class="btn-td phone-auth-btn">인증</button> -->
									<!-- <button type="button" title="인증" class="btn-td phone-auth-btn" disabled="">인증 완료</button> -->
								</td>
							</tr>
							<!-- <tr class="tr auth_number">
								<th class="th">인증번호</th>
								<td class="td">
									<div class="input-wrap input-phone">
									<input type="text" class="input auth-number" placeholder="">
									</div>
									<button type="button" title="확인" class="btn-td2 auth-confirm">확인</button>
									<span class="td-info auth-time"></span>
									<div class="table-txt txt-color-r auth-error-msg"></div>
								</td>
							</tr> -->
						</tbody>
					</table>
					<div class="table-info">
					•  정확한 이메일과 휴대폰 번호를 입력해주세요.<br>
					</div>
				</div>
				<div class="write-regular-area i-receiver">
<!-- 배송지정보 -->
					<div class="title">배송지 정보</div>
					<div class="select-radio-wrap">
						<label class="label">
							<input type="radio" name="isNewAddress" value="true" class="check" checked=""> 새로운 배송지</label>
						<label class="label s-savedAddress">
							<input type="radio" name="isNewAddress" value="false" class="check showaddresslist"> 저장된 배송지</label>
							<a href="#addresslist" title="주소록 선택" class="btn-td2 btn-select-address showaddresslist">주소록 선택</a>
					</div>
					<table class="table-input" summary="배송지 입력 테이블">
						<colgroup>
						<col class="col11">
						<col class="col22">
						</colgroup>
						<tbody>
						<tr class="tr">
						<th class="th">배송지명</th>
						<td class="td">
						<div class="input-wrap">
						<input name="od_name" type="text" class="input order_addressname" placeholder="" >
						</div>
						</td>
						</tr>
						<tr class="tr">
						<th class="th">수령자명</th>
						<td class="td">
						<div class="input-wrap">
						<input name="od_client" type="text" class="input order_receivename" placeholder="">
						</div>
						</td>
						</tr>
						<tr class="tr">
						<th class="th">휴대전화</th>
						<td class="td">
						<div class="input-wrap">
						<input name="od_phone" type="text" class="input receive_phone" placeholder="">
						</div>
						</td>
						</tr>
						<tr class="tr">
						<th class="th">추가번호(선택)</th>
						<td class="td">
						<div class="input-wrap">
						<input name="od_phone2" type="text" class="input receive_phone2" placeholder="">
						</div>
						</td>
						</tr>
						<tr class="tr">
						<th class="th">주소</th>
						<td class="td">
						<div class="td-br">
						<div class="input-wrap input-post input-readonly">
						<input name="od_postcode" type="text" readonly="readonly" id="po_postcode" class="input order_receivezipcode" placeholder="우편번호">
						</div>
						<a href="javascript:DaumPostcode()" title="우편번호" class="btn-td2 get-zipcode">우편번호</a>
						</div>
						<div class="td-br">
						<div class="input-wrap input-readonly">
						<input name="od_addr_main" type="text" readonly="readonly" id="po_addr_main" class="input order_receiveaddress" placeholder="주소">
						</div>
						</div>
						<div class="td-br">
						<div class="input-wrap">
						<input name="od_addr_sub" type="text" id="po_addr_sub" class="input order_receiveaddressdetail" placeholder="상세주소">
						</div>
						</div>
						<div class="td-br i-row-savebasic">
					<!--	<input type="checkbox" id="save-basic-delivery" class="checkbox">
				 		<label for="save-basic-delivery" class="label-basic-delivery">기본 배송지로 저장</label> -->
						<input type="hidden" id="extraAddress">
						</div>
						</td>
						</tr>
						<tr class="tr">
						<th class="th">배송요청 사항</th>
						<td class="td">
						<div class="input-textarea">
						<textarea name="od_comment" class="textarea order_receivecomment" rows="" cols="" placeholder="배송을 해주시는 택배기사님께 전달드리는 내용입니다." maxlength="300"></textarea>
						</div>
						</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="write-regular-area i-payment">
<!-- 결제정보 -->
				<div class="title">결제 정보</div>
				<colgoup>
				</colgoup>
				<table class="table-input" summary="할인정보 입력 테이블">
					<colgroup><col class="col01">
					<col class="col02">
					</colgroup>
					<tbody>
					<tr class="tr">
					<th class="th">마일리지 사용</th>
					<td class="td">
					<div class="input-wrap w65">
					<input type="text" class="input order_mileage" onkeypress="validate(event)" placeholder="" value="0">
					</div>
					<button type="button" class="btn-td2 w30 mileage_apply">적용</button>
					<div class="table-txt">현재 보유 마일리지: <span class="txt-color-r mileage">1000p</span> (1p = 1원)</div>
					</td>
					</tr>
					</tbody>
				</table>
				<div id="payInfo" class="justify-list">
				<ul>
				<li>
				<span class="i-title">상품금액</span>
				<span class="i-value"><fmt:formatNumber value="${lastsum}" pattern="##,###" />원</span>
				</li>
				<!-- <li>
				<span class="i-title">할인금액</span>
				<span class="i-value">-33,400원</span>
				</li> -->
				<li>
				<span class="i-title">배송비</span>
				<span class="i-value">무료</span>
				</li>
				
				</ul>
				<div class="area-result">
				<span class="i-title">전체 주문금액</span>
				<span class="i-value"><fmt:formatNumber value="${lastsum}" pattern="##,###" /><span class="i-won">원</span></span>
				</div>
				</div>
				
				</div>
			</div>
				<div class="write-order-btn">	
				<p class="desc">위 주문 내용을 확인 하였으며, 회원 본인은 결제에 동의합니다.</p>
					<button id="orderBtn" class="btn-order-ask confirm-order">취미 주문하기</button>
				</div>
</form:form>

<script type="text/javascript" src="${path}/jquery/js/page/order.js"></script>		
 		</div>
	</div>
<div class="modal addresslist"></div>
</div>
</body>