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
    <link rel="stylesheet" href="/resource/bootstrap/css/reservation.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <script type="text/javascript" src="/resource/bootstrap/js/jquery.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/jquery.sticky.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/jquery.stellar.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/wow.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/smoothscroll.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/custom.js"></script>

    <script>

        function toStringByFormatting(source, delimiter = '-') {
            const year = source.getFullYear();
            const month = leftPad(source.getMonth() + 1);
            const day = leftPad(source.getDate());

            return [year, month, day].join(delimiter);
        }

        $(document).ready(function () {
            // Get the value of the input field
            const memberDate = document.getElementById("memberDate");
            const dateValue = "${member.memBir}";

            console.log("memberDate");
            console.log(memberDate);

            console.log("nalJJA");
            console.log(dateValue);


            // Convert the date to the desired format
            const formattedDateObject = new Date(dateValue);
            const dateStr = toStringByFormatting(formattedDateObject);

            // Set the value of the input field to the formatted date
            $('#memberDate').val(dateStr);

            console.log("formattedDate");
            console.log(dateStr);

        });

    </script>
    <style>
        .time-radio {
            appearance: none;
        }

        .time-label {
            background-color: #a5c422;
            color: white;
            cursor: pointer;
            margin: 10px;
            padding: 10px;
        }

        .choiceTime {
            background-color: #66790e;
        }
    </style>
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>

<div class="container2">
    <c:forEach var="at" items="${attendance}">
        <input class="attendanceDate" type="hidden" value="${at.attendanceDate}">
        <input class="attendanceTime" type="hidden" value="${at.attendanceTime}">
    </c:forEach>

    <c:forEach var="re" items="${reservation}">
        <c:if test="${re.dcId eq doctor.dcId}">
            <input class="reservationDate" type="hidden" value="${re.reservationDateString}">
            <input class="reservationTime" type="hidden" value="${re.reservationTime}">
        </c:if>
    </c:forEach>

    <input class="myReservationDate" value="${myReservation.reservationDateString}" type="hidden">
    <input class="myReservationTime" value="${myReservation.reservationTime}" type="hidden">

    <div class="reservation-title">
        <h3>
            예약내용 확인
        </h3>
    </div>

    <div class="member-info">

        <table class="member-info-table">
            <tr class="member-info-table-tr">
                <td scope="col">이름</td>
                <td scope="col"><input name="memName" value="${myReservation.memName}" readonly="readonly"></td>
                <td scope="col">생년월일</td>
                <td scope="col"><input readonly name="memBir" value="${member.memBir}" required="required"
                                       id="memberDate"></td>
            </tr>
            <tr class="member-info-table-tr">
                <td scope="col">전화번호</td>
                <td scope="col"><input name="memHp" value="${myReservation.memHp}" readonly="readonly"></td>
                <td scope="col">이메일주소</td>
                <td scope="col"><input name="memEmail" value="${myReservation.memEmail}" readonly="readonly">
                </td>
            </tr>
            <tr class="member-info-table-tr">
                <td scope="col">진료과목</td>
                <td scope="col"><input name="treatmentName" value="${myReservation.treatmentName}"
                                       readonly="readonly"></td>
                <td scope="col">담당의</td>
                <td scope="col"><input name="dcName" value="${myReservation.dcName}" readonly="readonly"></td>
            </tr>
            <tr class="member-info-table-tr">
                <td scope="col">예약날짜</td>
                <td scope="col"><input class="myReservationDate" value="${myReservation.reservationDateString}"
                                       readonly="readonly"></td>
                <td scope="col">예약시간</td>
                <td scope="col"><input class="myReservationTime" value="${myReservation.reservationTime}"
                                       readonly="readonly"></td>
            </tr>
        </table>
    </div>

    <form name="reservation" action="/admin/adminReservationModify.wow" method="post">
        <sec:csrfInput/>
        <div>
            <input name="memId" value="${member.memId}" type="hidden">
            <input name="reservationNo" value="${myReservation.reservationNo}" type="hidden">
            <input name="dcId" value="${myReservation.dcId}" type="hidden">
            <input name="treatmentCode" value="${myReservation.treatmentCode}" type="hidden">
            <input name="memName" value="${myReservation.memName}" type="hidden">
            <input name="memHp" value="${myReservation.memHp}" type="hidden">
            <input name="memEmail" value="${myReservation.memEmail}" type="hidden">
            <input name="dcName" value="${myReservation.dcName}" type="hidden">
            <input name="treatmentName" value="${myReservation.treatmentName}" type="hidden">
            <div class="reservation-title">
                <h3>날짜 및 시간 선택</h3>
            </div>
            <div class="reservation-top">
                <div class="calendar-frame col-sm-5">
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
                </div>
                <div class="reservation-time-select col-sm-5">
                    <div class="time-frame">
                        <p id="timeMessage" style="padding-bottom: 10px;">진료시간을 선택해주세요.</p>
                        <div name="reservationTime">

                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" name="reservationDate" value="">
            <div class="reservation-btn">
                <button type="submit"><b>변경하기</b></button>
                <button type="button"><b>이전</b></button>
            </div>
        </div>
    </form>
