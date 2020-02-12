<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<style>
#tekbeCompnayList, #invoiceNumberText {
    width: 100%;
    height: 30px;
    padding-left: 10px;
    font-size: 15px;
    color: #11447B;
    border: 1px solid #11447B;
    border-radius: 5px;
}

#tekbeCompnayName, #invoiceNumber{
  color:black; 
  font-weight: bold; 
  margin-right: 20px;
  font-size: 16px;
}

#myButton1 {
  background: #11447B;
  
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 5px;
  color: #ffffff;
  font-size: 18px;
  padding: 10px 10px 10px 10px;
  text-decoration: none;
}

/* #myButton1:hover {
  background: #3cb0fd;
  background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
  background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
  text-decoration: none;
} */

.trackerTable {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

.trackerTable >td, .trackerTable >th {
    border: 1px solid #11447B;
    text-align: left;
    padding: 12px;
}

.trackerTable>tr:nth-child(odd) {
    background-color: #11447B;
    color: #ffffff;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script>

$(document).ready(function(){
	var myKey = "ggdwcT6cmLTJ8TmkPbmbVw"; // sweet tracker���� �߱޹��� �ڽ��� Ű �ִ´�.
	
		// �ù�� ��� ��ȸ company-api
        $.ajax({
            type:"GET",
            dataType : "json",
            url:"http://info.sweettracker.co.kr/api/v1/companylist?t_key="+myKey,
            success:function(data){
            		
            		// ��� 1. JSON.parse �̿��ϱ�
            		var parseData = JSON.parse(JSON.stringify(data));
             		console.log(parseData.Company); // ���� Json Array�� �����ϱ� ���� Array�� Company �Է�
            		
            		// ��� 2. Json���� ������ �����Ϳ� Array�� �ٷ� �����ϱ�
            		var CompanyArray = data.Company; // Json Array�� �����ϱ� ���� Array�� Company �Է�
            		console.log(CompanyArray); 
            		
            		var myData="";
            		$.each(CompanyArray,function(key,value) {
    	        			//'<option value='+value.Code+'>' +'key:'+key+', Code:'+value.Code+',Name:'+value.Name + '</option>'
	            			myData += ('<option value='+value.Code+'>' + value.Name + '</option>');        				
            		});
            		$("#tekbeCompnayList").html(myData);
            }
        });

		// ��������� ������� tracking-api
        $("#myButton1").click(function() {
        	var t_code = $('#tekbeCompnayList option:selected').attr('value');
        	var t_invoice = $('#invoiceNumberText').val();
        	
            $.ajax({
                type:"GET",
                dataType : "json",
                url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
                success:function(data){
                	console.log(data);
                	var myInvoiceData = "";
                	if(data.status == false){
                		myInvoiceData += ('<p>'+data.msg+'<p>');
                	}else{
	            		myInvoiceData += ('<tr>');            	
	            		myInvoiceData += ('<th>'+"�����»��"+'</td>');     				
	            		myInvoiceData += ('<th>'+data.senderName+'</td>');     				
	            		myInvoiceData += ('</tr>');     
	            		myInvoiceData += ('<tr>');            	
	            		myInvoiceData += ('<th>'+"��ǰ����"+'</td>');     				
	            		myInvoiceData += ('<th>'+data.itemName+'</td>');     				
	            		myInvoiceData += ('</tr>');     
	            		myInvoiceData += ('<tr>');            	
	            		myInvoiceData += ('<th>'+"�����ȣ"+'</td>');     				
	            		myInvoiceData += ('<th>'+data.invoiceNo+'</td>');     				
	            		myInvoiceData += ('</tr>');     
	            		myInvoiceData += ('<tr>');            	
	            		myInvoiceData += ('<th>'+"�����ȣ"+'</td>');     				
	            		myInvoiceData += ('<th>'+data.receiverAddr+'</td>');     				
	            		myInvoiceData += ('</tr>');           	                		
                	}
        			
                	
                	$("#myPtag").html(myInvoiceData)
                	
                	var trackingDetails = data.trackingDetails;
                	
                	
            		var myTracking="";
            		var header ="";
            		header += ('<tr>');            	
            		header += ('<th>'+"�ð�"+'</th>');
            		header += ('<th>'+"���"+'</th>');
            		header += ('<th>'+"����"+'</th>');
            		header += ('<th>'+"��ȭ��ȣ"+'</th>');     				
        			header += ('</tr>');     
            		
            		$.each(trackingDetails,function(key,value) {
	            		myTracking += ('<tr>');            	
            			myTracking += ('<td>'+value.timeString+'</td>');
            			myTracking += ('<td>'+value.where+'</td>');
            			myTracking += ('<td>'+value.kind+'</td>');
            			myTracking += ('<td>'+value.telno+'</td>');     				
	            		myTracking += ('</tr>');        			            	
            		});
            		
            		$("#myPtag2").html(header+myTracking);
                	
                }
            });
        });
		
});

function fncancle() {
	$(".trackerAPI").hide();
}

</script>
	
	<div id="dimmer-hf-modal-1580289583484809" class="hfc-dimmer hfc-dimmer-modal"></div>
		<div class="modal-dialog hfc-modal s-big" style="overflow: unset;">
			<!-- Modal content-->
			<div class="hfe-bg"></div>
			<div class="modal-content hfe-container" style="padding-left: 15px; padding-top: 15px; padding-right: 15px; padding-bottom: 15px;">
				<span id="tekbeCompnayName">�ù�ȸ���: </span>
					<select id="tekbeCompnayList" name="tekbeCompnayList"></select><br/><br/>
				
				<span id="invoiceNumber">������ȣ: </span>
					<input type="text" id="invoiceNumberText" name="invoiceNumberText"><br/><br/>
					
					<button id="myButton1">�ù� ��ȸ�ϱ� </button><br/><br/>
			
				<div>
					<table id="myPtag" class="trackerTable"></table>
				</div>
				<br/>
				<div>
					<table id="myPtag2" class="trackerTable"></table>
				</div>
				<div class="cancel-class-btn" style="height: 60px; padding-bottom: 0px; padding-top: 10px; ">
					<a href="javascript:fncancle()" title="�ݱ�" class="btn-cancel-class btn-close-cancel" style="width: 102px; height: 62px;">�ݱ�</a>
				</div>
			</div>
		</div>
