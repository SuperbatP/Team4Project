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
        border-bottom: 0.2px solid gainsboro;
        min-width: 700px;
        max-width: 1200px;

    }


    .doctor-info-frame {
        max-width: 1200px;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 450px;
        border-bottom: 0.2px solid gainsboro;

    }

    .doctorimg {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap;
        width: 200px;
        height: 380px;

    }

    .doctorim > img {
        margin-bottom: 20px;
    }

    .reservation-box {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap;
        width: 100%;
        height: 120px;
        padding-top: 10px;
        border: 0.5px solid gainsboro;
        margin-top: 20px;
    }

    .reservation-box > img {
        width: 80px;
        height: 70px;
        border-radius: 40px;
        margin-left: 20px;
        margin-right: 20px;
    }

    .reservation-box > p {
        font-size: 15px;
        color: gray;
    }

    .graph {
        height: 200px;
        display: flex;
        align-items: center;
    }

    table {
        border-collapse: collapse;
    }

    /*이중선 제거*/
    th,
    td {
        width: 100px;
        height: 40px;
        text-align: center;
        border: 1px solid gainsboro;
        color: gray;
    }

    .doctor-info {
        padding-top: 30px;
        min-width: 300px;
        height: 380px;

    }

    .doctor-info > div {
        padding-left: 30px;
    }
</style>

<div class="container2">
    <div class="header col-sm-10 wow fadeInUp">
        <h2 data-wow-delay="0.1s">진료과목나와야됨</h2>
    </div>
    <c:forEach var="doctor" items="${doctors}">
        <div class="col-sm-10 doctor-info-frame wow fadeInUp" data-wow-delay="0.2s">
            <div class="doctorimg col-sm-2">
                <img src="${doctor.dcImg}" class="img-responsive" alt="" style="width: 100%; height: 200px;">
                <a href="reservationForm.wow?memId=${USER_INFO!=null ? USER_INFO.userId : null}&dcId=${doctor.dcId}">
                    <div class="reservation-box">
                        <img src="../../../resource/bootstrap-3.3.2/images/달력.png">
                        <p>진료예약</p>
                    </div>
                </a>
            </div>

            <div class="doctor-info col-sm-10">
                <div>
                    <h3>${doctor.dcName}</h3>
                    <p>&nbsp${doctor.major}</p>
                </div>
                <div class="team-contact-info">
                    <p><i>·</i> ${doctor.university}</p>
                    <p><i>·</i> ${doctor.workHistory}</p>
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
                            <c:set  var="myList" value="${attendance.get(doctor.dcId)}" />
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