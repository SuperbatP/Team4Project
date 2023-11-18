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
                <td><input type="text" class="form-control" id="memId" placeholder="아이디"
                           oninput="checkId(), activateSignupbtn()" name="memId" autocomplete='off' required="required">
                    <font color="red" id="failid" style="display:none">5~15자의 영문자와 숫자를 조합해서 입력해주세요.</font>
                    <font color="red" id="fail" style="display:none">이미 존재하는 ID입니다.</font>
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="memPassword" class="form-control input-sm"
                           required="required" id="memPassword" placeholder="Password" oninput="checkPwd()">
                    <font color="red" id="failpwd" style="display:none">8~16자의 영문자와 숫자를 조합해서 입력해주세요.</font>
                </td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td>
                    <input type="password" class="form-control" id="pwCheck" placeholder="Password 확인"
                           oninput="checkPwd2(), activateSignupbtn()" name="pwCheck">
                    <font color="red" id="failpwd2" style="display:none">비밀번호가 맞지 않습니다.</font>
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" class="form-control" id="memName" placeholder="이름"
                           oninput="checkName(), activateSignupbtn()" name="memName" autocomplete='off'>
                    <font color="red" id="failname" style="display:none">올바른 형식으로 입력하세요.</font>
                </td>
            </tr>
            <tr>
                <th>우편번호</th>
                <td><input type="text" name="memZip" id="memZip" class="form-control input-sm"></td>
                <td>
                    <input type="button" class="form-control btn btn-block btn-secondary btn-sm"
                           onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
                           style="border: 0px; height: 33px; background-color: #E4E6EF; color: black;">
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <td><input type="text" name="memAdd1" id="memAdd1" class="form-control input-sm">
                    <input type="text" name="memAdd2" id="memAdd2" class="form-control input-sm">
                </td>
            </tr>
            <tr>
                <th>생일</th>
                <td><input type="date" name="memBir" class="form-control input-sm"></td>
            </tr>
            <tr>
                <th>메일</th>
                <td><input type="email" name="memEmail" class="form-control input-sm">
                    <button id="email" type="button">이메일인증</button>
                </td>
            </tr>
            <tr>
                <th>핸드폰</th>
                <td><input type="text" class="form-control" id="memHp" placeholder="전화번호"
                           oninput="addhyphen(),checkTel(), activateSignupbtn()" name="memHp"></td>
            </tr>
            <tr>

                <div class="row">
                    <div class="col-8 mail_check_input">
                        <input type="text" class="form-control mail_check_input" name="authNumber" id="authNum" value=""
                               disabled="disabled" placeholder="인증번호 입력">
                        <span id="mail_check_input_box_warn"></span>
                    </div>
                    <div class="col-4" style="padding-left:0px;">
                        <input type="button" class="form-control btn btn-block btn-secondary btn-sm" id="email_auth_btn"
                               value="인증번호 받기"
                               style="border: 0px;  height: 33px; width:125px; background-color: #E4E6EF; color: black;">
                    </div>
                </div>

            </tr>
            </tbody>
        </table>
        <button type="submit" class="btn btn-secondary" style="width: 100%;" id="signupbtn">회원가입</button>
    </form>
</div>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
            $(this).val($(this).val().replace(/[^0-9]/g, "").replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3").replace("--", "-")); //- 자동으로 입력
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
<script>
    //    우편번호 검색기
    function sample6_execDaumPostcode() {
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


<script>
    let header = "${_csrf.headerName}";
    let token  = "${_csrf.token}";
    var code = "";//이메일전송 인증번호 저장위한 코드

    /* 인증번호 비교 */
    $(".mail_check_input").focusout(function(){ //마우스가 다음칸 클릭했을 경우 일치 불일치 여부 뜸
        var inputCode = $("#authNum").val();// 입력코드
        var checkResult = $("#mail_check_input_box_warn");// 비교 결과

        if(inputCode == code){// 일치할 경우
            checkResult.html("인증번호가 일치합니다.");
            checkResult.attr("class", "correct");
        } else {// 일치하지 않을 경우
            checkResult.html("인증번호를 다시 확인해주세요.");
            checkResult.attr("class", "incorrect");
        }

    });

    $("#btn").submit(function() {
        var pos = $("#job").find("option:selected").data("no");
        var jcd = $("#position").val(pos);
        var memberjobcd = $("#job option:selected").val();
        var jod = $("#job option:selected").text();
        $("#jobgubun").val(jod);

        temp_pw_issuance()


        if ($("#email").val() == null || $("#email").val() == "") {
            alert("이메일을 입력해주세요.");
            $("#email").focus();

            return false;
        }

        if ($("#authNum").val() == "") {
            alert("인증번호를 입력해주세요.");
            $("#authNum").focus();

            return false;
        }



        alert("회원가입이 완료되었습니다.");
    });
    /* 인증번호 이메일 전송 */
    $("#email_auth_btn").click(function(){

        var email = $("input[name='memEmail']").val();            // 입력한 이메일
        var cehckBox = $("#authNum");     // 인증번호 입력란

        $.ajax({

            type:"GET",
            url:"/emp/mailCheck?email=" + email,
            beforeSend:function(xhr){
                xhr.setRequestHeader(header,token);
            },
            success:function(data){
                console.log("data : " + data);
                cehckBox.attr("disabled",false);
                //cehckBox.css("border-color","red");
                code = data;
                alert("인증번호가 발송되었습니다.");
            }
        });
    });


    function temp_pw_issuance() {
        let ranValue1 = ['1','2','3','4','5','6','7','8','9','0'];
        let ranValue2 = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
        let ranValue3 = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];

        var temp_pw = ""; //임시비밀번호

        for(i=0 ; i<2; i++) {
            let ranPick1 = Math.floor(Math.random() * ranValue1.length);
            let ranPick2 = Math.floor(Math.random() * ranValue2.length);
            let ranPick3 = Math.floor(Math.random() * ranValue3.length);
            temp_pw = temp_pw + ranValue1[ranPick1] + ranValue2[ranPick2] + ranValue3[ranPick3];
        }

        $("#pass").val(temp_pw);
        console.log($("#pass").val());
    }



</script>


</body>
</html>