<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<link rel="stylesheet" href="/resource/bootstrap-3.3.2/css/memberForm.css">

<%@include file="/WEB-INF/inc/navi.jsp" %>

<div class="container">
    <!--회원가입 안내문-->
    <section class="vh-100">
            <div class="form-title">
                <div class="col-md-7" style="margin-left: 40px">
                    <h2 style="margin-top: 40px">불사조 병원 회원가입</h2>
                    <p style="font-size: 15px; font-weight: bold">불사조병원 홈페이지는 회원의 개인정보보호를 위해 항상 최선을 다하고 있습니다.</p>
                    <p style="font-size: 15px; font-weight: bold">아래의 항목을 모두 기입하시고 "회원가입" 버튼을 누르시면 회원가입이 완료 됩니다.</p>
                </div>
                <div class="form-img" >
                    <img src="/resource/bootstrap-3.3.2/images/form-img.png" style="height: 280px">
                </div>
            </div>
    </section>

    <!--회원가입 양식-->
    <section>
        <form action="memberRegist.wow" method="post" class="form-horizontal">
            <sec:csrfInput/>
            <div class="form-group">
                <label for="memId" class="col-sm-3 control-label">아이디<span class="req"> *</span></label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="memId"
                           oninput="checkId(), activateSignupbtn()" name="memId" autocomplete='off' required="required">
                    <span id="failid"
                          style="display:none; margin-top: 5px; color: red;">5~15자의 영문자와 숫자를 조합해서 입력해주세요.</span>
                    <span color="red" id="fail" style="display:none">이미 존재하는 ID입니다.</span>
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memName" class="col-sm-3 control-label">이름<span class="req"> *</span></label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="memName"
                           oninput="checkName(), activateSignupbtn()" name="memName" autocomplete='off'>
                    <span id="failname" style="display:none; margin-top: 5px; color: red; ">올바른 형식으로 입력하세요.</span>
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memPassword" class="col-sm-3 control-label">비밀번호<span class="req"> *</span></label>
                <div class="col-sm-6">
                    <input type="password" name="memPassword" class="form-control input-sm"
                           required="required" id="memPassword" oninput="checkPwd()">
                    <span id="failpwd"
                          style="display:none; margin-top: 5px; color: red; ">8~16자의 영문자와 숫자를 조합해서 입력해주세요.</span>
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="pwCheck" class="col-sm-3 control-label">비밀번호 확인<span class="req"> *</span></label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" id="pwCheck"
                           oninput="checkPwd2(), activateSignupbtn()" name="pwCheck">
                    <span id="failpwd2" style="display:none; margin-top: 5px; color: red; ">비밀번호가 맞지 않습니다.</span>
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memBir" class="col-sm-3 control-label">생일</label>
                <div class="col-sm-6">
                    <input type="date" id="memBir" name="memBir" class="form-control input-sm">
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memZip" class="col-sm-3 control-label">우편번호</label>
                <div class="col-sm-4">
                    <input type="text" name="memZip" id="memZip" class="form-control input-sm" disabled="disabled">
                </div>
                <div class="col-sm-2">
                    <input type="button" class="form-control btn btn-block btn-secondary btn-sm"
                           onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
                           style="border: 0px; height: 33px; color: black;">
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memAdd1" class="col-sm-3 control-label">주소</label>
                <div class="col-sm-6">
                    <input type="text" name="memAdd1" id="memAdd1" class="form-control input-sm" disabled="disabled">
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memAdd2" class="col-sm-3 control-label">상세주소</label>
                <div class="col-sm-6">
                    <input type="text" name="memAdd2" id="memAdd2" class="form-control input-sm" disabled="disabled">
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memEmail" class="col-sm-3 control-label">이메일<span class="req"> *</span></label>
                <div class="col-sm-4">
                    <input type="email" id="memEmail" name="memEmail" class="form-control input-sm">
                </div>
                <div class="col-sm-2">
                    <input type="button" class="form-control btn btn-block btn-secondary btn-sm" id="email_auth_btn"
                           value="인증번호 받기"
                           style="border: 0px;  height: 33px; color: black;">
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="authNum" class="col-sm-3 control-label">인증번호 입력<span class="req"> *</span></label>
                <div class="col-sm-6 mail_check_input">
                    <input type="text" class="form-control mail_check_input" name="authNumber" id="authNum" value=""
                           disabled="disabled">
                    <span id="mail_check_input_box_warn"></span>
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memHp" class="col-sm-3 control-label">핸드폰<span class="req"> *</span></label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="memHp" placeholder="-를 제외한 숫자만 입력하시오."
                           oninput="addhyphen(),checkTel(), activateSignupbtn()" name="memHp">
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group" style="margin-top: 30px">
                <label for="signupbtn" class="col-sm-3 control-label"></label>
                <div class="col-sm-3">
                    <button type="submit" class="form-control btn btn-block btn-secondary btn-lg"
                            style="border: 0px; width: 100%; height: 50px; color: black;"
                            id="signupbtn">회원가입
                    </button>
                </div>
                <div class="col-sm-3">
                    <button type="submit" onclick="location.href='/index.jsp'"
                            style="border: 0px; width: 100%; height: 50px; color: black;"
                            class="form-control btn btn-block btn-secondary btn-lg">취소
                    </button>
                </div>
            </div>
        </form>
    </section>
</div>

<%@include file="/WEB-INF/inc/footer.jsp" %>


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

<script>
    <%-- 이메일 인증   --%>
    let header = "${_csrf.headerName}";
    let token = "${_csrf.token}";
    var code = "";//이메일전송 인증번호 저장위한 코드

    /* 인증번호 비교 */
    $(".mail_check_input").focusout(function () { //마우스가 다음칸 클릭했을 경우 일치 불일치 여부 뜸
        var inputCode = $("#authNum").val();// 입력코드
        var checkResult = $("#mail_check_input_box_warn");// 비교 결과

        if (inputCode == code) {// 일치할 경우
            checkResult.html("인증번호가 일치합니다.");
            checkResult.attr("class", "correct");
        } else {// 일치하지 않을 경우
            checkResult.html("인증번호를 다시 확인해주세요.");
            checkResult.attr("class", "incorrect");
        }

    });

    $("#btn").submit(function () {
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
    $("#email_auth_btn").click(function () {

        var email = $("input[name='memEmail']").val();            // 입력한 이메일
        var cehckBox = $("#authNum");     // 인증번호 입력란

        $.ajax({

            type: "GET",
            url: "/emp/mailCheck?email=" + email,
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
                console.log("data : " + data);
                cehckBox.attr("disabled", false);
                //cehckBox.css("border-color","red");
                code = data;
                alert("인증번호가 발송되었습니다.");
            }
        });
    });


    function temp_pw_issuance() {
        let ranValue1 = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
        let ranValue2 = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
        let ranValue3 = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];

        var temp_pw = ""; //임시비밀번호

        for (i = 0; i < 2; i++) {
            let ranPick1 = Math.floor(Math.random() * ranValue1.length);
            let ranPick2 = Math.floor(Math.random() * ranValue2.length);
            let ranPick3 = Math.floor(Math.random() * ranValue3.length);
            temp_pw = temp_pw + ranValue1[ranPick1] + ranValue2[ranPick2] + ranValue3[ranPick3];
        }

        $("#pass").val(temp_pw);
        console.log($("#pass").val());
    }
</script>
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