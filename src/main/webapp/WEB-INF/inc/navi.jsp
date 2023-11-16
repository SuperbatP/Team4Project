<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
    .dropdown {
        padding-top: 20px;
        position: relative;
        display: inline-block;
        width: 130px;

    }

    .drop-btn{
        padding-bottom: 15px;
        width :150px;
        text-align: left;
        cursor : pointer;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        z-index: 1;
        border: 1px solid gainsboro;
        background-color: white;
    }

    .dropdown-content a {
        display: block;
        text-decoration : none;
        font-size: 13px;
        padding : 12px 15px;
        font-family: sans-serif;
    }

    .dropdown:hover .dropdown-content {
        display: block;
    }
</style>


<header>
    <div class="container">
        <div class="row">

            <div class="col-md-4 col-sm-5">
                <p style="font-size: 16px;">Phoenix Hospital</p>
            </div>
            <div class="col-md-8 col-sm-7 text-align-right">
                <c:if test="${USER_INFO==null}">
                    <span class="phone-icon"><a href="/member/memberForm.wow">회원가입</a></span>
                    <span class="date-icon"><a href="/login/login.wow">로그인</a></span>
                    <span class="email-icon"><a href="#">사이트맵</a></span>
                </c:if>
                <c:if test="${USER_INFO!=null}">
                    <span class="">${USER_INFO.userName} 님</span>
                    <span class="phone-icon"><a href="#">My page</a></span>
                    <span class="date-icon"><a href="#">1:1 문의게시판</a></span>
                    <span class="email-icon"><a href="/login/logout.wow">로그아웃</a></span>
                    <span class="email-icon"><a href="#">사이트맵</a></span>
                </c:if>
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
            <div class="nav navbar-nav navbar-left"><a href="/"><img
                    src="/resource/bootstrap-3.3.2/images/logo_small.png" style="width:150px; "></a>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <div class="dropdown">
                    <li class="drop-btn"><a href="/reservation/reservationSearch.wow">진료예약</a></li>
                    <div class="dropdown-content">
                        <a class="smoothScroll" href="/reservation/reservationSearch.wow">진료예약</a>
                        <a class="smoothScroll" href="/reservation/checkUpForm.wow?memId=${USER_INFO!=null ? USER_INFO.userId : null}">건강검진예약</a>
                        <a class="smoothScroll" href="/reservation/reservationView.wow">예약확인 및 취소</a>
                    </div>
                </div>

                <div class="dropdown">
                    <li class="drop-btn"><a>병원소개</a></li>
                    <div class="dropdown-content">
                        <a class="smoothScroll" href="/map/map.wow">오시는길</a>
                        <a class="smoothScroll" href="/pharmacy/pharmacy.wow">인근약국 안내</a>
                    </div>
                </div>

                <div class="dropdown">
                    <li class="drop-btn"><a>증명서발급</a></li>
                    <div class="dropdown-content">

                    </div>
                </div>

                <div class="dropdown">
                    <li class="drop-btn"><a>정보마당</a></li>
                    <div class="dropdown-content">
                        <a class="smoothScroll" href="/free/freeList.wow">민원게시판</a>
                        <a class="smoothScroll" href="#">공지사항</a>
                        <a class="smoothScroll" href="#">건강정보</a>
                    </div>
                </div>
            </ul>

        </div>

    </div>
</section>



		
 