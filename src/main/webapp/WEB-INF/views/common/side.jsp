<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		.no_underline {
			text-decoration: none;
		}
	</style>
</head>
<body>
	<h1>
		<a href="${contextPath }/member/listMembers.do" class="no_underline" >멤버 리스트</a><br><br><br>
		<a href="${contextPath }/board/listArticles.do" class="no_underline">게시글 리스트</a><br><br><br>
		<a href="#" class="no_underline">상품 리스트</a><br><br><br>
	</h1>
</body>
</html>