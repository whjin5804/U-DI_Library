<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/admin/admin_update_member_info.css?ver=1" rel="stylesheet">
<style>

</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/js/admin/admin_update_member_info.js?ver=234"></script>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="/admin/adminUpdateMemberInfo?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
</head>
<body>

<!-- jumbyton -->
<div class="jumbotron jumbotron-fluid headJubmotron" >
  <div class="container">
    <h1 class="display-4 h1Jumbotron" style="">회원 관리</h1>
    <p class="lead pJumbotron"  style="">회원 정보 수정/삭제</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">

<form class="form-inline my-2 my-lg-0 formRight" method="post" action="/admin/adminUpdateMemberInfo">
	<div class="search">
		<select name="condition" id="condition" class="form-control">
				<option value="MEMBER_NAME" <c:if test="${condition eq 'memberName' }">selected</c:if>>성명</option>
				<option value="MEMBER_EMAIL" <c:if test="${condition eq 'memberEmail' }">selected</c:if>>이메일</option>
				<option value="MEMBER_ADDR" <c:if test="${condition eq 'memberAddr' }">selected</c:if>>주소</option>
				<option value="MEMBER_TEL" <c:if test="${condition eq 'memberTel' }">selected</c:if>>전화번호</option>
		</select>
		<input class="form-control mr-sm-2" name="keyword" type="search" value="${keyword }" placeholder="검색어를 입력하세요." aria-label="Search">
		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
	</div>
</form>

	<table class="table">
		<thead>
		    <tr>
		      <td scope="col">회원</td>
		      <td scope="col">성명</td>
		      <td scope="col">이메일</td>
		      <td scope="col">주소</td>
		      <td scope="col">상세주소</td>
		      <td scope="col">차번호</td>
		      <td scope="col">전화번호</td>
		      <td scope="col"></td>
		      <td scope="col"></td>
		      <td scope="col"></td>
		    </tr>
	    </thead>

		<c:choose>
			<c:when test="${empty memberList }">
				<tbody>
					<tr>
						<td colspan="12"><div class="nothing">검색결과가 존재하지 않습니다.</div></td>
					</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${memberList}" var="member">
					<tbody>
						<tr class="${member.memberCode }">
							<td>
							<c:if test="${member.isAdmin eq 'Y'}">
								관리자
							</c:if>
							<c:if test="${member.isAdmin eq 'N'}">
								<c:if test="${member.isKakao eq 'Y'}">카카오</c:if>사용자
							</c:if>
							</td>
							<td><input type="text" value="${member.memberName }"
								name="memberName"></td>
							<td><input type="text" value="${member.memberEmail }"
								name="memberEmail"></td>
							<td><input type="text" value="${member.memberAddr }"
								name="memberAddr"></td>
							<td><input type="text" value="${member.memberAddrDetail }"
								name="memberAddrDetail"></td>
							<td><input type="text" value="${member.memberCarNum }"
								name="memberCarNum"></td>
							<td><input type="text" value="${member.memberTel }"
								name="memberTel"></td>
							<td><input type="button" value="변경" class="form-control changeBtn" 
								onclick="updateMember('${member.memberCode}')"></td>
							<td><input type="button" value="삭제" class="form-control deleteBtn" 
								onclick="deleteMember('${member.memberCode}', this)"></td>
							<td><input type="button" value="관리자 등록" class="form-control deleteBtn" 
								onclick="updateMemberToAdmin('${member.memberCode}', this)"></td>
						</tr>
					</tbody>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
		<!-- 페이징 처리 -->
	<div class="paging">
		<c:if test="${paging.startPage != 1 }">
			<a href="/admin/adminUpdateMemberInfo?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					${p }
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/admin/adminUpdateMemberInfo?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage }">
			<a href="/admin/adminUpdateMemberInfo?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>

</body>
</html>