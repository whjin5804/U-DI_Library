<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/facility/library_map.css">
<link rel="stylesheet" href="/resources/css/facility/common.css">
<style type="text/css">
</style>
</head>
<body>
	<div class="Audi3040">
		<!-- jumbotron -->
		<div class="jumbotron jumbotron-fluid headJubmotron">
		  <div class="container">
		    <h1 class="display-4 h1Jumbotron">시설 이용</h1>
		    <p class="lead pJumbotron" >찾아오시는 길</p>
		  </div>
		</div>
		<hr style="margin-bottom: 30px;">
		<!-- jumbotron 끝 -->

		<!-- 지도[s] -->
		<div id="map"
			style="width: 100%; height: 600px; margin: auto; margin-top: 10px; z-index: 0;"></div>





		<!-- 위치, 전화번호 -->
		<div class="row" style="padding: 5px;">
			<div class="col">울산 남구 삼산로35번길 19 2층</div>
			<div class="col">052)0000-0000~1</div>
		</div>

		<hr style="margin-bottom: 60px;">

		<!-- 대중교통 -->
		<div class="box">
			<span class="box1"> <img alt="버스"
				src="/resources/image/facility/bus.jpg" width="220px">
			</span> <span class="box2"> <span class="block"
				style="font-weight: bold; font-size: 1.3rem;"> 시내버스 </span> <span
				class="block">
					<li>꽃바위 → 울산과학대학앞 → 현대중공업 → 울산대학병원 → 학성공원 → 태화로터리 → 시청앞 →
						공업탑하차, 도서관까지 도보 11분</li>
			</span> <span class="block">
					<li>농소공영차고지 → 울산공항 → 북구청남문 → 홈플러스중구점 → 학성공원 → 태화로터리 → 시청앞 →
						공업탑하차, 도서관까지 도보 11분</li>
			</span>
			</span>
		</div>
	</div>











	<!-- 지도 API -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=52ac585ed358eebe671a84e0be6def9c&ver=1"></script>
	<script type="text/javascript"
		src="/resources/js/facility/library_map.js?ver=1"></script>
	<script>
		
	</script>
	<!-- 지도[e] -->

	</div>
</body>
</html>