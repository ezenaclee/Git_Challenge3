<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" />
<c:set var="starFieldVO" value="${starFieldMap.starFieldVO }" />
<c:set var="imageFileList" value="${starFieldMap.imageFileList }" scope="request" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta
        name="viewport"
        content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Develocket</title>
    <!-- Bootstrap core CSS -->
    <link href="${contextPath}/resources/css/common/bootstrap.min.css" rel="stylesheet">
    <!-- Fonts -->
    <link
        href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
        rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${contextPath}/resources/css/common/mediumish.css" rel="stylesheet">
    <!-- jQeury -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
	    function scrollMasterInfo(id) {
	        const topValue = document
	            .getElementById(id)
	            .offsetTop;
	        window.scroll(0, topValue + 30);
	    }
	    
	    $(document).ready(function () {

            var topBar = $("#profile-bar").offset();

            $(window).scroll(function () {

                var docScrollY = $(document).scrollTop()
                var barThis = $("#profile-bar")
                var contentThis = $("#profile_content")

                if (docScrollY > topBar.top) {
                    barThis.addClass("profile_bar_fix");
                    contentThis.addClass("pd_top");
                } else {
                    barThis.removeClass("profile_bar_fix");
                    contentThis.removeClass("pd_top");
                }

            });

        })
    </script>
