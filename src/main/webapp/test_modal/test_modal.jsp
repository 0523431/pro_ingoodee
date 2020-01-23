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
		price_value = price_value * quan_value; // ����*����
		price.value = price_value;
	}
	
	$('.modal').on('hidden.bs.modal', function () {
        $(this).removeData('bs.modal');
});
</script>
</head>

<body>
	<!-- ��Ʈ��Ʈ���� ��� â�� ����ҷ��� �Ʒ��� class �̸����� �״�� ����ؾ� �Ѵ�. �����ϸ� ����� �޶�����.-->
	<!-- Modal -->
	<div class="modal fade" id="cart" role="dialog">
		<div class="modal-dialog hfc-modal s-big" style="overflow: unset;">
			<!-- Modal content-->
			<div class="modal-content hfe-container" >
				<div class="modal-header">
					<header>
						<h3 class="modal-title">Ŭ���� �ɼ��� �����ϼ���</h3>
						<button class="hfe-header-close a-close close" data-dismiss="modal">â�ݱ�</button>
					</header>
				</div>

				<div class="modal-body">
					<section class="hfe-content">
						<div class="hfe-option">
							<article class="s-select">
								<header>
									<h4>Ŭ���� �ɼ�</h4>
								</header>
								<ul class="option-list">
									<li><label> <input type="radio" name="listIndex"
											value="0">
											<div class="option-item">
												<h5>������ ��Ű��</h5>
												<p class="prices">
													<span class="sale">35,000��</span>
												</p>
												<span class="desc">�¶��� ������(�������)<br>+ �⺻ ���/����
												</span> <img
													src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/product/85/762e61e0-cfcc-11e9-bf27-61bfe2459c00-resize.jpg"
													alt="">
											</div>
											<div class="option-item">
												<h5>������ ��Ű��</h5>
												<p class="prices">
													<span class="sale">35,000��</span>
												</p>
												<span class="desc">�¶��� ������(�������)<br>+ �⺻ ���/����
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
						<div class="i-names">������ ��Ű��</div>
						<div class="i-quantity">
							<div class="hfc-spinner">
								<button class="hfc-i-down" onclick="form_btn(-1)">���̱�</button>
								<input type="number" id="count" name="count" class="hfc-i-num" min="1" max="99" value="1">
								<button class="hfc-i-up" onclick="form_btn(1)">�ø���</button>
							</div>
						</div>
						<div class="i-price-sale">
							<span class="i-label">Ŭ���� �ݾ�</span>
							<span class="i-num" id="price" value="35,000">${price.value * count.value}</span>
						</div>
					</div>
					<div class="hfe-btn-group s-twin">
						<button class="hfe-btn s-w5 a-cart">��ٱ��� ���</button>
						<button class="hfe-btn s-w5 a-buy s-active">�ٷ� ��û�ϱ�</button>
					</div>
				</footer>
			
			</div>
		</div>
	</div>

	<!-- �Ʒ����� data-toggle�� data-target �Ӽ����� data-toggle���� modal ���� data-target�Ӽ����� ��� â ��ü�� ���δ� div�� id �̸��� �����ϸ� �ȴ�. -->
	<button type="button" data-toggle="modal" data-target="#cart">���â ����</button>
	&nbsp;&nbsp;
	<a data-toggle="modal" href="#cart">��� â ����</a>
</body>

</html>