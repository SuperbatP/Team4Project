<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="Tooplate">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="css/tooplate-style.css">
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>


<style>
    .container2 {
        width: 1300px;
        display: flex;
        flex-wrap: wrap;
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
        margin: 20px;
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

        <form name="search" action="reservationList.wow" method="post">
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

        <div class="clearfix"></div>

        <div class="dtlist_frame">

        </div>

    </div>
</section>


<!-- SCRIPTS -->
<script src="resource/bootstrap-3.3.2/js/jquery.js"></script>
<script src="resource/bootstrap-3.3.2/js/bootstrap.min.js"></script>
<script src="resource/bootstrap-3.3.2/js/jquery.sticky.js"></script>
<script src="resource/bootstrap-3.3.2/js/jquery.stellar.min.js"></script>
<script src="resource/bootstrap-3.3.2/js/wow.min.js"></script>
<script src="resource/bootstrap-3.3.2/js/smoothscroll.js"></script>
<script src="resource/bootstrap-3.3.2/js/owl.carousel.min.js"></script>
<script src="resource/bootstrap-3.3.2/js/custom.js"></script>

<script>
    let v_dtnamelist = [['가정의학과'], ['감염내과'], ['내분비대사내과'], ['류마티스내과'], ['마취통증의학과'], ['방사선종양학과'], ['병리과'], ['비뇨의학과'], ['산부인과'], ['성형외과'], ['소아청소년과'], ['소화기내과'], ['신경과'], ['신경외과'], ['신장내과'], ['심장내과'], ['심장혈관흉부외과'], ['안과'], ['영상의학과'], ['외과'], ['외과-유방암·갑상선암'], ['응급의학과'], ['의공학과'], ['이비인후과'], ['재활의학과'], ['정신건강의학과'], ['정형외과'], ['진단검사의학과'], ['치과'], ['통증클리닉'], ['피부과'], ['핵의학과'], ['혈액종양내과'], ['호흡기알레르기내과']];


    for (let i = 0; i < v_dtnamelist.length; i++) {

        let v_dtlist = '<div class="dt_frame wow fadeInUp" data-wow-delay="0.2s">'
        v_dtlist += '<div class="dtimg">'
        v_dtlist += '<img src = "../../../resource/bootstrap-3.3.2/images/진료과목/' + v_dtnamelist[i] + '.png" class="img-responsive" alt = "">'
        v_dtlist += '</div>'
        v_dtlist += '<div class="dtname">'
        v_dtlist += '<p style="font-size: 17px; color: gray;">' + v_dtnamelist[i] + '</p>'
        v_dtlist += '</div>'
        v_dtlist += '</div>'

        document.querySelector(".dtlist_frame").innerHTML
            = v_dtlist + document.querySelector(".dtlist_frame").innerHTML;

        console.log(v_dtnamelist[i])
    }

</script>

<%@include file="/WEB-INF/inc/footer.jsp" %>

</body>
</html>