<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" />
<c:set var="star_field_cd" value="${starFieldMap.starFieldVO.star_field_cd }" />
<c:set var="profile_img" value="${starFieldMap.starFieldVO.profile_img }" />
<c:set var="short_intro" value="${starFieldMap.starFieldVO.short_intro }" />
<c:set var="detail_intro" value="${starFieldMap.starFieldVO.detail_intro }" />
<c:set var="career" value="${starFieldMap.starFieldVO.career }" />
<c:set var="business_img" value="${starFieldMap.starFieldVO.business_img }" />
<c:set var="qna" value="${starFieldMap.starFieldVO.qna }" />
<c:set var="imageFileList" value="${starFieldMap.imageFileList }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>스타프로필 수정창</title>
	<script type="text/javascript">
		// 프로필 이지지, 사업자등록증 이미지 읽어오기
		function readURL(input, id) {
			// 선택된 이미지 파일이 있다면
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#' + id).attr('src', e.target.result);
				};
				reader.readAsDataURL(input.files[0]);
			}
		}
		
		// 자격증 이미지 읽어오기
		function readURL2(input, index) {
			// 선택된 이미지 파일이 있다면
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#preview' + index).attr('src', e.target.result);
				};
				reader.readAsDataURL(input.files[0]);
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
			innerHTML += '<div width="200px"  align="center">';
				innerHTML += '<input type="file" name="imageFileName' + img_index + '" onchange="readURL2(this, ' + img_index + ')">';
			innerHTML += '</div>';
			innerHTML += '<div>';
				innerHTML += '<img id="preview' + img_index + '" width="480px" height="320px">';	
			innerHTML += '</div>';
			
			$("#tb_addImage").append(innerHTML);
			$("#added_img_num").val(img_index);	// 추가된 이미지 수를 hidden속성의 태그에 저장해서 컨트롤러로 보냄
			
		}
				
		function fn_removeModImage(_career_img_cd, _star_field_cd, _imageFileName, rowNum) {

			$.ajax({
				type: "post",
				async: false,
				url: "http://localhost:8080/develocket/starField/removeModImage.do",
				dataType: "text",
				data: {career_img_cd: _career_img_cd, star_field_cd: _star_field_cd, imageFileName: _imageFileName},
				success: function(result, textStatus) {
					if (result == 'success') {
						alert("이미지를 삭제했습니다.");
						location.href = "http://localhost:8080/develocket/starField/starFieldModify.do?removeCompleted=true&star_field_cd=" + _star_field_cd;
						
						$('#div_' + rowNum).remove();
						$('#div_sub' + rowNum).remove();
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
	<form action="${contextPath }/starField/modifyStarField.do" method="post"
		  enctype="multipart/form-data">
		<input type="hidden" name="star_field_cd" value="${star_field_cd }">
		<div>
			<div>[프로필 이미지]</div>
			<div>
				<input type="hidden" name="old_profile_img" value="${profile_img }" >
				<c:choose>
					<c:when test="${not empty profile_img && profile_img != 'null' }">
						<img id="profile_img" width="480px" height="320px"
					 		 src="${contextPath }/starField/download.do?imageFileName=${profile_img}&star_field_cd=${star_field_cd}">
					</c:when>
					<c:otherwise>
						<img id="profile_img" width="480px" height="320px"
							 src="${contextPath}/resources/image/common/kangstar.jpg">
					</c:otherwise>
				</c:choose>
			</div>
			<div>
				<input type="file" name="profile_img" value="null" onchange="readURL(this, 'profile_img')">
			</div>
		</div>
		<br><br>
		<div>
			<div>[짧은 소개]</div>
			<div>
				<textarea rows="10" cols="65" name="short_intro" placeholder="${short_intro }">${short_intro }</textarea>
			</div>
		</div>
		<br><br>
		<div>
			<div>[상세설명]</div>
			<div>
				<textarea rows="10" cols="65" name="detail_intro">${detail_intro }</textarea>
			</div>
		</div>
		<br><br>
		<div>
			<div>[경력]</div>
			<div>
				<textarea rows="10" cols="65" name="career" placeholder="상세히 입력해주세요.">${career }</textarea>
			</div>
		</div>
		<br><br>

		<c:set var="img_index" />
		<c:choose>
			<c:when test="${not empty imageFileList && imageFileList != 'null' }">
				<c:forEach var="careerImgVO" items="${imageFileList }" varStatus="status" >
					<div id="div_${status.count }">
						[자격증 이미지 ${status.count }]
					</div>
					<div>
						<!-- 이미지 수정시 미리 원래 이미지 파일이름을 저장함 -->
						<input type="hidden" name="career_img_cd" value="${careerImgVO.career_img_cd }" >
						<input type="hidden" name="oldFileName" value="${careerImgVO.imageFileName }" >
						<img alt="자격증 이미지" src="${contextPath }/starField/download.do?imageFileName=${careerImgVO.imageFileName}&star_field_cd=${careerImgVO.star_field_cd}"
							 id="preview${status.index }" width="480" height="320"><br>
					</div>
					<br>
					<div class="div_modEnable" id="div_sub${status.count }">
						<!-- 수정된 이미지 파일이름을 전송함 -->
						<input type="file" id="imageFileName${status.index }" name="imageFileName${status.index }" onchange="readURL2(this, ${status.index })">
						<input type="button" value="이미지 삭제하기" 
							   onclick="fn_removeModImage(${careerImgVO.career_img_cd}, ${careerImgVO.star_field_cd }, '${careerImgVO.imageFileName }', ${status.count })" >
					</div>
					<c:if test="${status.last eq true }">
						<c:set var="img_index" value="${status.count }" />	<!-- 기존 이미지 수 -->
						<input type="hidden" name="pre_img_num" value="${status.count }" >
						<input type="hidden" id="added_img_num" name="added_img_num" value="${status.count }" >	<!-- 수정시 새로 추가된 이미지 수 -->
					</c:if>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div>[자격증 이미지]</div>
				<c:set var="img_index" value="${0 }" />
				<!-- 기존 이미지수 -->
				<input type="hidden" name="pre_img_num" value="${0 }" >
				<!-- 수정시 이미지 수 -->
				<input type="hidden" id="added_img_num" name="added_img_num" value="${0 }" >
			</c:otherwise>
		</c:choose>
		
		
		<div id="tb_addImage" align="center">
			<!-- 자격증 이미지 추가 공간 -->
		</div>

		<div class="tr_modEnable">
			<input type="button" value="이미지 추가" onclick="fn_addModeImage(${img_index})">
		</div>

		<br><br>
		<div>
			<div>[사업자등록증]</div>
			<div>
				<input type="hidden" name="old_business_img" value="${business_img }" >
				<c:choose>
					<c:when test="${not empty business_img && business_img != 'null' }">
						<img id="business_img" width="480px" height="320px"
					 		 src="${contextPath }/starField/download.do?imageFileName=${business_img}&star_field_cd=${star_field_cd}">
					</c:when>
					<c:otherwise>
						<img id="business_img" width="480px" height="320px"
							 src="${contextPath}/resources/image/common/kangstar.jpg">
					</c:otherwise>
				</c:choose>
				
			</div>
			<div>
				<input type="file" name="business_img" value="null" onchange="readURL(this, 'business_img')">
			</div>
		</div>
		<br><br>
		<div>
			<div>[질문답변]</div>
			<div>
				<textarea rows="10" cols="65" name="qna" placeholder="상세히 입력해주세요.">${qna }</textarea>
			</div>
		</div>
		<br><br>
		<input type="submit" value="수정등록">
		<input type="reset" value="리셋하기">
	</form>
</body>
</html>