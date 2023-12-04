<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- 코드 작성구역 시작-->
<div class="container">
    <section style="margin-top: 40px;">
        <div class="row d-flex align-items-center justify-content-center h-100">
            <div class="col-xl-6" style="margin-right: 5%">
                <img src="/resource/images/search_IdPw.png"
                     class="rounded" style="width: 500px; " alt="">
            </div>
            <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-0">
                <%-- find ID  --%>
                <div class="divider d-flex align-items-center my-4">
                    <span class="text-center fw-bold mx-3 mar-bottom0" style="font-size: 20px">아이디 찾기</span>
                </div>
                <form action="/login/findId" method="POST">
                    <sec:csrfInput/>
                    <div class="mb-4">
                        <label for="memEmail1" class="form-label">이메일</label>
                        <input type="email" class="form-control form-control-lg"
                               id="memEmail1" autocomplete='off' required="required" name="memEmail"
                               placeholder="가입시 작성한 이메일을 입력하세요.">
                    </div>
                    <button type="submit" class="btn btn-primary btn-user btn-block">
                        FIND ID
                    </button>
                </form>
                <div class="divider d-flex align-items-center my-8">
                    <span class="text-center fw-bold mx-3 mar-bottom0" style="font-size: 20px">비밀번호 찾기</span>
                </div>
                <%-- find PW   --%>
                <form action="/login/findPw" method="POST">
                    <sec:csrfInput/>
                    <div class="mb-4">
                        <label for="memId" class="form-label">아이디</label>
                        <input type="text" class="form-control form-control-lg"
                               id="memId" autocomplete='off' required="required" name="memId">
                    </div>
                    <div class="mb-4">
                        <label for="memEmail" class="form-label">이메일</label>
                        <input type="email" class="form-control form-control-lg"
                               id="memEmail" autocomplete='off' required="required" name="memEmail"
                               placeholder="가입시 작성한 이메일을 입력하세요.">
                    </div>
                    <button type="submit" class="btn btn-primary btn-user btn-block">
                        FIND PASSWORD
                    </button>
                </form>
            </div>
        </div>
    </section>
</div>


<script type="text/javascript">


    var msg = "${msg}";

    if (msg != "") {
        alert(msg);
    }


</script>

<!-- 코드 작성구역 끝 -->

<%@include file="/WEB-INF/inc/footer.jsp" %>

</body>
</html>