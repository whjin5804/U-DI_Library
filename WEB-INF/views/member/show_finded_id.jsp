<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.text-right{
	text-align: right;
}
.login-buttons{
	text-align: center;
	margin-bottom: 5px;
	margin-top: 30px;
}
.btn-secondary{
	width: 120px;
}
</style>
</head>
<body>
<div class="audi3040">
<!-- jumbotron -->
<div class="jumbotron jumbotron-fluid headJubmotron">
  <div class="container">
    <h1 class="display-4 h1Jumbotron">로그인</h1>
    <p class="lead pJumbotron" >아이디, 비밀번호 입력</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">
<!-- jumbotron 끝 -->
<c:choose>
	<c:when test="${empty memberEmail}">
		<div class="text-center">가입 정보를 찾을 수 없습니다.</div>
	</c:when>
	<c:otherwise>
		<div class="text-center">회원님의 아이디는 ${memberEmail }입니다.</div>
	</c:otherwise>
</c:choose>
<div class="login-buttons">
	<input class="btn btn-secondary" onclick="location.href='/home/login';" value="로그인하기">
	<input class="btn btn-secondary" onclick="location.href='/member/findPw';" value="비밀번호 찾기">
</div>
</div>
</body>
</html>