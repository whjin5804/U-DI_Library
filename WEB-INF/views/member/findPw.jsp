<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    <p class="lead pJumbotron" >비밀번호 찾기</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">
<!-- jumbotron 끝 -->
<form action="/member/findPw2" method="post">
	<table class="table loginTable">
		<tr>
			<td class="text-bold">이름</td>
			<td class="text-right"><input type="text" name="memberName"></td>
		</tr>
		<tr>
			<td class="text-bold">E-mail(아이디)</td>
			<td class="text-right"><input type="text" name="memberEmail"></td>
		</tr>
	</table>
	<div class="login-buttons">
		<input type="submit" class="btn btn-primary login" value="전송">
	</div>
</form>
</div>
</body>
</html>