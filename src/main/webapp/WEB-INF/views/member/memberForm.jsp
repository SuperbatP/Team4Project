<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/inc/navi.jsp" %>

<div class="container">
    <h3>회원가입</h3>
    <form action="memberRegist.wow" method="post">
        <sec:csrfInput/>
        <table class="table table-striped table-bordered">

            <tbody>
            <tr>
                <th>아이디</th>
                <td><input type="text" class="form-control" id="memId" placeholder="아이디" oninput="checkId(), activateSignupbtn()" name = "memId" autocomplete='off' required="required">
                    <font color = "red" id = "failid" style = "display:none">5~15자의 영문자와 숫자를 조합해서 입력해주세요.</font>
                    <font color = "red" id = "fail" style = "display:none">이미 존재하는 ID입니다.</font>
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="memPassword" class="form-control input-sm"
                           required="required" id="memPassword" placeholder="Password" oninput ="checkPwd()">
                    <font color = "red" id = "failpwd" style = "display:none">8~16자의 영문자와 숫자를 조합해서 입력해주세요.</font>
                </td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td>
                    <input type="password" class="form-control" id="pwCheck" placeholder="Password 확인" oninput ="checkPwd2(), activateSignupbtn()" name = "pwCheck">
                    <font color = "red" id = "failpwd2" style = "display:none">비밀번호가 맞지 않습니다.</font>
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" class="form-control" id="memName" placeholder="이름" oninput="checkName(), activateSignupbtn()" name = "memName" autocomplete='off'>
                    <font color = "red" id = "failname" style = "display:none">올바른 형식으로 입력하세요.</font>
                </td>
            </tr>
            <tr>
                <th>우편번호</th>
                <td><input type="text" name="memZip" class="form-control input-sm"></td>
            </tr>
            <tr>
                <th>주소</th>
                <td><input type="text" name="memAdd1" class="form-control input-sm">
                    <input type="text" name="memAdd2" class="form-control input-sm">
                </td>
            </tr>
            <tr>
                <th>생일</th>
                <td><input type="date" name="memBir" class="form-control input-sm"></td>
            </tr>
            <tr>
                <th>메일</th>
                <td><input type="email" name="memMail" class="form-control input-sm">
                    <button id="email" type="button">이메일확인</button>
                </td>
            </tr>
            <tr>
                <th>핸드폰</th>
                <td> <input type="text" class="form-control" id="memHp"   placeholder="전화번호" oninput="addhyphen(),checkTel(), activateSignupbtn()" name = "memHp" ></td>
            </tr>
            </tbody>
        </table>
        <button type="submit" class="btn btn-secondary" style="width: 100%;" id="signupbtn">회원가입</button>
    </form>
</div>




<script>

    function regMemberid(memId) { //영문자 또는 숫자 6~16자
        var regExp = /^[A-za-z0-9]{5,15}/g;
        return regExp.test(memId);
    }

    function regPassword(memPassword) { //8~16자 영문, 숫자 조합
        var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
        return regExp.test(memPassword);
    }

    function regPhoneNumber(memHp) { //전화번호
        var regExp = /^01(?:0|1|[6-9])-(?:\d{3})-\d{5}$/;
        return regExp.test(memHp);
    }

    function regMemberName(memName) { //이름
        var regExp = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
        return regExp.test(memName);
    }

    function addhyphen() {
        $(document).on("keyup", "#memHp", function () {
            $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3").replace("--", "-") ); //- 자동으로 입력
        })
    }

</script>







