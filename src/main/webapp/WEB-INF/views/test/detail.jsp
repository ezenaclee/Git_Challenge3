<%@page import="org.json.JSONArray"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="org.json.simple.parser.ParseException"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.Reader"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	JSONParser parser = new JSONParser();
	
	Reader reader = null;
	try {
		reader = new FileReader("C:/workspace_spring/Develocket_Lee/src/main/webapp/resources/json/field.json");
		
	} catch (FileNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	org.json.simple.JSONObject jsonSimpleObject = null;
	try {
		jsonSimpleObject = (org.json.simple.JSONObject) parser.parse(reader);
	} catch (Exception e) {
		e.printStackTrace();
	}

	JSONObject jsonObject = new JSONObject(jsonSimpleObject.toJSONString());
	
	List<String> largeFieldList = new ArrayList<String>();
	Map<String, List<String>> middleMap = new HashMap<String, List<String>>();
	List<String> middleKeyList = new ArrayList<>();
	Map<String, List<String>> smallMap = new HashMap<String, List<String>>();
	
	Iterator<String> iterator = jsonObject.keys();
	while (iterator.hasNext()) {
		String field = iterator.next().toString();
		largeFieldList.add(field);
	}
	
	
	for (String large : largeFieldList) {
		List<String> tempList = new ArrayList<String>();
		
		JSONObject jsonObject2 = (JSONObject) jsonObject.get(large);
		Iterator<String> iteratorM = jsonObject2.keys();
		while (iteratorM.hasNext()) {
			String field = iteratorM.next().toString();
			tempList.add(field);
		}
		middleMap.put(large, tempList);
		
		for (String middleKey : tempList) {
			middleKeyList.add(middleKey);
		}
		
	}
	
	for (String large : largeFieldList) {
		List<String> middleList = middleMap.get(large);
		JSONObject jsonObject2 = jsonObject.getJSONObject(large);
		
		for (String middle : middleList) {
			List<String> tempList = new ArrayList<String>();
			JSONArray jsonArray = jsonObject2.getJSONArray(middle);
			
			if (jsonArray != null) {
				for (int i = 0; i < jsonArray.length(); i++) {
					tempList.add(jsonArray.get(i).toString());
				}
			}
			smallMap.put(middle, tempList);
		}
		
	}
	
	String[] field_L = {"IT", "건강/미용", "학업", "레슨"};
	
	
%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" />
<c:set var="field_L" value="<%= field_L %>" />
<c:set var="field_M" value="<%= middleMap %>" />
<c:set var="field_S" value="<%= smallMap %>" />
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>카테고리 상세</title>
        <link
            rel='stylesheet'
            type='text/css'
            media='screen'
            href='${contextPath}/resources/css/starcategory_detail.css'>
        <script>
            // For the thumbnail demo! :]

            var count = 1
            setTimeout(demo, 500)
            setTimeout(demo, 700)
            setTimeout(demo, 900)
            setTimeout(reset, 2000)

            setTimeout(demo, 2500)
            setTimeout(demo, 2750)
            setTimeout(demo, 3050)

            var mousein = false
            function demo() {
                if (mousein) 
                    return
                document
                    .getElementById('demo' + count++)
                    .classList
                    .toggle('hover')
            }

            function demo2() {
                if (mousein) 
                    return
                document
                    .getElementById('demo2')
                    .classList
                    .toggle('hover')
            }

            function reset() {
                count = 1
                var hovers = document.querySelectorAll('.hover')
                for (var i = 0; i < hovers.length; i++) {
                    hovers[i]
                        .classList
                        .remove('hover')
                }
            }

            document.addEventListener('mouseover', function () {
                mousein = true
                reset()
            })

        </script>
    </head>
    <body>
    	<div style="position: relative; z-index: 2">
    		<nav>
				<menu class="category_menu">
					<menuitem id="demo1">
						<a>카테고리</a>
						<menu>
						<%
							for (String large : field_L) {
						%>
								<menuitem id="demo2">
	                           		<a><%=large %></a>
	                           		<menu>
	                      			<%
	                        			for (String middle : middleMap.get(large)) {
	                      			%>
	                      					<menuitem id="demo3">
				                           		<a href="${contextPath}/detail/detailView.do?cate_m='<%=middle %>'">
				                           			<%=middle %>
				                           		</a>
				                           		<menu>
				                           		<%
				                           			for (String small : smallMap.get(middle)) {
				                           		%>
				                           				<menuitem>
							                           		<a><%=small %></a>
							                           	</menuitem>
				                           		<%
				                           			}
				                           		%>
				                           		</menu>
				                           	</menuitem>
	                        		<%
	                        			}
	                        		%>
	                           		</menu>
	                           	</menuitem>
						<%
							}
						%>
						</menu>
					</menuitem>
				</menu>
			</nav>
    	</div>
        
        
        <div id="main" style="margin-top: 100px; position: relative; z-index: 1">
            <div class="category">
                <ul class="category_list">
                    <li class="category_item">
                        <a class="category_link" href="#">
                            <img src="${contextPath}/resources/image/common/kangstar.jpg">
                            <span class="category_text">강스타_랜덤</span>
                        </a>
                    </li>
                    <li class="category_item">
                        <a class="category_link" href="#">
                            <img src="${contextPath}/resources/image/common/kangstar.jpg">
                            <span class="category_text">강스타_랜덤</span></a>
                    </li>
                    <li class="category_item">
                        <a class="category_link" href="#">
                            <img src="${contextPath}/resources/image/common/kangstar.jpg">
                            <span class="category_text">강스타_랜덤</span></a>
                    </li>
                    <li class="category_item">
                        <a class="category_link" href="#">
                            <img src="${contextPath}/resources/image/common/kangstar.jpg">
                            <span class="category_text">강스타_랜덤</span></a>
                    </li>
                    <li class="category_item">
                        <a class="category_link" href="#">
                            <img src="${contextPath}/resources/image/common/kangstar.jpg">
                            <span class="category_text">강스타_랜덤</span></a>
                    </li>
                </ul>
            </div>
        </div>

    </body>
</html>