<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/member/jquery.validate.js" type="text/javascript"></script>
<script src="/resources/js/member/member_info.js?ver=02" type="text/javascript"></script>
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
	height: 30px;
}
input[required]{
	width: 300px;
}
input{
	border: none;
	background-color: #FAFAFA;
}
.addr{
	width: 300px;
}
.btn-color{
	background-color: #014099;
}
.btn-color-gray{
	background-color: #6c757d;
	margin-left: 20px;
}
.btn-color-gray:hover{
	background-color: #c71818;
}
</style>
</head>
<body>
<!-- jumbyton -->
<div class="jumbotron jumbotron-fluid headJubmotron" >
  <div class="container">
    <h1 class="display-4 h1Jumbotron" style="">회원 정보</h1>
    <p class="lead pJumbotron"  style="">회원 정보 수정/삭제</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">
<form action="/member/updateMemberInfo" method="post" id="memberInfoForm">
	<input type="hidden" name="memberCode" value="${selectMemberInfo.memberCode }">
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
					<td>
					<input type="text" id="memberEmail" name="memberEmail" readonly value="${selectMemberInfo.memberEmail }">
					아이디는 수정할 수 없습니다.
					</td>
				</tr>
				<tr>
					<td>
					비밀번호
					</td>
					<td><input type="password" id="memberPassword" name="memberPassword"></td>
				</tr>
				<tr>
					<td>
					비밀번호 확인
					</td>
					<td><input type="password" id="memberPassword2" name="memberPassword2"></td>
				</tr>
				<tr>
					<td>
					이름
					</td>
					<td><input type="text" id="memberName" name="memberName" value="${selectMemberInfo.memberName }"></td>
				</tr>
				<tr>
					<td>
					주소
					</td>
					<td>
					<input type="text" class="addr" id="memberAddr" name="memberAddr" readonly onclick="openPostCode();" value="${selectMemberInfo.memberAddr }">
					<button class="btn btn-primary btn-color" type="button" onclick="openPostCode();">주소검색</button>
					</td>
				</tr>
				<tr>
					<td>
					상세주소
					</td>
					<td><input type="text" id="memberAddrDetail" name="memberAddrDetail" value="${selectMemberInfo.memberAddrDetail }"></td>
				</tr>
				<tr>
					<td>
					휴대전화
					</td>
					<td><input type="text" id="memberTel" name="memberTel" value="${selectMemberInfo.memberTel }">(ex. 01011112222)</td>
				</tr>
				<tr>
					<td>자차번호</td>
					<td><input type="text" id="memberCarNum" name="memberCarNum" value="${selectMemberInfo.memberCarNum }">(ex. 1234)</td>
				</tr>
			</table>
			<div class="join">
				<button class="btn btn-primary btn-color" type="submit">수정완료</button>
				<button class="btn btn-primary btn-color-gray" type="button" onclick="location.href='/member/deleteMemberPage';">회원탈퇴</button>
			</div>
		</div>
	</div>
</form>
</body>
</html>