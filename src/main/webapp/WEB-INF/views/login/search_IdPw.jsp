<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title></title>

</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>
<link rel="stylesheet" href="/resource/bootstrap-3.3.2/css/common.css">
<link rel="stylesheet" href="/resource/bootstrap-3.3.2/css/sub.css">
<!-- 코드 작성구역 시작-->
<section class="vh-100">
    <div class="container h-60">
        <div class="row d-flex align-items-center justify-content-center h-100">
            <div class="col-xl-6" style="margin-right: 5%">
                <img src="/resource/bootstrap-3.3.2/images/search_IdPw.png"
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
                    <div class="divider d-flex align-items-center my-8" >
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
    </div>
</section>

<script type="text/javascript">


    var msg = "${msg}";

    if (msg != "") {
        alert(msg);
    }


</script>

<!-- 코드 작성구역 끝 -->

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