<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" />
<c:set var="inquiryVO" value="${inquiryMap.inquiryVO }" />
<c:set var="imageFileList" value="${inquiryMap.imageFileList }" />
<c:set var="removeCompleted" value="${inquiryMap.removeCompleted }" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>글상세보기</title>
	<style type="text/css">
		#tr_btn_modify {
			display: none;
		}
		
		.tr_modEnable {
			visibility: hidden;
		}
	</style>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<c:choose>
		<c:when test="${removeCompleted eq true }">
			<script type="text/javascript">
				$(window).load(function() {
					fn_enable();
				});
			</script>
		</c:when>
	</c:choose>
	<script type="text/javascript">
		function backToInquiryList(obj) {
			obj.action = "${contextPath}/inquiry/inquiryList.do";
			obj.submit();
		}
	
		function backToList(obj, inquiry_cd) {
			obj.action = "${contextPath}/inquiry/inquiryVeiw.do?removeCompleted=false&inquiry_cd=" + inquiry_cd;
			obj.submit();
		}
		
		function fn_enable() {	/* 수정하기 클릭시 텍스트 박스를 활성화 시킴 */
			document.getElementById("i_title").disabled = false;
			document.getElementById("i_content").disabled = false;
			
			document.getElementById("tr_btn_modify").style.display = "block";
			document.getElementById("tr_btn").style.display = "none";
	
			$(".tr_modEnable").css('visibility', 'visible');
		}
		
		function fn_modify_inquiry(obj) {	/* 수정등록 클릭 시 컨트롤러에게 수정된 데이터를 전송함 */
			obj.action = "${contextPath}/inquiry/modifyInquiry.do";
			obj.submit();
		}
		
		function readURL(input, index) {
			// 선택된 이미지 파일이 있다면
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#preview' + index).attr('src', e.target.result);
				};
				reader.readAsDataURL(input.files[0]);
			}
		}
		
		function fn_remove_inquiry(url, inquiry_cd) {
			var form = document.createElement("form");	
			form.setAttribute("method", "post");
			form.setAttribute("action", url);
			
			var inquiryCDInput = document.createElement("input");		
			inquiryCDInput.setAttribute("type", "hidden")				
			inquiryCDInput.setAttribute("name", "inquiry_cd");
			inquiryCDInput.setAttribute("value", inquiry_cd);
			
			form.appendChild(inquiryCDInput);	
			document.body.appendChild(form);	
			form.submit();
		}
		
		function fn_reply_form(isLogOn, url, parent_cd, group_cd) {
			
			if (isLogOn != '' && isLogOn != 'false') {
				var form = document.createElement("form");
				form.setAttribute("method", "post");
				form.setAttribute("action", url);
				
				var parentCDInput = document.createElement("input");
				parentCDInput.setAttribute("type", "hidden");
				parentCDInput.setAttribute("name", "parent_cd");
				parentCDInput.setAttribute("value", parent_cd);
				
				var groupCDInput = document.createElement("input");
				groupCDInput.setAttribute("type", "hidden");
				groupCDInput.setAttribute("name", "group_cd");
				groupCDInput.setAttribute("value", group_cd);
				
				form.appendChild(parentCDInput);
				form.appendChild(groupCDInput);
				document.body.appendChild(form);	
				form.submit();	
			}
			else {
				alert('로그인 후 글쓰기가 가능합니다.');
				location.href = "${contextPath}/rocketInfo/loginForm.do?action=/inquiry/inquiryReplyForm.do&parent_cd=" + parent_cd + "&=group_cd" + group_cd;
			}
			
		}
		
		
		// 기존 이미지 개수(수정 이전의 이미지 갯수)
		var pre_img_num = 0;
		// 새로 추가된 이미지 갯수(수정 후 이미지 갯수)
		var img_index = 0;
		
		var isFirstAddImage = true;
		
		function fn_addModeImage(_img_index) {
			if (isFirstAddImage == true) {
				pre_img_num = _img_index;
				img_index = ++_img_index;
				isFirstAddImage = false;
			}
			else {
				++img_index;
			}
			
			var innerHTML = '';
			innerHTML += '<tr width="200px"  align="center">';
				innerHTML += '<td>';
					innerHTML += '<input type="file" name="imageFileName' + img_index + '" onchange="readURL(this, ' + img_index + ')">';
				innerHTML += '</td>';
				innerHTML += '<td>';
					innerHTML += '<img id="preview' + img_index + '" width="480px" height="320px">';
				innerHTML += '</td>';
			innerHTML += '</tr>';
			
			$("#tb_addImage").append(innerHTML);
			$("#added_img_num").val(img_index);	// 추가된 이미지 수를 hidden속성의 태그에 저장해서 컨트롤러로 보냄
			
		}
		
		function fn_removeModImage(_inquiry_img_cd, _inquiry_cd, _imageFileName, rowNum) {

			$.ajax({
				type: "post",
				async: false,
				url: "http://localhost:8080/develocket/inquiry/removeModImage.do",
				dataType: "text",
				data: {inquiry_img_cd: _inquiry_img_cd, inquiry_cd: _inquiry_cd, imageFileName: _imageFileName},
				success: function(result, textStatus) {
					if (result == 'success') {
						alert("이미지를 삭제했습니다.");
						location.href = "http://localhost:8080/develocket/inquiry/inquiryVeiw.do?removeCompleted=true&inquiry_cd=" + _inquiry_cd;
						
						$('#tr_' + rowNum).remove();
						$('#tr_sub' + rowNum).remove();
					}
					else {
						alert("다시 시도해주세요.")
					}
				},
				error: function(data, textStatus) {
					alert("에러가 발생했습니다.")
				},
				complete: function(data, textStatus) {
					//
				}
			});
			
		}
	</script>
