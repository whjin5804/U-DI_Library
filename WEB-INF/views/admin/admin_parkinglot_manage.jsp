<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/admin/admin_parkinglot_manage.css?ver=11" rel="stylesheet">
<style>

</style>
<script src="https://kit.fontawesome.com/6983c95227.js" crossorigin="anonymous"></script>
<script src="/resources/js/admin/admin_parkinglot_manage.js?ver=1234111551114111111541115115114445"></script>
<!-- input type=date 기본 날짜를 오늘로 설정-->
<script type="text/javascript">
	window.onload = function() {
		today = new Date();
		console.log("today.toISOString() >>>" + today.toISOString());
		today = today.toISOString().slice(0, 10);
		console.log("today >>>> " + today);
		bir = document.getElementById("parkingDate");
		bir.value = today;
	}
</script>
</head>
<body><!-- 넘어오는 데이터 리스트 이름 : parkingInfoList -->

<!-- jumbyton -->
<div class="jumbotron jumbotron-fluid headJubmotron" >
  <div class="container">
    <h1 class="display-4 h1Jumbotron" style="">시설 관리</h1>
    <p class="lead pJumbotron"  style="">주차장 예약 관리</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">

<table class="table table-borderless table-search">
	<tr>
		<td colspan="2"><div class="selectDateDiv">조회할 날짜를 선택하세요.</div></td>
	</tr>
	<tr>
		<td><input class="form-control" type="date" name="parkingDate" id="parkingDate" value=""></td>
		<td><button class="btn btn-outline-success" type="submit" onclick="selectDate('${parking.parkingCode}')">검색</button></td>
	</tr>
</table>

<!-- 예약 현황 테이블 -->
<table class="table table-content">
	<tr>
		<td class="color"></td>
		<td class="color">P1</td>
		<td class="color">P2</td>
		<td class="color">P3</td>
		<td class="color">P4</td>
		<td class="color">P5</td>
		<td class="color">P6</td>
		<td class="color">P7</td>
		<td class="color">P8</td>
		<td class="color">P9 <i class="fas fa-wheelchair"></i></td>
		<td class="color">P10 <i class="fas fa-wheelchair"></i></td>
	</tr>
	<tr class="N">
		<td class="color">오전</td>
		<td>사용가능</td>
		<td>사용가능</td>
		<td>사용가능</td>
		<td>사용가능</td>
		<td>사용가능</td>
		<td>사용가능</td>
		<td>사용가능</td>
		<td>사용가능</td>
		<td>사용가능</td>
		<td>사용가능</td>
	</tr>
	<tr class="Y">
		<td class="color">오후</td>
		<td>사용가능</td>
		<td>사용가능</td>
		<td>사용가능</td>
		<td>사용가능</td>
		<td>사용가능</td>
		<td>사용가능</td>
		<td>사용가능</td>
		<td>사용가능</td>
		<td>사용가능</td>
		<td>사용가능</td>
	</tr>
</table>

</body>
</html>