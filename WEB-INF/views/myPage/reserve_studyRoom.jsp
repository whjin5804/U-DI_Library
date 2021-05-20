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
    <p class="lead pJumbotron"  style="">스터디룸 예약 정보</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">

<table class="table table-hover table-studyRoom">
	<thead>
		<tr>
			<td scope="col">시설명</td>
			<td scope="col">예약자명</td>
			<td scope="col">예약인원</td>
			<td scope="col">예약일</td>
			<td scope="col">예약시간</td>
		</tr>
	</thead>
<c:forEach items="${myStudyRoomReserveList}" var="myStudyRoomReserve">
	<tbody>
		<tr>
			<td>${myStudyRoomReserve.studyRoomName }</td>
			<td>${myStudyRoomReserve.memberName }</td>
			<td>${myStudyRoomReserve.rentStu }명</td>
			<td>${myStudyRoomReserve.rentDate }</td>
			<td>${myStudyRoomReserve.rentTime }</td>
		</tr>
	</tbody>


</c:forEach>
</table>
</body>
</html>