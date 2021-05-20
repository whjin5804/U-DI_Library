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
	<c:when test="${empty pw}">
		<div class="text-center">가입 정보를 찾을 수 없습니다. 이름과 이메일을 확인해 주세요.</div>
	</c:when>
	<c:otherwise>
		<div class="text-center">회원님의 메일로 임시비밀번호를 발급하였습니다.</div>
	</c:otherwise>
</c:choose>
</div>
</body>
</html>