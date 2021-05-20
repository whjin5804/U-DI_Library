<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.table td{
	padding-left: 3rem;
}
.clickable{
	color: #014099;
}
</style>
</head>
<body>
<div class="Audi3040">
	<!-- jumbyton -->
	<div class="jumbotron jumbotron-fluid headJubmotron">
		<div class="container">
			<h1 class="display-4 h1Jumbotron">자세히 보기</h1>
			<p class="lead pJumbotron" >도서 상세 내용 확인</p>
		</div>
	</div>
	<hr style="margin-bottom: 30px;">
	<div class="col-sm-8" style="margin: 0 auto;">
		<table class="table text-center">
			<colgroup>
				<col width="50%">
				<col width="10%">
				<col width="40%">
			</colgroup>
			<tr>
				<th rowspan="7">
					<c:choose>
						<c:when test="${empty bookViewVO.bookImageName }">
							<img src="/resources/image/book/no_image.jpg" style="height: 30rem;">
						</c:when>
						<c:otherwise>
							<img src="/resources/image/book/${bookViewVO.bookImageName }" style="height: 30rem;">
						</c:otherwise>
					</c:choose>
				</th>
				<th class="align-middle" style="height: 3rem;">카테고리</th>
				<td class="align-middle text-left">
					<a href="/book/bookList?bookClass=${bookViewVO.bookClass }" class="clickable">${bookViewVO.bookClassName }</a>
				</td>
			</tr>
			<tr>
				<th class="align-middle">제목</th>
				<td class="align-middle text-left">${bookViewVO.bookTitle }</td>
			</tr>
			<tr>
				<th class="align-middle">출판사</th>
				<td class="align-middle text-left">
					<a href="/book/bookList?publisher=${bookViewVO.publisher }&bookClass=10" class="clickable">${bookViewVO.publisher }</a>
				</td>
			</tr>
			<tr>
				<th class="align-middle">작가</th>
				<td class="align-middle text-left">
					<a href="/book/bookList?author=${bookViewVO.author }&bookClass=10" class="clickable">${bookViewVO.author }</a>
				</td>
			</tr>
			<tr>
				<th class="align-middle" style="height: 3rem;">출간년도</th>
				<td class="align-middle text-left">${bookViewVO.bookPublicationDate }</td>
			</tr>
			<tr>
				<th class="align-middle" style="height: 3rem;">입관일</th>
				<td class="align-middle text-left">${bookViewVO.acquisitionDate }</td>
			</tr>
			<tr>
				<td colspan="2" style="height: 3rem;">
					<c:choose>
						<c:when test="${bookViewVO.isAvailable eq 'N'}">
							<input type="button" value="대여중" class="btn btn-danger">
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${empty sessionScope.loginInfo }">
									<input type="button" value="대여가능" class="btn btn-success">
								</c:when>
								<c:otherwise>
									<form action="/rent/bookRentForm" method="post">
										<input type="hidden" name="bookCode" value="${bookViewVO.bookCode }" required>
										<input type="hidden" name="bookTitle" value="${bookViewVO.bookTitle }" required>
										<input type="submit" value="책대여" class="btn btn-primary">
									</form>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					<%-- <c:if test="${not empty sessionScope.loginInfo }">
						<form action="/rent/bookRentForm" method="post">
							<input type="hidden" name="bookCode" value="${bookViewVO.bookCode }" required>
							<input type="hidden" name="bookTitle" value="${bookViewVO.bookTitle }" required>
							<input type="submit" value="책대여" class="btn btn-primary">
						</form>
					</c:if> --%><!-- 임시 -->
				</td>
			</tr>
			<tr>
				<th colspan="3">책 소개</th>
			</tr>
			<tr>
				<c:choose>
					<c:when test="${empty bookViewVO.bookPreview }">
						<td colspan="3" class="text-center">책 소개가 없어요 x.x</td>
					</c:when>
					<c:otherwise>
						<td colspan="3" class="text-left">${bookViewVO.bookPreview }</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
	</div>
</div>
</body>
</html>