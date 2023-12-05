<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/resource/bootstrap/css/memberForm.css">
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
    <!--안내문-->
    <section>
        <div class="form-title">
            <div class="col-md-7" style="margin-left: 40px">
                <h2 style="margin-top: 60px">비밀번호 변경</h2>
                <p style="font-size: 18px; font-weight: bold">정기적인 비밀번호 변경으로 회원님의 개인정보를 보호해 주세요.</p>
                <p style="font-size: 18px; font-weight: bold">ID, 주민번호, 생일, 전화번호 등 개인정보는 사용을 지양해 주세요.</p>
            </div>
            <div class="form-img">
                <img src="/resource/images/form-img.png" style="height: 280px">
            </div>
        </div>
    </section>

    <%-- 비밀번호 변경   --%>
    <section style="margin-top: 30px">
        <form action="/pwUpdate" method="post" id="pwUpdateForm" name="pwUpdateForm">
            <sec:csrfInput/>
            <input type="hidden" id="memId" name="memId" value="${member.memId}">
            <div class="col-sm-8 col-sm-offset-2">
                <div class="panel-default" style="border: none;">
                    <div class="panel-body panel-body-content text-center" style="border: none;">
                        <p class="lead" style="font-weight: bold; color: #0f0f0f">변경하실 비밀번호를 입력해 주세요.</p>
                        <div class="form-group">
                            <input type="password" name="memPassword" id="memPassword" onchange="checkpassword()"
                                   class="form-control form-control-inline text-center input-mg" placeholder="현재 비밀번호" autoComplete="off"/>
                            <span  id="fail" style="display:none; color: red;">현재 비밀번호와 맞지 않습니다.</span>
                        </div>
                        <div class="form-group">
                            <input type="password" id="memberPw1" name="memberPw1" class="form-control form-control-inline text-center input-mg"
                                   placeholder="새 비밀번호" oninput="checkPwd()" autoComplete="off" >
                            <span id="failpwd"
                                  style="display:none; margin-top: 5px; color: red; ">8~16자의 영문자와 숫자를 조합해서 입력해주세요.</span>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control form-control-inline text-center input-mg"
                                   oninput="checkPwd2()" placeholder="새 비밀번호 확인" id="pwCheck" autoComplete="off" >
                            <span id="failpwd2"
                                  style="display:none; margin-top: 5px; color: red; ">비밀번호가 맞지 않습니다.</span>
                        </div>
                        <button type="submit" id="pwUpdate" name="pwUpdate" class="btn btn-primary">비밀번호 변경</button>
                        <a href="/" class="btn btn-default">취소</a>
                    </div>
                </div>
            </div>
        </form>
    </section>
</div>


<script>
    function checkpassword() {
        var inputed = $('#memPassword').val();
        $.ajax({
            data: {
                memPassword: inputed //입력한 값을 memId라는 변수에 담음
            },
            url: "/pwCheck", // data를 checkid url에 보냄 (Controller에서 받아처리한다. 중복이 되면 1, 아니면 0을 반환하는 함수를 구현했다.)
            success: function (data) {
                    if (data === 0) {
                        console.log("확인1")
                        $("#fail").css("display", "block"); //에러메세지를 띄운다
                        $("#memPassword").css("background-color", "#FFCECE");
                    }else {
                        console.log("확인2")
                        $("#fail").css("display", "none");
                        $("#memPassword").css("background-color", "#B0F6AC");
                    }
            }
        });
    }

    function regPassword(memPassword) { //8~16자 영문, 숫자 조합
        var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
        return regExp.test(memPassword);
    }

    function checkPwd() {
        var inputed = $('#memberPw1').val();

        if (regPassword(inputed) === false || inputed.length > 16) {
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#failpwd").css("display", "block");
            $("#memberPw1").css("background-color", "#FFCECE");
        } else {
            $("#memberPw1").css("background-color", "#B0F6AC");
            $("#failpwd").css("display", "none");
        }
    }

    function checkPwd2() {
        var inputed1 = $('#memberPw1').val();
        var inputed2 = $('#pwCheck').val();

        if (inputed1 !== inputed2) {
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#pwCheck").css("background-color", "#FFCECE");
            $("#failpwd2").css("display", "block");
        } else {
            $("#pwCheck").css("background-color", "#B0F6AC");
            $("#failpwd2").css("display", "none");
        }
    }

    $(document).ready(function () {

        $("#pwUpdate").on("click", function() {
            if ($("#memPassword").val == "") {
                alert("현재 비밀번호를 입력해주세요");
                $("#memPassword").focus();
                return false
            }
        })

        $("#pwUpdate").on("click", function () {
            $.ajax({
                url: "/pwCheck",
                type: "POST",
                dataType: "json",
                data: $("#pwUpdateForm").serializeArray(),
                success: function (data) {
                    if (data === 0) {
                        alert("패스워드가 틀렸습니다.");
                        return;
                    } else {
                        if (confirm("변경하시겠습니까?")) {
                            $("#pwUpdateForm").submit();
                        }
                    }
                }
            });
        });
    });
</script>

<%@include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>