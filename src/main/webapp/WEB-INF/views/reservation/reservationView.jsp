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

</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>


<c:forEach var="re" items="${reservation}">
    <form name="reservation" action="reservationEdit.wow" method="post">
        <sec:csrfInput/>
        <div>
            <input name="reservationNo" value="${re.reservationNo}" type="hidden">
            <input name="" value="${re.dcName}" readonly="readonly">
            <input name="" value="${re.treatmentName}" readonly="readonly">
            <input name="" value="${re.reservationDate}" readonly="readonly">
            <input name="" value="${re.reservationTime}" readonly="readonly">
            <input name="" value="${re.memHp}" type="hidden">
            <input name="" value="${re.memEmail}" type="hidden">
            <input name="" value="${re.etc}" type="hidden">

            <button type="submit">예약수정</button>
            <button type="submit" formaction="reservationCancel.wow">예약취소</button>
        </div>
    </form>
</c:forEach>


<c:forEach var="ck" items="${checkUp}">
    <form name="checkUp" action="checkUpEdit.wow" method="post">
        <sec:csrfInput/>
        <div>
            <input name="ckReservationNo" value="${ck.ckReservationNo}" type="hidden">
            <input name="" value="${ck.reservationName}" readonly="readonly">
            <input name="" value="${ck.reservationGender}" type="hidden">
            <input name="" value="${ck.reservationBirthday}" type="hidden">
            <input name="" value="${ck.reservationHp}" type="hidden">
            <input name="" value="${ck.reservationDate}" readonly="readonly">
            <input name="" value="${ck.reservationTime}" readonly="readonly">
            <input name="" value="${ck.basicCheckupCode}" type="hidden">
            <input name="" value="${ck.addCheckupCode}" type="hidden">
            <input name="" value="${ck.dnaTestCode}" type="hidden">
            <input name="" value="${ck.etc}" type="hidden">

            <button type="submit">예약수정</button>
            <button type="submit" formaction="checkUpCancel.wow">예약취소</button>
        </div>
    </form>
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