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
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>
<style>
    .section {
        border-bottom: 1px solid #ccc;
        margin-top: 1em;
    }

    .section .col-md-3 {
        border-left: 1px solid #ccc;
    }

    .section .col-md-3:first-child {
        border: none;
    }
</style>

<!-- PRE LOADER -->
<section class="preloader">
    <div class="spinner">
        <span class="spinner-rotate"></span>
    </div>
</section>

<div class="container">

    <h3>불사조병원 사이트맵</h3>

    <section style="margin-top: 40px;" id="sec1">
        <h4>진료예약</h4>
        <div class="row">
            <div class="col-md-3">
                <ul>
                    <li><a href="/reservation/reservationSearch.wow">진료예약</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <ul>
                    <li><a href="/reservation/checkUpForm.wow">건강검진 예약</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <ul>
                    <li><a href="/reservation/reservationView.wow">예약확인 및 취소</a></li>
                </ul>
            </div>
        </div>
    </section>
    <section id="sec2">

        <h4>병원소개</h4>
        <div class="row">
            <div class="col-md-3">
                <ul>
                    <li><a href="/map/map.wow">오시는 길</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <ul>
                    <li><a href="/pharmacy/pharmacy.wow">인근약국 안내</a></li>
                </ul>
            </div>
        </div>
    </section>
    <section id="sec3">

        <h4>증명서발급</h4>
        <div class="row">
            <div class="col-md-3">
                <ul>
                    <li><a href="/certificate/certificateChoice.wow">증명서 조회</a></li>
                </ul>
            </div>
        </div>
    </section>
    <section id="sec4">
        <h4>정보마당</h4>
        <div class="row">
            <div class="col-md-3">
                <ul>
                    <li><a href="/free/freeList.wow">민원 게시판</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <ul>
                    <li><a href="/notice/noticeList.wow">공지사항</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <ul>
                    <li><a href="/health/healthList.wow">건강정보</a></li>
                </ul>
            </div>
        </div>
    </section>
</div>
<!-- /container -->

<%@include file="/WEB-INF/inc/footer.jsp" %>
<!-- SCRIPTS -->
<script>
    $('.nav li').click(function (e) {
        e.preventDefault();
        $('.nav li').removeClass('active');
        $(this).addClass('active');
    });
</script>

</body>
</html>