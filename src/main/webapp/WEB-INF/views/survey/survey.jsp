<%@page import="org.json.JSONArray"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="org.json.simple.parser.ParseException"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.Reader"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	JSONParser parser = new JSONParser();
	Reader reader = null;
	try {
		reader = new FileReader("C:/workspace_spring/Develocket_Lee/src/main/webapp/resources/json/survey.json");
		
	} catch (FileNotFoundException e) {
		e.printStackTrace();
	}
	
	org.json.simple.JSONObject jsonSimpleObject = null;
	try {
		jsonSimpleObject = (org.json.simple.JSONObject) parser.parse(reader);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	// json파일을 String 형식으로 변환함
	JSONObject jsonObject = new JSONObject(jsonSimpleObject.toJSONString());
	
	Map<String, String> surveyMap = new HashMap<>();
	
	Iterator<String> iterator = jsonObject.keys();
	while (iterator.hasNext()) {
		String key = iterator.next().toString();
		
		JSONArray jsonArray = jsonObject.getJSONArray(key);
		String value = jsonArray.get(0).toString();
	
		surveyMap.put(key, value);
	}
%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" />
<c:set var="surveyMap" value="<%=surveyMap %>"/>
<c:set var="example" value="${surveyMap['웹'] }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" 
          content="width=device-width, height=device-height, 
                     minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
	<title>설문지</title>
	<style>
		#title {
			margin-left: 30px;
			font-size: 1.5em;
			font-style: bold;
		}
		
		#answer {
			margin-top: 10px;
		}
		
	    div.left {
	        width: 50%;
	        float: left;
	        height: 300px;
	        box-sizing: border-box;
	        margin-top: 20px;
	    }
	    
	    div.right {
	        width: 50%;
	        float: right;
	        height: 300px;
	        box-sizing: border-box;
	        margin-top: 50px;
	    }
	    
	    div.part {
	        width: 33%;
	        float: left;
	        height: 100px;
	        box-sizing: border-box;
	        margin-top: 20px;
	        text-align: center;
	    }
    </style>
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
    	var cnt = 1;
    	
    	function fn_next(ex) {
    		cnt++;
    		
    		if (cnt > 3) {
    			cnt = 3;
    			return;
    		}
    		
    		$("#question").empty();
    		$("#answer").empty();
    		
    		if (cnt == 1) {
    			var innerHtml = "원하는 목표가 무엇인가요?<br>(최대한 자세히 작성해주세요.)";
    			
    			$("#question").append(innerHtml);
    			$("#answer").attr("placeholder", ex);
    		}
    		else if (cnt == 2) {
				var innerHtml = "원하시는 기간을 입력해주세요.";
    		
    			$("#question").append(innerHtml);
    			$("#answer").attr("placeholder", "3개월 / 6개월");
    		}
    		else if (cnt == 3) {
				var innerHtml = "원하는 횟수를 입력해주세요.";
    			
    			$("#question").append(innerHtml);
    			$("#answer").attr("placeholder", "주 3회");
    		}
    	}
    	
    	function fn_back(ex) {
			cnt--;
			
			if (cnt < 1) {
				cnt = 1;
    			return;
    		}
    		
    		$("#question").empty();
    		$("#answer").empty();
    		
    		if (cnt == 1) {
    			var innerHtml = '원하는 목표가 무엇인가요?<br>(최대한 자세히 작성해주세요.)';
    			
    			$("#question").append(innerHtml);
    			$("#answer").attr("placeholder", ex);
    		}
    		else if (cnt == 2) {
				var innerHtml = '원하시는 기간을 입력해주세요.';
    			
    			$("#question").append(innerHtml);
    			$("#answer").attr("placeholder", "3개월 / 6개월");
    		}
    		else if (cnt == 3) {
				var innerHtml = '원하는 횟수를 입력해주세요.';
    			
    			$("#question").append(innerHtml);
    		}
    	}
    </script>
</head>
<body>
	<div id="title"><b>IT개발 | WEB 개발</b></div>
	<div>
        <div class="left" align="center">
        	<div align="center" id="question">
        		원하는 목표가 무엇인가요?<br>
        		(최대한 자세히 작성해주세요.)
        	</div>
        	<c:set var="cate_m" value="보안" />
        	<textarea rows="15" cols="75" id="answer" placeholder="${example }"></textarea><br>
        	<button id="back" onclick="fn_back('${example }')">이전</button>
        	<button id="next" onclick="fn_next('${example }')">다음</button>
        </div>
        <div class="right">
        	<div class="part">
        		7,668<br>
				활동 고수
        	</div>
        	<div class="part">
        		13,010<br>
				누적 요청서
        	</div>
        	<div class="part">
        		224<br>
				리뷰 수
        	</div>
        	<div style="font-size: 9pt" align="center">
        		디벨로켓은 어떤 곳인가요?<br>
				서비스가 필요한 로켓과 서비스를 제공하는 스타를 쉽고 빠르게<br>
				연결해드리는 전문가 매칭 서비스입니다.<br>
				설문지를 작성하면, 설문지에 맞는  맞춤형 스타를 매칭해드려요.<br>
				맘에 쏙 드는 스타의 맞춤형 서비스를 받아보세요.
        	</div>
        </div>
    </div>
</body>
</html>