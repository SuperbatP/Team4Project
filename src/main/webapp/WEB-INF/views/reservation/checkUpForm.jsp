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
            width: 1200px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;;
            border: 1px solid red;
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

        .basicCheckUp > h3 {
            padding: 10px;
        }

        .basicCheckUp-tr > td {
            height: 55px;
            text-align: center;
            border: 1px solid gainsboro;
        }

        .basicCheckUp-tr > td:nth-child(1) {
            width: 150px;
        }

        .basicCheckUp-tr > td:nth-child(2) {
            text-align: left;
            padding-left: 10px;
            width: 1000px;
        }

    </style>
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>
<div class="container2">

    <c:forEach var="cu" items="${checkUp}">
        <input class="reservationDate" type="hidden" value="${cu.reservationDateString}">
        <input class="reservationTime" type="hidden" value="${cu.reservationTime}">
    </c:forEach>


    <div class="basicCheckUp">
        <h3>기본검진</h3>
        <table>
            <tr class="basicCheckUp-tr">
                <td style="background-color: whitesmoke">프로그램</td>
                <td style="background-color: whitesmoke">내용</td>
            </tr>
            <c:forEach var="basic" items="${basicCodeList}">
                <tr class="basicCheckUp-tr">
                    <td>${basic.basicCheckupName}</td>
                    <td>${basic.basicCheckupContent}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <form name="checkUp" action="checkUpRegist.wow" method="post">
        <sec:csrfInput/>
        <h3>예약자 정보</h3>
        이름<input name="reservationName" required="required">
        <label>성별</label>
        <div>
            남<input type="radio" name="reservationGender" required="required" value="m">
            여<input type="radio" name="reservationGender" required="required" value="f">
        </div>
        생년월일<input type="date" name="reservationBirthday" required="required">
        전화번호<input type="text" name="reservationHp" required="required">
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

        <input type="hidden" name="reservationDate" value="">

        <label>예약시간</label>
        <div>
            <select name="reservationTime" required="required">
                <option value="">예약시간 선택</option>
                <option value="08:00~11:00">08:00~11:00</option>
                <option value="13:30~16:00">13:30~16:00</option>
            </select>
        </div>

        <div>
            <h3>기본검사</h3>
            <c:forEach var="basic" items="${basicCodeList}">
                <input type="radio" id="basicCheckupCode" name="basicCheckupCode" value="${basic.basicCheckupCode}"
                       required="required">${basic.basicCheckupName}
            </c:forEach>
        </div>

        <div>
            <h3>추가검사</h3>
            <c:forEach var="add" items="${addCodeList}">
                <input type="radio" name="addCheckupCode" value="${add.addCheckupCode}">${add.addCheckupName}
            </c:forEach>
        </div>

        <div>
            <h3>유전자검사</h3>
            <c:forEach var="dna" items="${DNACodeList}">
                <input type="radio" name="dnaTestCode" value="${dna.dnaTestCode}">${dna.dnaTestName}
            </c:forEach>
        </div>


        <%--    나중에 추가구현--%>
        <%--    문진표--%>
        <%--    선결제--%>
        <button type="submit">예약</button>
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

    let reDate = document.getElementsByClassName('reservationDate');
    let reTime = document.getElementsByClassName('reservationTime');

    $form = $("form[name='checkUp']")
    $input = $("input[name='reservationDate']");
    $select = $("select[name='reservationTime']");

    $form.find("button[type=submit]").click(function (e) {
        e.preventDefault();
        if ($input[0].value == "" || $select[0].value == "") {
            alert("날짜를 선택해주세요");
        } else {
            $form.submit();
        }
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