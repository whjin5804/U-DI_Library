<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/facility/lib_lecture.css?ver=1">
<style type="text/css">
.modal-dialog-centered{
	margin: 1.75rem auto;
}
</style>
<script type="text/javascript">
/* 페이지 로딩 후 실행 */ 
$(document).ready(function(){ 
	$(document).on('click', '.lectureName', function() {
		let lectureCode = $(this).attr('id');
		detailLecture(lectureCode);
	}); 
	
	  $('[type="date"].min-today').prop('min', function(){
	        return new Date().toJSON().split('T')[0];
	    });
	

}); /*로딩화면 끝*/ 
/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/ 
/* 함수선언 영역*/ 
(function($){ 
	
	
	
	detailLecture = function(lectureCode){ 
            $.ajax({ 
            url: '/facility/selectDetailLecture', //요청경로, 어떤 controller로갈까 
            type: 'post', 
            data:{'lectureCode':lectureCode}, //필요한 데이터 
            success: function(result) { 
            	$('.detailHeadModal').empty();  
            	$('.detailBodyModal').empty();
               
				let str = '<div>' + result.lectureName + '</div>'; 
				$('.detailHeadModal').prepend(str);
				
				let body = '<div> 진행시간 : ' + result.lectureTime + '시간</div>'
				body += '<div> 강연자 : ' + result.lecturer + '</div>'
				if(result.lecturePlace == 'STUDY_ROOM_1'){
					body += '<div id="' + result.lecturePlace + '"> 강연장소 : 대토론실</div>'
				}
				else if(result.lecturePlace == 'STUDY_ROOM_2'){
					body += '<div id="' + result.lecturePlace + '"> 강연장소 : 미디어실1</div>'
				}
				$('.detailBodyModal').append(body);
				
				
            }, 
            error: function(){ 
             //ajax 실행 실패 시 실행되는 구간 
               alert('실패'); 
            } 
      }); //ajax 
     };//aaa() 

     selChange = function() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="/facility/libEvent?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}

})(jQuery); /*함수선언영역 끝*/ 
</script>
</head>
<body>
<div class="Audi3040">
<!-- jumbotron -->
<div class="jumbotron jumbotron-fluid headJubmotron">
  <div class="container">
    <h1 class="display-4 h1Jumbotron">시설 이용</h1>
    <p class="lead pJumbotron" >행사 소개</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">
<!-- jumbotron 끝 -->

<!-- search바 -->
<form action="/facility/searchLecture" method="post" class="ws-validate">
	<div class="row form-row" id="searchBar">
		<div class="col-1">
			<select name="lectureState">
				<option value="0">진행상태</option>
				<option value="1" <c:if test="${lectureVO.lectureState eq 1}">selected</c:if>>예정</option>
				<option value="2" <c:if test="${lectureVO.lectureState eq 2}">selected</c:if>>진행 중</option>
				<option value="3" <c:if test="${lectureVO.lectureState eq 3}">selected</c:if>>종료</option>
			</select>
		</div>
		<div class="col-2.5">
			시작
			<input type="date" name="startDate" class="min-today" value="${lectureVO.startDate }" data-date-split-input="true"> 

		</div>
		<div class="col-1" style="text-align: center;">
			~
		</div>
		<div class="col-2.5">
			종료
			<input type="date" name="endDate" class="min-today" value="${lectureVO.endDate }"  data-date-split-input="true" >
		</div>
		<div class="col-2 searchName">
			<input type="text" value="${lectureVO.searchName }" placeholder="행사명을 기입하세요" name="searchName">
		</div>
		<div class="col-1 btnDiv"  style="margin-top: 0;">
			<button type="submit" class="btn btn-primary">검색</button>
		</div>
	</div> <!-- #searchBar -->
</form>
		<div style="float: left;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 -->
	
	
	
<!-- 행사리스트 -->	
	<table class="table">
		<tr style="font-weight: bold;">
			<td scope="col">행사명</td>
			<td scope="col">날짜</td>
			<td scope="col">강연시간</td>
			<td scope="col">상태</td>
			<td scope="col">신청방법</td>
		</tr>
		<c:forEach items="${lectureList }" var="lecture" varStatus="status">
			<tr>
				<td style="text-align: left; padding-left: 290px;">
				<a onclick="" class="lectureName" id="${lecture.lectureCode }" data-toggle="modal" data-target="#detailModal">
					${lecture.lectureName }
				</a>
				</td>
				<td>
					<fmt:formatDate value="${lecture.lectureDate }" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					${lecture.lectureTime }시간
				</td>
				<td>
				<c:choose>
					<c:when test="${lecture.lectureState eq 1}">
						예정
					</c:when>
					<c:when test="${lecture.lectureState eq 2}">
						진행 중
					</c:when>
					<c:when test="${lecture.lectureState eq 3}">
						종료
					</c:when>
				</c:choose>				
				
				</td>
				<td>오프라인</td>
			</tr>
		</c:forEach>
	</table>
	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/facility/libEvent?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/facility/libEvent?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/facility/libEvent?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	
	



<!-- Modal -->
<div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content" style="width: 600px; height: 250px;background-image: none;">
      <div class="modal-header detailHeadModal" id="lectureModalHead">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body detailBodyModal">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</div>
</body>
</html>