<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<header>
  <div class="container">
    <div class="row">

      <div class="col-md-4 col-sm-5">
        <p style="font-size: 16px;">Phoenix Hospital</p>
      </div>

      <div class="col-md-8 col-sm-7 text-align-right">
        <span class="phone-icon"><a href="#">회원가입</a></span>
        <span class="date-icon"><a href="#">로그인</a></span>
        <span class="email-icon"><a href="#">사이트맵</a></span>
      </div>

    </div>
  </div>
</header>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

<!-- NAVI MENU BAR -->
<section class="navbar navbar-default navbar-static-top" role="navigation">
  <div class="container">
    <!-- MENU LINKS -->
    <div class="collapse navbar-collapse">
      <div class="nav navbar-nav navbar-left"><a href="index.wow"><img src="/resource/bootstrap-3.3.2/images/logo_small.png" style="width:150px; "></a></div>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#top" class="smoothScroll">진료안내</a></li>
        <li><a href="#about" class="smoothScroll">진료예약</a></li>
        <li><a href="#team" class="smoothScroll">오시는길</a></li>
        <li><a href="#news" class="smoothScroll">발급안내</a></li>
        <li><a href="#google-map" class="smoothScroll">병원소개</a></li>
      </ul>
    </div>

  </div>
</section>



		
 