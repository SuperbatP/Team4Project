<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>결과 : ${resultMessageVO.title}</title>
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
    <div class="row col-md-8 col-md-offset-2">
        <div class="page-header">
            <h3>${resultMessageVO.title}</h3>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <p>${resultMessageVO.message}</p>
            </div>
            <div class="panel-body">
                <a href="${pageContext.request.contextPath}/index.jsp"
                   class="btn btn-primary">
                    <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                    &nbsp;Home
                </a>
                <div class="pull-right">
                    <a href="#" onclick="history.back()" class="btn btn-default">
                        <span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>
                        &nbsp;뒤로가기
                    </a>
                    <sec:authorize access="hasRole('ADMIN')">
                        <c:if test="${not empty resultMessageVO.url}">
                            <a href="<c:url value='${resultMessageVO.url}' />"
                               class="btn btn-warning">
                                <span class="glyphicon glyphicon-new-window" aria-hidden="true"></span>
                                &nbsp;${resultMessageVO.urlTitle}
                            </a>
                        </c:if>
                    </sec:authorize>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>