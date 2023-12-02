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
    <link rel="stylesheet" href="/resource/bootstrap/css/common.css"/>
    <link rel="stylesheet" href="/resource/bootstrap/css/sub.css"/>
    <script src="/resource/bootstrap/js/jquery.js"></script>
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resource/bootstrap/js/jquery.sticky.js"></script>
    <script src="/resource/bootstrap/js/jquery.stellar.min.js"></script>
    <script src="/resource/bootstrap/js/wow.min.js"></script>
    <script src="/resource/bootstrap/js/smoothscroll.js"></script>
    <script src="/resource/bootstrap/js/owl.carousel.min.js"></script>
    <script src="/resource/bootstrap/js/custom.js"></script>
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>

<!-- 코드 작성구역 시작-->
<div class="container">
    <h3 class="mar-top40">증명서 조회</h3>

    <div style="margin-top: 40px;">
    <table class="width100 border-bottom">
        <tr class="table-tr fontW600">
            <td class="width200px height50px">증명서 종류</td>
            <td class="width200px height50px">진단명 포함</td>
            <td class="width200px height50px">발급 가능 년도</td>
            <td class="width200px height50px">조회</td>
        </tr>
        <tr class="table-tr">
            <td class="width200px height50px">
                <span>진단서</span>
            </td>
            <td class="width200px height50px">
                <span>포함</span>
            </td>
            <td class="width200px height50px">
                <span>제한없음</span>
            </td>
            <td class="width200px height50px">
                <div class="reservation-btnbox">
                    <button type="button" class="width80px height40px btn-green margin-left5 cancelBtn"><a href="certificateHistory.wow?fileName=진단서">조회</a></button>
                </div>
            </td>
        </tr>
        <tr class="table-tr">
            <td class="width200px height50px">
                <span>소견서</span>
            </td>
            <td class="width200px height50px">
                <span>포함</span>
            </td>
            <td class="width200px height50px">
                <span>5년</span>
            </td>
            <td class="width200px height50px">
                <div class="reservation-btnbox">
                    <button type="button" class="width80px height40px btn-green margin-left5 cancelBtn"><a href="certificateHistory.wow?fileName=소견서">조회</a></button>
                </div>
            </td>
        </tr>
        <tr class="table-tr">
            <td class="width200px height50px">
                <span>진료계산서 영수증 발급</span>
            </td>
            <td class="width200px height50px">
                <span>미포함</span>
            </td>
            <td class="width200px height50px">
                <span>1년</span>
            </td>
            <td class="width200px height50px">
                <div class="reservation-btnbox">
                    <button type="button" class="width80px height40px btn-green margin-left5 cancelBtn"><a href="certificateHistory.wow?fileName=진료계산서영수증">조회</a></button>
                </div>
            </td>
        </tr>
    </table>
    </div>
</div>

<!-- 코드 작성구역 끝 -->

<%@include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>