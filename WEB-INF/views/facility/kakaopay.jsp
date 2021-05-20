<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String name = (String)request.getAttribute("loginInfo.memberName");
    String email = (String)request.getAttribute("loginInfo.memberEmail");
    String phone = (String)request.getAttribute("loginInfo.memberTel");
    String address = (String)request.getAttribute("loginInfo.memberAddr");
    int totalPrice = 10000;    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<input type="hidden" name="parkingDate" id="parkingDate" value="${facilityVO.parkingDate }">
<input type="hidden" name="parkingLoc" id="parkingLoc" value="${facilityVO.parkingLoc }">
<input type="hidden" name="isAfternoon" id="isAfternoon" value="${facilityVO.isAfternoon }">
결제 중입니다.
    <script>
    $(function(){
    	let parkingDate = document.getElementById("parkingDate").value;
    	let parkingLoc = document.getElementById("parkingLoc").value;
    	let isAfternoon = document.getElementById("isAfternoon").value;
    	
        var IMP = window.IMP; // 생략가능
        IMP.init('imp08752382');// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        IMP.request_pay({
            pg : 'html5_inicis', // version 1.1.0부터 지원.
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '주문명:우디도서관주차장(결제테스트)',
            amount : 100,
            m_redirect_url : 'https://www.naver.com/payments/complete'
        }, function(rsp) {
        	//여기까진 온다.
            if ( rsp.success ) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                location.href='/facility/payParking?parkingDate=' + parkingDate + '&parkingLoc=' + parkingLoc + '&isAfternoon=' + isAfternoon;
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
        });
        
    });
    </script>
 
</body>
</html>