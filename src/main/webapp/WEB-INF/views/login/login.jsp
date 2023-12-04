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
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/resource/bootstrap/css/login.css">
    <script type="text/javascript" src="/resource/bootstrap/js/jquery.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/jquery.sticky.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/jquery.stellar.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/wow.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/smoothscroll.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/custom.js"></script>
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>

<div class="container">
<section style="margin-top: 40px;">
        <div class="row d-flex align-items-center justify-content-center h-100">
            <div class="col-xl-6" style="margin-right: 5%">
                <img src="/resource/images/loginImg.png"
                     class="rounded" style="width: 500px; " alt="">
            </div>
            <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-0">
                <form action="/login" class="" method="post">
                    <sec:csrfInput/>
                    <input type="hidden" name="remember" value="true">

                    <!-- id input -->
                    <div class="mb-4">
                        <label class="form-label" for="userId">아이디</label>
                        <input type="text" name="userId" value="${id}" id="userId"
                               class="form-control form-control-lg" placeholder="아이디를 입력하세요." required="required">
                    </div>

                    <!-- Password input -->
                    <div class="mb-4">
                        <label class="form-label " for="userPass">비밀번호</label>
                        <input type="password" name="userPass" id="userPass" class="form-control form-control-lg"
                               placeholder="비밀번호를 입력하세요." required="required">
                    </div>
                    <div class="d-flex justify-content-around align-items-center mb-4">
                        <div class="d-flex align-items-center my-6">
                            <%--  공백 처리용--%>
                        </div>
                        <!-- 아이디 기억하기 -->
                        <div class="form-check">
                            <label class="form-check-label" for="idRemember"> 로그인 상태 유지 </label>
                            <input class="form-check-input" type="checkbox" name="remember-me" id="idRemember" value="True" ${checked} >
                        </div>
                        <!-- 아이디 찾기 -->
                        <div class="form-check">
                            <label class="form-check-label"><a href="/login/search_IdPw.wow">아이디 찾기 /  비밀번호 찾기</a> </label>
                        </div>
                    </div>


                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
                    <a class="btn btn-primary btn-lg btn-block" style="background-color: #55acee"
                       href="/member/memberForm.wow"
                       role="button">회원가입</a>
                    <%-- 소셜 네트워크 로그인 관련   --%>
               <%--     <div class="divider d-flex align-items-center my-4">
                        <p class="text-center fontW600 mx-3 mar-bottom0 text-muted">OR</p>
                    </div>

                    <a class="btn btn-primary btn-lg btn-block" style="background-color: #3b5998" href="${ naver_url }"
                       role="button">
                        &lt;%&ndash;	SNS계정 로그인 아이콘	&ndash;%&gt;
                        <i class="fab fa-facebook-f me-2"></i>Continue with Naver
                    </a>
                    <a class="btn btn-primary btn-lg btn-block" style="background-color: #55acee" href="${ google_url }"
                       role="button">
                        <i class="fab fa-twitter me-2"></i>Continue with Google</a>--%>
                </form>
            </div>
        </div>
</section>
</div>

<script>
    var msg = "${msg}";

    if (msg != "") {
        alert(msg);
    }
</script>
<%@include file="/WEB-INF/inc/footer.jsp" %>

</body>
</html>