<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" />
<c:set var="inquiryList" value="${inquiryMap.inquiryList }" />
<c:set var="totalInquiry" value="${inquiryMap.totalInquiry }" />
<c:set var="section" value="${inquiryMap.section }" />
<c:set var="pageNum" value="${inquiryMap.pageNum }" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<title>1:1 문의 게시판</title>
	<script type="text/javascript">
		function fn_inquiryForm(isLogOn, inquiryForm, loginForm) {
			if (isLogOn != '' && isLogOn != 'false') {
				location.href = inquiryForm;
			}
			else {
				alert("로그인 후 글쓰기가 가능합니다.");
				// 로그인이 완료되면 action에 지정한 inquiryForm으로 이동함
				location.href = loginForm + '?action=/inquiry/inquiryForm.do';
			}
		}
	</script>
	<style type="text/css">
		.cls1 {text-decoration: none;}
		.cls2 {text-align: center; font-size: 30px;}
		.no_underLine {text-decoration: none;}
		.sel-page {text-decoration: none; color:red;}
	</style>
</head>
<body>
	<div>
		<h1>1:1 문의 게시판</h1>
	</div>
		
	<div align="right" style="display: block; width: 80%; margin-left: 10%;" > 
		<a href="javascript:fn_inquiryForm('${isLogOn}',
										   '${contextPath}/inquiry/inquiryForm.do', 
										   '${contextPath}/rocketInfo/loginForm.do')">
			문의등록
		</a>
	</div>
	<table align="center" border="1" width="80%">
		<tr height="10" align="center" bgcolor="lightblue">
			<td witdh="5%">글번호</td>
			<td witdh="10%">작성자</td>
			<td witdh="60%">제목</td>
			<td witdh="15%">작성일</td>
		</tr>
		<c:choose>
			<c:when test="${empty inquiryList }">
				<tr height="10">
					<td colspan="4">
						<p>
							<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:when test="${not empty inquiryList }">
				<%-- inquiryList로 포워딩된 글목록 --%> 
				<c:forEach var="inquiryVO" items="${inquiryList }" varStatus="inquiryNum">
					<tr align="center" >
						<td witdh="5%">${inquiryNum.count }</td>
						<td witdh="10%">${inquiryVO.id }</td>
						<td witdh="45%" align="left">
							<span style="padding-right: 30px"></span>
							<c:choose>
								<c:when test="${inquiryVO.level > 1 }">
									<c:forEach begin="2" end="${inquiryVO.level }" step="1">
										<span style="padding-left: 20px"></span>
									</c:forEach>
									<span style="font-size: 12px">[답변]</span>
									<a class="cls1" href="${contextPath}/inquiry/inquiryVeiw.do?inquiry_cd=${inquiryVO.inquiry_cd}">
										${inquiryVO.inquiry_title }
									</a>
								</c:when>
								<c:otherwise>
									<a class="cls1" href="${contextPath}/inquiry/inquiryVeiw.do?inquiry_cd=${inquiryVO.inquiry_cd}">
										${inquiryVO.inquiry_title }
									</a>
								</c:otherwise>
							</c:choose>
						</td>
						<td witdh="10%">
							<fmt:formatDate value="${inquiryVO.write_date }"/>
						</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<div class="cls2">
		<c:if test="${totalInquiry != 0 && totalInquiry != null }">
			<c:choose>
				<c:when test="${totalInquiry > 100 }">		<!-- 글개수가 100개 초과인 경우 -->
					<c:forEach var="page" begin="1" end="10" step="1" >
						<c:if test="${section > 1 && page == 1 }">
							<a class="no-uline" href="${contextPath}/inquiry/inquiryList.do?section=${section - 1}&pageNum=${(section - 1) * 10 + 1}">&nbsp;이전</a>
						</c:if>
						<a href="${contextPath}/inquiry/inquiryList.do?section=${section}&pageNum=${page}">${(section - 1) * 10 + page }</a>
						<c:if test="${page == 10 }">
							<a class="no-uline" href="${contextPath}/inquiry/inquiryList.do?section=${section + 1}&pageNum=${section * 10 + 1}">&nbsp;다음</a>
						</c:if>
					</c:forEach>
				</c:when>
				<c:when test="${totalInquiry == 100 }">		<!-- 등록된 글개수가 100개인 경우 -->
					<c:forEach var="page" begin="1" end="10" step="1" >
						<a class="no-uline" href="${contextPath}/inquiry/inquiryList.do?section=${section}&pageNum=${page}">${page }</a>
					</c:forEach>
				</c:when>
				<c:when test="${totalInquiry < 100 }">
					<c:forEach var="page" begin="1" end="${totalInquiry / 10 + 1 }" step="1" >
						<c:choose>
							<c:when test="${page == pageNum }">
								<a class="sel-page" href="${contextPath}/inquiry/inquiryList.do?section=${section}&pageNum=${page}">${page }</a>
							</c:when>
							<c:otherwise>
								<a class="no-uline" href="${contextPath}/inquiry/inquiryList.do?section=${section}&pageNum=${page}">${page }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:when>
			</c:choose>
		</c:if>
	</div>
</body>
</html>