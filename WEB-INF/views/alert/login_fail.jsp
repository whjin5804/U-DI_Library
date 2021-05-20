<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:choose>
	<c:when test="${empty findSuccess}">
		<script type="text/javascript">
			alert('입력하신 회원정보가 없습니다.');
			location.href = '/home/login';
		</script>
	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test="${failCnt < 5 }">
				<script type="text/javascript">
					const failCnt = ${failCnt + 1};
					alert('로그인 정보를 확인해 주세요.\n' + failCnt + '회 잘못 입력하였습니다. 5회 이상 입력 오류 시 계정이 잠깁니다.');
					location.href = '/home/login';
				</script>
			</c:when>
			<c:otherwise>
				<script type="text/javascript">
					alert('5회 이상 비밀번호를 잘못 입력하여 계정이 잠겼습니다.\n이메일로 임시비밀번호를 발송하였으니\n발송된 비밀번호로 로그인하여 비밀번호를 변경해 주세요.');
					location.href = '/home/login';
				</script>
			</c:otherwise>
		</c:choose>
	</c:otherwise>
</c:choose>
</head>
<body>

</body>
</html>