<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/resources/js/member/side.js?ver=1"></script>
<style type="text/css">
Ul UlUl {
    display:none;
}
.title{
	font-size: 15px;
	font-weight: bold;
	background-color: #F2F2F2;
}
.list-group-item {
	padding: 10px 10px;
	text-align: center;
}
.list-group-item.active{
	background-color: #014099;
}
.list-group-item.active > a:link, .list-group-item.active > a:visited {
	color: white;
}
.title-manageMenu{
	height: 70px;
	line-height: 50px;
	background-color: #014099;
	color: white;
	font-size: 1.5rem;
	font-weight: normal;
}
.list-group{
	margin-top: 180px;
}

.sideBody{
	color: black;
}

.sideBody:link, .sideBody:visited {
	color: black;
	text-decoration: none;
}

.sideBody:hover{
font-size: 1.05rem;
}
.sideUl {
	list-style : none;
	font-size: 13px;
	padding-left: 0px;
}
</style>
</head>
<body>
	<ul class="list-group sideUl">
	<li>
      <div class="title list-group-item title-manageMenu">마이 페이지</div>
   </li>
    <li class="lili">
        <div class="title list-group-item list-group-item-action"><a href="/member/myPage" class="sideBody">회원 정보</a></div>
        <ul class="sideUl">
            <li class="list-group-item list-group-item-action <c:if test="${sideMenu eq 1 }">active</c:if>"><a href="/member/memberInfo" class="sideBody">회원 정보 수정/삭제</a></li>
        </ul>
    </li>
    <li class="lili">
        <div class="title list-group-item list-group-item-action"><a href="#" class="sideBody">도서 관리</a></div>
        <ul class="sideUl">
            <li class="list-group-item list-group-item-action <c:if test="${sideMenu eq 2 }">active</c:if>"><a href="/member/rentReturnBook" class="sideBody">대여/반납</a></li>
        </ul>
    </li>
    <li class="lili">
        <div class="title list-group-item list-group-item-action"><a href="#" class="sideBody">시설 예약 관리</a></div>
        <ul class="sideUl">
            <li class="list-group-item list-group-item-action <c:if test="${sideMenu eq 4 }">active</c:if>"><a href="/member/myParkingReserveList" class="sideBody">주차장 예약</a></li>
            <li class="list-group-item list-group-item-action <c:if test="${sideMenu eq 4 }">active</c:if>"><a href="/member/myStudyRoomReserveList" class="sideBody">스터디룸 예약</a></li>
        </ul>
    </li>
    <li class="lili">
        <div class="title list-group-item list-group-item-action <c:if test="${sideMenu eq 3 }">active</c:if>"><a href="/member/bookAlgorithm" class="sideBody">나를 위한 책 추천</a></div>
    </li>
</ul>
</body>

</html>