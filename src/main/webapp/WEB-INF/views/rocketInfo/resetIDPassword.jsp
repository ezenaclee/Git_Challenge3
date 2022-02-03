<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호재설정창</title>
</head>
<body>
	<form method="post" action="#">
		<h1>비밀번호를 변경합니다</h1>
		<fieldset>
			<div>
				변경하실 비밀번호를 입력해 주세요.(8-24자 영문,숫자 조합 포함)<br>
				<input type="password" name="pw" placeholder="변경하실 비밀번호를 입력해 주세요"><br>
				<input type="password" name="pw" placeholder="변경하실 비밀번호를 한번 더 입력해 주세요"><br>
				<input type="submit" value="비밀번호 변경">
			</div>
		</fieldset>
	</form>
</body>
</html>