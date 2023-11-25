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
<link rel="stylesheet" href="/resource/bootstrap-3.3.2/css/login.css">


<!-- 코드 작성구역 시작-->
<section class="vh-100">
    <div class="container h-60">
        <div class="row d-flex align-items-center justify-content-center h-100">
            <div class="col-xl-6" style="margin-right: 5%">
                <img src="/resource/bootstrap-3.3.2/images/search_IdPw.png"
                     class="rounded" style="width: 500px; " alt="">
            </div>
            <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-0">
                <h4> 아이디는 &nbsp;
                    <c:forEach items="${member}" var="member">
                   <span style="color: #a10000">${member.memId}</span>
                    </c:forEach>
                    &nbsp; 입니다</h4>
                <button type="button" class="btn btn-primary" onclick="location.href='/login/login.wow'">로그인페이지</button>
                <button type="button" class="btn btn-primary" onclick="location.href='/login/search_IdPw.wow'">뒤로가기</button>
            </div>
        </div>
    </div>
</section>


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