<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/facility/library_map.css">
<link rel="stylesheet" href="/resources/css/facility/common.css?ver=1">
<link rel="stylesheet" href="/resources/css/facility/parking.css?ver=12">
<style type="text/css">

</style>
<script type="text/javascript" src="/resources/js/facility/parking.js?ver=54342"></script>
</head>
<body>
<div class="Audi3040">
<!-- jumbotron -->
<div class="jumbotron jumbotron-fluid headJubmotron">
  <div class="container">
    <h1 class="display-4 h1Jumbotron">시설 이용</h1>
    <p class="lead pJumbotron" >주차장 이용	</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">
<!-- jumbotron 끝 -->

<div class="row">
	<div class="col-5">
	<h3 align="center">주차장 이용안내</h3>

		<div class="group-list">
			<font class="fontClass">
				<b style="color: #014099">ㅣ</b>가격
			</font>
				<li>로그인 후 이용가능합니다.</li>
				<li>주차장은 선불제이며 가격은 <b style="color: red;">1,000원</b>입니다.</li>
				<li>
				포인트가 <b style="color: red;">100점</b>당 1,000원으로 환산되며 포인트가 100점 이상일 경우 자동으로 포인트가 차감됩니다.
				<c:if test="${not empty sessionScope.loginInfo }">
					현재 <b>${MemberInfo.memberName }</b>님의 포인트는 <b>${MemberInfo.memberPoint }점</b> 입니다.
				</c:if>
				</li>
				<li>포인트가 없을 경우 선불로 계산됩니다.</li>
				<li>주말 및 공휴일에도 이용가능합니다.</li>
		</div>
		
		<div class="group-list">
			<font class="fontClass">
				<b style="color: #014099">ㅣ</b>기타안내
			</font>
			<li>차량 유도선을 준수하여 주시길 바랍니다.</li>
			<li>주차장 입 · 출입 시 10Km 미만으로 서행하여 운행 바랍니다.</li>
			<li>문의사항은 도서관으로 연락바랍니다.</li>
		</div>
		
		
	</div>
	<!-- 달력 -->
		<div class="col-7">
	    <h3 align="center">주차예약 날짜를 클릭하세요.</h3>
		<table id="calendar" >
	    <tr class="calHeadTr"><!-- label은 마우스로 클릭을 편하게 해줌 -->
	        <td><label onclick="prevCalendar()" style="cursor: pointer;">
	        <
	        </label></td>
	        <td align="center" id="tbCalendarYM" colspan="5">
	        yyyy년 m월</td>
	        <td><label onclick="nextCalendar()" style="cursor: pointer;">
	        >
	        </label></td>
	    </tr>
	    <tr class="calBodyTr">
	        <td align="center"><font color ="red" class="calBodyTr">일</font></td>
	        <td align="center">월</td>
	        <td align="center">화</td>
	        <td align="center">수</td>
	        <td align="center">목</td>
	        <td align="center">금</td>
	        <td align="center"><font color ="blue" class="calBodyTr">토</font></td>
	    </tr> 
	</table>
	</div>
	
	
</div>





<!--     지도 API -->
<!--     <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=52ac585ed358eebe671a84e0be6def9c&ver=2"></script> -->
<!--     <script type="text/javascript" src="/resources/js/facility/library_map.js"></script> -->
</div> <!-- Audi3040 -->





<!-- Modal -->
<div class="modal fade modalBox1" id=
"" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
  <form action="/facility/reserveParking" method="post" id="reserveParkingForm">	<!-- form태그 -->
    <div id="modal-content">
      <div class="modal-header" style="color: black;">
        <h5 class="modal-title"  id="modalHead">
        <!-- 자바스크립트에서 가져옴 -->
<!-- let str = '<div class="deleteDay" data-today="'+ year + '-' + month + '-' + i + '">' + year + '년 ' + month + '월 ' + i + '일 주차장 예약하기' + '</div>';  -->
<!-- 		+ '<input type="hidden" name="parkingDate" value="'+ year + '-' + month + '-' + i + '" class="deleteDay">';  -->
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-left: 0px">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div id="modal-body">
	      <c:forEach begin="1" end="10" step="2" var="e">
	        <div class="row parkingRow">
				<div class="col-4">
				<input type="radio" name="parkingLoc" value="PARKING_${e }" id="PARKING_${e }">
					<h5 class="parkingH5"><span class="badge badge-success">주차장<c:out value="${e }"/></span></h5>
					<img alt= "주차장1" src="/resources/image/facility/parking1.jpeg" width="20%">
					<span class="PARKING_${e }">
						<span class="N changeColor">
							오전/
						</span>
						<span class="Y changeColor">
							오후
						</span>
					</span>
				</div>
				<div class="col-4 offset-4">
					<input type="radio" name="parkingLoc" value="PARKING_${e + 1}" id="PARKING_${e + 1}">
					<h5 class="parkingH5"><span class="badge badge-success">주차장<c:out value="${e + 1 }"/></span></h5>
					<img alt= "주차장2" src="/resources/image/facility/parking1.jpeg" width="20%">
					<span class="PARKING_${e + 1 }">
						<span class="N changeColor">
							오전/
						</span>
						<span class="Y changeColor">
							오후
						</span>
					</span>
				</div> 
			</div>	       
	      </c:forEach>
	        <br>
	        <div class="row isAfternoon" id="isAfternoon2">
	        	<div class="col">
	        		오전/오후를 선택하세요. <br>(<b style="color: red;">빨간색</b>은 이미 주차되어있는 공간입니다.)
	        	</div>
	        </div>
	        <div class="row isAfternoon">
	        	<div class="offset-5 col-1">
	        		<input type="radio" name="isAfternoon" value="N" class="afternoonN">
	        		오전
	        	</div>
	        	<div class="col-1">
	        		<input type="radio" name="isAfternoon" value="Y" class="afternoonY">
	        		오후
	        	</div>
	        </div>
      </div>	<!-- modal-body끝  -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onclick="reserveParking()">예약</button>
        <c:if test="${not empty sessionScope.loginInfo }">
	        <button type="button" class="btn btn-warning" onclick="cancelReserve()">예약 취소</button>
        </c:if>
      </div>
    </div>
   </form>
  </div>
</div>
<script  type="text/javascript">
    buildCalendar();//
</script>
</body>
</html>