<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<title>메인화면</title>
</head>
<body>
	<h2 style="text-align: center">메인페이지</h2>
	<table align="center" width="50%">
		<c:if test="${isLogOn == true && rocketInfoVO != null }">
			<tr>
				<td colspan="3">
					<h2 style="text-align: center;">환영합니다. ${rocketInfoVO.name }님</h2>
				</td>
			</tr>
		</c:if>
		<tr align="center">
			<c:choose>
				<c:when test="${isLogOn == true && rocketInfoVO != null }">
					<td width="15%"><a href="${contextPath }/rocketInfo/logout.do">로그아웃</a></td>
					<td width="15%"><a href="${contextPath }/starInfo/joinStarForm.do">스타등록</a></td>
				</c:when>
				<c:otherwise>
					<td width="15%"><a href="${contextPath }/rocketInfo/loginForm.do">로그인</a></td>
					<td width="15%"><a href="${contextPath }/rocketInfo/joinForm.do">회원가입</a></td>
				</c:otherwise>
			</c:choose>
			<td width="15%"><a href="${contextPath }/inquiry/inquiryList.do">1:1문의</a></td>
		</tr>
	</table>
</body>
</html>