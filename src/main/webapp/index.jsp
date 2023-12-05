<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>
<!-- PRE LOADER -->
<section class="preloader">
    <div class="spinner">

        <span class="spinner-rotate"></span>

    </div>
</section>

<!-- HOME -->
<section id="home" class="slider" data-stellar-background-ratio="0.5">
    <div class="container">
        <div class="row">
            <div class="owl-carousel owl-theme">
                <div class="item item-first">
                    <div class="caption">
                        <div class="col-md-offset-1 col-md-10">
                            <h3>집에서 진료 예약을 간편하게</h3>
                            <h1>불사조 병원 예약 시스템</h1>
                            <a href="/reservation/reservationSearch.wow" class="section-btn btn btn-default smoothScroll">진료예약 하기</a>
                        </div>
                    </div>
                </div>
                <div class="item item-second">
                    <div class="caption">
                        <div class="col-md-offset-1 col-md-10">
                            <h3>방문하기 편리한 위치</h3>
                            <h1>불사조 병원</h1>
                            <a href="/map/map.wow" class="section-btn btn btn-default btn-gray smoothScroll">위치 안내</a>
                        </div>
                    </div>
                </div>

                <div class="item item-third">
                    <div class="caption">
                        <div class="col-md-offset-1 col-md-10">
                            <h3>불사조 병원 최근 뉴스</h3>
                            <h1>불사조 병원 공지사항</h1>
                            <a href="/notice/noticeList.wow" class="section-btn btn btn-default btn-blue smoothScroll">공지사항</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- ABOUT -->
<section id="about">
    <div class="container">
        <div class="row">

            <div class="col-md-6 col-sm-6">
                <div class="about-info">
                    <h2 class="wow fadeInUp" data-wow-delay="0.6s">불사조 병원을 방문해주셔서<br> 감사합니다.</h2>
                    <div class="wow fadeInUp" data-wow-delay="0.8s">
                        <p style="font-size: 18px;">불사조 병원은 환자의 입장에서 먼저 생각합니다.</p>
                        <p style="font-size: 18px;">불사조 병원 예약 사이트는 무료입니다.</p>
                        <p style="font-size: 18px;">회원가입 후 서비스를 이용하세요.</p>
                    </div>
                    <figure class="profile wow fadeInUp" data-wow-delay="1s">
                        <img src="resource/images/의료진대표이미지/김정환원장님.jpg" class="img-responsive" alt="">
                        <figcaption style="margin-top: 20px;">
                            <h3>김정환 원장</h3>
                            <p>토니토니 초파</p>
                        </figcaption>
                    </figure>
                </div>
            </div>

        </div>
    </div>
</section>


<!-- TEAM -->
<section id="team" data-stellar-background-ratio="1">
    <div class="container">
        <div class="row">

            <div class="col-md-6 col-sm-6">
                <div class="about-info">
                    <h2 class="wow fadeInUp" data-wow-delay="0.1s">의료진 소개</h2>
                </div>
            </div>
            <div class="clearfix"></div>

            <div class="col-md-4 col-sm-6">
                <div class="team-thumb wow fadeInUp" data-wow-delay="0.2s">
                    <img src="resource/images/의료진대표이미지/DC024.jpg" class="img-responsive" alt="">
                    <div class="team-info">
                        <h3>김영희</h3>
                        <p>가정의학과</p>
                        <div class="team-contact-info">
                            <p style="font-size: 16px;">서울대학교 의과대학</p>
                            <p style="font-size: 16px;">서울의료원 가정의학과전문의 경력 10년</p>
                            <br>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-sm-6">
                <div class="team-thumb wow fadeInUp" data-wow-delay="0.4s">
                    <img src="resource/images/의료진대표이미지/DC025.jpg" class="img-responsive" alt="">
                    <div class="team-info">
                        <h3>박민정</h3>
                        <p>감염내과</p>
                        <div class="team-contact-info">
                            <p style="font-size: 16px;">연세대학교 의과대학</p>
                            <p style="font-size: 16px;">연세의료원 감염내과전문의 경력 8년</p>
                            <br>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-sm-6">
                <div class="team-thumb wow fadeInUp" data-wow-delay="0.6s">
                    <img src="resource/images/의료진대표이미지/DC026.jpg" class="img-responsive" alt="">
                    <div class="team-info">
                        <h3>박영미</h3>
                        <p>내분비대사내과</p>
                        <div class="team-contact-info">
                            <p style="font-size: 16px;">고려대학교 의과대학</p>
                            <p style="font-size: 16px;">한양의료원 내분비대사내과전문의 경력 15년</p>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- NEWS -->
