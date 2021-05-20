<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#video {
     position: absolute;
     top: 0px;
     left: 0px;
     min-width: 100%;
     min-height: 100%;
     width: auto;
     height: auto;
     z-index: -1;
     overflow: hidden;
}
</style>
</head>
<body>
여기 홈화면 아닙니다
여기 홈화면 아닙니다
여기 홈화면 아닙니다
여기 홈화면 아닙니다
여기 홈화면 아닙니다
여기 홈화면 아닙니다
여기 홈화면 아닙니다
home/home 으로 가세요

   <video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
      <source src="/resources/video/movie.mp4">
   </video>
   <input type="button" class="btn btn-primary" value="테스트" onclick="location.href='/home/testPage';">
</body>
</html>