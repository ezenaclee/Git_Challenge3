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
	<title>공지사항 목록</title>
</head>
<body>
	<div style="">
		<div style=" display: inline-block;">
			<h1>공지사항</h1>
		</div>
		
		<div style="display: inline-block;;">
			<form action="${pageContext }/board/noticeView.do" method="get">
				<ul>
					<li>
						<a href="#">공지사항 1</a>
					</li>
					<li>
						<a href="#">공지사항 2</a>
					</li>
					<li>
						<a href="#">공지사항 3</a>
					</li>
					<li>
						<a href="#">공지사항 3</a>
					</li>
				
				<!-- 공지사항 불러오는 for문 -->
				<%-- <c:forEach var="notice" items="${ }">
					<li>
						<a href="#">${notice} </a>
					</li>					
				</c:forEach> --%>
				
				</ul>
				
				
				<input type="button" onclick="fn_moreView()" value="더보기">
				<%-- <c:if test="만약에 로그인되어있고, 계정이 admin이라면"> --%>
					<input type="submit" value="공지사항 작성하기">
				<%-- </c:if> --%>
				
			</form>
			
			
		</div>
	</div>
	<!-- 페이지 넘버 (이전 1~10 다음)함수 -->
	<%-- <div class="cls2" >
		<c:if test="${totArticles != null }">
			<c:choose>
				<c:when test="${totArticles > 100 }">		글개수가 100개 초과인 경우
					<c:forEach var="page" begin="1" end="10" step="1">
						<c:if test="${section > 1 && page ==1}">
							<a class="no_underLine" href="${contextPath }/board2/listArticles.do?section=${section-1}&pageNum=${(section-1)*10 + 1}">&nbsp;이전</a>
						</c:if>
							<a class="no_underLine" href="${contextPath }/board2/listArticles.do?section=${section}&pageNum=${page}">${(section-1)*10 + page}</a>
						<c:if test="${ page == 10}">
							<a class="no_underLine" href="${contextPath }/board2/listArticles.do?section=${section+1}&pageNum=${section*10 + 1}">&nbsp;다음</a>
						</c:if>	
					</c:forEach>
				</c:when>
				<c:when test="">							등록된 글개수가 100개인 경우
					<c:forEach var="page" begin="1" end="10" step="1">
						<a class="no_underLine" href="#"></a>
					</c:forEach>
				</c:when>
				
				<c:when test="${totArticles < 100 }">							등록된 글개수가 100개 미만인 경우
					<c:forEach var="page" begin="1" end="${totArticles/10 + 1 }" step="10">
						<c:choose>
							<c:when test="${page == pageNum }">
								<a class="sel-page" href="${contextPath }/listArticles.do?section=${section}&pageNum=${page}">${page }</a>
							</c:when>
							<c:otherwise>
								<a class="no_underLine" href="${contextPath }/listArticles.do?section=${section}&pageNum=${page}">${page }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:when>
			</c:choose>
		</c:if>
	</div> --%>
</body>
</html>