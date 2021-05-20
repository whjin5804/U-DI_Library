<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.ganguck{
	margin-bottom: 3rem;
}
.captionStyle{
	caption-side: top;
	font-size: 1.5rem;
	font-weight: bold;
	margin-bottom: 0.75rem;
}
.theadBg{
	background-color: #014099;
	color: white;
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
			<h1 class="display-4 h1Jumbotron">카테고리별 보기</h1>
			<p class="lead pJumbotron" >인기있는 카테고리순으로 정렬</p>
		</div>
	</div>
	<hr style="margin-bottom: 30px;">
	<div class="row justify-content-center">
		<div class="col-9">
			<c:forEach items="${bookListToCategory }" var="bookList">
				<table class="table text-center ganguck">
					<caption class="offset-1 col captionStyle">
							${bookList[1].bookClassName }
					</caption>
					<colgroup>
						<col width="40%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead class="theadBg">
						<tr>
							<th>책 제목</th>
							<th>출판사</th>
							<th>작가</th>
							<th>입관일</th>
						</tr>
					</thead>
					<c:forEach items="${bookList }" var="bookInfo">
						<tr>
							<td>
								<a href="/book/bookDetail?bookCode=${bookInfo.bookCode }" class="clickable">${bookInfo.bookTitle }</a>
							</td>
							<td>
								<a href="/book/bookList?publisher=${bookInfo.publisher }&bookClass=${bookInfo.bookClass}" class="clickable">${bookInfo.publisher }</a>
							</td>
							<td>
								<a href="/book/bookList?author=${bookInfo.author }&bookClass=${bookInfo.bookClass}" class="clickable">${bookInfo.author }</a>
							</td>
							<td>${bookInfo.acquisitionDate }</td>
						</tr>
					</c:forEach>
				</table>
			</c:forEach>
		</div>
	</div>
</div>
<!-- <br>임시로 반납 페이지 여기 만들어요
<a href="/rent/bookReturnForm">반납 페이지로</a>
<a href="/book/insertBookRank">책랭킹 넣기</a> -->
</body>
</html>