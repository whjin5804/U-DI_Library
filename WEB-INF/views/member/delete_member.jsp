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
.btn-secondary{
	width: 110px;
	margin-top: 30px;
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
    <h1 class="display-4 h1Jumbotron">탈퇴하기</h1>
    <p class="lead pJumbotron" >아이디, 비밀번호 입력</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">
<!-- jumbotron 끝 -->
<div class="audi3040">
	<form action="/member/deleteMemberInfo" method="post">
		<h4 class="table loginTable">정말 탈퇴하시겠습니까?</h4>
			<table class="table loginTable">
				<tr>
					<td>ID</td>
					<td><input type="text" name="memberEmail" placeholder="ID"></td>
				</tr>
				<tr>
					<td>PW</td>
					<td><input type="password" name="memberPassword" placeholder="PASSWORD"></td>
				</tr>
			</table>
			<div class="login-buttons">
				<button type="submit" class="btn btn-secondary login">탈퇴하기</button>
			</div>
	</form>
</div>
</div>
</body>
</html>