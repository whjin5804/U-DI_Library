<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/admin/admin_update_book_info.css?ver=1" rel="stylesheet">

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/js/admin/admin_update_book_info.js?ver=31111111111131211"></script>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="/admin/adminUpdateBookInfo?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
</head>
<body>

<!-- jumbyton -->
<div class="jumbotron jumbotron-fluid headJubmotron" >
  <div class="container">
    <h1 class="display-4 h1Jumbotron" style="">도서 관리</h1>
    <p class="lead pJumbotron"  style="">도서 정보 수정/삭제</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">

<form class="form-inline my-2 my-lg-0 formRight" method="post" action="/admin/adminUpdateBookInfo">
	<div class="search">
		<select name="condition" id="condition" class="form-control">
				<option value="BOOK_TITLE" <c:if test="${condition eq 'bookTitle' }">selected</c:if>>제목</option>
				<option value="AUTHOR" <c:if test="${condition eq 'author' }">selected</c:if>>지은이</option>
				<option value="PUBLISHER" <c:if test="${condition eq 'publisher' }">selected</c:if>>출판사</option>
				<option value="BOOK_PUBLICATION_DATE" <c:if test="${condition eq 'bookPublicationDate' }">selected</c:if>>출판일</option>
		</select>
		<input class="form-control mr-sm-2" name="keyword" type="search" value="${keyword }" placeholder="검색어를 입력하세요." aria-label="Search">
		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
	</div>
</form>

	<table class="table">
		<thead>
			<tr>
				<td scope="col">번호</td>
				<td scope="col">도서 장르</td>
				<td scope="col">도서 제목</td>
				<td scope="col">출판사</td>
				<td scope="col">지은이</td>
				<td scope="col">출판일</td>
				<td scope="col">도서 취득일</td>
				<td scope="col"></td>
				<td scope="col"></td>
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
				<c:forEach items="${bookList}" var="book" varStatus="status">
					<tbody>
						<tr class="${book.bookCode }">
							<td>${status.count }</td>
							<td>
								<select name="bookClass">
									<c:forEach items="${bookClassList }" var="bookClassInfo">
										<option value="${bookClassInfo.bookClass }" <c:if test="${book.bookClass eq bookClassInfo.bookClass }">selected</c:if>>${bookClassInfo.bookClassName }</option>
									</c:forEach>
								</select>
							</td>
							<td><input type="text" value="${book.bookTitle }"
								name="bookTitle"></td>
							<td><input type="text" value="${book.publisher }"
								name="publisher"></td>
							<td><input type="text" value="${book.author }" name="author"></td>
							<td><input type="text" value="${book.bookPublicationDate }"
								name="bookPublicationDate"></td>
							<td>${book.acquisitionDate }</td>
							<td><input type="button" value="변경" class="form-control changeBtn"
								onclick="updateBook('${book.bookCode}')"></td>
							<td><input type="button" value="삭제" class="form-control deleteBtn"
								onclick="deleteBook('${book.bookCode}',  this)"></td>
						</tr>
					</tbody>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
<!-- 페이징 처리 -->
	<div class="paging">
		<c:if test="${paging.startPage != 1 }">
			<a href="/admin/adminUpdateBookInfo?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					${p }
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/admin/adminUpdateBookInfo?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage }">
			<a href="/admin/adminUpdateBookInfo?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	
</body>
</html>