<script>

    // //이메일 인증
    // $("#email").on("click", function (e) {
    //     let mailAddress = $("input[name='memEmail']").val();
    //     $.ajax({
    //         url: "/join/emailSend.wow"
    //         , type: "get", data: {"email": mailAddress}
    //         , success: function (data) {
    //             alert("메일을 확인하세요.");
    //             //시간제한 + 인증번호 랜덤값 6개 입력하는 칸이 새로 생기고
    //             //사용자가 입력한 값이랑 서버에서 생성한 값이랑 같은지 비교.
    //             //랜덤값 6개를 DB에 저장해서... qustnfh, session 등등 다양하게.
    //         }
    //         , error: function (err) {
    //             alert("에러");
    //         }
    //     });
    //
    // });

    var idCheck = 0;
    var pwdCheck = 0;
    var phoneCheck = 0;
    var nameCheck = 0;
    var pwCheck = 0;
    var authCheck = 0;


    function checkId() {
        var inputed = $('#memId').val();
        $.ajax({
            data: {
                memId: inputed //입력한 값을 memId라는 변수에 담음
            },
            url: "checkid", // data를 checkid url에 보냄 (Controller에서 받아처리한다. 중복이 되면 1, 아니면 0을 반환하는 함수를 구현했다.)
            success: function (data) {
                if (data == '1') { //아이디가 중복되었을 때
                    $("#fail").css("display", "block"); //에러메세지를 띄운다
                    $("#failid").css("display", "none"); //중복에러메세지 말고 다른 에러 메세지를 지운다.
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#memId").css("background-color", "#FFCECE");
                    idCheck = 0;
                } else if (regMemberid(inputed) == false || inputed.length > 14) {
                    $("#failid").css("display", "block");
                    $("#fail").css("display", "none");
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#memId").css("background-color", "#FFCECE");
                    idCheck = 0;

                } else if (data == '0' && regMemberid(inputed)) { //중복되지않고, 정규식을 통과할 때
                    $("#memId").css("background-color", "#B0F6AC");
                    $("#failid").css("display", "none");
                    $("#fail").css("display", "none");
                    idCheck = 1;
                }
            }
        });
    }

    function checkName() {
        var inputed = $('#memName').val(); //이름에 입력한 값
        $.ajax({
            success: function () {
                if (regMemberName(inputed) == false || inputed.length > 18) { //입력한 값이 정규표현식에 해당되지 않을 때와 18자 이상이 넘을 때
                    $(".signupbtn").prop("disabled", true); //회원가입 버튼 누르지 못하게 하기
                    $(".signupbtn").css("background-color", "#aaaaaa"); //버튼 회색으로 바꾸기
                    $("#failname").css("display", "block");
                    $("#memName").css("background-color", "#FFCECE");  // input 배경 붉은색으로 바꾸기
                    nameCheck = 0; // 회원 가입 전 값들 체크하기 위해 (0은 불가, 1은 가능)
                } else if (regMemberName(inputed) == true) { //정규표현식에 해당할 때
                    $("#memName").css("background-color", "#B0F6AC"); // input 배경 초록색으로 바꾸기
                    $("#failname").css("display", "none");
                    nameCheck = 1;
                }
            }
        })
    }

    function checkPwd() {
        var inputed = $('#memPassword').val();

        $.ajax({
            success: function () {
                if (regPassword(inputed) == false || inputed.length > 16) {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#failpwd").css("display", "block");
                    $("#memPassword").css("background-color", "#FFCECE");
                    pwdCheck = 0;
                } else if (regPassword(inputed) == true) {
                    $("#memPassword").css("background-color", "#B0F6AC");
                    $("#failpwd").css("display", "none");
                    pwdCheck = 1;
                }
            }
        })
    }

    function checkPwd2() {
        var inputed = $('#pwCheck').val();
        var inputed1 = $('#memPassword').val();

        $.ajax({
            success: function () {
                if (inputed != inputed1) {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#pwCheck").css("background-color", "#FFCECE");
                    $("#failpwd2").css("display", "block");
                    pwCheck = 0;
                } else if (inputed == inputed1) {
                    $("#pwCheck").css("background-color", "#B0F6AC");
                    $("#failpwd2").css("display", "none");
                    pwCheck = 1;
                }
            }
        })
    }

    function checkTel() {
        var inputed = $('#mTel').val();

        $.ajax({
            success: function () {
                if (regPhoneNumber(inputed) == false) {
                    $("#mTel").css("background-color", "#FFCECE");
                    inputed = $('#mTel').val();
                    phoneCheck = 0;
                } else if (regPhoneNumber(inputed) == true) {
                    $("#mTel").css("background-color", "#B0F6AC");
                    phoneCheck = 1;
                }
            }
        })
    }


    function activateSignupbtn() {

        if (idCheck == 1 && pwdCheck == 1 && nameCheck == 1 && pwCheck == 1 && authCheck == 1) {
            $(".signupbtn").prop("disabled", false);
            $(".signupbtn").css("background-color", "#B0F6AC");
        } else {
            $(".signupbtn").css("background-color", "#aaaaaa");
            $(".signupbtn").prop("disabled", true);
        }
    }


</script>
</body>
</html>