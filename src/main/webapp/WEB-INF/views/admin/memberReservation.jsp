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
    <link rel="stylesheet" href="/resource/bootstrap/css/common.css"/>
    <link rel="stylesheet" href="/resource/bootstrap/css/sub.css"/>
    <link rel="stylesheet" href="/resource/bootstrap/css/reservation.css">
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
                        <td class="width200px height50px">의료진</td>
                        <td class="width200px height50px">진료과</td>
                        <td class="width200px height50px">예약날짜</td>
                        <td class="width200px height50px">예약시간</td>
                        <td class="width200px height50px"></td>
                    </tr>
                    <c:forEach var="re" items="${reservation}">
                        <form name="reservation" action="/admin/adminReservationEdit.wow" method="post">
                            <sec:csrfInput/>
                            <input name="memId" value="${member.memId}" type="hidden">
                            <tr class="table-tr">
                                <input name="reservationNo" value="${re.reservationNo}" type="hidden">
                                <input name="dcId" value="${re.dcId}" type="hidden">
                                <input name="treatmentCode" value="${re.treatmentCode}" type="hidden">
                                <td class="width200px height50px">
                                    <input name="dcName" value="${re.dcName}" readonly="readonly">
                                </td>
                                <td class="width200px height50px">
                                    <input name="treatmentName" value="${re.treatmentName}" readonly="readonly">
                                </td>
                                <td class="width200px height50px">
                                    <input name="reservationDateString" value="${re.reservationDateString}"
                                           readonly="readonly">
                                </td>
                                <td class="width200px height50px">
                                    <input name="reservationTime" value="${re.reservationTime}" readonly="readonly">
                                </td>
                                <input name="memName" value="${re.memName}" type="hidden">
                                <input name="memHp" value="${re.memHp}" type="hidden">
                                <input name="memEmail" value="${re.memEmail}" type="hidden">
                                <input name="etc" value="${re.etc}" type="hidden">
                                <td class="width200px height50px">
                                    <div class="reservation-btnbox">
                                        <button type="submit" class="width80px height40px btn-gray"><b>수정</b></button>
                                        <button type="submit" formaction="/admin/adminReservationCancel.wow"
                                                class="width80px height40px btn-green margin-left5 cancelBtn"
                                                onclick="cancelAction()"><b>취소</b></button>
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
                        <td class="width200px height50px">예약자명</td>
                        <td class="width200px height50px">기본검진</td>
                        <td class="width200px height50px">추가검진</td>
                        <td class="width200px height50px">유전자검사</td>
                        <td class="width200px height50px">예약날짜</td>
                        <td class="width200px height50px">예약시간</td>
                        <td class="width200px height50px"></td>
                    </tr>
                    <c:forEach var="ck" items="${checkUp}">
                        <form name="checkUp" action="/admin/adminCheckUpEdit.wow" method="post">
                            <sec:csrfInput/>
                            <input name="memId" value="${member.memId}" type="hidden">
                            <input name="ckReservationNo" value="${ck.ckReservationNo}" type="hidden">
                            <input name="reservationGender" value="${ck.reservationGender}" type="hidden">
                            <input name="reservationBirthday" value="${ck.reservationBirthday}" type="hidden">
                            <input name="reservationHp" value="${ck.reservationHp}" type="hidden">
                            <input name="etc" value="${ck.etc}" type="hidden">

                            <tr class="table-tr">
                                <td class="width200px height50px">
                                    <input name="reservationName" value="${ck.reservationName}" readonly="readonly">
                                </td>
                                <td class="width200px height50px">
                                    <input name="basicCheckupCode" value="${ck.basicCheckupName}" readonly="readonly">
                                </td>
                                <td class="width200px height50px">
                                    <input name="addCheckupCode" value="${ck.addCheckupName}" readonly="readonly">
                                </td>
                                <td class="width200px height50px">
                                    <input name="dnaTestCode" value="${ck.dnaTestName}" readonly="readonly">
                                </td>
                                <td class="width200px height50px">
                                    <input name="reservationDateString" value="${ck.reservationDateString}"
                                           readonly="readonly">
                                </td>
                                <td class="width200px height50px">
                                    <input name="reservationTime" value="${ck.reservationTime}" readonly="readonly">
                                </td>
                                <td class="width200px height50px">
                                    <div class="reservation-btnbox">
                                        <button type="submit" class="width80px height40px btn-gray"><b>수정</b></button>
                                        <button type="submit" formaction="/admin/adminCheckUpCancel.wow"
                                                class="width80px height40px btn-green margin-left5 cancelBtn"
                                                onclick="cancelAction()"><b>취소</b></button>
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

    function cancelAction() {
        if (!window.confirm("예약을 취소하시겠습니까?")) {
            event.preventDefault();
        }
    }


</script>

<!-- 코드 작성구역 끝 -->

<%@include file="/WEB-INF/inc/footer.jsp" %>


</body>
</html>