<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>	<!-- 타일즈 사용하기 위해 추가 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><tiles:insertAttribute name="title" /></title>
	<style type="text/css">
		#container {
			width: 100%;
			margin: 0px auto;
			text-align: center;
			border: 0px solid #ebedf0;
		}
		#header {
			padding: 5px;
			margin-bottom: 5px;
			border: 1px solid #ebedf0;
			background-color: #f5f7fa;
		}
		
		/* #sidebar-left {
			width: 0%;
			height: 700px;
			padding: 5px;
			margin-right: 5px;
			margin-bottom: 5px;
			float: left;
			background-color: #f5f7fa;
			border: 0px solid #bdbcbc;
			font-size: 10px;
		} */
		
		#content {
			width: 100%;
			margin-top: 30px;	
		}
		
		#footer {
			margin-top: 30px;
			clear: both;
			padding: 5px;
			border: 0px solid #bcbcbc;
			background-color: #f5f7fa;
		}
	</style>
</head>
<body>
	<div id="container" >
		<div id="header" >
			<tiles:insertAttribute name="header" />
		</div>
		
		<%-- <div id="sidebar-left" >
			<tiles:insertAttribute name="side" />
		</div> --%>
		
		<div id="content">
			<tiles:insertAttribute name="body" />
		</div>
		
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>