<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.hand{
	cursor: pointer;
}
.hand:hover{
	text-decoration: underline;
}
.spanGrey{
	color: #777777;
}
.grey{
	color: #777777;
}
.grey:hover {
	text-decoration: underline;
}
.titleMargin{
	padding: 0;
	padding-bottom: 0.5rem;
	padding-top: 0.5rem;
}
.noMargin{
	margin: 0;
}
.textBlack{
	color: black;
}
.contentsDiv{
	padding-top: 0.5rem;
}
.oneBookDiv{
	margin-bottom: 0.3rem;
}
.pagingDiv{
	margin-top: 0.5rem;
	margin-bottom: 0.5rem;
}
.optionColor{
	background-color: #fff;
	color: black;
}
.fullHeight{
	height: 100%;
}
.marPadClean{
	margin: 0;
	padding: 0;
}
.clickable{
	color: #014099;
}
</style>
<script type="text/javascript">
(function($){
	prevPageSet = function(){
		$('#nowPage').val(${pagingVO.startPage - 1});
		$('#hiddenListForm').submit();
	};
	prevPage = function(){
		$('#nowPage').val(Number($('#nowPage').val()) - 1);
		$('#hiddenListForm').submit();
	};
	afterPage = function(){
		$('#nowPage').val(Number($('#nowPage').val()) + 1);
		$('#hiddenListForm').submit();
	};
	afterPageSet = function(){
		$('#nowPage').val(${pagingVO.endPage + 1});
		$('#hiddenListForm').submit();
	};
	setPage = function(target){
		$('#nowPage').val($(target).text());
		$('#hiddenListForm').submit();
	};
})(jQuery);
</script>
</head>
<body>
<div class="Audi3040">
	<!-- jumbyton -->
	<div class="jumbotron jumbotron-fluid headJubmotron">
		<div class="container">
			<h1 class="display-4 h1Jumbotron">통합 검색</h1>
			<p class="lead pJumbotron" >도서를 검색</p>
		</div>
	</div>
	<hr style="margin-bottom: 30px;">
	<div class="row justify-content-center">
		<div class="col-8">
			<!-- 검색 바 -->
			<div class="row justify-content-end">
				<form action="/book/bookList" method="post" id="bookListForm" class="form-inline my-2 my-lg-0">
					<div class="col text-right" style="margin-bottom: 15px; padding: 0;">
						<select name="bookClass" class="form-control">
							<option value="10">모든 카테고리</option>
							<c:forEach items="${bookClassList }" var="bookClassInfo">
								<option value="${bookClassInfo.bookClass }">${bookClassInfo.bookClassName }</option>
							</c:forEach>
						</select>
						<input type="text" name="keyword" class="form-control mr-sm-2" placeholder="책 제목, 저자, 출판사로 검색">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
					</div>
				</form>
			</div>
			<!-- 검색바 종료 -->
			<!-- 상단 페이징 -->
			<div class="row justify-content-center text-center pagingDiv">
				<div class="col">
				<c:if test="${pagingVO.startPage != 1 }">
					<span class="hand" onclick="prevPageSet();">&lt;&lt;</span>
				</c:if>
				</div>
				<div class="col">
				<c:if test="${pagingVO.nowPage != 1 }">
					<span class="hand" onclick="prevPage();">&lt;</span>
				</c:if>
				</div>
				<c:forEach begin="${pagingVO.startPage }" end="${pagingVO.endPage }" var="page">
					<c:choose>
						<c:when test="${page == pagingVO.nowPage }">
						<div class="col">
							<span style="color: red;">${page }</span>
						</div>
						</c:when>
						<c:otherwise>
						<div class="col">
							<span class="hand" onclick="setPage(this);">${page }</span>
						</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<div class="col">
				<c:if test="${pagingVO.nowPage < pagingVO.lastPage }">
					<span class="hand" onclick="afterPage();">&gt;</span>
				</c:if>
				</div>
				<div class="col">
				<c:if test="${pagingVO.endPage != pagingVO.lastPage }">
					<span class="hand" onclick="afterPageSet();">&gt;&gt;</span>
				</c:if>
				</div>
			</div>
			<!-- 상단 페이징 종료 -->
			<!-- 검색 결과에 대한 데이터 -->
			<div class="row justify-content-center">
				<div class="col" style="margin: 0; padding: 0;">
					<c:choose>
						<c:when test="${empty bookList }">
							<div class="row border align-items-center noMargin" style=" height: 200px;">
								<h2 class="col text-center">해당하는 조건의 도서가 없어요 x.x</h2>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${bookList }" var="bookInfo">
								<div class="col border-bottom border-right oneBookDiv">
									<div class="row">
										<div class="col-3 text-center" style="height: 12rem;">
											<c:choose>
												<c:when test="${empty bookInfo.bookImageName }">
													<a href="/book/bookDetail?bookCode=${bookInfo.bookCode }">
														<img src="/resources/image/book/no_image.jpg" style="height: 100%;">
													</a>
												</c:when>
												<c:otherwise>
													<a href="/book/bookDetail?bookCode=${bookInfo.bookCode }">
														<img src="/resources/image/book/${bookInfo.bookImageName }" style="height: 100%;">
													</a>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="col">
											<a href="/book/bookList?bookClass=${bookInfo.bookClass }" class="grey">
												<span class="badge badge-secondary" style="font-size: 0.9rem;">${bookInfo.bookClassName }</span>
											</a>
											<div class="col font-weight-bold titleMargin" style="font-size: 1.2rem;">
												<a href="/book/bookDetail?bookCode=${bookInfo.bookCode }" class="textBlack">
													${bookInfo.bookTitle }
												</a>
											</div>
											<div class="contentsDiv">
												<a href="/book/bookList?author=${bookInfo.author }&bookClass=10">
													<span class="clickable">${bookInfo.author }</span> <span class="grey">지음</span>
												</a> 
											</div>
											<div class="contentsDiv">
												<a href="/book/bookList?publisher=${bookInfo.publisher }&bookClass=10">
													<span class="clickable">${bookInfo.publisher }</span><span class="grey">, ${bookInfo.bookPublicationDate }</span> 
												</a>
											</div>
											<div class="contentsDiv">
												<span class="spanGrey">
													${bookInfo.acquisitionDate } 입관
												</span>
											</div>
										</div>
										<div class="col-2 align-self-center text-center" style="line-height: 100%">
											<c:choose>
												<c:when test="${bookInfo.isAvailable eq 'N'}">
													<input type="button" value="대여중" class="btn btn-danger">
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${empty sessionScope.loginInfo }">
															<input type="button" value="대여가능" class="btn btn-success">
														</c:when>
														<c:otherwise>
															<form action="/rent/bookRentForm" method="post">
																<input type="hidden" name="bookCode" value="${bookInfo.bookCode }" required>
																<input type="hidden" name="bookTitle" value="${bookInfo.bookTitle }" required>
																<input type="submit" value="책대여" class="btn btn-primary">
															</form>
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<!-- 검색 결과에 대한 데이터 끝 -->
			<!-- 하단 페이징 -->
			<div class="row justify-content-center text-center pagingDiv">
				<div class="col">
				<c:if test="${pagingVO.startPage != 1 }">
					<span class="hand" onclick="prevPageSet();">&lt;&lt;</span>
				</c:if>
				</div>
				<div class="col">
				<c:if test="${pagingVO.nowPage != 1 }">
					<span class="hand" onclick="prevPage();">&lt;</span>
				</c:if>
				</div>
				<c:forEach begin="${pagingVO.startPage }" end="${pagingVO.endPage }" var="page">
					<c:choose>
						<c:when test="${page == pagingVO.nowPage }">
							<div class="col">
								<span style="color: red;">${page }</span>
							</div>
						</c:when>
						<c:otherwise>
						<div class="col">
							<span class="hand" onclick="setPage(this);">${page }</span>
						</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<div class="col">
				<c:if test="${pagingVO.nowPage < pagingVO.lastPage }">
					<span class="hand" onclick="afterPage();">&gt;</span>
				</c:if>
				</div>
				<div class="col">
				<c:if test="${pagingVO.endPage != pagingVO.lastPage }">
					<span class="hand" onclick="afterPageSet();">&gt;&gt;</span>
				</c:if>
				</div>
			</div>
			<!-- 하단 페이징 끝 -->
			<!-- <div>
				<input type="button" class="btn" value="책등록" onclick="location.href='/book/insertBookForm'">
			</div> -->
		</div>
	</div>
	<%-- <div class="col-8" style="margin: 0 auto;">
	<form action="/book/bookList" method="post">
		<div class="row" style="height: 3rem;">
			<div class="col-2 marPadClean">
				<select class="form-control fullHeight" style="background-color: #ff8b35; color: white;" name="bookClass">
						<option value="10" class="optionColor">모든 카테고리</option>
					<c:forEach items="${bookClassList }" var="bookClass">
						<option value="${bookClass.bookClass }" class="optionColor">${bookClass.bookClassName }</option>
					</c:forEach>
				</select>
			</div>
			<div class="col marPadClean">
				<input type="text" placeholder="책 제목, 저자, 출판사로 검색.." class="form-control fullHeight" name="keyword">
			</div>
			<div class="col-2 marPadClean">
				<button type="submit" class="btn btn-primary form-control fullHeight">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
						<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
					</svg>
					검색
				</button>
			</div>
		</div>
	</form>
	</div> --%>
</div>
<!-- 페이지 눌렀을때를 위한 폼 -->
<form action="/book/bookList" method="post" id="hiddenListForm">
	<input type="hidden" name="bookClass" value="${bookViewVO.bookClass }">
	<input type="hidden" name="keyword" value="${bookViewVO.keyword }">
	<input type="hidden" name="publisher" value="${bookViewVO.publisher }">
	<input type="hidden" name="author" value="${bookViewVO.author }">
	<input type="hidden" name="nowPage" id="nowPage" value="${pagingVO.nowPage }">
</form>
</body>
</html>