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
                    <h4 style="margin-top: 40px">지금까지 불사조 병원 홈페이지를 <br>이용해 주셔서 감사합니다</h4>
                    <p style="font-size: 15px; font-weight: bold">회원을 탈퇴하실 경우, 고객님의 모든 정보는 병원 홈페이지 시스템에서 완전히 삭제됩니다. </p>
                    <p style="font-size: 15px; font-weight: bold; color: #a10000;">탈퇴 후 아이디를 제외한 모든 정보는 삭제되며 </p>
                    <p style="font-size: 15px; font-weight: bold; color: #a10000;">의료정보기록이 있는 회원의 경우 본원의 환자 관련 정보는 삭제되지 않고 저장 됩니다.</p>

                </div>
                <div class="form-img" >
                    <img src="/resource/images/form-img.png" style="height: 280px">
                </div>
            </div>
    </section>

    <%-- 탈퇴 양식   --%>
    <section style="margin-top: 30px">
        <form action="/removeMember" method="post" id="pwUpdateForm" name="pwUpdateForm">
            <sec:csrfInput/>
            <input type="hidden" id="memId" name="memId" value="${member.memId}">
            <div class="col-sm-8 col-sm-offset-2">
                <div class="panel-default panel-margin-10"  style="border: none;">
                    <div class="panel-body text-center">
                        <p class="lead">비밀번호를 입력해주세요.</p>
                        <div class="form-group">
                            <input type="password" name="memPassword" id="memPassword" onchange="checkpassword()"
                                   class="form-control form-control-inline text-center" placeholder="현재 비밀번호" autoComplete="off" />
                            <span  id="fail" style="display:none; color: red;">현재 비밀번호와 맞지 않습니다.</span>
                        </div>
                        <button type="button" id="pwUpdateCk" class="btn btn-primary" onclick="removeMember()">탈퇴</button>
                        <button type="submit" id="pwUpdate" style="display: none;" name="pwUpdate" class="btn btn-primary">탈퇴</button>
                        <a href="/" class="btn btn-default" id="cancle" style="display: inline-block">취소</a>
                    </div>
                </div>
            </div>
        </form>
    </section>
</div>

<script>
    function removeMember() {
        if(window.confirm("탈퇴하시겠습니까?")){
            $("#pwUpdateCk").css("display", "none");
            $("#pwUpdate").css("display", "inline-block");
            $("#pwUpdate").css("background-color", "#a10000");
            $("#cancle").css("display", "none");
        }
    }
</script>

<script>
    function checkpassword() {
        var inputed = $('#memPassword').val();
        $.ajax({
            data: {
                memPassword: inputed
            },
            url: "/pwCheck",
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

</script>
<%@include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>