</div>
<input id="td_date" type="hidden">
<input id="td_time" type="hidden">
<!-- 코드 작성구역 시작-->

<script>
    window.onload = function () {
        buildCalendar();
    }    // 웹 페이지가 로드되면 buildCalendar 실행

    let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
    let today = new Date();     // 페이지를 로드한 날짜를 저장
    today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화

    let atDate = document.getElementsByClassName('attendanceDate');
    let atTime = document.getElementsByClassName('attendanceTime');
    let reDate = document.getElementsByClassName('reservationDate');
    let reTime = document.getElementsByClassName('reservationTime');

    $form = $("form[name='reservation']")
    $input = $("input[name='reservationDate']");
    $select = $("div[name='reservationTime']");

    $myDate = $(".myReservationDate");
    $myTime = $(".myReservationTime");

    $form.find("button[type=submit]").click(function (e) {
        e.preventDefault();
        if ($input[0].value == "" || $('#td_time').attr('value') == null) {
            alert("날짜 및 시간을 선택해주세요");
        } else {
            $tdDate = $("#td_date");
            if (window.confirm($tdDate[0].value + " 일 " + $('#td_time').attr('value') + "시로 예약 변경하시겠습니까?")) {
                $form.submit();
            }
        }
    });

    $form.find("button[type=button]").click(function () {
        window.history.back();
    });

    function timeSelect() {
        if (document.getElementsByClassName("choiceTime")[0]) {                              // 기존에 선택한 날짜가 있으면
            document.getElementsByClassName("choiceTime")[0].classList.remove("choiceTime");  // 해당 날짜의 "choiceDay" class 제거
        }
        event.target.parentNode.classList.add("choiceTime");
        $('#td_time').attr('value', event.target.value);
    }

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
            nowColumn.id = nowDay.getFullYear() + "-" + (nowDay.getMonth() + 1) + "-" + nowDay.getDate();

            if (nowDay.getDay() == 0) {                 // 일요일인 경우 글자색 빨강으로
                nowColumn.style.color = "#DC143C";
            }
            if (nowDay.getDay() == 6) {                 // 토요일인 경우 글자색 파랑으로 하고
                nowColumn.style.color = "#0000CD";
                nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
            }

            if (nowDay < today) {                       // 지난날인 경우
                nowColumn.className = "pastDay";
            } else {
                for (let i = 0; i < atDate.length; i++) {
                    if (DayToNum(atDate[i].value) == nowDay.getDay()) {
                        if ($myDate[0].value == (nowDay.getFullYear() + "-" + (nowDay.getMonth() + 1) + "-" + nowDay.getDate())) {
                            choiceDate(nowColumn);
                        }

                        if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우
                            nowColumn.classList.add("today");
                            nowColumn.onclick = function () {
                                choiceDate(this);
                            }
                            break;
                        } else {                                      // 미래인 경우
                            nowColumn.classList.add("futureDay");
                            nowColumn.onclick = function () {
                                choiceDate(this);
                            }
                            break;
                        }
                    }

                    nowColumn.className = "pastDay";
                }
            }
        }
    }

    // 날짜 선택
    function choiceDate(nowColumn) {
        if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
            document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
        }
        nowColumn.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
        console.log(nowColumn);

        let nowDate = new Date(nowColumn.id);
        $input.val(nowDate);
        let str = "";
        for (let i = 0; i < atDate.length; i++) {
            console.log(atDate.length);
            if (nowDate.getDay() == DayToNum(atDate[i].value)) {
                str += "<label class='time-label' onclick='timeSelect()'";
                for (let j = 0; j < reDate.length; j++) {
                    console.log(reDate.length);
                    let reservationDate = new Date(reDate[j].value);
                    if (reservationDate.getFullYear() == nowDate.getFullYear() && reservationDate.getMonth() == nowDate.getMonth() && reservationDate.getDate() == nowDate.getDate() && reTime[j].value == atTime[i].value) {
                        str += " style='display: none'";
                        break;
                    }
                }
                str += "><input type='radio' class='time-radio' name='reservationTime' value='" + atTime[i].value + "' required='required'>" + atTime[i].value + "</label>";
            }
        }
        $select.empty();
        $select.append(str);
        $('#td_date').attr('value', nowColumn.id);

        if($select.childElementCount == 0){
            $('#timeMessage')[0].innerText = "예약 가능한 시간이 없습니다.";
        }
        else {
            $('#timeMessage')[0].innerText = "진료시간을 선택해주세요.";
        }
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

    function DayToNum(day) {
        switch (day) {
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

    $select.change(() => {
        $('#td_time').attr('value', $select[0].value)
    });
</script>

<!-- 코드 작성구역 끝 -->

<%@include file="/WEB-INF/inc/footer.jsp" %>

</body>
</html>