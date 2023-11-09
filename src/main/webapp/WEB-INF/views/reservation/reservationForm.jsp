
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@include file="/WEB-INF/inc/header.jsp"%>
    <title></title>

</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

<!-- 코드 작성구역 시작-->

<form name="reservation" action="reservationRegist.wow" method="post">
    <input type="hidden" name="memId" value="${member.memId}">
    이름<input name="memName" value="${member.memName}">
    전화번호<input name="memHp" value="${member.memHp}">
    메일주소<input name="memEmail" value="${member.memMail}">
    <input type="hidden" name="dcId" value="${doctor.dcId}">
    <input type="hidden" name="treatmentCode" value="${doctor.treatmentCode}">
    <label>예약일</label>
    <div>
        <select name="reservationDate">
            <c:forEach var="at" items="${attendance}">
                <option value="${at.attendanceDate}">${at.attendanceDate}</option>
            </c:forEach>
        </select>
    </div>

    <label>예약시간</label>
    <div>
        <select name="reservationTime">
            <c:forEach var="at" items="${attendance}">
                <option value="${at.attendanceTime}">${at.attendanceTime}</option>
            </c:forEach>
        </select>
    </div>
<%--    나중에 추가구현--%>
<%--    문진표--%>
<%--    선결제--%>
    <button type="submit">예약</button>
</form>

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