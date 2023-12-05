<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <script type="text/javascript" src="/resource/bootstrap/js/jquery.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/jquery.sticky.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/jquery.stellar.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/wow.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/smoothscroll.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="/resource/bootstrap/js/custom.js"></script>
    <script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>
    <script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script>
    <script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script>
    <meta charset='UTF-8'>
    <meta name="robots" content="noindex">
    <link rel="shortcut icon" type="image/x-icon"
          href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico"/>
    <link rel="mask-icon" type=""
          href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg"
          color="#111"/>
    <link rel="canonical" href="https://codepen.io/laviperchik/pen/FilGw?limit=all&page=36&q=shop"/>
    <script src="https://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css'>
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>
<style>
    .container-sitemap {
        width: 1000px;
        margin: 20px auto;
    }

    nav ul {
        margin: 0;
        padding: 0;
        list-style-type: none;
    }

    .sitemap {
        width: 800px;
        margin: 50px auto;
    }

    .sitemap a {
        color: #000;
        text-decoration: none;
        display: inline-block;
        text-transform: uppercase;
        margin: 0 5px;
        border-radius: 7px;
        text-align: center;
        position: relative;
        font-size: 22px;
    }

    .first > li > a {
        background: #a5c422;
        width: 170px;
        height: 70px;
        line-height: 70px;
        display: block;
        margin: auto;
    }

    .first > li > a:after {
        content: "";
        position: absolute;
        left: 50%;
        width: 1px;
        height: 10px;
        background: #a5c422;
        top: 100%;
    }

    .second {
        padding-top: 20px;
    }

    .second > li {
        display: inline-block;
        vertical-align: top;
    }

    .second a {
        background: #a5c422;
        font-size: 17px;
        width: 125px;
        height: 50px;
        line-height: 50px;
        z-index: 10;
    }

    .second a:before {
        content: "";
        position: absolute;
        border: 1px solid #9e9f9e;
        border-left: none;
        border-bottom: none;
        height: 9px;
        top: -10px;
        left: -76px;
        width: 150px;
    }

    .second li:first-child a:before {
        border-top: none;
    }

    .third {
        margin-left: 16px;
        padding-top: 20px;
    }

    .third a {
        background: #bac479;
        width: 120px;
        height: 40px;
        line-height: 40px;
        margin-bottom: 10px;
        z-index: 5;
        font-size: 15px;
    }

    .third a:before {
        border: 1px solid #9e9f9e;
        border-right: none;
        border-top: none;
        height: 55px;
        top: -35px;
        left: -8px;
        width: 7px;
    }
</style>

<!-- PRE LOADER -->
<section class="preloader">
    <div class="spinner">
        <span class="spinner-rotate"></span>
    </div>
</section>

<div class="container-sitemap" style="margin-top: 40px;">

    <h3>불사조병원 사이트맵</h3>

    <nav class="sitemap">
        <ul class="first">
            <li><a href="/">불사조 병원</a>
                <ul class="second">
                    <li><a href="/reservation/reservationSearch.wow">진료예약</a>
                        <ul class="third">
                            <li><a href="/reservation/reservationSearch.wow">진료예약</a></li>
                            <li><a href="/reservation/checkUpForm.wow">건강검진 예약</a></li>
                            <li><a href="/reservation/reservationView.wow">예약확인 및 취소</a></li>
                        </ul>
                    </li>
                    <li><a href="#">병원소개</a>
                        <ul class="third">
                            <li><a href="/map/map.wow">오시는 길</a></li>
                            <li><a href="/pharmacy/pharmacy.wow">인근약국 안내</a></li>
                        </ul>
                    </li>
                    <li><a href="#">증명서발급</a>
                        <ul class="third">
                            <li><a href="/certificate/certificateChoice.wow">증명서 조회</a></li>
                        </ul>
                    </li>
                    <li><a href="#">정보마당</a>
                        <ul class="third">
                            <li><a href="/free/freeList.wow">민원 게시판</a></li>
                            <li><a href="/notice/noticeList.wow">공지사항</a></li>
                            <li><a href="/health/healthList.wow">건강정보</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>
</div>
<!-- /container -->


<!-- SCRIPTS -->
<
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<%@include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>