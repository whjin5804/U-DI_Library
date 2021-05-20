<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.basic{
	width: 800px;
	margin: 0 auto;
}
.space{
	margin: 0 20px;
}
.join{
	text-align: center;
}
.button{
	background: #014099;
	color: white;
	border-radius: 16px;
	border-style: none;
	width: 120px;
	height: 30px
}
input[required]{
	width: 300px;
}
input{
	border: none;
	background-color: #FAFAFA;
}
.btn-color{
	background-color: #014099;
}
</style>
</head>
<body>
<!-- jumbyton -->
<div class="jumbotron jumbotron-fluid headJubmotron" >
  <div class="container">
    <h1 class="display-4 h1Jumbotron" style="">마이 페이지</h1>
    <p class="lead pJumbotron"  style="">기본 정보</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">
	<div class="row justify-content-center basic">
		<div class="col">
			<div class="row">
				<div class="col">
					<h3>기본 정보</h3>
				</div>
			</div>
			<table class="table">
				<tr>
					<td>
					아이디(이메일)
					</td>
					<td><input type="text" id="memberEmail" name="memberEmail" readonly value="${selectBasicMemberInfo.memberEmail }"></td>
				</tr>
				<tr>
					<td>
					등급
					</td>
					<td><input type="text" id="memberName" name="memberName" value="${selectBasicMemberInfo.memberLevel }" readonly></td>
				</tr>
				<tr>
					<td>
					포인트
					</td>
					<td><input type="text" id="memberName" name="memberName" value="${selectBasicMemberInfo.memberPoint }" readonly></td>
				</tr>
				<tr>
					<td>
					이름
					</td>
					<td><input type="text" id="memberName" name="memberName" value="${selectBasicMemberInfo.memberName }" readonly></td>
				</tr>
				<tr>
					<td>
					주소
					</td>
					<td>
					<input type="text" id="memberAddr" name="memberAddr" readonly onclick="openPostCode();" value="${selectBasicMemberInfo.memberAddr }" readonly>
					</td>
				</tr>
				<tr>
					<td>
					상세주소
					</td>
					<td><input type="text" id="memberAddrDetail" name="memberAddrDetail" value="${selectBasicMemberInfo.memberAddrDetail }" readonly></td>
				</tr>
				<tr>
					<td>
					휴대전화
					</td>
					<td><input type="text" id="memberTel" name="memberTel" value="${selectBasicMemberInfo.memberTel }" readonly>(ex. 01011112222)</td>
				</tr>
				<tr>
					<td>자차번호</td>
					<td><input type="text" id="memberCarNum" name="memberCarNum" value="${selectBasicMemberInfo.memberCarNum }" readonly>(ex. 1234)</td>
				</tr>
			</table>
			<div class="join">
				<button class="btn btn-primary btn-color" onclick="location.href='/member/memberInfo';">회원정보수정</button>
			</div>
		</div>
	</div>
</body>
</html>