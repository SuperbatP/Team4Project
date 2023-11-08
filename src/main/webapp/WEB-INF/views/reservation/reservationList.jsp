<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%request.setCharacterEncoding("UTF-8");%>
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/inc/navi.jsp" %>
<c:forEach var="doctor" items="${doctors}">
    <div>
        <img src="${doctor.dcImg}">
        이름${doctor.dcName}
        진료과${doctor.major}
        일정
    </div>
</c:forEach>
</body>
</html>
