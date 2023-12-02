<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>인근약국</title>
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

<style>
    .container2 {
        margin-top: 40px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap;
    }

    .map-info{
        display: flex;
        justify-content: center;
        align-items: center;

        width: auto;
    }

    .pharmacy-list {
        display: flex;
        align-items: center;
        height: 400px;
    }

    table {
        border-collapse: collapse;
    }

    /*이중선 제거*/
    td {
        height: 60px;
        text-align: center;
        border: 1px solid gainsboro;
        color: gray;
    }
    tr > td:nth-child(1){
        width: 200px;
    }
    tr > td:nth-child(2){
        width: 230px;
    }
    tr > td:nth-child(3){
        width: 300px;
    }
    tr:nth-child(1){
        background-color: whitesmoke;
    }

</style>


<div class="container2">
    <div id="map" class="col-sm-7" style="min-width:786px; height:350px;"></div>
    <div class="col-sm-7" style="min-width: 786px; padding-top: 30px">
        <h3 style="font-size: 26px">인근약국 리스트</h3>
    </div>
    <div class="pharmacy-list col-sm-7">
        <table>
            <tr>
                <td scope="col">약국명</td>
                <td scope="col">전화번호</td>
                <td scope="col">주소</td>
            </tr>
            <tr>
                <td scope="col">미래약국</td>
                <td scope="col">042-255-8220</td>
                <td scope="col">대전 중구 선화로9 동성빌딩 1</td>
            </tr>
            <tr>
                <td scope="col">행복한온누리약국</td>
                <td scope="col">042-223-9141</td>
                <td scope="col">대전 중구 선화로 20</td>
            </tr>
            <tr>
                <td scope="col">새봄약국</td>
                <td scope="col">042-536-6675</td>
                <td scope="col">대전 중구 계룡로 858 2층</td>
            </tr>
            <tr>
                <td scope="col">조아약국</td>
                <td scope="col">042-525-7121</td>
                <td scope="col">대전 중구 계룡로 876</td>
            </tr>
            <tr>
                <td scope="col">오룡대형약국</td>
                <td scope="col">042-222-0666</td>
                <td scope="col">대전 중구 계룡로 809 동성빌딩 1층</td>
            </tr>
        </table>
    </div>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=33bc111ff5a741e88a74435f109f98c3"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 4 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 마커가 표시될 위치입니다
    var markerPosition = new kakao.maps.LatLng(36.32512053699505, 127.41076147115487);
    var markerPosition2 = new kakao.maps.LatLng(36.325597426740394, 127.41162986120288);
    var markerPosition3 = new kakao.maps.LatLng(36.32419299314189, 127.40991022069491);
    var markerPosition4 = new kakao.maps.LatLng(36.323193423496605, 127.41100749653087);
    var markerPosition5 = new kakao.maps.LatLng(36.327721263584365, 127.40656529137567);

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });
    var marker2 = new kakao.maps.Marker({
        position: markerPosition2
    });
    var marker3 = new kakao.maps.Marker({
        position: markerPosition3
    });
    var marker4 = new kakao.maps.Marker({
        position: markerPosition4
    });
    var marker5 = new kakao.maps.Marker({
        position: markerPosition5
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    marker2.setMap(map);
    marker3.setMap(map);
    marker4.setMap(map);
    marker5.setMap(map);

    var v_Content = '<div class="map-info"><p>미래약국</p></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwPosition = new kakao.maps.LatLng(36.32512053699505, 127.41076147115487); //인포윈도우 표시 위치입니다
    var v_Content2 = '<div class="map-info"><p>행복한온누리약국</p></div>',
        iwPosition2 = new kakao.maps.LatLng(36.325597426740394, 127.41162986120288);
    var v_Content3 = '<div class="map-info"><p>새봄약국</p></div>',
        iwPosition3 = new kakao.maps.LatLng(36.32419299314189, 127.40991022069491);
    var v_Content4 = '<div class="map-info"><p>조아약국</p></div>',
        iwPosition4 = new kakao.maps.LatLng(36.323193423496605, 127.41100749653087);
    var v_Content5 = '<div class="map-info"><p>오룡대형약국</p></div>',
        iwPosition5 = new kakao.maps.LatLng(36.327721263584365, 127.40656529137567);

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        position: iwPosition,
        content: v_Content
    });
    var infowindow2 = new kakao.maps.InfoWindow({
        position: iwPosition2,
        content: v_Content2
    });
    var infowindow3 = new kakao.maps.InfoWindow({
        position: iwPosition3,
        content: v_Content3
    });
    var infowindow4 = new kakao.maps.InfoWindow({
        position: iwPosition4,
        content: v_Content4
    });
    var infowindow5 = new kakao.maps.InfoWindow({
        position: iwPosition5,
        content: v_Content5
    });


    // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
    infowindow.open(map, marker);
    infowindow2.open(map, marker2);
    infowindow3.open(map, marker3);
    infowindow4.open(map, marker4);
    infowindow5.open(map, marker5);
</script>

<%@include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>