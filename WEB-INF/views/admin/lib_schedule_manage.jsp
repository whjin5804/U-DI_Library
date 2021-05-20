<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='/resources/fullcalendar-5.6.0/lib/main.css?ver=91100' rel='stylesheet' />
<script type="text/javascript" src="/resources/fullcalendar-5.6.0/lib/main.js"></script>
<style type="text/css">

.fc-view-harness{
	z-index: 0;
}
.usingCal{
	font-size: 1.2rem;
	text-align: center;
	font-weight: bold;
}
</style>
</head>
<body>

<!-- jumbyton -->
<div class="jumbotron jumbotron-fluid headJubmotron" >
  <div class="container">
    <h1 class="display-4 h1Jumbotron" style="">일정 관리</h1>
    <p class="lead pJumbotron"  style="">도서관 일정 관리</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">


<div class="usingCal">
	<a href="https://calendar.google.com/calendar/u/0?cid=YXFrZWtmZmtrajRpdnA1cXVrOW9mdWN2c3NAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ">
		<button class="btn btn-primary">
			일정 수정 바로가기
		</button>
	</a>
</div>
	<!-- 캘린더를 나타내는 곳 -->
	<div id='calendar' style="z-index: -1;"></div>
</body>
<script type="text/javascript" src="/resources/js/facility/googleCalendar.js"></script>

</html>