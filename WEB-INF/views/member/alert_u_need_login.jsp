<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	let isTrue = confirm('로그인이 필요한 서비스입니다.\n로그인화면으로 이동하시겠습니까?')
	if(isTrue){
		location.href='/home/login';
	}
	else{
		location.href='/home/board';
	}

</script>
</head>
<body>

</body>
</html>