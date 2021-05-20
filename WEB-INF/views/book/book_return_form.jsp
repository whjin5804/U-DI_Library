<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 반납은 마이페이지에서 진행하는게 맞을까? -->
<!-- 현재 대출중인 도서 목록 -->
<div class="Audi3040">
	<!-- jumbyton -->
	<div class="jumbotron jumbotron-fluid headJubmotron">
		<div class="container">
			<h1 class="display-4 h1Jumbotron">대출 도서 확인</h1>
			<p class="lead pJumbotron" >현재 대출 받으려는 책 확인</p>
		</div>
	</div>
	<table>
	<c:choose>
		<c:when test="${empty rentedBookList }">
			<tr>
				<td>
					빌린책 없어용~
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${rentedBookList }" var="rentedBookInfo">
				<tr>
					<td rowspan="2">
						<img src="/resources/image/book/no_image.jpg">
					</td>
					<td>
						${rentedBookInfo.bookTitle } | 
						${rentedBookInfo.publisher } | 
						${rentedBookInfo.author } | 
						${rentedBookInfo.bookPublicationDate } | 
						${rentedBookInfo.acquisitionDate } | 
						${rentedBookInfo.bookClassName }
					</td>
					<td rowspan="2">
						<form action="/rent/bookReturn" method="post">
							<input type="hidden" value="${rentedBookInfo.rentCode }" name="rentCode">
							<input type="submit" class="btn btn-primary" value="반납할까?">
						</form>
					</td>
				</tr>
				<tr>
					<td>
						${rentedBookInfo.rentDate } | 
						${rentedBookInfo.returnDate }
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</table>
</div>
</body>
</html>