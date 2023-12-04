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
                <h4> 임시비밀번호를  &nbsp;
                    <c:forEach items="${member}" var="member">
                   <span style="color: #a10000">${member}</span>
                    </c:forEach>
                    &nbsp;&nbsp; 로 전송하였습니다.</h4>
                <button type="button" class="btn btn-primary" onclick="location.href='/login/login.wow'">로그인페이지</button>
                <button type="button" class="btn btn-primary" onclick="location.href='/login/search_IdPw.wow'">뒤로가기</button>
            </div>
        </div>
    </section>
</div>

<!-- 코드 작성구역 끝 -->

<%@include file="/WEB-INF/inc/footer.jsp" %>

</body>
</html>