<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>진료예약</title>
    <link rel="stylesheet" href="/resource/bootstrap/css/common.css"/>
    <link rel="stylesheet" href="/resource/bootstrap/css/sub.css"/>
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
<section id="team" data-stellar-background-ratio="1"
         style="display: flex; justify-content: center; align-items: center;">
    <div class="container">
        <div class="content">
            <form class="width100  mar-bottom40" name="search" action="reservationList.wow" method="post">
                <sec:csrfInput/>
                <section class="search-box wow fadeInUp" data-wow-delay="0.1s" id="appointment">
                    <div class="search-img">
                        <img style="margin-top: -5px; width: 30px; height: 30px;"
                             src="../../../resource/images/돋보기.png" class="img-responsive">
                    </div>
                    <div class="search-search">
                        <h4>진료과/의료진 찾기</h4>
                    </div>
                    <div class="search-input">
                        <input style="margin-top: 10px;" type="text" class="form-control" name="searchWord"
                               placeholder="진료과 및 의료진 명으로 검색하실 수 있습니다..">
                    </div>
                    <button type="submit" class="search-btn" id="cf-submit" name="submit" onclick="f_click()">검색
                    </button>
                </section>
            </form>

            <c:forEach var="tc" items="${codeList}">
                <a href="reservationList.wow?searchType=${tc.treatmentCode}">
                    <div class="dtlist_frame">
                        <div class="dt_frame wow fadeInUp" data-wow-delay="0.2s">
                            <div class="dtimg">
                                <img src='../../../resource/images/진료과목/${tc.treatmentName}.png'
                                     class="img-responsive" alt="">
                            </div>
                            <div class="dtname">
                                <p style="font-size: 17px; color: gray;">${tc.treatmentName}</p>
                            </div>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
</section>
<%@include file="/WEB-INF/inc/footer.jsp" %>
<script>
    function f_click() {
        event.preventDefault();
        if($("input[name='searchWord']")[0].value=="") {
            alert("검색어를 입력해주세요");
        } else {
            $("form[name='search']").submit();
        }
    }
</script>
</body>
</html>