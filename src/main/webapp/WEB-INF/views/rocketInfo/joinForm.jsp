<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입창</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		/* 이름 */
		$("#username").blur(function(){ 
			var sm_name = $("#username").val(); 
			if(sm_name == "" || sm_name.length < 2){ 
				$(".successNameChk").text("이름은 2자 이상 8자 이하로 설정해주세요 :)"); 
					$(".successNameChk").css("color", "red"); 
					$("#nameDoubleChk").val("false"); }
			else{ 
				$.ajax({ 
					url : '${pageContext.request.contextPath}/nameCheck?name='+ name, 
					type : 'post', 
					cache : false, 
					success : function(data) { 
						if (data == 0) { 
							$(".successNameChk").text("사용가능한 이름입니다."); 
							$(".successNameChk").css("color", "green"); 
							$("#nameDoubleChk").val("true"); } 
						else { 
							$(".successNameChk").text("사용중인 이름입니다 :p"); 
							$(".successNameChk").css("color", "red"); 
							$("#nameDoubleChk").val("false"); } 
						}, 
					error : function() {
						 console.log("실패");
					 } 
				}); 
			} 
		});
		
		//아이디
		$("#userid").blur(function(){ 
				var sm_name = $("#userid").val(); 
				if(sm_name == "" || sm_name.length < 2){ 
					$(".successIdChk").text("아이디는 2자 이상 20자 이하로 설정해주세요 :)"); 
						$(".successIdChk").css("color", "red"); 
						$("#idDoubleChk").val("false"); }
				else{ 
					$.ajax({ 
						url : '${pageContext.request.contextPath}/nameCheck?id='+ id, 
						type : 'post', 
						cache : false, 
						success : function(data) { 
							if (data == 0) { 
								$(".successIdChk").text("사용가능한 아이디입니다."); 
								$(".successIdChk").css("color", "green"); 
								$("#idDoubleChk").val("true"); } 
							else { 
								$(".successIdChk").text("사용중인 아이디입니다 :p"); 
								$(".successIdChk").css("color", "red"); 
								$("#idDoubleChk").val("false"); } 
							}, 
						error : function() {
							 console.log("실패");
						 } 
					}); 
				} 
			});
		
			/* 비밀번호 */
			$("#userpassChk").blur(function(){ 
				if($("#userpassChk").val() == $("#userpass").val()){ 
					$(".successPwdChk").text("비밀번호가 일치합니다."); 
					$(".successPwdChk").css("color", "green"); 
					$("#pwdDoubleChk").val("true"); }
				else{ 
					$(".successPwdChk").text("비밀번호가 일치하지 않습니다."); 
					$(".successPwdChk").css("color", "red"); 
					$("#pwdDoubleChk").val("false"); 
				     } 
			});
			
			function fn_sendEmail() {
				var email = $("#email").val(); 
				$.ajax({ 
					type:"post", 
					async: false,
					url:"http://localhost:8080/develocket/email/mailCheck?email=" + email, 
					cache : false, 
					success:function(data){ 
						if(data == "error"){ 
							alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요."); 
							$("#email").attr("autofocus",true); 
							$(".successEmailChk").text("유효한 이메일 주소를 입력해주세요."); 
							$(".successEmailChk").css("color","red"); 
						}else{ 
							alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오."); 
							$("#email2").attr("disabled",false); 
							$("#emailChk2").css("display","inline-block"); 
							$(".successEmailChk").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오."); 
							$(".successEmailChk").css("color","green"); 
							code = data; 
						} 
					} 
				}); 
			}
			
			function fn_emailCheck() {
				if($("#email2").val() == code){ 
					$(".successEmailChk").text("인증번호가 일치합니다."); 
					$(".successEmailChk").css("color","green"); 
					$("#emailDoubleChk").val("true"); 
					$("#email2").attr("disabled",true);
					 //$("#sm_email").attr("disabled",true); 
				}else{ 
					$(".successEmailChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다."); 
					$(".successEmailChk").css("color","red"); 
					$("#emailDoubleChk").val("false"); 
					$("#email2").attr("autofocus",true); 
					}
			}
	</script>
</head>
<body>
	<h1>디벨로켓에 오신 것을 환영합니다</h1>
	<fieldset style="width:100%;">
		<form method='post' action='${contextPath }/rocketInfo/join.do'>
			<table align="center">
				<tr> 
					<th> 
						<label for="username">이&emsp;름</label> 
					</th> 
					<td> 
						<input id="username" type="text" name="name" placeholder="실명을 입력해주세요" maxlength="20" title="8자 까지 입력" required autofocus/>
						<span class="point successNameChk">이름은 2자 이상 8자 이하로 설정해주시기 바랍니다.</span> 
						<input type="hidden" id="nameDoubleChk"/> <br>
					</td> 
				</tr>
				
				<!-- 아이디 -->
				<tr> 
					<th> 
						<label for="userid">아이디</label> 
					</th> 
					<td> 
						<input id="id" type="text" name="id" placeholder="아이디를 입력해주세요." required maxlength="10"/> 
						<span class="point successIdChk"></span><br/> <span class="point">※ 영문자, 소문자 입력가능, 최대 10자 까지 입력</span> 
						<input type="hidden" id="idDoubleChk"/> <br>
					</td> 
				</tr>
				<br>
				
				<!-- 비밀번호 -->
				<tr> 
					<th> 
						<label for="userpass">비밀번호</label> 
					</th> 
					<td> 
						<input id="userpass" type="password" name="password" required maxlength="15" autocomplete="off"/> 
						<span class="point">※ 비밀번호는 총 8자 까지 입력가능</span> <br>
					</td> 
				</tr> 
				<tr> 
					<th> 
						<label for="userpassChk">비밀번호 확인</label> 
					</th> 
					<td> 
						<input id="userpassChk" type="password" name="pwd_Chk" placeholder="동일하게 입력해주세요." required maxlength="15" autocomplete="off"/> 
						<span class="point successPwdChk"></span> 
						<input type="hidden" id="pwdDoubleChk"/> <br>
					</td> 
				</tr>
	
				<!-- 이메일 -->
				<tr class="email"> 
					<th> 
						<label for="useremail">이메일</label> 
					</th> 
					<td> 
						<p> 
							<input id="email" type="text" name="email" title="이메일 주소를 입력해주세요." required/> 
							<input type="button" value="인증번호 보내기" onclick="fn_sendEmail()"><br>
							<!-- <span id="emailChk" class="doubleChk">인증번호 보내기</span><br/>  -->
							<input id="email2" type="text" name="email2" title="인증번호 입력" disabled required/> 
							<input type="button" value="이메일인증" onclick="fn_emailCheck()">
							<span id="emailChk2" class="doubleChk">이메일인증</span> <br>
							<span class="point successEmailChk">이메일 입력후 인증번호 보내기를 해주십시오.</span> 
							<input type="hidden" id="emailDoubleChk"/> 
						</p> 
						<p class="tip"> 아이디 비밀번호 분실시 필요한 정보이므로, 정확하게 기입해 주십시오. </p> 
					</td> 
				</tr>
			</table>
			<p>휴대폰 번호<br> 
				<input name='phone_number' type='text' placeholder="010-1234-5678">
			</p>	
			<br>
			<br>
			<label>
				<input id="checkBox" type="checkbox">이용약관, 개인정보 수집 및 이용 동의(필수)
			</label><br>
			<label>
				<input id="checkBox" type="checkbox">만 14세 이상(필수)
			</label><br>
			<input type='submit' value='회원가입'>
		</form>
	</fieldset>
</body>
</html>