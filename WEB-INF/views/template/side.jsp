<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/resources/js/admin/side.js?ver=1111121323"></script>
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
	background-color: #91b2de;
	border: 0px;
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
	margin-top: 219px;
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
		<div class="title list-group-item title-manageMenu">관리자 메뉴</div>
	</li>
    <li class="lili">
        <div class="title list-group-item list-group-item-action"><a href="#" class="sideBody">회원 관리</a></div>
        <ul class="sideUl">
            <li class="list-group-item list-group-item-action <c:if test="${sideMenu eq 1 }">active</c:if>"><a href="/admin/adminMemberList?sideMenu=1" class="sideBody">회원 목록 조회</a></li>
            <li class="list-group-item list-group-item-action <c:if test="${sideMenu eq 2 }">active</c:if>"><a href="/admin/adminUpdateMemberInfo?sideMenu=2" class="sideBody">회원 정보 수정/삭제</a></li>
        </ul>
    </li>
    <li class="lili">
        <div class="title list-group-item list-group-item-action"><a href="#" class="sideBody">도서 관리</a></div>
        <ul class="sideUl">
            <li class="list-group-item list-group-item-action <c:if test="${sideMenu eq 3 }">active</c:if>"><a href="/admin/adminBookList" class="sideBody">도서 목록 조회</a></li>
            <li class="list-group-item list-group-item-action <c:if test="${sideMenu eq 4 }">active</c:if>"><a href="/admin/adminRegisterBook" class="sideBody">도서 신규 등록</a></li>
            <li class="list-group-item list-group-item-action <c:if test="${sideMenu eq 5 }">active</c:if>"><a href="/admin/adminUpdateBookInfo" class="sideBody">도서 정보 수정/삭제</a></li>
        </ul>
    </li>
    <li class="lili">
        <div class="title list-group-item list-group-item-action"><a href="#" class="sideBody">예약 관리</a></div>
        <ul class="sideUl">
            <li class="list-group-item list-group-item-action <c:if test="${sideMenu eq 6 }">active</c:if>"><a href="/admin/adminStudyroomManage" class="sideBody">스터디룸 예약 관리</a></li>
            <li class="list-group-item list-group-item-action <c:if test="${sideMenu eq 7 }">active</c:if>"><a href="/admin/adminParkinglotManage" class="sideBody">주차장 예약 현황 조회</a></li>
        </ul>
    </li>
    <li class="lili">
        <div class="title list-group-item list-group-item-action"><a href="#" class="sideBody">일정 관리</a></div>
        <ul class="sideUl">
            <li class="list-group-item list-group-item-action <c:if test="${sideMenu eq 8 }">active</c:if>"><a href="/admin/adminLectureManage" class="sideBody">행사 일정 조회</a></li>
            <li class="list-group-item list-group-item-action <c:if test="${sideMenu eq 9 }">active</c:if>"><a href="/admin/adminInsertLectureManage" class="sideBody">행사 일정 등록</a></li>
            <li class="list-group-item list-group-item-action <c:if test="${sideMenu eq 10 }">active</c:if>"><a href="/admin/adminUpdateLectureInfo" class="sideBody">행사 일정 수정/삭제</a></li>
            <li class="list-group-item list-group-item-action <c:if test="${sideMenu eq 11 }">active</c:if>"><a href="/admin/libScheduleManage" class="sideBody">도서관 일정 관리</a></li>
        </ul>
    </li>
</ul>
</body>

</html>