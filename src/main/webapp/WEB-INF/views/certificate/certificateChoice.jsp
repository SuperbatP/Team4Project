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
    <link rel="stylesheet" href="/resource/bootstrap-3.3.2/css/common.css"/>
    <link rel="stylesheet" href="/resource/bootstrap-3.3.2/css/sub.css"/>
    <script src="/resource/bootstrap-3.3.2/js/jquery.js"></script>
    <script src="/resource/bootstrap-3.3.2/js/bootstrap.min.js"></script>
    <script src="/resource/bootstrap-3.3.2/js/jquery.sticky.js"></script>
    <script src="/resource/bootstrap-3.3.2/js/jquery.stellar.min.js"></script>
    <script src="/resource/bootstrap-3.3.2/js/wow.min.js"></script>
    <script src="/resource/bootstrap-3.3.2/js/smoothscroll.js"></script>
    <script src="/resource/bootstrap-3.3.2/js/owl.carousel.min.js"></script>
    <script src="/resource/bootstrap-3.3.2/js/custom.js"></script>
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>

<a href="certificateHistory.wow?fileName=진단서">진단서 발급</a>
<a href="certificateHistory.wow?fileName=소견서">소견서 발급</a>
<a href="certificateHistory.wow?fileName=진료계산서영수증">진료계산서 영수증 발급</a>

<!-- 코드 작성구역 시작-->


<!-- 코드 작성구역 끝 -->

<%@include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>