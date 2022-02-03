<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디 비밀번호 찾기</title>
</head>
<body>
  	<form method="post" action="#">
    	<h1>아이디를 잊으셨나요?</h1>
      	<fieldset>
			<p>이름: <input type="text" name="name"></p>
			<p>휴대폰:
				<select>
					<option>SKT</option>
					<option>KT</option>
					<option>LG U+</option>
					<option>알뜰폰</option>
				</select>
				<input type="text" />
				<input type="button" value="인증" />
				<div>
					<input type="text" placeholder="인증번호" />
					<input type="button" value="확인" />
				</div>
            </p>
        	<input type="submit" value="아이디 찾기">
    	</fieldset>
	</form>
	<form method="post" action="#">
    	<h1>비밀번호를 잊으셨나요?</h1>
      	<fieldset>
			<p>아이디: <input type="text" name="name"></p>
			<p>휴대폰:  
			<select>
				<option>SKT</option>
				<option>KT</option>
				<option>LG U+</option>
				<option>알뜰폰</option>
			</select>
			<input type="text" />
			<input type="button" value="인증" />
			<div>
			<input type="text" placeholder="인증번호" />
			<input type="button" value="확인" />
			</div>
			</p>
			<input type="submit" value="비밀번호 찾기">
    	</fieldset>
  	</form>
</body>
</html>