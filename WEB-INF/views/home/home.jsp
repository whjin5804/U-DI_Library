<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/resources/js/home/home.js?ver=112"></script>
<link rel="stylesheet" href="/resources/css/home/home.css?ver=531">
<link href='/resources/fullcalendar-5.6.0/lib/main.css?ver=1' rel='stylesheet' />
<script type="text/javascript" src="/resources/fullcalendar-5.6.0/lib/main.js"></script>
<style>
/* 여기서 디자인하고 옮기세요 그럼 편함 */
.section {
	width: 100%;
	height: 950px;
	position: relative;
	font-size: 24pt;
	z-index: -1;
}
/* html,body{ margin:0px; padding:0px; width:100%; height:100%;} */
.section2Part2 {
	width: 100%;
	margin: 0 auto;
    text-align: center;
}
.part2Title{
	text-align: center;
    background: #014099;
    color: white;
    width: 180px;
    margin-bottom: 10px;
}
.libTime{
	
}

.libTimeTable{
	color: black;
	font-size: 14px;
}
.noticeBoard{
	
}
.libCalendar{
	z-index: -1;
	margin-top: 100px;
	margin-right: 70px;
	border: 1px solid #014099;
	padding: 0px;
}

.list-group {
	color: black;
	font-size: 15px;
}

.part2{
	margin: 100px 70px;
	margin-bottom: 1px;
	border: 1px solid #014099;
	padding: 0px;
}
.fc-view-harness{
	z-index: 0;
}
.fc .fc-daygrid-day-frame {
    position: relative;
    min-height: 100%; /* seems to work better than `height` because sets height after rows/cells naturally do it */
    height: 30px;
  }
