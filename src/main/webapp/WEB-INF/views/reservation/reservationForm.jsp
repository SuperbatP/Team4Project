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
    <style>
        .container2 {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
        }

        .reservation-top {
            width: 1200px;
            display: flex;
            justify-content: space-around;
            align-items: start;
            height: 500px;
        }

        .calendar-frame {
            border: 1px solid gainsboro;
            height: 450px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .reservation-time-select {
            border: 1px solid gainsboro;
            height: 450px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
        }


        td {
            width: 50px;
            height: 50px;
        }

        .Calendar {
            text-align: center;
            margin: 0 auto;
        }

        .Calendar > thead > tr:first-child > td {
            font-weight: bold;
        }

        .Calendar > thead > tr:last-child > td {
            background-color: gray;
            color: white;
        }

        .pastDay {
            background-color: lightgray;
        }

        .today {
            background-color: #FFCA64;
            cursor: pointer;
        }

        .futureDay {
            background-color: #FFFFFF;
            cursor: pointer;
        }

        .futureDay.choiceDay, .today.choiceDay {
            background-color: #3E85EF;
            color: #fff;
            cursor: pointer;
        }

        .futureDay.choiceDay, .today.choiceDay {
            background: #a5c422;
            color: #fff;
            cursor: pointer;
        }


        .reservation-title {
            padding-left: 55px;
            padding-top: 78px;
            width: 1200px;
            height: 150px;

        }

        .member-info {
            height: 370px;
            display: flex;
            flex-wrap: wrap;
            align-items: start;
            justify-content: center;
            width: 1200px;
        }

        .member-info-table-tr > td {
            height: 55px;
            text-align: center;
            border: 1px solid gainsboro;
            color: gray;
        }

        .member-info-table-tr > td:nth-child(1), .member-info-table-tr > td:nth-child(3) {
            width: 240px;
            background-color: whitesmoke;
        }

        .member-info-table-tr > td:nth-child(2), .member-info-table-tr > td:nth-child(4) {
            width: 310px;
        }

        input {
            border: none;
        }

        input:focus {
            outline: none;
        }

        .reservation-btn {
            width: 1200px;
            height: 60px;
            display: flex;
            justify-content: center;
            align-items: center;

        }

        .reservation-btn > button:nth-child(1) {
            width: 130px;
            height: 100%;
            margin-right: 10px;
            border: 1px solid gainsboro;
            background-color: whitesmoke;
            color: dimgray;
        }

        .reservation-btn > button:nth-child(2) {
            width: 130px;
            height: 100%;
            margin-left: 10px;
            border: 1px solid gainsboro;
            background-color: #a5c422;
            color: white;

        }

        .time-frame {
            width: 380px;
            height: 200px;
        }


    </style>


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


    <form name="reservation" action="reservationRegist.wow" method="post">
        <sec:csrfInput/>
        <input type="hidden" name="dcId" value="${doctor.dcId}">
        <input type="hidden" name="treatmentCode" value="${doctor.treatmentCode}">
        <div class="reservation-title">
            <h3>🌈날짜 및 시간 선택</h3>
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
                    <p style="padding-bottom: 10px;">진료시간을 선택해주세요.</p>
                    <select name="reservationTime" required="required">

                    </select>
                </div>
            </div>
        </div>

        <input type="hidden" name="reservationDate" value="">
        <div class="reservation-title">
            <h3>
                예약내용 확인
            </h3>
        </div>

        <div class="member-info">
            <table class="member-info-table">
                <tr class="member-info-table-tr">
                    <td scope="col">이름</td>
                    <td scope="col"><input readonly type="memName" name="memName" value="${member.memName}"
                                           required="required"></td>
                    <td scope="col">전화번호</td>
                    <td scope="col"><input readonly name="memHp" value="${member.memHp}" required="required"></td>
                </tr>
                <tr class="member-info-table-tr">
                    <td scope="col">이메일주소</td>
                    <td scope="col"><input readonly name="memEmail" value="${member.memEmail}" required="required"></td>
                    <td scope="col">생년월일</td>
                    <td scope="col"><input readonly name="memBir" value="${member.memBir}" required="required"
                                           id="memberDate"></td>
                </tr>
                <tr class="member-info-table-tr">
                    <td scope="col">예약날짜</td>
                    <td scope="col"><input id="td_date" readonly></td>
                    <td scope="col">예약시간</td>
                    <td scope="col"><input id="td_time" readonly></td>
                </tr>
                <tr class="member-info-table-tr">
                    <td scope="col">우편번호</td>
                    <td scope="col"><input readonly name="memZip" value="${member.memZip}" required="required"></td>
                    <td scope="col">주소</td>
                    <td scope="col"><input readonly name="memAdd" value="${member.memAdd1} ${member.memAdd2}"
                                           required="required"></td>
                </tr>
            </table>
            <div class="reservation-btn">
                <button type="submit"><b>예약하기</b></button>
                <button type="button"><b>이전</b></button>
            </div>
        </div>

        <%--    나중에 추가구현--%>
        <%--    문진표--%>
        <%--    선결제--%>

    </form>
</div>

<%@include file="/WEB-INF/inc/footer.jsp" %>

<!-- 코드 작성구역 시작 -->

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
    $select = $("select[name='reservationTime']");



    $form.find("button[type=submit]").click(function (e) {
        e.preventDefault();
        if ($input[0].value == "" || $select[0].value == "") {
            alert("날짜 및 시간을 선택해주세요");
        } else {
            if (window.confirm($("#td_date").val() + " 일 "+ $select[0].value +"시에 "+ "예약하시겠습니까?")) {
                $form.submit();
            }
        }
    });

    $form.find("button[type=button]").click(function () {
        window.history.back();
    });

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
                        if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우
                            nowColumn.className = "today";
                            nowColumn.onclick = function () {
                                choiceDate(this);
                            }
                            break;
                        } else {                                      // 미래인 경우
                            nowColumn.className = "futureDay";
                            nowColumn.onclick = function () {
                                choiceDate(this);
                            }
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

        let nowDate = new Date(nowColumn.id);
        $input.val(nowDate);
        let str = "";
        str += "<option value='' selected='selected'>예약시간 선택</option>";
        for (let i = 0; i < atDate.length; i++) {
            if (nowDate.getDay() == DayToNum(atDate[i].value)) {
                str += "<option value='" + atTime[i].value;
                for (let j = 0; j < reDate.length; j++) {
                    let reservationDate = new Date(reDate[j].value);
                    if (reservationDate.getFullYear() == nowDate.getFullYear() && reservationDate.getMonth() == nowDate.getMonth() && reservationDate.getDate() == nowDate.getDate() && reTime[j].value == atTime[i].value) {
                        str += "' style='display: none";
                        break;
                    }
                }
                str += "'>" + atTime[i].value + "</option>";
            }
        }
        $select.empty();
        $select.append(str);
        $('#td_date').attr('value', nowColumn.id);

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

<!-- SCRIPTS -->
<script src="/resource/bootstrap/js/jquery.js"></script>
<script src="/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="/resource/bootstrap/js/jquery.sticky.js"></script>
<script src="/resource/bootstrap/js/jquery.stellar.min.js"></script>
<script src="/resource/bootstrap/js/wow.min.js"></script>
<script src="/resource/bootstrap/js/smoothscroll.js"></script>
<script src="/resource/bootstrap/js/owl.carousel.min.js"></script>
<script src="/resource/bootstrap/js/custom.js"></script>
</body>
</html>