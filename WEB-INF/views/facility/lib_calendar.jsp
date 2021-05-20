<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='/resources/fullcalendar-5.6.0/lib/main.css?ver=1234' rel='stylesheet' />
<script type="text/javascript" src="/resources/fullcalendar-5.6.0/lib/main.js"></script>
</head>
<body>
<div class="Audi3040">
<!-- jumbotron -->
<div class="jumbotron jumbotron-fluid headJubmotron">
  <div class="container">
    <h1 class="display-4 h1Jumbotron">시설 이용</h1>
    <p class="lead pJumbotron" >전체 일정</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">
<!-- jumbotron 끝 -->

	<!-- 캘린더를 나타내는 곳 -->
	<div id='calendar' style="z-index: -1;"></div>
</div>
</body>
<script type="text/javascript" src="/resources/js/facility/googleCalendar.js"></script>


</html>