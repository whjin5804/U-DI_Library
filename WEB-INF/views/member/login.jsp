<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/member/login.js?ver=07" type="text/javascript"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>


<style type="text/css">
.loginTable {
	margin: 0 auto;
	margin-top: 50px;
	width: 500px;
}
.kakaoButton{
	background: #014099;
	color: white;
	border-radius: 16px;
	border-style: none;
	width: 220px;
	height: 30px;
}
.login{
	width: 222px;
	height: 46px;
	background-color: #014099;
	margin-top: 30px;
}
.btn-secondary{
	width: 110px;
}
input{
	border: none;
	background-color: #FAFAFA;
}
.text-right{
	text-align: right;
}
.login-buttons{
	text-align: center;
	margin-bottom: 5px;
}
.text-bold{
	font-weight: bold;
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

<form action="/member/login" method="post">
<!-- 로그인 새로운 테이블 -->
<table class="table loginTable">
	<tr>
		<td class="text-bold">아이디(이메일)</td>
		<td class="text-right"><input type="email" id="memberEmail" name="memberEmail" placeholder="ID" required></td>
	</tr>
	<tr>
		<td class="text-bold">비밀번호</td>
		<td class="text-right"><input type="password" id="memberPassword" name="memberPassword" placeholder="PASSWORD" required></td>
	</tr>
	<tr>
		<td colspan="2" class="text-right"><input type="checkbox" id="idSaveCheck"> 아이디 저장</td>
	</tr>
</table>
<div class="login-buttons">
	<button type="submit" class="btn btn-primary login">로그인</button>
</div>
<div class="login-buttons">
	<a id="kakao-login-btn" href="javascript:loginFormWithKakao()">
		<img
		  src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
		  width="222"
		/>
	</a>
</div>
<div class="login-buttons">
	<button type="button" class="btn btn-secondary" onclick="location.href='/member/findId';">ID찾기</button>
	<button type="button" class="btn btn-secondary" onclick="location.href='/member/findPw';">PW찾기</button>
</div>
	
</form>
</div>
<script src="/resources/js/member/login_kakao.js?ver=32" type="text/javascript"></script>
</body>
</html>
