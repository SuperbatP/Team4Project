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

<style>

    .container2 {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap;
        margin-top: 90px;

    }

    .header {
        display: flex;
        justify-content: start;
        border-bottom: 1.5px solid gainsboro;
        min-width: 700px;
        max-width: 1200px;

    }


    .doctor-info-frame {
        max-width: 1200px;
        min-width: 736px;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 520px;
        flex-wrap: wrap;
    }

    .doctor-info {
        padding-top: 15px;
        display: flex;
        justify-content: space-around;
        align-items: center;
        width: 100%;
        height: 230px;
    }

    .doctor-img {
        height: 230px;
        width: 210px;

        display: flex;
        justify-content: center;
        align-items: center;
    }


    .reservation-box {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap;


        width: 130px;
        height: 110px;
        background: #a5c422;

    }

    .reservation-box:hover {
        background: #393939;
        color: #ffffff;
    }

    .reservation-box > img {
        margin-top: 10px;
        width: 80px;
        height: 70px;
        border-radius: 40px;
    }

    .reservation-box > p {
        font-size: 15px;
        color: black;
    }

    .graph {
        height: 200px;
        display: flex;
        align-items: start;
        justify-content: center;
    }

    table {
        border-collapse: collapse;
    }

    /*이중선 제거*/
    th,
    td {
        width: 125px;
        height: 55px;
        text-align: center;
        border: 1px solid gainsboro;
        color: gray;
    }

    .middle-box-top{
        width: 98%;

        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .middle-box-bottom{
        width: 98%;
        height: 90px;

    }

    .middle-box {

        display: flex;
        flex-wrap: wrap;
    }

</style>

<div class="container2">
    <c:forEach var="doctor" items="${doctors}">
        <div class="header col-sm-7 wow fadeInUp">
            <h2 data-wow-delay="0.1s">${doctor.major}</h2>
        </div>
        <div class="col-sm-7 doctor-info-frame wow fadeInUp" data-wow-delay="0.2s">
            <div class="doctor-info">
                <div class="doctor-img col-sm-2">
                    <img src="${doctor.dcImg}" class="img-responsive" alt="" style="width: 100%; height: 200px;">
                </div>

                <div class="middle-box col-sm-9">
                    <div class="middle-box-top">
                        <div>
                            <h2 style="font-size: 30px">${doctor.dcName}</h2>
                            <p style="font-size: 20px">&nbsp${doctor.major}</p>
                        </div>
                        <a href="reservationForm.wow?memId=${USER_INFO!=null ? USER_INFO.userId : null}&dcId=${doctor.dcId}">
                            <div class="reservation-box col-sm-2">
                                <img src="../../../resource/bootstrap-3.3.2/images/달력.png">
                                <p>진료예약</p>
                            </div>
                        </a>
                    </div>

                    <div class="team-contact-info middle-box-bottom">
                        <p style="font-size: 18px"><i>·</i> ${doctor.university}</p>
                        <p style="font-size: 18px"><i>·</i> ${doctor.workHistory}</p>
                    </div>
                </div>

            </div>
            <div class="graph">
                <table>
                    <tr>
                        <td scope="col"></td>
                        <td scope="col">월</td>
                        <td scope="col">화</td>
                        <td scope="col">수</td>
                        <td scope="col">목</td>
                        <td scope="col">금</td>
                        <td scope="col">토</td>

                        <td scope="col">일</td>
                    </tr>
                    <tr>
                        <td>예약가능일</td>
                        <c:set var="myList" value="${attendance.get(doctor.dcId)}"/>
                        <td id="mon">
                            <c:if test='${myList.contains("월")}'>●</c:if>
                        </td>
                        <td id="tue">
                            <c:if test='${myList.contains("화")}'>●</c:if>
                        </td>
                        <td id="wen">
                            <c:if test='${myList.contains("수")}'>●</c:if>
                        </td>
                        <td id="thu">
                            <c:if test='${myList.contains("목")}'>●</c:if>
                        </td>
                        <td id="fri">
                            <c:if test='${myList.contains("금")}'>●</c:if>
                        </td>
                        <td id="sat">
                            <c:if test='${myList.contains("토")}'>●</c:if>
                        </td>
                        <td id="sun">
                            <c:if test='${myList.contains("일")}'>●</c:if>
                        </td>
                    </tr>

                </table>
            </div>

        </div>


    </c:forEach>
</div>

<script>

</script>


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