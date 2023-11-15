<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>


<style>
    .container2 {
        width: 1200px;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
    }

    form{
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .search-box {
        border: 0.5px solid;
        border-color: gainsboro;
        width: 95%;
        height: 100px;
        display: flex;
        justify-content: center;
        align-items: center;

    }

    .search-img {
        margin-top: -100px;
        width: 50px;
        height: 100px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .search-search {
        margin-top: -100px;
        width: 230px;
        height: 100px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .search-input {
        margin-top: -100px;
        width: 400px;
        height: 100px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .search-btn {
        margin-top: -100px;
        width: 130px;
        height: 100px;
        display: flex;
        justify-content: center;
        align-items: center;
        padding-left: 10px;
        padding-right: 10px;
    }

    .dtlist_frame {
        padding-top: 70px;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
    }

    .dt_frame {
        border: 0.5px solid;
        border-color: gainsboro;
        padding-top: 20px;
        width: 200px;
        height: 230px;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        cursor: pointer;
        margin-left: 10px;
        margin-right: 10px;
    }

    .dtimg {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 65%;
        height: 65%;
    }

    .dtimg > img {
        width: 80%;
        height: 80%;
    }

    .dtname {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 80%;
        height: 20%;
    }

</style>

<section id="team" data-stellar-background-ratio="1"
         style="display: flex; justify-content: center; align-items: center;">
    <div class="container2">

        <form style="width: 100%;" name="search" action="reservationList.wow" method="post">
            <sec:csrfInput/>
            <section class="search-box wow fadeInUp" data-wow-delay="0.1s" id="appointment">
                <div class="search-img">
                    <img style="margin-top: -5px; width: 30px; height: 30px;"
                         src="../../../resource/bootstrap-3.3.2/images/돋보기.png" class="img-responsive">
                </div>
                <div class="search-search">
                    <h4>진료과/의료진 찾기</h4>
                </div>
                <div class="search-input">
                    <input style="margin-top: 10px;" type="text" class="form-control" name="searchWord"
                           placeholder="진료과 및 의료진 명으로 검색하실 수 있습니다..">
                </div>
                <div class="search-btn">
                    <button style="margin-top: 10px;" type="submit" class="form-control" id="cf-submit" name="submit"
                            onclick="f_click()">검색
                    </button>
                </div>
            </section>
        </form>

        <c:forEach var="tc" items="${codeList}">
        <a href="reservationList.wow?searchType=${tc.treatmentCode}">
        <div class="dtlist_frame">
            <div class="dt_frame wow fadeInUp" data-wow-delay="0.2s">
                <div class="dtimg">
                    <img src='../../../resource/bootstrap-3.3.2/images/진료과목/${tc.treatmentName}.png' class="img-responsive" alt="">
                </div>
                <div class="dtname">
                    <p style="font-size: 17px; color: gray;">${tc.treatmentName}</p>
                </div>
            </div>
        </div>
        </a>
        </c:forEach>


    </div>
</section>

<%@include file="/WEB-INF/inc/footer.jsp" %>
<!-- SCRIPTS -->
<script>

</script>
<script src="resource/bootstrap-3.3.2/js/jquery.js"></script>
<script src="resource/bootstrap-3.3.2/js/bootstrap.min.js"></script>
<script src="resource/bootstrap-3.3.2/js/jquery.sticky.js"></script>
<script src="resource/bootstrap-3.3.2/js/jquery.stellar.min.js"></script>
<script src="resource/bootstrap-3.3.2/js/wow.min.js"></script>
<script src="resource/bootstrap-3.3.2/js/smoothscroll.js"></script>
<script src="resource/bootstrap-3.3.2/js/owl.carousel.min.js"></script>
<script src="resource/bootstrap-3.3.2/js/custom.js"></script>

</body>
</html>