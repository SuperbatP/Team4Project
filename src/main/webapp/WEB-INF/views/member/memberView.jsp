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
<%@include file="/WEB-INF/inc/navi.jsp" %>

<div class="container">
    <h3>상세보기</h3>
    <form action="updateUser.wow" method="post">
        <sec:csrfInput/>
        <table class="table table-striped table-bordered">
            <tbody>
            <tr>
                <th>아이디</th>
                <td><input name="memId" value='${member.memId}' readonly="readonly"></td>
            </tr>
            <tr>
                <th>회원명</th>
                <td>${member.memName}</td>
            </tr>
            <tr>
                <th>우편번호</th>
                <td>${member.memZip}</td>
            </tr>
            <tr>
                <th>주소</th>
                <td>${member.memAdd1} ${member.memAdd2}</td>
            </tr>
            <tr>
                <th>생일</th>
                <td><input type="date" name="memBir" class="form-control input-sm" value='${member.memBir}'
                           readonly="readonly"></td> <!-- 'YYYY-MM-DD'형태만 value값으로 들어갈수있어요 -->
            </tr>
            <tr>
                <th>핸드폰</th>
                <td>${member.memHp}</td>
            </tr>
            <tr>
                <th>권한 USER/ADMIN</th>
                <td><input name="memRole" value='${member.memRole}'></td>
            </tr>
            <tr>
                <th>탈퇴여부 Y/N</th>
                <td><input name="memDelYn" value='${member.memDelYn}'></td>
            </tr>
            <tr>
                <td colspan="2"><a href="memberList.wow" class="btn btn-default btn-sm"> <span
                        class="glyphicon glyphicon-list" aria-hidden="true"></span> &nbsp;목록
                </a>
                    <button type="submit" class="btn btn-primary">
                        <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
                        &nbsp;&nbsp; 저장
                    </button>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>


</body>
</html>