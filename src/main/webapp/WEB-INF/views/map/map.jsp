<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<title>오시는길</title>
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
<%@include file="/WEB-INF/inc/navi.jsp" %>

<div id="mapframe" style="display: flex; justify-content: center; align-items: center; flex-wrap: wrap;">

    <div id="map" class="col-sm-7" style="min-width: 400px; height: 350px; margin-top: 40px;"></div>

    <div style="width: 1150px; height: 350px;">
        <div class="news-info">
            <h3>불사조 병원</h3>
            <p>주소: 대전광역시 중구 용두동 번지 2층 35-17 희영빌딩</p>
            <p>대표전화: 042-719-8850</p>
            <div class="author" style="display: flex; justify-content: start; align-items: center;">
                <a href="">
                    <div class="author-info" style="display: flex; margin-right: 20px;">
                        <img src="../../../resource/images/원내배치도.png" class="img-responsive" alt="">
                        <h5>원내배치도</h5>
                    </div>
                </a>
                <a href="https://map.kakao.com/link/to/희영빌딩,36.32679775351748,127.40783011006639">
                    <div class="author-info" style="display: flex;">
                        <img src="../../../resource/images/버스.png" class="img-responsive" alt="">
                        <h5>길찾기</h5>
                    </div>
                </a>
            </div>
        </div>
    </div>


    <div class="mymap"
         style="width: 1200px; height: 300px; border: 0.5px solid; border-color: gainsboro; display: flex; justify-content: center; align-items: center;">
        <section id="appointment"
                 style="width: 90%; height: 90%; display: flex; justify-content: space-evenly; align-items: center;">

            <div class="col-sm-2 section-title" style="margin-top: -90px;">
                <img style="width: 100%; height: 130px;" src="../../../resource/images/지도.png"
                     class="img-responsive">
            </div>

            <div class="col-sm-7" style="margin-top: -90px;">
                <!-- SECTION TITLE -->
                <div class="section-title">
                    <h2>내 위치에서 오시는길</h2>

                    <div class="col-md-12 col-sm-12">
                        <label for="myplace">내 위치</label>
                        <input type="text" class="form-control" id="myplace" name="myplace" placeholder="주소를 입력해주세요.">
                        <button type="button" class="form-control" id="cf-submit" name="submit" onclick="f_click()">검색
                        </button>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=33bc111ff5a741e88a74435f109f98c3"></script>
<script type="text/javascript">
    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    var options = { //지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(36.32679775351748, 127.40783011006639), //지도의 중심좌표.
        level: 3 //지도의 레벨(확대, 축소 정도)
    };

    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

    var imageSrc = 'https://cdn-icons-png.flaticon.com/512/3448/3448436.png', // 마커이미지의 주소입니다
        imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
        imageOption = {offset: new kakao.maps.Point(33, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
        markerPosition = new kakao.maps.LatLng(36.32679775351748, 127.40783011006639); // 마커가 표시될 위치입니다

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition,
        image: markerImage // 마커이미지 설정
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    const form = document.getElementById("appointment-form")

    function f_click() {
        const place = document.querySelector("#myplace").value
        var openNewWindow = window.open("about:blank");
        openNewWindow.location.href = "https://www.google.co.kr/maps/dir/" + place + "/넥스트아이티교육센터";
        console.log(place)

    }


</script>
<%@include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>