<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%request.setCharacterEncoding("UTF-8");%>
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/inc/navi.jsp" %>
<form name="search" action="reservationList.wow" method="post">
    <input type="text" name="searchWord">
    <button type="submit">검색</button>
</form>
<c:forEach var="tc" items="${codeList}">
    <div>
        <a href="reservationList.wow?searchWord=${tc.treatmentCode}">
            ${tc.treatmentName}
        </a>
    </div>
</c:forEach>
</body>
</html>
