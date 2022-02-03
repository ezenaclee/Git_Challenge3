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
	<title>자주 묻는 질문 목록</title>
</head>
<body>
	<div>
		<div>
			<h1>자주 묻는 질문</h1>	
		</div>
		<div>
			<form action="${contextPath }/board/addNewFaq.do">
				<ul>
					<!-- 자주 묻는 질문 불러오는 for문 -->
				<%-- <c:forEach var="faq" items="${faqList }">
						<li>
							<a href="#">${notice} </a>
						</li>					
					</c:forEach> --%>
					<li><a href="#">질문 1</a></li>
					<li><a href="#">질문 2</a></li>
					<li><a href="#">질문 3</a></li>
					<li><a href="#">질문 4</a></li>
					<li><a href="#">질문 5</a></li>
					<li><a href="#">질문 6</a></li>
				</ul>
				
				<%-- <c:if test="만약에 로그인되어있고, 계정이 admin이라면"> --%>
					<input type="submit" value="자주묻는 질문 작성하기">
				<%-- </c:if> --%>
				
			</form>
			
		</div>
	</div>
</body>
</html>