<section id="news" data-stellar-background-ratio="2.5">
    <div class="container">
        <div class="row">

            <div class="col-md-12 col-sm-12">
                <!-- SECTION TITLE -->
                <div class="section-title wow fadeInUp" data-wow-delay="0.1s">
                    <h2>최신 뉴스</h2>
                </div>
            </div>

            <div class="col-md-4 col-sm-6">
                <!-- NEWS THUMB -->
                <div class="news-thumb wow fadeInUp" data-wow-delay="0.4s">
                    <a href="/notice/noticeView.wow?boNo=%2083">
                        <img src="resource/images/news-image1.jpg" class="img-responsive" alt="">
                    </a>
                    <div class="news-info">
                        <span>2023 12 12</span>
                        <h3><a href="/notice/noticeView.wow?boNo=%2083">불사조 병원 최종 합격자</a></h3>
                        <p style="font-size: 16px;">제 1회 불사조 병원 합격지원자 명단 확인</p>
                        <p style="font-size: 16px;">지원해주신 19명은 명단을 확인해주세요.</p>
                        <div class="author">
                            <img src="resource/images/의료진대표이미지/김정환원장님.jpg" class="img-responsive" alt="">
                            <div class="author-info">
                                <h5>김정환 원장</h5>
                                <p>토니토니 초파</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-sm-6">
                <!-- NEWS THUMB -->
                <div class="news-thumb wow fadeInUp" data-wow-delay="0.6s">
                    <a href="/notice/noticeView.wow?boNo=%2082">
                        <img src="resource/images/news-image2.jpg" class="img-responsive" alt="">
                    </a>
                    <div class="news-info">
                        <span>2023 12 04</span>
                        <h3><a href="/notice/noticeView.wow?boNo=%2082">재활의학과의 확장이전 소식</a></h3>
                        <p style="font-size: 16px;">불사조 병원에 재활의학과가 확장 이전합니다.</p>
                        <p style="font-size: 16px;">환자분들의 편의를 위해 더욱 접근이 용이한 위치로 옮기게 되었습니다.</p>
                        <div class="author">
                            <img src="resource/images/의료진대표이미지/김정환원장님.jpg" class="img-responsive" alt="">
                            <div class="author-info">
                                <h5>김정환 원장</h5>
                                <p>토니토니 초파</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-sm-6">
                <!-- NEWS THUMB -->
                <div class="news-thumb wow fadeInUp" data-wow-delay="0.8s">
                    <a href="/notice/noticeView.wow?boNo=%2081">
                        <img src="resource/images/news-image3.jpg" class="img-responsive" alt="">
                    </a>
                    <div class="news-info">
                        <span>2023 12 01</span>
                        <h3><a href="/notice/noticeView.wow?boNo=%2081">불사조 병원 의료진 추가채용</a></h3>
                        <p style="font-size: 16px;">불사조 병원의 의료진를 추가 모집합니다.</p>
                        <div class="author">
                            <img src="resource/images/의료진대표이미지/김정환원장님.jpg" class="img-responsive" alt="">
                            <div class="author-info">
                                <h5>김정환 원장</h5>
                                <p>토니토니 초파</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

<!-- FOOTER -->
<footer data-stellar-background-ratio="5" style="margin-top: 30px;">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-4">
                <div class="footer-thumb">
                    <h4 class="wow fadeInUp" data-wow-delay="0.4s">불사조 병원연락처</h4>
                    <p>고객님들의 소중한 의견 감사히 받겠습니다.</p>

                    <div class="contact-info">
                        <p><i class="fa fa-phone"></i> 042-719-8850</p>
                        <p><i class="fa fa-fax"></i> 042-719-8851</p>
                        <p><i class="fa fa-envelope-o"></i> nextit_center@naver.com</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4">
                <div class="footer-thumb">
                    <div class="opening-hours">
                        <h4 class="wow fadeInUp" data-wow-delay="0.4s">불사조 병원 이용시간</h4>
                        <p>월요일 - 금요일 <span>09:00 AM - 06:00 PM</span></p>
                        <p>토요일 - 일요일 <span>09:00 AM - 13:00 PM</span></p>
                    </div>

                    <ul class="social-icon">
                        <li><a href="https://www.nextit.or.kr/" target="_blank" class="fa fa-home"></a></li>
                        <li><a href="https://blog.naver.com/nextit_center" target="_blank" class="fa fa-bookmark"></a></li>
                        <li><a href="https://www.instagram.com/__nextit__/" target="_blank" class="fa fa-instagram"></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-4 col-sm-4">
                <div class="footer-thumb">
                    <div class="opening-hours">
                        <h4 class="wow fadeInUp" data-wow-delay="0.4s">불사조 병원 주소</h4>
                        <p><span> (34856) 넥스트 IT 교육센터</span></p>
                        <p><span> 대전광역시 중구 계룡로 825 (용두동, 희영빌딩 2층) </span></p>
                    </div>

                    <ul class="social-icon">
                        <li><a href="/map/map.wow" class="fa fa-map"></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>

<%@include file="/WEB-INF/inc/footer.jsp" %>
<!-- SCRIPTS -->
<script src="resource/bootstrap/js/jquery.js"></script>
<script src="resource/bootstrap/js/bootstrap.min.js"></script>
<script src="resource/bootstrap/js/jquery.sticky.js"></script>
<script src="resource/bootstrap/js/jquery.stellar.min.js"></script>
<script src="resource/bootstrap/js/wow.min.js"></script>
<script src="resource/bootstrap/js/smoothscroll.js"></script>
<script src="resource/bootstrap/js/owl.carousel.min.js"></script>
<script src="resource/bootstrap/js/custom.js"></script>

</body>
</html>