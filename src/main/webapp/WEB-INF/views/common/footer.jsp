<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${contextPath}/resources/css/common/footer.css" rel="stylesheet">
</head>
<body>
    <div class="footer" align="left" style="height: 150px;">
        <div style="display: inline-block;">
            <a class="footer-brand pull-left" href="index.html">
                <img src="${contextPath}/resources/image/common/mainLogo2.png" alt="logo">
            </a>
            <p  style="margin-top: 60px; margin-left: 0px;">                    
                Copyright &copy; 2022 Develocket
            </p>
        </div>
        <div class="pull-right" style="display: inline-block; ">
            <div class="foot_ul" style="display: block; float: left; ">
                <ul style="list-style: none;">
                    <li>
                        <a href="#">Develocket 소개</a>
                    </li>
                    <li>
                        <a href="#">회사소개</a>
                    </li>
                </ul>
            </div>
            <div class="foot_ul" style="display: block; float: right;"> 
                <ul style="list-style: none;">
                    <li>
                        <a href="#">고객센터</a>
                    </li>
                    <li>
                        <a href="#">공지사항</a>
                    </li>
                    <li>
                        <a href="#">자주묻는질문</a>
                    </li>
                    <li>
                        <a href="#">이용안내</a>
                    </li>
                    <li>
                        <a href="#">예상금액</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>