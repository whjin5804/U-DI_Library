<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	font-size: 0.8rem;
	text-align: center;
}
.search{
	text-align: right;
	margin-bottom: 15px;
}
.nothing{
	padding-top: 20px;
	padding-bottom: 20px;
}
thead{
	background-color: #014099;
	color: white;
}
.btn-outline-success {
    color: #014099;
    border-color: #014099;
}
.btn-outline-success:hover {
	background-color: #014099;
}
.formRight{
	display: block;
}
.paging{
	text-align: center;
	color: #078399;
	margin-top: 50px;
	
}
.hand{
	cursor: pointer;
}
</style>
</head>
<body>

<!-- jumbyton -->
<div class="jumbotron jumbotron-fluid headJubmotron" >
  <div class="container">
    <h1 class="display-4 h1Jumbotron" style="">일정 관리</h1>
    <p class="lead pJumbotron"  style="">행사 일정 조회</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">

<!-- 검색 -->
<form class="form-inline my-2 my-lg-0 formRight" method="post" action="/admin/adminLectureManage">
	<div class="search">
		<select name="condition" id="condition" class="form-control">
				<option value="LECTURE_NAME" <c:if test="${paging.condition eq 'LECTURE_NAME' }">selected</c:if>>행사명</option>
				<option value="LECTURE_DATE" <c:if test="${paging.condition eq 'LECTURE_DATE' }">selected</c:if>>행사일시</option>
				<option value="LECTURER" <c:if test="${paging.condition eq 'LECTURER' }">selected</c:if>>강연자</option>
				<option value="LECTURE_STATE" <c:if test="${paging.condition eq 'LECTURE_STATE' }">selected</c:if>>진행상태</option>
		</select>
		<input class="form-control mr-sm-2" name="keyword" type="search" value="${keyword }" placeholder="검색어를 입력하세요." aria-label="Search">
		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
	</div>
</form>



	<table class="table table-hover">
	<thead>
	    <tr>
	      <td scope="col">번호</td>
	      <td scope="col">행사명</td>
	      <td scope="col">행사일</td>
	      <td scope="col">행사시간</td>
	      <td scope="col">강연자</td>
	      <td scope="col">진행상태</td>
	      <td scope="col">행사위치</td>
	    </tr>
    </thead>
		<c:choose>
			<c:when test="${empty LectureInfoList }">
				<tbody>
					<tr>
						<td colspan="7"><div class="nothing">검색결과가 존재하지 않습니다.</div></td>
					</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${LectureInfoList }" var="lecture" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${lecture.lectureName }</td>
						<td>${lecture.lectureDate }</td>
						<td>${lecture.lectureTime }시간</td>
						<td>${lecture.lecturer }</td>
						<td>
							<c:if test="${lecture.lectureState eq 1}">예정</c:if>
							<c:if test="${lecture.lectureState eq 2}">진행 중</c:if>
							<c:if test="${lecture.lectureState eq 3}">종료</c:if>
						</td>
						<td>${lecture.studyRoomName }</td>
					</tr>
				</tbody>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
	<!-- 페이징 처리 -->
	<div class="paging">
		<c:if test="${paging.startPage != 1 }">
			<span class="hand" onclick="prevPage();">&lt;</span>
			<%-- <a href="/admin/adminBookList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a> --%>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<span style="color: red;">${p }</span>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<span class="hand" onclick="toSelectedPage(this);">${p }</span>
					<%-- <a href="/admin/adminBookList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a> --%>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage }">
			<span class="hand" onclick="nextPage();">&gt;</span>
			<%-- <a href="/admin/adminBookList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a> --%>
		</c:if>
	</div>
	<!-- 박종민이가 추가함 -->
	<form action="/admin/adminLectureManage" method="post" id="pagingForm">
		<input type="hidden" name="condition" value="${paging.condition }">
		<input type="hidden" name="keyword" value="${paging.keyword }">
		<input type="hidden" name="cntPerPage" value="${paging.cntPerPage }">
		<input type="hidden" name="nowPage" value="${paging.nowPage }" id="nowPageInput">
	</form>
<script type="text/javascript">
//한번에 나타내는 숫자 조정하는 함수로 보임
function selChange() {
	var sel = document.getElementById('cntPerPage').value;
	location.href="/admin/adminBookList?nowPage=${paging.nowPage}&cntPerPage="+sel;
}
(function($){
	prevPage = function(){
		let startPage = ${paging.startPage};
		startPage = Number(startPage) - 1 ;
		$('#nowPageInput').val(startPage);
		$('#pagingForm').submit();
	};
	toSelectedPage = function(wantToGoPage){
		const newNowPage = $(wantToGoPage).text();
		$('#nowPageInput').val(newNowPage);
		$('#pagingForm').submit();
	};
	nextPage = function(){
		let endPage = ${paging.endPage};
		endPage = Number(endPage) + 1;
		$('#nowPageInput').val(endPage);
		$('#pagingForm').submit();
	};
})(jQuery);
</script>
</body>
</html>