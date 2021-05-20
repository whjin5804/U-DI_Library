<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	text-align: center;
	font-size: 0.8rem;
}
thead {
	background-color: #014099;
	color: white;
}
</style>
</head>
<body>
<!-- jumbyton -->
<div class="jumbotron jumbotron-fluid headJubmotron" >
  <div class="container">
    <h1 class="display-4 h1Jumbotron" style="">마이 페이지</h1>
    <p class="lead pJumbotron"  style="">주차장 예약 정보</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">

<table class="table table-hover table-studyRoom">
	<thead>
		<tr>
			<td scope="col">날짜</td>
			<td scope="col">주차장번호</td>
			<td scope="col">예약시간</td>
		</tr>
	</thead>
	<c:forEach items="${myParkingReserveList}" var="myParkingReserve">
	<tbody>
		<tr>
			<td>${myParkingReserve.parkingDate }</td>
			<td>${myParkingReserve.parkingLoc }</td>
			<c:if test="${myParkingReserve.isAfternoon.equals('N')}">
			<td>오전</td>
			</c:if>
			<c:if test="${myParkingReserve.isAfternoon.equals('Y')}">
			<td>오후</td>
			</c:if>
		</tr>
		</tbody>
	</c:forEach>
</table>
</body>
</html>