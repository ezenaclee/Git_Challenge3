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
	<meta charset="utf-8">
    <meta
        name="viewport"
        content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="assets/img/favicon.ico">
    <title>Mediumish - A Medium style template by WowThemes.net</title>
    <!-- Bootstrap core CSS -->
    <link href="${contextPath}/resources/css/common/bootstrap.min.css" rel="stylesheet">
    <!-- Fonts -->
    <link
        href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${contextPath}/resources/css/common/mediumish.css" rel="stylesheet">
</head>
<body>
	<!-- Begin Nav ================================================== -->
    <nav
        class="navbar navbar-toggleable-md navbar-light bg-white fixed-top mediumnavigation">
        <button
            class="navbar-toggler navbar-toggler-right"
            type="button"
            data-toggle="collapse"
            data-target="#navbarsExampleDefault"
            aria-controls="navbarsExampleDefault"
            aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="container">
            <!-- Begin Logo -->
            <a class="navbar-brand" href="${contextPath}">
                <img src="${contextPath}/resources/image/common/develocketlogo-text.png" alt="logo">
            </a>
            <!-- End Logo -->
            <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                <!-- Begin Search -->
                <form class="form-inline my-2 my-lg-0" style="padding-left: 200px;">
                    <input class="form-control mr-sm-2" type="text" placeholder="검색">
                    <span class="search-icon">
                        <svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25">
                            <path
                                d="M20.067 18.933l-4.157-4.157a6 6 0 1 0-.884.884l4.157 4.157a.624.624 0 1 0 .884-.884zM6.5 11c0-2.62 2.13-4.75 4.75-4.75S16 8.38 16 11s-2.13 4.75-4.75 4.75S6.5 13.62 6.5 11z"></path>
                        </svg>
                    </span>
                </form>
                <!-- End Search -->
                <!-- Begin Menu -->
                <c:choose>
					<c:when test="${isLogOn == true && rocketInfoVO != null }">
						<ul class="navbar-nav ml-auto">
		                    <li class="nav-item active">
		                        <a class="nav-link" href="#">채팅<span class="sr-only">(current)</span></a>
		                    </li>
		                    <li class="nav-item">
		                        <a class="nav-link" href="#">받은견적</a>
		                    </li>
		                    <li class="nav-item">
		                        <a class="nav-link" href="#">받은요청</a>
		                    </li>
		                </ul>
						<div class="dropdown">
							<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<img id="profile-img" src="${contextPath}/resources/image/common/kangstar.jpg" alt="profile">
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						  		<a class="dropdown-item" href="${contextPath }/rocketInfo/logout.do">로그아웃</a>
						 		<a class="dropdown-item" href="${contextPath }/starInfo/joinStarForm.do">스타등록</a>
						 		<c:forEach var="star_field_cd" items="${starFieldCDList }" varStatus="cnt" >
									<a class="dropdown-item" href="${contextPath }/starField/starFieldView.do?star_field_cd=${star_field_cd}">
										스타프로필${cnt.count }
									</a>
								</c:forEach>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<ul class="navbar-nav ml-auto">
		                    <li class="nav-item active">
		                        <a class="nav-link" href="${contextPath }/rocketInfo/loginForm.do">로그인<span class="sr-only">(current)</span></a>
		                    </li>
		                    <li class="nav-item">
		                        <a class="nav-link" href="${contextPath }/rocketInfo/joinForm.do">회원가입</a>
		                    </li>
		                </ul>
					</c:otherwise>
				</c:choose>
                <!-- End Menu -->
            </div>
        </div>
    </nav>
    <!-- End Nav ================================================== -->
    
    <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${contextPath}/resources/js/jquery.min.js"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
            integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
            crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
        <script src="${contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>











