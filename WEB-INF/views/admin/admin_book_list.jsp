<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/admin/admin_book_list.css?ver=2" style="text/css">
</head>
<body>

<!-- jumbyton -->
<div class="jumbotron jumbotron-fluid headJubmotron" >
  <div class="container">
    <h1 class="display-4 h1Jumbotron" style="">도서 관리</h1>
    <p class="lead pJumbotron"  style="">도서 목록 조회</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">

<form class="form-inline my-2 my-lg-0 formRight" method="post" action="/admin/adminBookList">
	<div class="search">
		<select name="condition" id="condition" class="form-control">
				<option value="BOOK_TITLE" <c:if test="${paging.condition eq 'BOOK_TITLE' }">selected</c:if>>제목</option>
				<option value="AUTHOR" <c:if test="${paging.condition eq 'AUTHOR' }">selected</c:if>>지은이</option>
				<option value="PUBLISHER" <c:if test="${paging.condition eq 'PUBLISHER' }">selected</c:if>>출판사</option>
				<option value="BOOK_PUBLICATION_DATE" <c:if test="${paging.condition eq 'BOOK_PUBLICATION_DATE' }">selected</c:if>>출판일</option>
		</select>
		<input class="form-control mr-sm-2" name="keyword" type="search" value="${keyword }" placeholder="검색어를 입력하세요." aria-label="Search">
		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
	</div>
</form>


<!-- 왜안돼 -->
<%-- <c:choose>
	<!-- [입력한 키워드]로 검색된 99개의 파일이 있습니다. -->
	<c:when test="${not empty keyword }">
		<div>{입력한 키워드 }로 검색된 @@개의 파일이 있습니다.</div>
	</c:when>
	<c:otherwise>
		<div>@@개의 파일이 있습니다.</div>
	</c:otherwise>
</c:choose> --%>

	<table class="table table-hover">
	<thead>
	    <tr>
	      <td scope="col">번호</td>
	      <td scope="col">도서 장르</td>
	      <td scope="col">도서 제목</td>
	      <td scope="col">출판사</td>
	      <td scope="col">지은이</td>
	      <td scope="col">출판일</td>
	      <td scope="col">도서 취득일</td>
	    </tr>
    </thead>
		<c:choose>
			<c:when test="${empty bookList }">
				<tbody>
					<tr>
						<td colspan="7"><div class="nothing">검색결과가 존재하지 않습니다.</div></td>
					</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${bookList }" var="book" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${book.bookClassName }</td>
						<td>${book.bookTitle }</td>
						<td>${book.publisher }</td>
						<td>${book.author }</td>
						<td>${book.bookPublicationDate }</td>
						<td>${book.acquisitionDate }</td>
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
	<form action="/admin/adminBookList" method="post" id="pagingForm">
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