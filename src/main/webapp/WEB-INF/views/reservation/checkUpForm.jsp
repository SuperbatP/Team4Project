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
    <title>건강검진예약</title>
    <script type="text/javascript" src="/resource/bootstrap/js/jquery.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/jquery.sticky.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/jquery.stellar.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/wow.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/smoothscroll.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/custom.js"></script>
</head>
<style>
    .container2{
        display: flex;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap;
        width: 1200px;
        margin: auto;
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

    h3 {
        display: flex;
        align-items: end;
        width: 1100px;
        height: 70px;
        margin-bottom: -10px;
        padding-left: 55px;
    }

    .basicCheckUp-list {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 1200px;
        height: 600px;

        flex-wrap: wrap;
    }

    .basicCheckUp-list-tr:nth-child(1){
        background-color: whitesmoke;
        font-weight: 600;
    }

    .basicCheckUp-list-tr > td {
        height: 55px;
        text-align: center;
        border: 1px solid gainsboro;

    }

    .basicCheckUp-list-tr > td:nth-child(1) {
        width: 150px;
    }

    .basicCheckUp-list-tr > td:nth-child(2) {
        text-align: left;
        padding-left: 10px;
        width: 1000px;
    }

    .checkup-info {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        width: 1200px;
        height: 100px;
    }


    .checkup-info-tr > td {
        height: 55px;
        text-align: center;
        border: 1px solid gainsboro;
    }

    .checkup-info-tr > td:nth-child(1),
    .checkup-info-tr > td:nth-child(3),
    .checkup-info-tr > td:nth-child(5),
    .checkup-info-tr > td:nth-child(7) {
        background-color: whitesmoke;
        width: 95px;
    }

    .checkup-info-tr > td:nth-child(2),
    .checkup-info-tr > td:nth-child(4),
    .checkup-info-tr > td:nth-child(6),
    .checkup-info-tr > td:nth-child(8) {
        width: 190px;
    }

    .reservation-top {
        width: 1200px;
        display: flex;
        justify-content: space-around;
        align-items: center;
        height: 500px;
    }

    .Calendar-frame {
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

    .time-frame {
        width: 380px;
        height: 200px;
    }

    .basicCheckUp-frame {
        width: 90%;
        height: 50px;
        padding-top: 18px;
        padding-left: 50px;
    }

    .addCheckUp-frame {
        width: 90%;
        height: 250px;
        padding-top: 18px;
        padding-left: 50px;
    }

    .dnaTest-frame {
        width: 90%;
        height: 150px;
        padding-top: 18px;
        padding-left: 50px;
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

    label {
        padding: 7px;
        font-weight: normal;
    }

    input {
        border: none;
    }

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

<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>

<div class="container2">
    <form class="checkup-display" name="checkUp" action="checkUpRegist.wow" method="post">
        <h3>기본검진</h3>

        <c:forEach var="cu" items="${checkUp}">
            <input class="reservationDate" type="hidden" value="${cu.reservationDateString}">
            <input class="reservationTime" type="hidden" value="${cu.reservationTime}">
        </c:forEach>

        <sec:csrfInput/>
        <div class="basicCheckUp-list">
            <table>
                <tr class="basicCheckUp-list-tr">
                    <td>프로그램</td>
                    <td>내용</td>
                </tr>
                <c:forEach var="basic" items="${basicCodeList}">
                    <tr class="basicCheckUp-list-tr">
                        <td>${basic.basicCheckupName}</td>
                        <td>${basic.basicCheckupContent}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <h3>예약자 정보</h3>


        <div class="checkup-info">
            <table>
                <tr class="checkup-info-tr">
                    <td>이름</td>
                    <td>
                        <input name="reservationName" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" required="required" style="width: 80%">
                    </td>
                    <td>성별</td>
                    <td>
                        남<input type="radio" name="reservationGender" required="required" value="m">
                        여<input type="radio" name="reservationGender" required="required" value="f">
                    </td>
                    <td>생년월일</td>
                    <td>
                        <input type="date" name="reservationBirthday" required="required">
                    </td>
                    <td>전화번호</td>
                    <td>
                        <input type="text" id="reservationHp" name="reservationHp" required="required" style="width: 80%" oninput="addhyphen(),checkTel()" placeholder="-를 제외한 숫자만 입력.">
                    </td>
                </tr>
            </table>
        </div>
        <h3>🌈날짜 및 시간 선택</h3>
        <div class="reservation-top">
            <div class="Calendar-frame col-sm-5">
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

            <input type="hidden" name="reservationDate" value="">

            <div class="reservation-time-select col-sm-5">
                <div class="time-frame">
                    <p id="timeMessage" style="padding-bottom: 10px;">진료시간을 선택해주세요.</p>
                    <div name="reservationTimeDiv">
                        <label class="time-label" onclick="timeSelect()"><input type="radio" class="time-radio" value="08:00~11:00" required="required" name="reservationTime">08:00~11:00</label>
                        <label class="time-label" onclick="timeSelect()"><input type="radio" class="time-radio" value="13:30~16:00" required="required" name="reservationTime">13:30~16:00</label>
                    </div>
                </div>
            </div>
        </div>

        <h3>기본검사</h3>
        <div class="basicCheckUp-frame">
            <c:forEach var="basic" items="${basicCodeList}">
                <label><input type="radio" id="basicCheckupCode" name="basicCheckupCode"
                              value="${basic.basicCheckupCode}"
                              required="required">${basic.basicCheckupName}</label>
            </c:forEach>
        </div>

        <h3>추가검사</h3>
        <div class="addCheckUp-frame">
            <c:forEach var="add" items="${addCodeList}">

                <c:if test="${add.addCheckupCode != '-'}"> <!-- if 조건 선언 -->
                    <label><input type="radio" name="addCheckupCode" value="${add.addCheckupCode}">${add.addCheckupName}
                    </label>
                </c:if>

            </c:forEach>
        </div>

        <h3>유전자검사</h3>
        <div class="dnaTest-frame">
            <c:forEach var="dna" items="${DNACodeList}">

                <c:if test="${dna.dnaTestCode != '-'}"> <!-- if 조건 선언 -->
                    <label><input type="radio" name="dnaTestCode" value="${dna.dnaTestCode}">${dna.dnaTestName}</label>
                </c:if>

            </c:forEach>
        </div>


        <%--    나중에 추가구현--%>
        <%--    문진표--%>
        <%--    선결제--%>

        <div class="reservation-btn">
            <button type="submit"><b>예약하기</b></button>
            <button type="button"><b>이전</b></button>
        </div>
    </form>

</div>
<input id="td_date" type="hidden">
<input id="td_time" type="hidden">

<%@include file="/WEB-INF/inc/footer.jsp" %>

<!-- 코드 작성구역 시작 -->
<script>
    window.onload = function () {
        buildCalendar();
    }    // 웹 페이지가 로드되면 buildCalendar 실행

    let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
    let today = new Date();     // 페이지를 로드한 날짜를 저장
    today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화

    let reDate = document.getElementsByClassName('reservationDate');
    let reTime = document.getElementsByClassName('reservationTime');

    $form = $("form[name='checkUp']")
    $input = $("input[name='reservationDate']");
    $select = $("div[name='reservationTimeDiv']");



    let additionalCheckVal="";
    $("div.dnaTest-frame input[type=radio]").click(function (e) {
        if($(this).val() == additionalCheckVal){
            $(this).prop("checked", false);
            additionalCheckVal="";
        }else{
            additionalCheckVal=$(this).val() ;
        }
    });

    let dnaCheckVal="";
    $("div.addCheckUp-frame input[type=radio]").click(function (e) {
        if($(this).val() == dnaCheckVal){
            $(this).prop("checked", false);
            dnaCheckVal="";
        }else{
            dnaCheckVal=$(this).val() ;
        }
    });

    $form.find("button[type=submit]").click(function (e) {
        e.preventDefault();
        if ($input[0].value == "" || $('#td_time').attr('value') == null) {
            alert("날짜 및 시간을 선택해주세요");
        } else {
            $tdDate = $("#td_date");
            if (window.confirm($tdDate[0].value + " 일 " + $('#td_time').attr('value') + "시로 예약하시겠습니까?")) {
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
            } else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우
                nowColumn.className = "today";
                nowColumn.onclick = function () {
                    choiceDate(this);
                }
            } else {                                      // 미래인 경우
                nowColumn.className = "futureDay";
                nowColumn.onclick = function () {
                    choiceDate(this);
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

        let options = $select.children();
        for (let i = 1; i < options.length; i++) {
            let cnt = 0;
            for (let j = 0; j < reDate.length; j++) {
                let reservationDate = new Date(reDate[j].value);
                if (reservationDate.getFullYear() == nowDate.getFullYear() && reservationDate.getMonth() == nowDate.getMonth() && reservationDate.getDate() == nowDate.getDate() && reTime[j].value == options[i].value) {
                    cnt++;
                }
            }
            if (cnt > 60) {
                options[i].style("display: none");
            }
        }
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

    function addhyphen() {
        $(document).on("keyup", "#reservationHp", function () {
            $(this).val($(this).val().replace(/[^0-9]/g, "").replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3").replace("--", "-")); //- 자동으로 입력
        })
    }

    function checkTel() {
        var inputed = $('#reservationHp').val();

        $.ajax({
            success: function () {
                if (regPhoneNumber(inputed) == false) {
                    $("#reservationHp").css("background-color", "#FFCECE");
                    inputed = $('#mTel').val();
                    phoneCheck = 0;
                } else if (regPhoneNumber(inputed) == true) {
                    $("#reservationHp").css("background-color", "#B0F6AC");
                    phoneCheck = 1;
                }
            }
        })
    }

    function characterCheck(obj){
        var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
        if( regExp.test(obj.value) ){
            alert("특수문자는 입력하실수 없습니다.");
            obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
        }
    }
</script>
<!-- 코드 작성구역 끝 -->

</body>
</html>