<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

table{
	text-align: center;
}
</style>
<script type="text/javascript">
selChange = function() {
	var sel = document.getElementById('cntPerPage').value;
	location.href="/home/board?nowPage=${paging.nowPage}&cntPerPage="+sel;
}
</script>
</head>
<body>
<div class="Audi3040">
<!-- jumbyton -->
<div class="jumbotron jumbotron-fluid headJubmotron">
  <div class="container">
    <h1 class="display-4 h1Jumbotron">참여마당</h1>
    <p class="lead pJumbotron" >공지사항/자유게시판</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">

<nav class="navbar navbar-expand-lg navbar-light">
			<!-- ~줄보기 -->
        	<div style="float: right;">
				<select id="cntPerPage" name="sel" onchange="selChange()">
					<option value="5"
						<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
					<option value="10"
						<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
					<option value="15"
						<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
					<option value="20"
						<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
				</select>
			</div> <!-- 옵션선택 끝 -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">공지사항/자유게시판 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" method="post" action="/home/board">
      <input class="form-control mr-sm-2" name="keyword" type="search" value="${paging.keyword }" placeholder="제목을 입력하세요." aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
    </form>
  </div>
</nav>

<hr>
		<table class="table">
					<colgroup>
						<col width="10%">
						<col width="50%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>				
			<thead style="background-color: #014099; color: white; font-weight: bold;">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">날짜</th>
					<th scope="col">조회수</th>
					<th scope="col">공개여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardNoticeInfo }" var="boardNotice">
					<tr>
						<th scope="row">
							<button class="btn btn-warning">공지</button>
						</th>
						<td>
							<a href="/board/detailBoardNotice?boardCode=${boardNotice.boardCode }">
								${boardNotice.boardTitle }
							</a>
						</td>
						<td>관리자</td>
						<td>${boardNotice.regDate }</td>
						<td>${boardNotice.readCnt }</td>
						<td>
							전체공개														
						</td>
						<td>
						</td>
					</tr>
				</c:forEach>
				<c:forEach items="${boardList }" var="board">
					<tr>
					<c:choose>
						<c:when test="${board.isNotice eq 1 }">
							<th scope="row">
								<button class="btn btn-warning">공지</button>
							</th>
						</c:when>
						<c:otherwise>
							<th scope="row">${board.rn}</th>	<!-- -1은 공지사항 갯수만큼 추가.. -->
						</c:otherwise>
					</c:choose>
						<td>
						
							<a <c:if test="${board.isSecurity ne 1 }">
								href="/board/detailBoard?boardCode=${board.boardCode }"
								</c:if>
							<c:if test="${sessionScope.loginInfo.isAdmin.equals('Y') || sessionScope.loginInfo.memberCode eq board.regMember}">
								href="/board/detailBoard?boardCode=${board.boardCode }"
							</c:if>
							>
								${board.boardTitle }
							</a>
						</td>
						<td>${board.memberName }</td>
						<td>${board.regDate }</td>
						<td>${board.readCnt }</td>
						<td>
							<c:if test="${board.isSecurity eq 1}">
								비밀 게시물
							</c:if>
							<c:if test="${board.isSecurity ne 1}">
								전체공개
							</c:if>
														
						</td>
						<td>
						</td>
					</tr>
				</c:forEach>
		</table>
	
		
		
		<!-- 페이징 -->
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/home/board?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/home/board?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/home/board?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	
	
		<div class="row">
			<div class="offset-11 col-1">
				<button class="btn btn-primary" onclick="location.href='/board/writeBoard';">글쓰기</button>
			</div>
		</div>




	</div>	<!-- Audi3040 -->
</body>
</html>