<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="pageContext" value="${pageContext.servletContext.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>공지사항 상세보기(수정하기)</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		function fn_modify_article() {
			//id가 관리자면 보이는 수정하기 버튼 클릭 이후에 게시물 수정한 다음 '수정등록 버튼'에 쓰이는 기능
		}
		function backToList() {
			//id가 관리자면 보이는 수정하기 버튼 클릭 이후에 수정 않고 '취소 버튼'에 쓰이는 기능
		}
		function fn_enable() {
			//id가 관리자면 보이는 수정하기 버튼 클릭시 숨긴버튼 보이게, 필요없는 버튼 안보이게 하는 기능
		}
		function fn_remove_article() {
			//id가 관리자면 보이는 '삭제하기 버튼' 클릭시 게시물 삭제하는 기능
		}
			
	</script>
</head>
<body>
	<div>
		<h1>공지사항 상세보기</h1>
	</div>
	<div>
		<form action="#" method="post" enctype="multipart/form-data">
			<table >
				<tr>
					<td>
						글번호
					</td>
					<td>
						<input type="text" placeholder="공지사항 글번호">
						<input type="hidden" name="noticeNO">						
					</td>
				</tr>
				<tr>
					<td>
						작성자 아이디
					</td>
					<td>
						<input type="text" value="admin" disabled>
					</td>
				</tr>
				
				<tr>
					<td>
						공지사항 제목  
					</td>
					<td>
						<input type="text" placeholder="ex_공지사항 제목">
					</td>
				</tr>
				
				<tr>
					<td>
						내용
					</td>
					<td>
						<textarea rows="20" cols="60" disabled>ex_Text</textarea>
					</td>
				</tr>
				
				<%-- <c:if test="noticeID에 연결된 이미지파일이 있다면"> --%>
				<tr>
					<td>
						이미지 or 파일
					</td>
					<td>
						<img alt="이미지" src="#" width="400px" height="200px" border="1px solid black">
					</td>
				</tr>
				<%-- </c:if> --%>
				<%-- <c:if test="로그인되어있고 계정이 admin이라면"> --%>
				
				<tr id="tr_btn_modify">
					<td>
						<input type="button" value="수정등록" onclick="fn_modify_notice()">
						<input type="button" value="취소" onclick="backToList()">
					</td>
				
				</tr>
				
				<tr id="tr_btn">
					<td colspan="2">
						<input type="button" value="수정하기" onclick="fn_enable()">
						<input type="button" value="삭제하기" onclick="fn_remove_notice()">						
						<input type="button" value="목록보기" onclick="fn_backToList()">
					</td>
				</tr>
					
				<%-- </c:if> --%>
				
			</table>
			
			
		</form>
		
		
	</div>
	
</body>
</html>