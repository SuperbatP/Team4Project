
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
    <style>
        td {
            width: 50px;
            height: 50px;
        }

        .Calendar {
            text-align: center;
            margin: 0 auto;
        }

        .Calendar>thead>tr:first-child>td { font-weight: bold; }

        .Calendar>thead>tr:last-child>td {
            background-color: gray;
            color: white;
        }

        .pastDay{ background-color: lightgray; }

        .today{
            background-color: #FFCA64;
            cursor: pointer;
        }

        .futureDay{
            background-color: #FFFFFF;
            cursor: pointer;
        }

        .futureDay.choiceDay, .today.choiceDay{
            background-color: #3E85EF;
            color: #fff;
            cursor: pointer;
        }
    </style>
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<form name="reservation" action="reservationRegist.wow" method="post">
    <input type="hidden" name="memId" value="${member.memId}">
    이름<input name="memName" value="${member.memName}">
    전화번호<input name="memHp" value="${member.memHp}">
    메일주소<input name="memEmail" value="${member.memEmail}">
    <input type="hidden" name="dcId" value="${doctor.dcId}">
    <input type="hidden" name="treatmentCode" value="${doctor.treatmentCode}">

    <table class="Calendar">
        <thead>
        <tr>
            <td onclick="prevCalendar()" style="cursor:pointer;">&#60;</td>
            <td colspan="5">
                <span id="calYear"></span>년
                <span id="calMonth"></span>월
            </td>
            <td onclick="nextCalendar()" style="cursor:pointer;">&#62;</td>
        </tr>
        <tr>
            <td>일</td>
            <td>월</td>
            <td>화</td>
            <td>수</td>
            <td>목</td>
            <td>금</td>
            <td>토</td>
        </tr>
        </thead>

        <tbody>

        </tbody>
    </table>


    <c:forEach var="at" items="${attendance}">
        <input class="attendanceDate" type="hidden" value="${at.attendanceDate}">
        <input class="attendanceTime" type="hidden" value="${at.attendanceTime}">
    </c:forEach>

    <c:forEach var="re" items="${reservation}">
        <c:if test="${re.dcId eq doctor.dcId}">
            <input class="reservationDate" type="hidden" value="${re.reservationDate}">
            <input class="reservationTime" type="hidden" value="${re.reservationTime}">
        </c:if>
    </c:forEach>

    <label>예약시간</label>
    <div>
        <select name="reservationTime">

        </select>
    </div>
<%--    나중에 추가구현--%>
<%--    문진표--%>
<%--    선결제--%>
    <button type="submit">예약</button>
</form>

<%@include file="/WEB-INF/inc/footer.jsp" %>

<!-- 코드 작성구역 시작 -->
<script>
    window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

    let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
    let today = new Date();     // 페이지를 로드한 날짜를 저장
    today.setHours(0,0,0,0);    // 비교 편의를 위해 today의 시간을 초기화

    let atDate = document.getElementsByClassName('attendanceDate');
    let atTime = document.getElementsByClassName('attendanceTime');
    let reDate = document.getElementsByClassName('reservationDate');
    let reTime = document.getElementsByClassName('reservationTime');

    // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
    function buildCalendar() {
        let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
        let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

        let tbody_Calendar = document.querySelector(".Calendar > tbody");
        document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
        document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신

        while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
            tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
        }

        let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가

        for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
            let nowColumn = nowRow.insertCell();        // 열 추가
        }

        for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복

            let nowColumn = nowRow.insertCell();        // 새 열을 추가하고
            nowColumn.innerText = leftPad(nowDay.getDate());      // 추가한 열에 날짜 입력


            if (nowDay.getDay() == 0) {                 // 일요일인 경우 글자색 빨강으로
                nowColumn.style.color = "#DC143C";
            }
            if (nowDay.getDay() == 6) {                 // 토요일인 경우 글자색 파랑으로 하고
                nowColumn.style.color = "#0000CD";
                nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
            }

            if (nowDay < today) {                       // 지난날인 경우
                nowColumn.className = "pastDay";
            }
            else {
                for (let i = 0; i < atDate.length; i++) {
                    if(DayToNum(atDate[i].value) == nowDay.getDay()){
                        if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우
                            nowColumn.className = "today";
                            nowColumn.onclick = function () { choiceDate(this); }
                            break;
                        }
                        else {                                      // 미래인 경우
                            nowColumn.className = "futureDay";
                            nowColumn.onclick = function () { choiceDate(this); }
                            break;
                        }
                    }

                    nowColumn.className = "pastDay";
                }
            }


            // if (nowDay < today) {                       // 지난날인 경우
            //     nowColumn.className = "pastDay";
            // }
            // else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우
            //     nowColumn.className = "today";
            //     nowColumn.onclick = function () { choiceDate(this); }
            // }
            // else {                                      // 미래인 경우
            //     nowColumn.className = "futureDay";
            //     nowColumn.onclick = function () { choiceDate(this); }
            // }
        }
    }

    // 날짜 선택
    function choiceDate(nowColumn) {
        if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
            document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
        }
        nowColumn.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
        console.log(nowColumn);


    }

    // 이전달 버튼 클릭
    function prevCalendar() {
        nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
        buildCalendar();    // 달력 다시 생성
    }
    // 다음달 버튼 클릭
    function nextCalendar() {
        nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
        buildCalendar();    // 달력 다시 생성
    }

    // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
    function leftPad(value) {
        if (value < 10) {
            value = "0" + value;
            return value;
        }
        return value;
    }

    function DayToNum(day){
        switch (day){
            case '일':
                return 0;
            case '월':
                return 1;
            case '화':
                return 2;
            case '수':
                return 3;
            case '목':
                return 4;
            case '금':
                return 5;
            case '토':
                return 6;
        }
    }
</script>
<!-- 코드 작성구역 끝 -->

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