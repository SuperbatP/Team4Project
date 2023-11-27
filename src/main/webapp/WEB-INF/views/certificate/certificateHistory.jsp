<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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

<form name="certificate" method="post" action="certificateDownload.wow">
    <sec:csrfInput/>
    <input type="hidden" name="fileName" value="${fileName}">
    <table>
        <tr>
            <td></td>
            <td>진료과</td>
            <td>담당의</td>
            <td>내원일</td>
        </tr>
        <c:forEach var="hi" items="${history}">
            <tr>
                <td><input type="radio" name="reservationNo" value="${hi.reservationNo}"></td>
                <td>${hi.dtName}</td>
                <td>${hi.dcName}</td>
                <td>${hi.reservationDateString}</td>
            </tr>
        </c:forEach>
    </table>
    <button type="submit">발급</button>
</form>

<!-- 코드 작성구역 시작-->


<!-- 코드 작성구역 끝 -->

<%@include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>