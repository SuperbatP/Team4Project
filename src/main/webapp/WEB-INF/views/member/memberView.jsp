<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <link rel="stylesheet" href="/resource/bootstrap/css/memberForm.css">
    <link rel="stylesheet" href="/resource/bootstrap/css/login.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
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
    <h3>회원 정보 수정</h3>
    <section style="margin-top: 60px;">
        <form name="updateUser" action="/member/updateUser.wow" method="post" class="form-horizontal">
            <sec:csrfInput/>
            <div class="form-group">
                <label for="memId" class="col-sm-3 control-label">아이디</label>
                <div class="col-sm-6 ">
                    <input id="memId"  class="form-control input-mg" name="memId" value="${member.memId}" readonly>
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memName" class="col-sm-3 control-label">이름</label>
                <div class="col-sm-6 ">
                    <input id="memName" class="form-control input-mg" name="memName" value="${member.memName}" >
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memZip" class="col-sm-3 control-label">우편번호</label>
                <div class="col-sm-4">
                    <input id="memZip" class="form-control input-mg" name="memZip" value='${member.memZip}'>
                </div>
                <div class="col-sm-2">
                    <input type="button" class="form-control btn btn-block btn-secondary btn-mg"
                           onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
                           style="border: 0px; height: 33px; color: black;">
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memAdd1" class="col-sm-3 control-label">주소</label>
                <div class="col-sm-6">
                    <input id="memAdd1" class="form-control input-mg" name="memAdd1" value='${member.memAdd1}'>
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memAdd2" class="col-sm-3 control-label">상세주소</label>
                <div class="col-sm-6">
                    <input id="memAdd2" class="form-control input-mg" name="memAdd2" value='${member.memAdd2}'>
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memBir" class="col-sm-3 control-label">생일</label>
                <div class="col-sm-6">
                    <input id="memBir" type="date" class="form-control input-mg" name="memBir"
                           value='${member.memBir}'>
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memEmail" class="col-sm-3 control-label">이메일</label>
                <div class="col-sm-6 ">
                    <input id="memEmail" class="form-control input-mg" name="memEmail" value="${member.memEmail}">
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memHp" class="col-sm-3 control-label">핸드폰</label>
                <div class="col-sm-6">
                    <input class="form-control" id="memHp" placeholder="-를 제외한 숫자만 입력하시오."
                           name="memHp" value='${member.memHp}' oninput="addhyphen(),checkTel()">
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memRole" class="col-sm-3 control-label">권한</label>
                <div class="col-sm-6">
                    <select id="memRole" name="memRole" class="form-control input-mg">
                        <option value="USER" ${member.memRole=='USER' ? "selected='selected'" : ""}>USER</option>
                        <option value="ADMIN" ${member.memRole=='ADMIN' ? "selected='selected'" : ""}>ADMIN</option>
                    </select>
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memDelYn" class="col-sm-3 control-label">탈퇴여부</label>
                <div class="col-sm-6">
                    <select id="memDelYn" name="memDelYn" class="form-control input-mg">
                        <option value="Y" ${member.memDelYn=='Y' ? "selected='selected'" : ""}>Y</option>
                        <option value="N" ${member.memDelYn=='N' ? "selected='selected'" : ""}>N</option>
                    </select>
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group" style="margin-top: 30px">
                <label for="signupbtn" class="col-sm-3 control-label"></label>
                <div class="col-sm-3">
                    <button type="submit" class="form-control btn btn-block btn-secondary btn-lg"
                            style="border: 0px; width: 100%; height: 50px; color: black;"
                            id="signupbtn">저장
                    </button>
                </div>
                <div class="col-sm-3">
                    <a href="/member/memberList.wow" style="border: 0px; width: 100%; height: 50px; color: black;"
                       class="glyphicon glyphicon-list form-control btn btn-block btn-secondary btn-lg">&nbsp;목록으로</a>
                </div>
            </div>
        </form>
    </section>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    $form = $("form[name='updateUser']");

    $form.find("button[type=submit]").click(function (e) {
        e.preventDefault();
        if (window.confirm("정보를 수정하시겠습니까?")) {
            $form.submit();
        }
    });

    var msg = "${msg}";
    if (msg != "") {
        alert(msg);
    }

    function regPhoneNumber(memHp) { //전화번호
        var regExp = /^01(?:0|1|[6-9])-(?:\d{3})-\d{5}$/;
        return regExp.test(memHp);
    }

    function addhyphen() {
        $(document).on("keyup", "#memHp", function () {
            $(this).val($(this).val().replace(/[^0-9]/g, "").replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3").replace("--", "-")); //- 자동으로 입력
        })
    }

    //    우편번호 검색기
    var cehckBox1 = $("#memZip");     // 인증번호 입력란
    var cehckBox2 = $("#memAdd1");     // 인증번호 입력란
    var cehckBox3 = $("#memAdd2");     // 인증번호 입력란

    function sample6_execDaumPostcode() {
        cehckBox1.attr("disabled", false);
        cehckBox2.attr("disabled", false);
        cehckBox3.attr("disabled", false);
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                /*var extraAddr = ''; // 참고항목 변수*/

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("memZip").value = data.zonecode;
                document.getElementById("memAdd1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("memAdd2").focus();
            }
        }).open();
    }

</script>
<%@include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>