</head>
<body>
    <div class="container">

        <div class="mainheading">
            <h1 class="sitetitle">PROFILE</h1>
            <div class="profile-card">
                <header>
                    <a>
                        <img id="profile-img" src="${contextPath}/resources/image/common/kangstar.jpg">
                    </a>
                    <h1>스타이름 : 강스타</h1>
                    <h2>분야 : Web & Mobile Developer</h2>
                </header>
                <div class="profile-bio">
                    <p>웹과 모바일을 가르치는 스타개발자.</p>
                </div>

            </div>

        </div>

        <!-- End Site Title ================================================== -->

        <!-- Begin Featured ================================================== -->
        <section class="featured-posts">
            <div class="section-title prfile" id="profile-bar">
                <!-- <h2> <span>ETC</span></h2> -->
                <form action="${contextPath }/starField/starFieldModify.do" method="post">
	                <input type="hidden" name="star_field_cd" value="${starFieldVO.star_field_cd }">
					<input type="hidden" name="star_cd" value="${starFieldVO.star_cd }">
					<input type="hidden" name="cate_cd" value="${starFieldVO.cate_cd }">
					<input type="hidden" name="profile_img" value="${starFieldVO.profile_img }">
					<input type="hidden" name="short_intro" value="${starFieldVO.short_intro }">
					<input type="hidden" name="detail_intro" value="${starFieldVO.detail_intro }">
					<input type="hidden" name="career" value="${starFieldVO.career }">
					<input type="hidden" name="business_img" value="${starFieldVO.business_img }">
					<input type="hidden" name="qna" value="${starFieldVO.qna }">
					<input type="hidden" name="imageFileList" value="${imageFileList }">
                	<h2>
	                    <span>
	                        <ul class="profile-links">
	                            <li>
	                                <a id="btn1" onclick="scrollMasterInfo('star_information')">
	                                    information
	                                </a>
	                            </li>
	
	                            <li>
	                                <a id="btn2" onclick="scrollMasterInfo('star_picture')">
	                                    picture
	                                </a>
	
	                            </li>
	
	                            <li>
	                                <a id="btn3" onclick="scrollMasterInfo('star_review')">
	                                    review
	                                </a>
	
	                            </li>
	                            <li>
	                                <a id="btn4" onclick="scrollMasterInfo('star_question')">
	                                    question
	                                </a>
	
	                            </li>
	                            
	                            <li>
	                            	<input type="submit" value="modify">
	                            </li>
	                        </ul>
	                    </span>
	                </h2>
                </form>
            </div>
            <div class="content" id="profile_content">
                <div id="star_information">
                    <div>
                        <h1>스타정보</h1>
                        <div class="inf_div">
                            <h2>👨‍💻스프링 마스터 강스타</h2>
                            <h2>🏆1002회 고용됨</h2>
                            <h2>📞연락 가능 시간 : 09:00 ~ 20:00</h2>
                            <h2>📝사업자등록증 등록완료</h2>
                        </div>
                    </div>
                    <div>
                        <h1>활동지역</h1>
                        <div class="inf_div">
                            <h2>🌍서울특별시</h2>
                        </div>
                    </div>
                    <div>
                        <h1>제공 서비스</h1>
                        <div class="inf_div">
                            <h2>📕JAVA</h2>
                            <h2>📗JSP</h2>
                            <h2>📘스프링</h2>
                        </div>
                    </div>
                </div>
                <div id="star_picture">
                    <div>
                        <h1>사진</h1>
                        <div class="star_img">
                            <img src="${contextPath}/resources/image/common/kangstar.jpg">
                            <img src="${contextPath}/resources/image/common/kangstar.jpg">
                            <img src="${contextPath}/resources/image/common/kangstar.jpg">
                        </div>
                    </div>
                </div>
                <div id="star_review">
                    <div>
                        <h1>스타리뷰</h1>
                        <div>
                            <div
                                class="locket_chatreview"
                                style="background-color: white; margin: 20px; padding: 10px;">
                                <div class="review_content" style="margin: 10px;">
                                    <h2>강현규</h2>
                                    <div class="review_content" style="margin: 10px;">
                                        <div class="score">
                                            <p style="text-align: left;">
                                                <span>4.0</span>
                                            </p>
                                        </div>
                                        <div class="register">
                                            <p style="text-align: left;">2022.01.20</p>
                                        </div>
                                        <div class="locket_chat">
                                            <!-- 리뷰 제목 -->
                                            <h3>
                                                "최악 그 자체"
                                            </h3>
                                            <!-- 리뷰 내용 -->
                                            <p style="text-align: left;">ㄹㅇ 겁나 못함 내가 코딩 더 잘할듯</p>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div
                                class="star_chatreview"
                                style="background-color: orange; margin: 20px; padding: 10px;">
                                <div class="review_content" style="margin: 10px;">
                                    <h2>┗ 강스타</h2>
                                    <div class="review_style" style="margin-left:20px;">
                                        <div class="register">
                                            <p style="text-align: left;">2022.01.20</p>
                                        </div>
                                        <div class="locket_chat">
                                            <!-- 리뷰 제목 -->
                                            <h3>
                                                "ㅗㅗㅗ"
                                            </h3>
                                            <!-- 리뷰 내용 -->
                                            <p style="text-align: left;">지가 못해놓고서는 ㅈㄹ함</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="star_question">
                    <div>
                        <h1>질문답변</h1>
                        <div class="question_div">
                            <h2>💬스프링 게시판이 답글만 달리는데 어떻게 하나요?</h2>
                            <div class="response_div">
                                <h2>┗ 저도 고치고싶어요😪</h2>
                            </div>
                            <h2>💬스타프로필 기능구현은 우찌하나요?</h2>
                            <div class="response_div">
                                <h2>┗ 몰라요 (╯°□°）╯︵ ┻━┻</h2>
                            </div>
                            <h2>💬조장님 살려주세요</h2>
                            <div class="response_div">
                                <h2>┗ (❁´◡`❁)ㅗ</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- <div class="category_card"> <ul class="category_list2"> <li
            class="category_item"> <a class="category_link" href="starcategory_detail.html">
            <img src="img/kangstar.jpg"> <span class="category_text">악기</span> </a> </li>
            <li class="category_item"> <a class="category_link"
            href="starcategory_detail.html"> <img src="img/kangstar.jpg"> <span
            class="category_text">음악</span> </a> </li> <li class="category_item"> <a
            class="category_link" href="starcategory_detail.html"> <img
            src="img/kangstar.jpg"> <span class="category_text">댄스/무용</span> </a> </li> <li
            class="category_item"> <a class="category_link" href="starcategory_detail.html">
            <img src="img/kangstar.jpg"> <span class="category_text">사진/영상</span> </a> </li>
            <li class="category_item"> <a class="category_link"
            href="starcategory_detail.html"> <img src="img/kangstar.jpg"> <span
            class="category_text">주식</span> </a> </li> <li class="category_item"> <a
            class="category_link" href="starcategory_detail.html"> <img
            src="img/kangstar.jpg"> <span class="category_text">스포츠</span> </a> </li> <li
            class="category_item"> <a class="category_link" href="starcategory_detail.html">
            <img src="img/kangstar.jpg"> <span class="category_text">미술</span> </a> </li>
            </ul> </div> -->

        </section>
        <!-- End Featured ================================================== -->

        <!-- Begin List Posts ================================================== -->

        <!-- End List Posts ================================================== -->

        <!-- Begin Footer ================================================== -->
        <div class="footer">
            <p class="pull-left">
                Copyright &copy; 2017 Your Website Name
            </p>
            <p class="pull-right">
                Mediumish Theme by
                <a target="_blank" href="https://www.wowthemes.net">WowThemes.net</a>
            </p>
            <div class="clearfix"></div>
        </div>
        <!-- End Footer ================================================== -->

    </div>
    <!-- /.container -->
    <!-- Bootstrap core JavaScript ================================================== -->
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