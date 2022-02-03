<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
	<div class="container">
            <div class="mainheading">
                <h1 class="sitetitle">Develocket</h1>
                <p class="lead">
                    당신의 재능! 로켓에게 판매하세요!!
                </p>
            </div>
            <!-- End Site Title ================================================== -->

            <!-- Begin Featured ================================================== -->
            <section class="featured-posts">
                <div class="section-title">
                    <h2>
                        <span>CATEGORY</span></h2>
                </div>
				<div class="category_card">
					<ul class="category_list">
						<li class="category_item">
							<a class="category_link" href="${contextPath}/starcategory/starcategory_IT.do">
								<img src="${contextPath }/resources/image/common/kangstar.jpg">
								<span class="category_text">IT</span>
							</a>
						</li>
						<li class="category_item">
							<a class="category_link" href="${contextPath}/view/starcategory/starcategory_Health.html">
								<img src="${contextPath }/resources/image/common/kangstar.jpg">
								<span class="category_text">건강</span></a>
						</li>
						<li class="category_item">
							<a class="category_link" href="view/starcategory/starcategory_Study.html">
								<img src="${contextPath }/resources/image/common/kangstar.jpg">
								<span class="category_text">학업</span></a>
						</li>
						<li class="category_item">
							<a class="category_link" href="view/starcategory/starcategory_Lesson.html">
								<img src="${contextPath }/resources/image/common/kangstar.jpg">
								<span class="category_text">레슨</span></a>
						</li>
						<li class="category_item">
							<a class="category_link" href="view/starcategory/starcategory_ETC.html">
								<img src="${contextPath }/resources/image/common/kangstar.jpg">
								<span class="category_text">기타</span></a>
						</li>
					</ul>
				</div>
                <div class="card-columns listfeaturedtag">
					
                   
                    <!-- begin post -->
                    <!-- <div class="card">
                        <div class="row">
                            <div class="col-md-5 wrapthumbnail">
                                <a href="view/starprofile/starprofile.html">
                                    <div class="thumbnail" style="background-image:url(assets/img/demopic/4.jpg);"></div>
                                </a>
                            </div>
                            <div class="col-md-7">
                                <div class="card-block">
                                    <h2 class="card-title">
                                        <a href="view/starprofile/starprofile.html">San Francisco at its best view in all seasons</a>
                                    </h2>
                                    <h4 class="card-text">This is a longer card with supporting text below as a
                                        natural lead-in to additional content. This content is a little bit longer.</h4>
                                    <div class="metafooter">
                                        <div class="wrapfooter">
                                            <span class="meta-footer-thumb">
                                                <a href="author.html"><img
                                                    class="author-thumb"
                                                    src="https://www.gravatar.com/avatar/e56154546cf4be74e393c62d1ae9f9d4?s=250&amp;d=mm&amp;r=x"
                                                    alt="Sal"></a>
                                            </span>
                                            <span class="author-meta">
                                                <span class="post-name">
                                                    <a href="author.html">Sal</a>
                                                </span><br/>
                                                <span class="post-date">22 July 2017</span>
                                                <span class="dot"></span><span class="post-read">6 min read</span>
                                            </span>
                                            <span class="post-read-more">
                                                <a href="view/starprofile/starprofile.html" title="Read Story">
                                                    <svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25">
                                                        <path
                                                            d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z"
                                                            fill-rule="evenodd"></path>
                                                    </svg>
                                                </a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>  -->
                    <!-- end post -->

                </div>
            </section>
            <!-- End Featured ================================================== -->

            <!-- Begin List Posts ================================================== -->
            <section class="recent-posts">
                <div class="section-title">
                    <h2>
                        <span>POPULAR STAR</span></h2>
                </div>
                <div class="card-columns listrecent">

                    <!-- begin post -->
                    <div class="card">
                        <a href="view/starprofile/starprofile.html">
                            <img class="img-fluid" src="${contextPath }/resources/image/common/kangstar.jpg" alt="">
                        </a>
                        <div class="card-block">
                            <h2 class="card-title">
                                <a href="view/starprofile/starprofile.html">강스타</a>
                            </h2>
                            <h4 class="card-text">웹과 모바일을 가르치는 스타개발자.</h4>
                        </div>
                    </div>
                    <!-- end post -->

                    <!-- begin post -->
                    <div class="card">
                        <a href="view/starprofile/starprofile.html">
                            <img class="img-fluid" src="${contextPath }/resources/image/common/kangstar.jpg" alt="">
                        </a>
                        <div class="card-block">
                            <h2 class="card-title">
                                <a href="view/starprofile/starprofile.html">강스타</a>
                            </h2>
                            <h4 class="card-text">웹과 모바일을 가르치는 스타개발자.</h4>
                        </div>
                    </div>
                    <!-- end post -->

                    <!-- begin post -->
                    <div class="card">
                        <a href="view/starprofile/starprofile.html">
                            <img class="img-fluid" src="${contextPath }/resources/image/common/kangstar.jpg" alt="">
                        </a>
                        <div class="card-block">
                            <h2 class="card-title">
                                <a href="view/starprofile/starprofile.html">강스타</a>
                            </h2>
                            <h4 class="card-text">웹과 모바일을 가르치는 스타개발자.</h4>
                        </div>
                    </div>
                    <!-- end post -->

                    <!-- begin post -->
                    <div class="card">
                        <a href="view/starprofile/starprofile.html">
                            <img class="img-fluid" src="${contextPath }/resources/image/common/kangstar.jpg" alt="">
                        </a>
                        <div class="card-block">
                            <h2 class="card-title">
                                <a href="view/starprofile/starprofile.html">강스타</a>
                            </h2>
                            <h4 class="card-text">웹과 모바일을 가르치는 스타개발자.</h4>
                        </div>
                    </div>
                    <!-- end post -->

                    <!-- begin post -->
                    <div class="card">
                        <a href="view/starprofile/starprofile.html">
                            <img class="img-fluid" src="${contextPath }/resources/image/common/kangstar.jpg" alt="">
                        </a>
                        <div class="card-block">
                            <h2 class="card-title">
                                <a href="view/starprofile/starprofile.html">강스타</a>
                            </h2>
                            <h4 class="card-text">웹과 모바일을 가르치는 스타개발자.</h4>
                        </div>
                    </div>
                    <!-- end post -->

                    <!-- begin post -->
                    <div class="card">
                        <a href="view/starprofile/starprofile.html">
                            <img class="img-fluid" src="${contextPath }/resources/image/common/kangstar.jpg" alt="">
                        </a>
                        <div class="card-block">
                            <h2 class="card-title">
                                <a href="view/starprofile/starprofile.html">강스타</a>
                            </h2>
                            <h4 class="card-text">웹과 모바일을 가르치는 스타개발자.</h4>
                        </div>
                    </div>
                    <!-- end post -->

                    <!-- begin post -->
                    <!-- <div class="card">
                        <a href="view/starprofile/starprofile.html">
                            <img class="img-fluid" src="assets/img/demopic/10.jpg" alt="">
                        </a>
                        <div class="card-block">
                            <h2 class="card-title">
                                <a href="view/starprofile/starprofile.html">Visiting the world means learning cultures</a>
                            </h2>
                            <h4 class="card-text">This is a longer card with supporting text below as a
                                natural lead-in to additional content. This content is a little bit longer.</h4>
                            <div class="metafooter">
                                <div class="wrapfooter">
                                    <span class="meta-footer-thumb">
                                        <a href="author.html"><img
                                            class="author-thumb"
                                            src="https://www.gravatar.com/avatar/e56154546cf4be74e393c62d1ae9f9d4?s=250&amp;d=mm&amp;r=x"
                                            alt="Sal"></a>
                                    </span>
                                    <span class="author-meta">
                                        <span class="post-name">
                                            <a href="author.html">Sal</a>
                                        </span><br/>
                                        <span class="post-date">22 July 2017</span>
                                        <span class="dot"></span><span class="post-read">6 min read</span>
                                    </span>
                                    <span class="post-read-more">
                                        <a href="view/starprofile/starprofile.html" title="Read Story">
                                            <svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25">
                                                <path
                                                    d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z"
                                                    fill-rule="evenodd"></path>
                                            </svg>
                                        </a>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div> -->
                    <!-- end post -->

                </div>
            </section>
</body>
</html>