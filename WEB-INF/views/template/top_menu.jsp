<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/js/template/top_menu.js?ver=02" type="text/javascript"></script> -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="/resources/js/template/top_menu.js?ver=03" type="text/javascript"></script>
<style type="text/css">
.offTop{
	width: 100%;
}
.topMenu{
	width: 100%;
}
.ul-width{
	width: 1200px;
	margin: 0 auto;
}
.nav-link{
	padding: 0 2rem;
}

.modal-dialog{
	margin:0;
}
.modal-content{
	width: 100vw;
	height: 100vh;
	background-image: url('/resources/image/home/사이트맵 배경.png');
	background-repeat: no-repeat;
	background-size: cover;
	opacity: 0.98;
}

.modal-backdrop{
	z-index: -1;
}
.siteMapBody{
	color:  white;
}
.modal-header{
	color: white;
	margin: 0 auto;
	margin-top: 50px;
    margin-bottom: 20px;
}
#siteMapModalLabel{
	font-weight: bold;
}

/* li글자 */
.siteMapList, siteMapBody{
	color:  white;
	padding: 7px 0;
	list-style: none;
}
.siteMapList:hover{
	color: #dadadc;
}
.bg-color{
	font-weight: bold;
	font-size: 1.5rem;
	color: white;
}

/* ul글자 */
.navMargin{
	margin-top: 75px;
}

.noListSt{
	list-style: none;
	padding: 0 35px;
	font-size: 1.2rem;
}
.modal-body-site{
	padding-top: 150px;
	height: 100%;
}

.menuNav{
	color: white;
}

.menuNav:hover {
	color:white;
	font-size: 1.05rem;
}
.bg-color-hr{
	background-color:white;
	width: 150px;
}
.btnDiv{
	text-align: right;
	margin: 30px;
}
.bi-list{
	color: white;
}
.bi-list:hover{
	color: #dadadc;
	width: 60;
}

/* 메뉴(드롭다운) 디자인 */
.dropdown-item{
	height: 50px;
}
.dropdown-menu{
	width: 200px;
	margin-left: 5px;
	text-align: center;
}
ul.dropdown-menu.show{
	padding-bottom: 20px;
}
.li-height{
	height: 40px;
	line-height: 40px;
}
.topNoMargin{
	margin: 0;
	border-bottom:  margin-right: 0px; margin-left: 0px; width: 100%;
}
</style>
</head>
<body>
<div class="row topNoMargin">
	<h1 class="col-2 text-center align-middle" style="color: blue; height: 98px; line-height: 98px; ">
		<a href="/home/first">
			<img alt="logo에러" src="/resources/image/home/로고후보4.png" width="120px;">		
		</a>
	</h1>
	<div class="col colDiv">
		<ul class="nav justify-content-end text-center row"  style="height: 30px; line-height:30px; padding-right: 30px; ">
			<c:choose>
				<c:when test="${empty sessionScope.loginInfo}">	
					<li class="nav-item">
						<a class="nav-link menuNav" href="/home/login">로그인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link menuNav" href="/home/join">회원가입</a>
					</li>
				</c:when>
				<c:otherwise>
						<li class="nav-item" style="color:white;">${sessionScope.loginInfo.memberName} 님 반갑습니다</li>
						<c:if test="${sessionScope.loginInfo.isAdmin.equals('Y')}">
							<li class="nav-item"><a class="nav-link menuNav" href="/admin/adminMemberList">관리자메뉴</a></li>
						</c:if>
						<li class="nav-item"><a class="nav-link menuNav" href="/member/myPage">마이 페이지</a></li>
						<li class="nav-item"><a class="nav-link menuNav" href="/home/logout">로그아웃</a></li>
						<!-- <li class="nav-item"><a class="nav-link menuNav" href="#" onclick="logout();">로그아웃</a></li> -->
				</c:otherwise>
			</c:choose>
		</ul>
		
		
		
		<!-- 메뉴 -->
		<ul class="nav justify-content-center text-center row page-start" style=" height: 68px; line-height: 68px;">
			<li class="nav-item dropdown col-2">
				<a class="nav-link dropdown-toggle menuNav" href="#" id="bookDropdown" role="button" data-toggle="dropdown" aria-expanded="false">도서관 소개</a>
				<ul class="dropdown-menu" aria-labelledby="bookDropdown">
		          <li class="li-height"><a class="dropdown-item" href="/home/helloLib">인사말</a></li>
		          <li class="li-height"><a class="dropdown-item" href="/home/historyLib">연혁</a></li>
		          <li class="li-height"><a class="dropdown-item" href="/home/groupLib">조직도</a></li>
		          <li class="li-height"><a class="dropdown-item" href="/home/floorLib">이용 안내</a></li>
		        </ul>
			</li>
			<li class="nav-item dropdown col-2">
				<a class="nav-link dropdown-toggle menuNav" href="#" id="bookDropdown" role="button" data-toggle="dropdown" aria-expanded="false">자료검색</a>
				<!-- 도서 드롭다운 -->
				<ul class="dropdown-menu" aria-labelledby="bookDropdown">
		          <li class="li-height"><a class="dropdown-item" href="/book/listToNewCommer">신착도서</a></li>
		          <li class="li-height"><a class="dropdown-item" href="/book/listToCategory">카테고리별</a></li>
		          <li class="li-height"><a class="dropdown-item" href="/book/bookList?bookClass=10">통합검색</a></li>
		          <li class="li-height"><a class="dropdown-item" href="/book/listToRank">월간대출랭킹</a></li>
		        </ul>
			</li>
			<li class="nav-item dropdown col-2">
		        <a class="nav-link dropdown-toggle menuNav" href="#" id="navbarScrollingDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
          			시설 이용
       			</a>
				<!-- 드롭다운 -->
				<ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
		          <li class="li-height"><a class="dropdown-item" href="/facility/libraryMap">찾아오는 길</a></li>
		          <li class="li-height"><a class="dropdown-item" href="/facility/parking">주차장 이용</a></li>
		          <li class="li-height"><a class="dropdown-item" href="/facility/studyRoom">스터디룸 이용</a></li>
		          <li class="li-height"><a class="dropdown-item" href="/facility/libEvent">행사 소개</a></li>
		          <li><hr class="dropdown-divider"></li>
		          <li class="li-height"><a class="dropdown-item" href="/facility/libCalendar">도서관 전체일정</a></li>
		        </ul>
			</li>
			<li class="nav-item col-2">
				<a class="nav-link menuNav" href="/home/board">참여마당</a>
			</li>
			
			<li class="nav-item col-2"><!-- 사이트맵 팝업을 위한 모달버튼 -->
				<button type="button" class="btn btn-audi" data-toggle="modal" data-target="#siteMapModal">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
					</svg>
				</button>
			</li>
		</ul>
		<!-- 메뉴 끝 -->
		
		
	</div>
