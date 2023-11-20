<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title></title>
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>
<link rel="stylesheet" href="/resource/bootstrap-3.3.2/css/login.css">

<!-- 코드 작성구역 시작-->
<section class="vh-100">
    <div class="container h-60">
        <div class="row d-flex align-items-center justify-content-center h-100">
            <div class="col-xl-6" style="margin-right: 5%">
                <img src="/resource/bootstrap-3.3.2/images/search_IdPw.png"
                     class="rounded" style="width: 500px; " alt="">
            </div>
            <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-0">
                <form action="/login/findId" method="POST">
                    <sec:csrfInput/>
                    <div class="mb-4">
                        <label for="memEmail" class="control-label">이메일</label>
                        <input type="email" class="form-control form-control-lg"
                               id="memEmail" autocomplete='off' required="required" name="memEmail"
                               placeholder="가입시 작성한 이메일을 입력하세요.">
                    </div>
                    <button type="submit" class="btn btn-primary btn-user btn-block">
                        Find ID
                    </button>
                </form>
            </div>
        </div>
    </div>
</section>


<!-- 코드 작성구역 끝 -->

<%@include file="/WEB-INF/inc/footer.jsp" %>


<script type="text/javascript">


    var msg = "${msg}";

    if (msg != "") {
        alert(msg);
    }


</script>

<script type="text/javascript">
    // 비밀번호 찾기
    $("#findBtn").on("click", function () {
        let id = $("#memName").val();
        let email = $("#memEmail").val();

        if (id == null || id == "") {
            alert("이름을 입력해주세요.");
            $("#memName").focus();
            return false;
        } else if (email == null || email == "") {
            alert("이메일을 입력해주세요.");
            $("#memEmail").focus();
            return false;
        } else if (id == null) {
            alert("아이디나 비밀번호가 틀렸습니다. 다시 확인해 주세요.");
        }

        let memName = $("#memName").val();
        let memEmail = $("#memEmail").val();
        let data = {"memName": memName, "memEmail": memEmail};

        //console.log(data);

//흐름이 이상해 리팩토링 필요해 서버에서 보내는게 났다.
//ajax 안에 ajax 들어가지 말로 서버로 처리
        $.ajax({
            type: "post",
            url: "/emp/pwSearch",

            data: JSON.stringify(data),
            contentType: "application/json;charset=utf-8",
            dataType: 'json',
            success: function (data) {
                //console.log("비밀번호는 : " + data);
                //alert("원래 비밀번호는 : " + data);

                let newPw = data;

                /*이메일로 비밀번호 보내기*/
                $.ajax({
                    type: "POST",
                    url: "/emp/passSearch?email=" + empMail,
                    data: JSON.stringify(newPw),
                    contentType: "application/json;charset=utf-8",
                    dataType: 'text',
                    success: function (data) {
                        console.log("인증메일 비번 : " + data);
                        code = data;
                        alert("인증번호가 발송되었습니다.");
                        //$('#modal-center3').modal('hide');
                        window.location.reload();
                    }
                });
            }
        });
    });

</script>


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