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


<div class="container">
    <h3 class="mar-top40">증명서 발급</h3>

    <form name="certificate" style="flex-wrap: wrap" method="post" action="certificateDownload.wow">
        <sec:csrfInput/>
        <input type="hidden" name="fileName" value="${fileName}">
        <table class="width100 border-bottom">
            <tr class="table-tr fontW600">
                <td></td>
                <td class="width200px height50px">진료과</td>
                <td class="width200px height50px">담당의</td>
                <td class="width200px height50px">내원일</td>
            </tr>
            <c:forEach var="hi" items="${history}">
            <tr class="table-tr">
                <td class="width200px height50px">
                    <input type="radio" name="reservationNo" value="${hi.reservationNo}">
                </td>
                <td class="width200px height50px">
                    <span>${hi.dtName}</span>
                </td>
                <td class="width200px height50px">
                    <span>${hi.dcName}</span>
                </td>
                <td class="width200px height50px">
                    <span>${hi.reservationDateString}</span>
                </td>
            </tr>
            </c:forEach>
        </table>
        <div style="margin-top: 10px">
            <button type="submit" class="width80px height40px btn-green margin-left5 cancelBtn">발급</button>
        </div>
    </form>
</div>

<%@include file="/WEB-INF/inc/footer.jsp" %>

<script>
    $form = $("form[name='certificate']");

    $form.find("button[type=submit]").click(function (e) {
        e.preventDefault();
        if ($("input[name='reservationNo']:checked")[0]) {
            $form.submit();
        } else {
            alert("진료내역을 선택해주세요");
        }
    });
</script>
</body>
</html>