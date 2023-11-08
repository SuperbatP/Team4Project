<%@page import="com.PhoenixHospital.login.vo.UserVO"%>
<%@page import="com.PhoenixHospital.common.util.CookieUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/inc/header.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/inc/navi.jsp"%>

	${msg}



	<section class="vh-100">
		<div class="container py-5 h-100">
			<div class="row d-flex align-items-center justify-content-center h-100">
				<div class="col-md-8 col-lg-7 col-xl-6">
					<img src="/resource/bootstrap-3.3.2/images/news-image1.jpg"
						 class="img-fluid" alt="Phone image">
				</div>
				<div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
					<form>
						<!-- Email input -->
						<div class="form-outline mb-4">
							<input type="email" id="form1Example13" class="form-control form-control-lg" />
							<label class="form-label" for="form1Example13">Email address</label>
						</div>

						<!-- Password input -->
						<div class="form-outline mb-4">
							<input type="password" id="form1Example23" class="form-control form-control-lg" />
							<label class="form-label" for="form1Example23">Password</label>
						</div>





</body>
</html>