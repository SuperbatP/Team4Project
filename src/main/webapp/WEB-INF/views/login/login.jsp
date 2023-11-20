<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>login</title>
</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>
<link rel="stylesheet" href="/resource/bootstrap-3.3.2/css/login.css">
<section class="vh-100">
    <div class="container h-60">
        <div class="row d-flex align-items-center justify-content-center h-100">
            <div class="col-xl-6" style="margin-right: 5%">
                <img src="/resource/bootstrap-3.3.2/images/loginImg.png"
                     class="rounded" style="width: 500px; " alt="">
            </div>
            <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-0">
                <form action="/login" class="" method="post">

                    <sec:csrfInput/>
                    <input type="hidden" name="remember" value="true">

                    <!-- id input -->
                    <div class="mb-4">
                        <label class="form-label" for="form1Example13">ID</label>
                        <input type="text" name="userId" value="${id}" id="form1Example13"
                               class="form-control form-control-lg" placeholder="아이디를 입력하세요.">
                    </div>

                    <!-- Password input -->
                    <div class="mb-4">
                        <label class="form-label" for="form1Example23">Password</label>
                        <input type="password" name="userPass" id="form1Example23" class="form-control form-control-lg"
                               placeholder="비밀번호를 입력하세요.">
                    </div>
                    <div class="d-flex justify-content-around align-items-center mb-4">
                        <!-- 아이디 기억하기 -->
                        <div class="form-check">
                            <label class="form-check-label" for="form1Example3"> ID 기억하기 </label>
                            <input class="form-check-input" type="checkbox" name="remember-me" value="Y"
                                   id="form1Example3" ${checked} >
                        </div>
                        <!-- 아이디 찾기 -->
                        <div class="form-check">
                            <label class="form-check-label"><a href="/login/search_Id.wow">아이디 찾기</a> </label>
                        </div>
                        <!-- 비밀번호 찾기 -->
                        <div class="form-check">
                            <label class="form-check-label"><a href="/login/search_Pw.wow">비밀번호 찾기</a></label>
                        </div>
                    </div>

                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
                    <a class="btn btn-primary btn-lg btn-block" style="background-color: #55acee"
                       href="/member/memberForm.wow"
                       role="button">회원가입</a>

                    <div class="divider d-flex align-items-center my-4">
                        <p class="text-center fw-bold mx-3 mb-0 text-muted">OR</p>
                    </div>

                    <a class="btn btn-primary btn-lg btn-block" style="background-color: #3b5998" href="${ naver_url }"
                       role="button">
                        <%--	SNS계정 로그인 아이콘	--%>
                        <i class="fab fa-facebook-f me-2"></i>Continue with Naver
                    </a>
                    <a class="btn btn-primary btn-lg btn-block" style="background-color: #55acee" href="${ google_url }"
                       role="button">
                        <i class="fab fa-twitter me-2"></i>Continue with Google</a>
                </form>
            </div>
        </div>
    </div>
</section>


<%@include file="/WEB-INF/inc/footer.jsp" %>
<!-- SCRIPTS -->
<script src="/resource/bootstrap-3.3.2/js/jquery.js"></script>
<script src="/resource/bootstrap-3.3.2/js/bootstrap.min.js"></script>
<script src="/resource/bootstrap-3.3.2/js/jquery.sticky.js"></script>
<script src="/resource/bootstrap-3.3.2/js/jquery.stellar.min.js"></script>
<script src="/resource/bootstrap-3.3.2/js/wow.min.js"></script>
<script src="/resource/bootstrap-3.3.2/js/smoothscroll.js"></script>
<script src="/resource/bootstrap-3.3.2/js/owl.carousel.min.js"></script>
<script src="/resource/bootstrap-3.3.2/js/custom.js"></script>


</body>
</html>