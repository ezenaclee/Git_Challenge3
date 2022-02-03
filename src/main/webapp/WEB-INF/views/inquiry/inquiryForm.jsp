<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>글쓰기</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		function readURL(input, index) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				// onload로 파일을 모두 읽어들이면 바로 function이 실행됨
				reader.onload = function(e) {
					// 첨부파일이 img에서 보일 수 있도록 설정
					$('#preview' + index).attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		
		function backToList(obj) {
			obj.action = "${contextPath}/inquiry/inquiryList.do";
			obj.submit();
		}
		
		var cnt = 0;
		function fn_addFile() {
			cnt++;
			var innerHtml = "";
			innerHtml += "<tr width='100%' align='center'>";
			innerHtml += "<td>" 
						 + "<input type='file' name='file" + cnt + "' onchange='readURL(this," + cnt + ")'>" 
						 + "</td>";
			innerHtml += "<td>" 
				 		 + "<img id='preview" + cnt + "' src='#' width='480px' height='360px'>" 
				 		 + "</td>";
			innerHtml += "</tr>";
			
			$("#tb_newImage").append(innerHtml);
		}
	</script>
</head>
<body>
	<h1 style="text-align: center;" >새 글 쓰기</h1>
			<%-- /addArticle.do로해서 새글 등록 요청 --%>
	<form action="${contextPath}/inquiry/addNewInquiry.do" name="inquiryForm" method="post" 
			enctype="multipart/form-data">	<%-- multipart/form-data: 파일 업로드 기능 --%>
		
		<table border="0" align="center">
			<tr>
				<td align="right">작성자: </td>
				<td colspan="2" align="center">${rocketInfoVO.name }</td>
			</tr>
			<tr>
				<td align="right">글제목: </td>
				<td colspan="2">
					<input type="text" size="67" maxlength="500" name="inquiry_title" placeholder="글제목">
				</td>
			</tr>
			<tr>
				<td align="right" valign="top"><br>글내용: </td>
				<td colspan="2">
					<textarea name="inquiry_content" rows="20" cols="100" maxlength="4000" placeholder="글을 작성해주세요."></textarea>
				</td>
			</tr>
			<tr>
				<td align="right"><br>이미지파일 첨부: </td><br>
				<td colspan="2">
					<input type="file" name="imageFileName" onchange="readURL(this, 0)">
				</td>
				<%-- 첨부한 이미지를 미리 보기로 표시함 --%>
				<td><img id="preview0" alt="이미지" src="#" width="480px" height="360px" ></td>
			</tr>
			
			
			<tr>
				<td colspan="3">
					<table width="100%" border="0" id="tb_newImage"></table>
				</td>
			</tr>
			
			<tr height="200px">
				<td colspan="3"></td>
			</tr>
			
			<tr>
				<td align="right">이미지파일 첨부</td>
				<td align="left" colspan="2"><input type="button" value="새 이미지 파일 추가하기" onclick="fn_addFile()"></td>
			</tr>
			
			<tr>
				<td colspan="4">
					<div id="d_file"></div>
				</td>
			</tr>
			
			<tr>
				<td align="right"></td>
				<td colspan="2">
					<input type="submit" value="글쓰기">
					<input type="button" value="목록보기" onclick="backToList(this.form)">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>







