<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 창</title>
	<c:choose>
		<c:when test="${param.result == 'loginFailed' }">
			<script type="text/javascript">
				window.onload = function() {
					alert("아이디나 비밀번호가 틀립니다. 다시 로그인 하세요!");
				}
			</script>
		</c:when>
	</c:choose>
</head>
<body>
	<h1>로그인</h1>
    <fieldset style="width:250px;">
		<form method='post' action='${contextPath }/rocketInfo/login.do'>
	        <p>아이디<br> <input name='id' type='text'> </p>
	        <p>비밀번호<br> <input name='password' type='password'> </p>
	        <input type='submit' value='로그인'> 
	        <input type='reset' value='카카오톡으로 로그인하기'>
	        <a href='#'>아이디/비밀번호 찾기</a>
	        <a href='#'>계정이 없으신가요?</a>
		</form>
    </fieldset>
</body>
</html>