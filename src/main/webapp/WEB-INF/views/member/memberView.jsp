<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<link rel="stylesheet" href="/resource/bootstrap-3.3.2/css/memberForm.css">
<link rel="stylesheet" href="/resource/bootstrap-3.3.2/css/login.css">
<%@include file="/WEB-INF/inc/navi.jsp" %>

<div class="container">
    <h3>회원 권한 설정 및 탈퇴</h3>
    <section style="margin-top: 60px;">
        <form name="updateUser" action="updateUser.wow" method="post" class="form-horizontal">
            <sec:csrfInput/>
            <div class="form-group">
                <input type="hidden" name="memId" value="${member.memId}">
                <label for="memId" class="col-sm-3 control-label">아이디</label>
                <div class="col-sm-6 ">
                    <span id="memId">${member.memId}</span>
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memName" class="col-sm-3 control-label">이름</label>
                <div class="col-sm-6 ">
                    <span id="memName">${member.memName}</span>
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memZip" class="col-sm-3 control-label">우편번호</label>
                <div class="col-sm-4">
                    <input id="memZip" class="form-control input-mg" readonly="readonly" value='${member.memZip}'>
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memAdd1" class="col-sm-3 control-label">주소</label>
                <div class="col-sm-6">
                    <input id="memAdd1" class="form-control input-mg" value='${member.memAdd1}' readonly="readonly">
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memAdd2" class="col-sm-3 control-label">상세주소</label>
                <div class="col-sm-6">
                    <input id="memAdd2" class="form-control input-mg" value='${member.memAdd2}' readonly="readonly">
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memBir" class="col-sm-3 control-label">생일</label>
                <div class="col-sm-6">
                    <input id="memBir" type="date" readonly="readonly" class="form-control input-mg"
                           value='${member.memBir}'>
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <input type="hidden" name="memEmail" value="${member.memEmail}">
                <label for="memEmail" class="col-sm-3 control-label">이메일</label>
                <div class="col-sm-6 ">
                    <span id="memEmail">${member.memEmail}</span>
                </div>
            </div>
            <p class="divider-text"></p>
            <div class="form-group">
                <label for="memHp" class="col-sm-3 control-label">핸드폰</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="memHp" placeholder="-를 제외한 숫자만 입력하시오."
                           name="memHp" value='${member.memHp}' disabled>
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
                    <a href="memberList.wow" style="border: 0px; width: 100%; height: 50px; color: black;"
                       class="glyphicon glyphicon-list form-control btn btn-block btn-secondary btn-lg">&nbsp;목록으로</a>
                </div>
            </div>
        </form>
    </section>
</div>

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

</script>
</body>
</html>