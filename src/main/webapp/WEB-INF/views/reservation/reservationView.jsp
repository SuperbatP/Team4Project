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
    <title>예약확인 및 취소</title>
    <link rel="stylesheet" href="/resource/bootstrap-3.3.2/css/common.css"/>
    <link rel="stylesheet" href="/resource/bootstrap-3.3.2/css/sub.css"/>
    <script type="text/javascript" src="/resource/bootstrap-3.3.2/js/jquery.js"></script>
    <script type="text/javascript" src="/resource/bootstrap-3.3.2/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap-3.3.2/js/jquery.sticky.js"></script>
    <script type="text/javascript" src="/resource/bootstrap-3.3.2/js/jquery.stellar.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap-3.3.2/js/wow.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap-3.3.2/js/smoothscroll.js"></script>
    <script type="text/javascript" src="/resource/bootstrap-3.3.2/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap-3.3.2/js/custom.js"></script>
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>

<div class="container">
    <h3 class="mar-top40">예약확인 및 취소</h3>
    <ul class="tab-nav" role="tablist" id="myTab">
        <li><a href="#tab1">진료예약</a></li>
        <li><a href="#tab2">건강검진예약</a></li>
    </ul>
    <div class="tab-content">
        <div id="tab1">
            <div>
                <table class="width100 border-bottom">
                    <tr class="table-tr fontW600">
                        <td class="width200px height50px" >의료진</td>
                        <td class="width200px height50px" >진료과</td>
                        <td class="width200px height50px" >예약날짜</td>
                        <td class="width200px height50px" >예약시간</td>
                        <td class="width200px height50px" ></td>
                    </tr>
                    <c:forEach var="re" items="${reservation}">
                        <form name="reservation" action="reservationEdit.wow" method="post">
                            <sec:csrfInput/>
                            <tr class="table-tr">
                                <input name="reservationNo" value="${re.reservationNo}" type="hidden">
                                <input name="dcId" value="${re.dcId}" type="hidden">
                                <input name="treatmentCode" value="${re.treatmentCode}" type="hidden">
                                <td class="width200px height50px" >
                                    <input name="dcName" value="${re.dcName}" readonly="readonly">
                                </td>
                                <td class="width200px height50px" >
                                    <input name="treatmentName" value="${re.treatmentName}" readonly="readonly">
                                </td>
                                <td class="width200px height50px" >
                                    <input name="reservationDateString" value="${re.reservationDateString}" readonly="readonly">
                                </td>
                                <td class="width200px height50px" >
                                    <input name="reservationTime" value="${re.reservationTime}" readonly="readonly">
                                </td>
                                <input name="memName" value="${re.memName}" type="hidden">
                                <input name="memHp" value="${re.memHp}" type="hidden">
                                <input name="memEmail" value="${re.memEmail}" type="hidden">
                                <input name="etc" value="${re.etc}" type="hidden">
                                <td class="width200px height50px" >
                                    <div class="reservation-btnbox">
                                        <button type="submit" class="width80px height40px btn-gray"><b>수정</b></button>
                                        <button type="submit" class="width80px height40px btn-green margin-left5" id="cf-submit" formaction="reservationCancel.wow"><b>취소</b></button>
                                    </div>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                </table>
            </div>
        </div>

        <div id="tab2">
            <div>
                <table class="width100 border-bottom">
                    <tr class="table-tr fontW600">
                        <td class="width200px height50px" >의료진</td>
                        <td class="width200px height50px" >기본검진</td>
                        <td class="width200px height50px" >추가검진</td>
                        <td class="width200px height50px" >유전자검사</td>
                        <td class="width200px height50px" >예약날짜</td>
                        <td class="width200px height50px" >예약시간</td>
                        <td class="width200px height50px" ></td>
                    </tr>
                    <c:forEach var="ck" items="${checkUp}">
                        <form name="checkUp" action="checkUpEdit.wow" method="post">
                            <sec:csrfInput/>
                            <tr class="table-tr">
                                <input name="ckReservationNo" value="${ck.ckReservationNo}" type="hidden">
                                <td class="width200px height50px" >
                                    <input name="reservationName" value="${ck.reservationName}" readonly="readonly">
                                </td>
                                <td class="width200px height50px" >
                                    <input name="basicCheckupCode" value="${ck.basicCheckupCode}">
                                </td>
                                <td class="width200px height50px" >
                                    <input name="addCheckupCode" value="${ck.addCheckupCode}">
                                </td>
                                <td class="width200px height50px" >
                                    <input name="dnaTestCode" value="${ck.dnaTestCode}">
                                </td>
                                <input name="reservationGender" value="${ck.reservationGender}" type="hidden">
                                <input name="reservationBirthday" value="${ck.reservationBirthday}" type="hidden">
                                <input name="reservationHp" value="${ck.reservationHp}" type="hidden">
                                <td class="width200px height50px" >
                                    <input name="reservationDateString" value="${ck.reservationDateString}"
                                           readonly="readonly">
                                </td>
                                <td class="width200px height50px" >
                                    <input name="reservationTime" value="${ck.reservationTime}" readonly="readonly">
                                </td>
                                <input name="etc" value="${ck.etc}" type="hidden">
                                <td class="width200px height50px" >
                                    <div class="reservation-btnbox">
                                        <button type="submit" class="width80px height40px btn-gray"><b>수정</b></button>
                                        <button type="submit" class="width80px height40px btn-green margin-left5" formaction="checkUpCancel.wow"><b>취소</b></button>
                                    </div>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- 코드 작성구역 시작-->

<script>

    $(function () {
        $('.tab-content > div').hide();
        $('.tab-nav a').click(function () {
            $('.tab-content > div').hide().filter(this.hash).fadeIn();
            $('.tab-nav a').removeClass('active');
            $(this).addClass('active');
            return false;
        }).filter(':eq(0)').click();
    });

</script>

<!-- 코드 작성구역 끝 -->

<%@include file="/WEB-INF/inc/footer.jsp" %>


</body>
</html>