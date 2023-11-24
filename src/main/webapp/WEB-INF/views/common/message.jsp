<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp"%>
<title>결과 : ${resultMessageVO.title}</title>
</head>
<body>
	<%@include file="/WEB-INF/inc/navi.jsp"%>
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
						<a href="/free/freeList.wow" onclick="history.back()" class="btn btn-default">
							<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>
							&nbsp;뒤로가기
						</a> 
						&nbsp;
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
	<!-- container -->
</body>
</html>