</head>
<body>
	<form action="#" name="frmInquiry" method="post" enctype="multipart/form-data">
		<table border="0" align="center">
			<tr>
				<td width="150" align="center" bgcolor="#add3f7">
					글번호
				</td>
				<td>
					<input type="text" value="${inquiryVO.inquiry_cd }" disabled >
					<%-- 글 수정시 글 번호를 컨트롤러에게 전송하기 위해 글번호를 저장함 --%>
					<input type="hidden" name="inquiry_cd" value="${inquiryVO.inquiry_cd }">
				</td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="#add3f7">
					작성자 아이디
				</td>
				<td>
					<input type="text" value="${inquiryVO.id }" name="id"  disabled >
				</td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="#add3f7">
					제목
				</td>
				<td>
					<input type="text" value="${inquiryVO.inquiry_title }" name="inquiry_title" id="i_title" disabled >
				</td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="#add3f7">
					내용
				</td>
				<td>
					<textarea rows="20" cols="60" name="inquiry_content" id="i_content" disabled >${inquiryVO.inquiry_content }</textarea>
				</td>
			</tr>
			
			<!-- 다수 이미지 표시로 수정 -->
			<c:set var="img_index" />
			<c:choose>
				<c:when test="${not empty imageFileList && imageFileList != 'null' }">
					<c:forEach var="inquiryImgVO" items="${imageFileList }" varStatus="status" >
						<tr id="tr_${status.count }">
							<td width="150" align="center" bgcolor="#add3f7">
								이미지${status.count }
							</td>
							<td>
								<!-- 이미지 수정시 미리 원래 이미지 파일이름을 저장함 -->
								<input type="hidden" name="oldFileName" value="${inquiryImgVO.imageFileName }" >
								<input type="hidden" name="inquiry_img_cd" value="${inquiryImgVO.inquiry_img_cd }" >
								<img alt="이미지" src="${contextPath }/download.do?imageFileName=${inquiryImgVO.imageFileName}&inquiry_cd=${inquiryImgVO.inquiry_cd}"
									 id="preview${status.index }" width="430" height="400"><br>
							</td>
						</tr>
						<tr class="tr_modEnable" id="tr_sub${status.count }">
							<td></td>
							<td>
								<!-- 수정된 이미지 파일이름을 전송함 -->
								<input type="file" id="imageFileName${status.index }" name="imageFileName${status.index }" onchange="readURL(this, ${status.index })">
								<input type="button" value="이미지 삭제하기" 
									   onclick="fn_removeModImage(${inquiryImgVO.inquiry_img_cd}, ${inquiryImgVO.inquiry_cd }, '${inquiryImgVO.imageFileName }', ${status.count })" >
							</td>
						</tr>
						
						<c:if test="${status.last eq true }">
							<c:set var="img_index" value="${status.count }" />	<!-- 기존 이미지 수 -->
							<input type="hidden" name="pre_img_num" value="${status.count }" >
							<input type="hidden" id="added_img_num" name="added_img_num" value="${status.count }" >	<!-- 수정시 새로 추가된 이미지 수 -->
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:set var="img_index" value="${0 }" />
					<!-- 기존 이미지수 -->
					<input type="hidden" name="pre_img_num" value="${0 }" >
					<!-- 수정시 이미지 수 -->
					<input type="hidden" id="added_img_num" name="added_img_num" value="${0 }" >
				</c:otherwise>
			</c:choose>
			
			<tr>
				<td colspan="2">
					<table id="tb_addImage" align="center" >
						
					</table>
				</td>
			</tr>
			
			<tr class="tr_modEnable">
				<td colspan="2">
					<input type="button" value="이미지 추가" onclick="fn_addModeImage(${img_index})">
				</td>
			</tr>
			
			<tr>
				<td width="150" align="center" bgcolor="#add3f7">
					등록일자
				</td>
				<td>
					<input type="text" value='<fmt:formatDate value="${inquiryVO.write_date }"/>' disabled >
				</td>
			</tr>
			<tr id="tr_btn_modify"  >
				<td colspan="2" align="center">
					<input type="button" value="수정등록" onclick="fn_modify_inquiry(frmInquiry)" >
					<input type="button" value="취소" onclick="backToList(frmInquiry, '${inquiryVO.inquiry_cd}')" >
				</td>
			</tr>
			<tr id="tr_btn" >
				<td colspan="2" align="center">
					<c:if test="${rocketInfoVO.rocket_cd == inquiryVO.rocket_cd }">
						<input type="button" value="수정하기" onclick="fn_enable()" >		<%-- 삭제하기 fn_remove_inquiry() 호출하면서 inquiry_cd 전달 --%>
						<input type="button" value="삭제하기" onclick="fn_remove_inquiry('${contextPath}/inquiry/removeInquiry.do', ${inquiryVO.inquiry_cd })" >
					</c:if>
					<input type="button" value="목록보기" onclick="backToInquiryList(frmInquiry)" >
					<input type="button" value="답글쓰기" onclick="fn_reply_form('${isLogOn}', '${contextPath}/inquiry/inquiryReplyForm.do', '${inquiryVO.inquiry_cd }', '${inquiryVO.group_cd }')" >
				</td>
			</tr>
		</table>
	</form>
</body>
</html>









