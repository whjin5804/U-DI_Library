<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.theadBg{
	background-color: #014099;
	color: white;
}
</style>
</head>
<body>
<!-- 로그인을 해야만 여기로 올 수 있다고 해야겠음 -->
<div class="Audi3040">
	<!-- jumbyton -->
	<div class="jumbotron jumbotron-fluid headJubmotron">
		<div class="container">
			<h1 class="display-4 h1Jumbotron">대출 도서 확인</h1>
			<p class="lead pJumbotron" >현재 대출 받으려는 책 확인</p>
		</div>
	</div>
	<c:choose>
		<c:when test="${empty sessionScope.loginInfo }">
			로그인이 필요한 서비스 입니다
		</c:when>
		<c:otherwise>
		<div class="row justify-content-center">
			<div class="col-6">
				<form action="/rent/bookRent" method="post">
					<table class="table text-center">
						<caption style="color: red; caption-side: top;">※대여 내용을 확인해 주세요!</caption>
						<colgroup>
							<col width="20%">
							<col width="*">
						</colgroup>
						<tr>
							<th class="align-middle">빌리는 사람</th>
							<td>
								<input type="text" value="${sessionScope.loginInfo.memberName }" class="form-control" readonly>
								<input type="hidden" value="${sessionScope.loginInfo.memberCode }" name="rentMember">
							</td>
						</tr>
						<tr>
							<th class="align-middle">빌리는 책</th>
							<td>
								<input type="text" value="${bookVO.bookTitle }" readonly class="form-control">
								<input type="hidden" value="${bookVO.bookCode }" name="rentBookCode">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								${sessionScope.loginInfo.memberName }님의 등급은 ${memberLevelInfo.levelName }이고 ${memberLevelInfo.availableRentDate }일 대여 가능합니다.
								(현재 ${countRentedBook }권 대여중)
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<c:choose>
									<c:when test="${countRentedBook lt memberLevelInfo.availableRentBookNumber  }">
										<input type="submit" value="대여" class="btn btn-success" >
									</c:when>
									<c:otherwise>
										현재 대여가능한 만큼의 책을 모두 빌리셨습니다. 반납 후 대여 바랍니다.
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="col-4 border-left">
				<table class="table text-center">
					<caption class="text-center" style="caption-side: top;">
						등급 별 대여 가능 일 수
					</caption>
					<thead class="theadBg">
						<tr>
							<th>레벨 (레벨명)</th>
							<th>대여가능날짜</th>
							<th>대여가능도서수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${levelInfoList }" var="levelInfo">
							<tr>
								<th class="text-left" style="padding-left: 20px;">${levelInfo.memberLevel } (${levelInfo.levelName })</th>
								<td>${levelInfo.availableRentDate } 일</td>
								<td>${levelInfo.availableRentBookNumber } 권</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<%-- 빌리는 사람 : ${sessionScope.loginInfo.memberName }
			빌리는 책 : ${bookVO.bookTitle }
			<form action="/rent/bookRent" method="post">
				<input type="hidden" value="${sessionScope.loginInfo.memberCode }" name="rentMember"><br>
				<input type="hidden" value="${bookVO.bookCode }" name="rentBookCode"><br>
				<input type="submit" value="대여">
			</form> --%>
		</div>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>