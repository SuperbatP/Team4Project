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

<c:forEach var="re" items="${reservation}">
    ${re}
    <a href="reservationEdit.wow?reNo=${re.reservationNo}">예약수정</a>
    <a href="reservationCancel.wow?reNo=${re.reservationNo}">예약취소</a>
</c:forEach>

<c:forEach var="ck" items="${checkUp}">
    ${ck}
    <a href="checkUpEdit.wow?ckNo=${ck.ckReservationNo}">예약수정</a>
    <a href="checkUpCancel.wow?ckNo=${ck.ckReservationNo}">예약취소</a>
</c:forEach>

<!-- 코드 작성구역 시작-->


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