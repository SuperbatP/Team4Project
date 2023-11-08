<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>
<c:forEach var="doctor" items="${doctors}">
    <div>
        <img src="${doctor.dcImg}">
        이름${doctor.dcName}
        진료과${doctor.major}
        일정
        <c:forEach var="atList" items="${attendance.get(doctor.dcId)}">
            ${atList.attendanceDate}
            ${atList.attendanceTime}
        </c:forEach>
        <a href="reservationForm.wow?dcId=${doctor.dcId}">진료예약</a>
    </div>
</c:forEach>

<%@include file="/WEB-INF/inc/footer.jsp" %>
<!-- SCRIPTS -->
<script src="resource/bootstrap-3.3.2/js/jquery.js"></script>
<script src="resource/bootstrap-3.3.2/js/bootstrap.min.js"></script>
<script src="resource/bootstrap-3.3.2/js/jquery.sticky.js"></script>
<script src="resource/bootstrap-3.3.2/js/jquery.stellar.min.js"></script>
<script src="resource/bootstrap-3.3.2/js/wow.min.js"></script>
<script src="resource/bootstrap-3.3.2/js/smoothscroll.js"></script>
<script src="resource/bootstrap-3.3.2/js/owl.carousel.min.js"></script>
<script src="resource/bootstrap-3.3.2/js/custom.js"></script>

</body>
</html>