.fc-daygrid-day{
	height: 40px;
	
}
.fc-toolbar-chunk{
	font-size: 20px;
}
.fc .fc-button{
	padding: 0;
}
.fc .fc-toolbar.fc-header-toolbar {
    margin-bottom: 0;
}
.fc .fc-toolbar-title {
    font-size: 0;
    margin: 0;
}
.fc-theme-standard td, .fc-theme-standard th {
    border: 1px solid #ddd;
    border: 1px solid var(--fc-border-color, #ddd);
}
.fc th, .fc td {
    vertical-align: top;
    padding: 0;
    width: 100%;
    font-size: 11px;
}

.fc-scroller-liquid-absolute{
	overflow: hidden;
}

.fc .fc-daygrid-body { /* a <div> that wraps the table */
    position: relative;
    z-index: 1; /* container inner z-index's because <tr>s can't do it */
    overflow: hidden;
  }
.optionColor{
	background-color: #fff;
	color: black;
}
.fullHeight{
	height: 100%;
}
.marPadClean{
	margin: 0;
	padding: 0;
}
.cardOverflow{
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.weatherDiv{
	text-align: right;
	font-size: 0.7rem;
	margin-right: 50px;
	color: gray;
}
.fc .fc-button {
    padding: 0;
    background-color: white;
    border: none;
}

.fc .fc-button-primary:disabled{
	background-color: white;
}
</style>
</head>
<body>
	<div id="fullpage">


		<!-- 홈화면 영상-->
		<div class="section videoBox">
			<video id="video" preload="auto" autoplay="true" loop="loop"
				muted="muted" volume="0">
				<source src="/resources/video/home_movie.mp4">
			</video>


			<!-- 채팅창 -->
			<img alt="" src="/resources/image/home/chatting.2.png"
				onclick="showChat();" id="chattingImg">

			<!-- 처음오셨소 -->
			<div class="helloBtn">
				<button type="button" class="btn" data-toggle="modal"
					data-target="#staticBackdrop">
					<img src="/resources/image/home/firstVisit.png" loop=infinite
						width="230px" />
				</button>
			</div>



			<div class="chattDiv" style="width: 250px; margin: 0 20px 0 auto;">
				<p3>
				<button onclick="hiddenChat()" class="btn btn-danger">채팅창
					끄기</button>
				</p3>
				<script id="cid0020000279465496104" data-cfasync="false" async
					src="//st.chatango.com/js/gz/emb.js"
					style="width: 250px; height: 350px;">{"handle":"audilibrary","arch":"js","styles":{"a":"dddddd","b":100,"c":"000000","d":"000000","k":"dddddd","l":"dddddd","m":"dddddd","p":"10","q":"dddddd","r":100,"t":0,"ab":false,"usricon":0,"fwtickm":1}}</script>
			</div>
		</div>

		<!-- 스크롤 다운 -->

		<!-- 여기는 통합검색 -->
		<!-- 첫 번째 스크롤 화면 (영상 바로 아래) -->
		<div class="section section2" id="2">
		
		<!-- 날씨 API -->
		<div class="weatherDiv">
			<img alt="" src="" class="weatherImg" style="width: 80px;">
		</div>
		
			<div class="row section2Part1">
				<div class="col-8" style="margin: 0 auto;">
					<form action="/book/bookList" method="post">
						<div class="row" style="height: 3rem;">
							<div class="col-2 marPadClean">
								<select class="form-control fullHeight" style="background-color: #ff8b35; color: white;" name="bookClass">
										<option value="10" class="optionColor">모든 카테고리</option>
									<c:forEach items="${bookClassList }" var="bookClass">
										<option value="${bookClass.bookClass }" class="optionColor">${bookClass.bookClassName }</option>
									</c:forEach>
								</select>
							</div>
							<div class="col marPadClean">
								<input type="text" placeholder="책 제목, 저자, 출판사로 검색.." class="form-control fullHeight" name="keyword">
							</div>
							<div class="col-2 marPadClean">
								<button type="submit" class="btn btn-primary form-control fullHeight" style="display: block;">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
										<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
									</svg>
									검색
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row section2Part2">
				<div class="col part2 libTime">
				<div class="part2Title">이용안내</div>
					<table class="table libTimeTable">
						<colgroup>
							<col width="33%">
							<col width="34%">
							<col width="33%">
						</colgroup>				
						<thead class="libTimeHead">
							<tr>
								<th scope="col">문의사항</th>
								<th scope="col">전화번호</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">단행본, 전자책[구입]</th>
								<th scope="row">111-1234</th>
							</tr>
							<tr>
								<th scope="row">대출반납, 예약도서, 보존자료</th>
								<th scope="row">111-4321</th>
							</tr>
							<tr>
								<th scope="row">도서관회원제, 일반이용자</th>
								<th scope="row">111-1000</th>
							</tr>
							<tr>
								<th scope="row">고문헌, 개인문고</th>
								<th scope="row">111-0123</th>
							</tr>
							<tr>
								<th scope="row">도서관 출입관련 문의</th>
								<th scope="row">111-0444</th>
							</tr>
							<tr>
								<th scope="row">주차장, 그룹스터디룸</th>
								<th scope="row">111-0699</th>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col part2 noticeBoard">
				<div class="part2Title">공지사항</div>
					<c:forEach items="${boardList}" var="board">
						<div class="list-group">
							<h5>
								<a href="/board/detailBoard?boardCode=${board.boardCode }"> ${board.boardTitle } </a>
							</h5>
							<div>${board.regDate}</div>
							<hr>
						</div>
					</c:forEach>

				</div>
				<div class="col libCalendar">
				<div class="part2Title">도서관일정</div>
				<div id='calendar' style="z-index: -1;"></div>
				</div>
			</div>
		</div>


		<!-- footer와 함께 스크롤 화면 -->
		<div class="section" id="3">
			<div class="col-10" style="margin: 0 auto; margin-top: 180px;">
				<div style="margin-bottom: 20px;">전월의 순위</div>
				<div class="row" style="margin-bottom: 20px;">
					<c:choose>
						<c:when test="${empty lastMonthRank }">
							<div>
								없다!
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${lastMonthRank }" var="rankedBook" end="4" varStatus="status">
								<div class="col card">
									<a href="/book/bookDetail?bookCode=${rankedBook.bookCode }">
									<c:choose>
										<c:when test="${empty rankedBook.bookImageName }">
											<img src="/resources/image/book/no_image.jpg" class="card-img-top">
										</c:when>
										<c:otherwise>
											<img src="/resources/image/book/${rankedBook.bookImageName }" class="card-img-top">
										</c:otherwise>
									</c:choose>
									</a>
									<div class="card-body">
										<p class="card-text cardOverflow">
											<span class="badge badge-secondary">${status.count }위</span>
											<a href="/book/bookDetail?bookCode=${rankedBook.bookCode }">
												${rankedBook.bookTitle }
											</a>
										</p>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="footer">
					<hr class="hr">
					<hr>
					<ul class="nav justify-content-center text-center align-items-center row" style="height: 40px;">
						<li class="nav-item">
							<a class="nav-link" href="/home/personalInfo" style="color:red; font-weight: bold;">개인정보처리방침</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">이메일무단수집</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/facility/libraryMap">찾아오시는길</a>
						</li>
					</ul>
			<hr class="hr">
			
				<ul class="nav justify-content-center text-center align-items-center row linkUl">
					<li class="nav-item list listTitle">주요 정보기관</li>
					<li class="nav-item list">
						<a href="https://www.nl.go.kr/" target="_blank" class="aTag">
							국립중앙도서관
						</a>
					</li>
					<li class="nav-item list">
						<a href="https://www.nanet.go.kr/main.do" target="_blank" class="aTag">
							국회도서관
						</a>
					</li>
					<li class="nav-item list">
						<a href="https://www.dlibrary.go.kr/" target="_blank" class="aTag">
							국가전자도서관
						</a>
					</li>
					<li class="nav-item list">
						<a href="https://scienceon.kisti.re.kr/main/mainForm.do" target="_blank" class="aTag">
							Science ON
						</a>
					</li>
					<li class="nav-item list">
						<a href="https://scholar.google.co.kr/" target="_blank" class="aTag">
							Google Scholar
						</a>
					</li>
					<li class="nav-item list">
						<a href="http://www.rinfo.kr/" target="_blank" class="aTag">
							Rinfo(학술정보통계시스템)
						</a>
					</li>
				</ul>
			<div class="row">
				<div class="col" style="padding : 60px 100px;">
					주소 : (44677)울산 남구 삼산로35번길 19 2층 / (680-828)울산광역시 남구 신정동 679-8<br>
					TEL : 052)0000-0000~1 / Fax : 052)0000-0002~3<br><br>
					Copyright 2021 Audi Library. All Rights Reserved.
				</div>
				<div class="col" style="padding : 60px 100px;  text-align: right;">
					<img alt="로고자리" src="/resources/image/home/footerLogo.png" style="width: 15%;">
				</div>
			</div>
		</div>
				
				
			</div><!-- section 3 -->
				
				





		<!-- Modal 내부화면 시작-->
		<div class="modal fade show" id="staticBackdrop"
			data-backdrop="static" data-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content helloModal">

					<button type="button" class="close modalCloseBtn"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<!-- </div> -->
					<div class="modal-body">
						<!-- <div class="box"> -->
						<div class="visitPop">
							<div>
								<ul class="modalUl">
									<li class="toHorizontal"><a class="modalMenuA"
										href="/home/floorLib"> <img
											src="/resources/image/home/이용안내.png" alt="이용안내" width="90px"
											height="90px"><br> <span class="modalMenu">이용안내</span>
									</a></li>
									<li class="toHorizontal"><a class="modalMenuA"
										href="/home/join"> <img
											src="/resources/image/home/회원가입.png" alt="회원가입" width="90px"
											height="90px"><br> <span class="modalMenu">회원가입</span>
									</a></li>
								</ul>
								<ul class="modalUl">
									<li class="toHorizontal"><a class="modalMenuA"
										href="/home/board"> <img
											src="/resources/image/home/공지사항.png" alt="공지사항" width="90px"
											height="90px"><br> <span class="modalMenu">공지사항</span>
									</a></li>
									<li class="toHorizontal"><a class="modalMenuA"
										href="/facility/libraryMap"> <img
											src="/resources/image/home/찾아오시는길.png" alt="찾아오시는 길"
											width="90px" height="90px"><br> <span
											class="modalMenu modalMenuMap">찾아오시는 길</span>
									</a></li>
								</ul>
							</div>
							<!--              <a href="#" class="popClose"><img src="/image/ko/local/ext/m_menu_close.png" alt="팝업창 닫기"></a> -->
							<!-- </div> -->
						</div>
						<!--   사이드 퀵메뉴 종료   -->
					</div>
				</div>
			</div>
		</div>
		<!-- Modal 내부화면 끝 -->



		<!-- 레이어팝업 -->
		<div id="pop">
			<div style="height: 370px;">
				<img alt="사진" src="/resources/image/home/popup.jpg" width="100%"
					height="100%">
			</div>

			<div class="closeDiv">
				<div id="close" style="width: 290px; margin: auto;">
					<b class="cloCl"> 코로나 방역 함께하겠습니다. &nbsp;&nbsp;<b class="cloCl">X</b>
					</b>
				</div>
			</div>
		</div>
		<!-- 레이어팝업 끝  -->

	



	</div>
</body>
<script type="text/javascript" src="/resources/js/facility/googleCalendar.js"></script>
<script type="text/javascript">
$(document).ready(function(){ 
	$('.fc-toolbar-title').remove();
}); /*로딩화면 끝*/ 
</script>
</html>