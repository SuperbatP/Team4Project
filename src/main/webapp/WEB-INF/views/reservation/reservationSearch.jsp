<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%request.setCharacterEncoding("UTF-8");%>
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<form name="search" action="ReservationList.wow" method="post">
    <input>
    <button type="submit">검색</button>
</form>
<c:forEach var="dt" items="">
    <div>
        <a href="ReservationList.wow?=${dt.department_treatment}">

        </a>
    </div>
</c:forEach>
</body>
</html>
