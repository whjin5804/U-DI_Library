<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.cardImage{
	height: 10rem;
	object-fit: contain;
}
.cardHeight{
	height: 100%;
}
.cardOverflow{
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.cardContent{
	margin-top: 0;
	margin-bottom: 0;
}
.centered{
	margin: 0 auto;
}
.rankDiv{
	margin-bottom: 2rem;
}
.monthDiv{
	font-size: 1.3rem;
	color: #6c757d;
	padding-left: 2rem;
}
.greyBg{
	background-color: #e9ecef;
}
.clickable{
	color: #014099;
}
.textBlack{
	color: black;
}
</style>
<script type="text/javascript">
(function($){
	moveToRank = function(target){
		rankMonth = $(target).val();
		location.href='/book/listToRank?rankMonth=' + rankMonth;
	}
})(jQuery);
</script>
</head>
<body>
<div class="Audi3040">
	<!-- jumbyton -->
	<div class="jumbotron jumbotron-fluid headJubmotron">
		<div class="container">
			<h1 class="display-4 h1Jumbotron">월간 대여 랭킹</h1>
			<div class="text-center lead pJumbotron">
				<select onchange="moveToRank(this);">
					<c:forEach items="${rankedMonthList }" var="month">
						<option value="${month.rankMonth }" <c:if test="${selectedMonth eq month.rankMonth }">selected</c:if>>
							${month.rankMonth }
						</option>
					</c:forEach>
					<!-- 인기랭크 테이블 (만들어야댐) 에 있는 년-월 컬럼 참조  -->
				</select>
				월의 인기 랭크
			</div>
			<!-- <p class="lead pJumbotron" >도서 상세 내용 확인</p> -->
		</div>
	</div>
	<hr style="margin-bottom: 30px;">
	<div class="col-8 centered">
		<c:forEach items="${monthlyRank }" var="thisMonthRankedBookList" varStatus="index">
			<div class="col monthDiv">
				${selectedRankMonthList[(index.index)] }월
			</div>
			<div id="m${selectedRankMonthList[(index.index)] }" class="carousel slide rankDiv" data-ride="carousel">
			<%-- <label for="m${selectedRankMonthList[(index.index)] }" class="col monthRabel"></label> --%>
			<ol class="carousel-indicators">
				<li data-target="#m${selectedRankMonthList[(index.index)] }" data-slide-to="0" class="active"></li>
				<li data-target="#m${selectedRankMonthList[(index.index)] }" data-slide-to="1"></li>
				<li data-target="#m${selectedRankMonthList[(index.index)] }" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" style="height: 20rem;">
				<div class="carousel-item active">
					<div class="row justify-content-center">
						<div class="col-10 card-deck">
						<!-- 여기서부터 시작 -->
						<c:forEach items="${thisMonthRankedBookList}" var="bookInfo" varStatus="status">
							<div class="card cardHeight">
								<c:choose>
									<c:when test="${empty bookInfo.bookImageName }">
										<a href="/book/bookDetail=${bookInfo.bookCode }">
											<img src="/resources/image/book/no_image.jpg" class="card-img-top cardImage">
										</a>
									</c:when>
									<c:otherwise>
										<a href="/book/bookDetail?bookCode=${bookInfo.bookCode }">
											<img src="/resources/image/book/${bookInfo.bookImageName }" class="card-img-top cardImage" >
										</a>
									</c:otherwise>
								</c:choose>
								<div class="card-body">
									<h5 class="card-title cardOverflow">
										${status.count }위. 
										<a href="/book/bookDetail?bookCode=${bookInfo.bookCode }" class="textBlack">${bookInfo.bookTitle }</a>
									</h5>
									<p class="card-text cardOverflow cardContent">
										<a href="/book/bookList?author=${bookInfo.author }" class="clickable">
											${bookInfo.author }
										</a>
									</p> 
									<p class="card-text cardOverflow cardContent">
										<a href="/book/bookList?publisher=${bookInfo.publisher }" class="clickable">
											${bookInfo.publisher }
										</a>, ${bookInfo.bookPublicationDate }
									</p>
									<p class="card-text cardContent">
										<a href="/book/bookList?bookClass=${bookInfo.bookClass }" class="badge badge-pill badge-secondary font-weight-light">${bookInfo.bookClassName }</a>
									</p>
								</div>
							</div>
							<c:if test="${status.count % 3 == 0 and !status.last}">
							<!-- 세퍼레이터 -->
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="row justify-content-center">
							<div class="col-10 card-deck">
							<!-- 세퍼레이터 -->
							</c:if>
						</c:forEach>
						<!-- 종료 시퀀스 -->
						</div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev col-1 greyBg" href="#m${selectedRankMonthList[(index.index)] }" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next col-1 greyBg" href="#m${selectedRankMonthList[(index.index)] }" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		</c:forEach>
	</div>
</div>
</body>
</html>