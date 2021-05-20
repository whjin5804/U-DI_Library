<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 가져와서 씀 -->
<link href="/resources/css/admin/admin_update_member_info.css?ver=1" rel="stylesheet">
<style>

</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/js/admin/admin_update_lecture_info.js?ver=11143"></script>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="/admin/adminUpdateLectureInfo?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
	
	$(function(){
	    $('[type="date"].min-today').prop('min', function(){
	        return new Date().toJSON().split('T')[0];
	    });
	});
	
</script>
</head>
<body>

<!-- jumbyton -->
<div class="jumbotron jumbotron-fluid headJubmotron" >
  <div class="container">
    <h1 class="display-4 h1Jumbotron" style="">일정 관리</h1>
    <p class="lead pJumbotron"  style="">행사 일정 수정/삭제</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">

<!-- 검색 -->
<form class="form-inline my-2 my-lg-0 formRight" method="post" action="/admin/adminUpdateLectureInfo">
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

	<table class="table">
		<thead>
		    <tr>
		      <td scope="col">번호</td>
		      <td scope="col">행사명</td>
		      <td scope="col">행사일</td>
		      <td scope="col">행사시간</td>
		      <td scope="col">강연자</td>
		      <td scope="col">진행상태</td>
		      <td scope="col">행사위치</td>
		      <td scope="col"></td>
		      <td scope="col"></td>
		    </tr>
	    </thead>

		<c:choose>
			<c:when test="${empty lectureList }">
				<tbody>
					<tr>
						<td colspan="7"><div class="nothing">검색결과가 존재하지 않습니다.</div></td>
					</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${lectureList}" var="lecture" varStatus="status">
					<tbody>
						<tr class="${lecture.lectureCode }">
							<td>${status.count }</td>
							<td><input type="text" value="${lecture.lectureName }"
								name="lectureName"></td>
							<td><input type="date" value="<fmt:formatDate value="${lecture.lectureDate }" pattern="YYYY-MM-dd"></fmt:formatDate>"
								name="lectureDate" class="min-today"></td>
							<td><input type="text" value="${lecture.lectureTime }"
								name="lectureTime"></td>
							<td><input type="text" value="${lecture.lecturer }"
								name="lecturer"></td>
							<%-- <td><input type="text" value="${lecture.lectureState }"
								name="lectureState"></td> --%>
							<td>
								<select name="lectureState">
										<option value="1" <c:if test="${lecture.lectureState eq 1 }">selected</c:if>>
											예정
										</option>
										<option value="2" <c:if test="${lecture.lectureState eq 2 }">selected</c:if>>
											진행 중
										</option>
										<option value="3" <c:if test="${lecture.lectureState eq 3 }">selected</c:if>>
											종료
										</option>
								</select>
							</td>
							<td>
								<select name="lecturePlace">
									<c:forEach items="${studyRoomList }" var="studyRoom">
										<option value="${studyRoom.studyRoomCode }" <c:if test="${lecture.lecturePlace eq studyRoom.studyRoomCode }">selected</c:if>>${studyRoom.studyRoomName }</option>
									</c:forEach>
								</select>
							</td>
							<td><input type="button" value="변경" class="form-control changeBtn" 
								onclick="updateLecture('${lecture.lectureCode}')"></td>
							<td><input type="button" value="삭제" class="form-control deleteBtn" 
								onclick="deleteLecture('${lecture.lectureCode}', this)"></td>
						</tr>
					</tbody>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
		<!-- 페이징 처리 -->
	<div class="paging">
		<c:if test="${paging.startPage != 1 }">
			<a href="/admin/adminUpdateLectureInfo?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					${p }
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/admin/adminUpdateLectureInfo?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage }">
			<a href="/admin/adminUpdateLectureInfo?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>

</body>
</html>