</div>

<!-- 사이트맵 모달창 -->
<div class="modal fade" id="siteMapModal" tabindex="5" aria-labelledby="siteMapModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" id="siteMapBackground">
				<div class="btnDiv">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color:white">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			<div class="modal-header">
				<h4 class="modal-title" id="siteMapModalLabel">전체 메뉴</h4>
			</div>
			<div class="modal-body-site">
				<ul class="nav justify-content-center text-center row ul-width">
					<li class="nav-item col ">
						<a class="nav-link siteMapBody" href="#"><span class="bg-color">도서관 소개</span></a>
						<hr class="bg-color-hr">
						<ul class="noListSt">
							<li>
								<a class="nav-link siteMapList" href="/home/helloLib">인사말</a>
							</li>
							<li>
								<a class="nav-link siteMapList" href="/home/historyLib">연혁</a>
							</li>
							<li>
								<a class="nav-link siteMapList" href="/home/groupLib">조직도</a>
							</li>
							<li>
								<a class="nav-link siteMapList" href="/home/floorLib">이용안내</a>
							</li>
						</ul>
					</li>
					<li class="nav-item col">
						<a class="nav-link siteMapBody" href="#"><span class="bg-color">도서</span></a>
						<hr class="bg-color-hr">
						<ul class="noListSt">
							<li>
								<a class="nav-link siteMapList" href="/book/listToNewCommer">신착도서</a>
							</li>
							<li>
								<a class="nav-link siteMapList" href="/book/listToCategory">카테고리별</a>
							</li>
							<li>
								<a class="nav-link siteMapList" href="/book/bookList?bookClass=10">통합검색</a>
							</li>
							<li>
								<a class="nav-link siteMapList" href="/book/listToRank">월간대출랭킹</a>
							</li>
						</ul>
					</li>
					<!-- </ul> -->
					
					
				<!-- <ul class="nav justify-content-center text-center row"> -->
					<li class="nav-item col">
						<a class="nav-link siteMapBody" href="#"><span class="bg-color">시설</span></a>
						<hr class="bg-color-hr">
						<ul class="noListSt">
							<li>
								<a class="nav-link siteMapList" href="/facility/libraryMap">찾아오는 길</a>
							</li>
							<li>
								<a class="nav-link siteMapList" href="/facility/parking">주차장이용</a>
							</li>
							<li>
								<a class="nav-link siteMapList" href="/facility/studyRoom">스터디룸이용</a>
							</li>
							<li>
								<a class="nav-link siteMapList" href="/facility/libEvent">행사소개</a>
							</li>
							<li>
								<a class="nav-link siteMapList" href="/facility/libCalendar">도서관 전체일정</a>
							</li>
						</ul>
					</li>
					<li class="nav-item col">
						<a class="nav-link siteMapBody" href="#" style=""><span class="bg-color">참여마당</span></a>
						<hr class="bg-color-hr">
						<ul class="noListSt">
							<li>
								<a class="nav-link siteMapList" href="/home/board">공지사항/자유게시판</a>
							</li>
						</ul>
					</li>				
				</ul>
			</div>
			<!-- <div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div> -->
		</div>
	</div>
</div>
</body>
</html>