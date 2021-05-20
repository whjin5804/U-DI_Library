<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/js/admin/admin_studyroom_manage.js?ver=36"></script>
<link href="/resources/css/admin/admin_studyroom_manage.css?ver=1" rel="stylesheet">
</head>
<body>

<!-- jumbyton -->
<div class="jumbotron jumbotron-fluid headJubmotron" >
  <div class="container">
    <h1 class="display-4 h1Jumbotron" style="">시설 관리</h1>
    <p class="lead pJumbotron"  style="">스터디룸 예약 관리</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">

<div class="btnDiv">
<button class="btn btn-lg btn-studyRoom" value="all" onclick="selectRoomType(this)">전체</button>
<button class="btn btn-lg btn-studyRoom" value="discussionRoom" id="discussionRoom" onclick="selectRoomType(this)">토론실</button>
<button class="btn btn-lg btn-studyRoom" value="mediaRoom" id="mediaRoom" onclick="selectRoomType(this)">미디어실</button>
<button class="btn btn-lg btn-studyRoom" value="presentationRoom" id="presentationRoom" onclick="selectRoomType(this)">발표실</button>
</div>
<table class="table table-hover table-studyRoom">
	<thead>
		<tr>
			<td scope="col">시설명</td>
			<td scope="col">예약자명</td>
			<td scope="col">예약인원</td>
			<td scope="col">예약일</td>
			<td scope="col">예약시간</td>
			<td scope="col"></td>
		</tr>
	</thead>
	<c:forEach items="${StudyRoomInfoList}" var="studyRoom">
	<tbody>
		<tr>
			<td>${studyRoom.studyRoomName }</td>
			<td>${studyRoom.memberName }</td>
			<td>${studyRoom.rentStu }명</td>
			<td>${studyRoom.rentDate }</td>
			<td>${studyRoom.rentTime }</td>
			<td><input type="button" value="예약취소" class="form-control cancelBtn" onclick="cancelStudyRoom('${studyRoom.memberCode}', '${studyRoom.rentTime }', this)"></td>
		</tr>
		</tbody>
	</c:forEach>
</table>
</body>
</html>