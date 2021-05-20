<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">	
</style>
</head>
<body>
<!-- jumbyton -->
<div class="jumbotron jumbotron-fluid headJubmotron" >
  <div class="container">
    <h1 class="display-4 h1Jumbotron" style="">도서 관리</h1>
    <p class="lead pJumbotron"  style="">대여/반납</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">
<table class="table table-hover">
	<colgroup>
		<col width="5%">
		<col width="*">
		<col width="15%">
		<col width="15%">
		<col width="15%">
		<col width="15%">
		<col width="10%">
	</colgroup>
	 <thead style="background-color: #014099; color: white;" class="text-center">
		<tr>
			<th class="span1">No.</th>
			<th class="span3">제목</th>
			<th class="span1">작가</th>
			<th class="span2">출판사</th>
			<th class="span1">대여 날짜</th>
			<th class="span1">반납 날짜</th>
			<th class="span1"></th>
		</tr>
	  </thead>
	  <tbody class="vertical-center text-center">
		<c:forEach items="${rentBookList }" var="rentBook" varStatus="status">
		<tr>
			<td>${rentBookList.size() - status.index }</td>
			<td class="text-left">${rentBook.bookTitle }</td>
			<td>${rentBook.publisher }</td>
			<td>${rentBook.author }</td>
			<td>${rentBook.rentDate }</td>
			<td>${rentBook.returnDate }</td>
			<td>
				<c:choose>
					<c:when test="${rentBook.isReturn eq 'N' }">
						<input type="button" class="btn btn-primary" onclick="location.href='/rent/bookReturn?rentCode=${rentBook.rentCode}';" value="반납">
					</c:when>
					<c:otherwise>
						<div style="color: red;">반납완료</div>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		</c:forEach>
	  </tbody>
</table>
</body>
</html>