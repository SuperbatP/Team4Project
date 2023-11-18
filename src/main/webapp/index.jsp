<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <style>

        body {
            margin: 40px 10px;
            padding: 0;
            font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
            font-size: 14px;
        }

        #calendar {
            max-width: 1100px;
            margin: 0 auto;
        }

    </style>

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
                            <h3>Let's make your life happier</h3>
                            <h1>Healthy Living</h1>
                            <a href="#team" class="section-btn btn btn-default smoothScroll">Meet Our Doctors</a>
                        </div>
                    </div>
                </div>

                <div class="item item-second">
                    <div class="caption">
                        <div class="col-md-offset-1 col-md-10">
                            <h3>Aenean luctus lobortis tellus</h3>
                            <h1>New Lifestyle</h1>
                            <a href="#about" class="section-btn btn btn-default btn-gray smoothScroll">More About Us</a>
                        </div>
                    </div>
                </div>

                <div class="item item-third">
                    <div class="caption">
                        <div class="col-md-offset-1 col-md-10">
                            <h3>Pellentesque nec libero nisi</h3>
                            <h1>Your Health Benefits</h1>
                            <a href="#news" class="section-btn btn btn-default btn-blue smoothScroll">Read Stories</a>
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
                    <h2 class="wow fadeInUp" data-wow-delay="0.6s">Welcome to Your <i class="fa fa-h-square"></i>ealth Center</h2>
                    <div class="wow fadeInUp" data-wow-delay="0.8s">
                        <p>Aenean luctus lobortis tellus, vel ornare enim molestie condimentum. Curabitur lacinia nisi vitae velit volutpat venenatis.</p>
                        <p>Sed a dignissim lacus. Quisque fermentum est non orci commodo, a luctus urna mattis. Ut placerat, diam a tempus vehicula.</p>
                    </div>
                    <figure class="profile wow fadeInUp" data-wow-delay="1s">
                        <img src="resource/bootstrap-3.3.2/images/author-image.jpg" class="img-responsive" alt="">
                        <figcaption>
                            <h3>Dr. Neil Jackson</h3>
                            <p>General Principal</p>
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
                    <h2 class="wow fadeInUp" data-wow-delay="0.1s">Our Doctors</h2>
                </div>
            </div>

            <div class="clearfix"></div>

            <div class="col-md-4 col-sm-6">
                <div class="team-thumb wow fadeInUp" data-wow-delay="0.2s">
                    <img src="resource/bootstrap-3.3.2/images/team-image1.jpg" class="img-responsive" alt="">

                    <div class="team-info">
                        <h3>Nate Baston</h3>
                        <p>General Principal</p>
                        <div class="team-contact-info">
                            <p><i class="fa fa-phone"></i> 010-020-0120</p>
                            <p><i class="fa fa-envelope-o"></i> <a href="#">general@company.com</a></p>
                        </div>
                        <ul class="social-icon">
                            <li><a href="#" class="fa fa-linkedin-square"></a></li>
                            <li><a href="#" class="fa fa-envelope-o"></a></li>
                        </ul>
                    </div>

                </div>
            </div>

            <div class="col-md-4 col-sm-6">
                <div class="team-thumb wow fadeInUp" data-wow-delay="0.4s">
                    <img src="resource/bootstrap-3.3.2/images/team-image2.jpg" class="img-responsive" alt="">

                    <div class="team-info">
                        <h3>Jason Stewart</h3>
                        <p>Pregnancy</p>
                        <div class="team-contact-info">
                            <p><i class="fa fa-phone"></i> 010-070-0170</p>
                            <p><i class="fa fa-envelope-o"></i> <a href="#">pregnancy@company.com</a></p>
                        </div>
                        <ul class="social-icon">
                            <li><a href="#" class="fa fa-facebook-square"></a></li>
                            <li><a href="#" class="fa fa-envelope-o"></a></li>
                            <li><a href="#" class="fa fa-flickr"></a></li>
                        </ul>
                    </div>

                </div>
            </div>

            <div class="col-md-4 col-sm-6">
                <div class="team-thumb wow fadeInUp" data-wow-delay="0.6s">
                    <img src="resource/bootstrap-3.3.2/images/team-image3.jpg" class="img-responsive" alt="">

                    <div class="team-info">
                        <h3>Miasha Nakahara</h3>
                        <p>Cardiology</p>
                        <div class="team-contact-info">
                            <p><i class="fa fa-phone"></i> 010-040-0140</p>
                            <p><i class="fa fa-envelope-o"></i> <a href="#">cardio@company.com</a></p>
                        </div>
                        <ul class="social-icon">
                            <li><a href="#" class="fa fa-twitter"></a></li>
                            <li><a href="#" class="fa fa-envelope-o"></a></li>
                        </ul>
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
                    <h2>Latest News</h2>
                </div>
            </div>

            <div class="col-md-4 col-sm-6">
                <!-- NEWS THUMB -->
                <div class="news-thumb wow fadeInUp" data-wow-delay="0.4s">
                    <a href="news-detail.html">
                        <img src="resource/bootstrap-3.3.2/images/news-image1.jpg" class="img-responsive" alt="">
                    </a>
                    <div class="news-info">
                        <span>March 08, 2018</span>
                        <h3><a href="news-detail.html">About Amazing Technology</a></h3>
                        <p>Maecenas risus neque, placerat volutpat tempor ut, vehicula et felis.</p>
                        <div class="author">
                            <img src="resource/bootstrap-3.3.2/images/author-image.jpg" class="img-responsive" alt="">
                            <div class="author-info">
                                <h5>Jeremie Carlson</h5>
                                <p>CEO / Founder</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-sm-6">
                <!-- NEWS THUMB -->
                <div class="news-thumb wow fadeInUp" data-wow-delay="0.6s">
                    <a href="news-detail.html">
                        <img src="resource/bootstrap-3.3.2/images/news-image2.jpg" class="img-responsive" alt="">
                    </a>
                    <div class="news-info">
                        <span>February 20, 2018</span>
                        <h3><a href="news-detail.html">Introducing a new healing process</a></h3>
                        <p>Fusce vel sem finibus, rhoncus massa non, aliquam velit. Nam et est ligula.</p>
                        <div class="author">
                            <img src="resource/bootstrap-3.3.2/images/author-image.jpg" class="img-responsive" alt="">
                            <div class="author-info">
                                <h5>Jason Stewart</h5>
                                <p>General Director</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-sm-6">
                <!-- NEWS THUMB -->
                <div class="news-thumb wow fadeInUp" data-wow-delay="0.8s">
                    <a href="news-detail.html">
                        <img src="resource/bootstrap-3.3.2/images/news-image3.jpg" class="img-responsive" alt="">
                    </a>
                    <div class="news-info">
                        <span>January 27, 2018</span>
                        <h3><a href="news-detail.html">Review Annual Medical Research</a></h3>
                        <p>Vivamus non nulla semper diam cursus maximus. Pellentesque dignissim.</p>
                        <div class="author">
                            <img src="resource/bootstrap-3.3.2/images/author-image.jpg" class="img-responsive" alt="">
                            <div class="author-info">
                                <h5>Andrio Abero</h5>
                                <p>Online Advertising</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>


<!-- MAKE AN APPOINTMENT -->
<section id="appointment" data-stellar-background-ratio="3">
    <div class="container">
        <div class="row">

            <div class="col-md-6 col-sm-6">
                <img src="resource/bootstrap-3.3.2/images/appointment-image.jpg" class="img-responsive" alt="">
            </div>

            <div class="col-md-6 col-sm-6">
                <!-- CONTACT FORM HERE -->
                <form id="appointment-form" role="form" method="post" action="#">

                    <!-- SECTION TITLE -->
                    <div class="section-title wow fadeInUp" data-wow-delay="0.4s">
                        <h2>Make an appointment</h2>
                    </div>

                    <div class="wow fadeInUp" data-wow-delay="0.8s">
                        <div class="col-md-6 col-sm-6">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Full Name">
                        </div>

                        <div class="col-md-6 col-sm-6">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Your Email">
                        </div>

                        <div class="col-md-6 col-sm-6">
                            <label for="date">Select Date</label>
                            <input type="date" name="date" value="" class="form-control">
                        </div>

                        <div class="col-md-6 col-sm-6">
                            <label for="select">Select Department</label>
                            <select class="form-control">
                                <option>General Health</option>
                                <option>Cardiology</option>
                                <option>Dental</option>
                                <option>Medical Research</option>
                            </select>
                        </div>

                        <div class="col-md-12 col-sm-12">
                            <label for="telephone">Phone Number</label>
                            <input type="tel" class="form-control" id="phone" name="phone" placeholder="Phone">
                            <label for="Message">Additional Message</label>
                            <textarea class="form-control" rows="5" id="message" name="message" placeholder="Message"></textarea>
                            <button type="submit" class="form-control" id="cf-submit" name="submit">Submit Button</button>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</section>

<%--TEST--%>
<section>
    <div class="container-full">
        <div class="content-header">
            <div class="d-flex align-items-center">
                <div class="me-auto">
                    <h3 class="page-title"><a href="/main/main">관리자 페이지</a></h3>
                    <div class="d-inline-block align-items-center">
                        <nav>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/admin/list"><i class="mdi mdi-home-outline"></i></a></li>
                            </ol>
                        </nav>
                    </div>
                </div>

            </div>
        </div>
        <section class="content">
            <div class="row">
                <div class="col-lg-6 col-12">
                    <!-- <div class="box scrollDiv" style="overflow:auto; overflow-y:scroll; max-height:708px;"> -->
                    <div class="box">
                        <div class="box-header with-border">
                            <h2 class="box-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><a href="/admin/list">직원 정보</a></font></font></h2>
                            <div class="box-controls pull-right">
                                <div class="input-group">
                                    <!-- 검색부분 ///////////////////////////////////////////////////////////////////////-->
                                    <input type="text" class="form-control" name="s" id="search">
                                    <button type="button" id="btnSearch" class="waves-effect waves-light btn btn-social-icon btn-foursquare"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div>

                        <!-- /.box-header -->
                        <!-- <div class="box-body no-padding"> -->
                        <div class="box-body no-padding scrollDiv" style="overflow:auto;overflow-y:scroll;max-height:708px;">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <!-- <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">순번</font></font></th> -->
                                        <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">사번</font></font></th>
                                        <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">직책</font></font></th>
                                        <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이름</font></font></th>
                                        <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">주민번호</font></font></th>
                                        <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">입사일</font></font></th>
                                        <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">승인여부</font></font></th>
                                    </tr>
                                    </thead>
                                    <tbody id="update">
                                    <c:forEach items="${emplist}" var="emp">
                                        <tr>
                                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${emp.empNo}</font></font></td>
                                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${emp.jobGubun}</font></font></td>
                                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${emp.empName}</font></font></td>
                                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${emp.empReg}</font></font></td>
                                            <td><span class="text-muted"><i class="fa fa-clock-o"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> <fmt:formatDate value='${emp.empIn}' pattern='yyyy-MM-dd'/></font></font></span></td>
                                            <c:if test="${emp.empEnabled == 'N'}">
                                                <td><button type="button" name="${emp.empNo}" id="${emp.empNo}" class="sunju waves-effect waves-circle btn btn-circle btn-danger btn-xs mb-5">${emp.empEnabled}</button></td>
                                            </c:if>
                                            <c:if test="${emp.empEnabled == 'Y'}">
                                                <td><button type="button" name="${emp.empNo}" id="${emp.empNo}" class="sunju waves-effect waves-circle btn btn-circle btn-info btn-xs mb-5">${emp.empEnabled}</button></td>
                                            </c:if>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- 직원상세 시작 ---------------------------------------------------------------------------------------------------->
                <div class="col-lg-6 col-12">
                    <div class="box box-body px-35 scrollDiv" style="overflow:auto;overflow-y:scroll;max-height:708px;">
                        <form action="admin/detail" method="get">
                            <div>
                                <h4 class="fw-500 text-primary-light bb-2 pb-10 m-0">직원 상세정보</h4>
                            </div>
                            <div class="d-flex justify-content-between align-items-center py-15 box-body form-element">
                                <p class="m-0  fw-600 text-fade">이름</p>
                                <div class="col-sm-4">
                                    <input type="hidden" class="form-control">
                                </div>
                                <div style="width:18%;">
                                    <input type="text" class="form-control rounded-0" id="name" readonly>
                                </div>
                            </div>

                            <div class="d-flex justify-content-between align-items-center py-15 box-body form-element">
                                <p class="m-0  fw-600 text-fade">사번</p>
                                <div class="col-sm-4">
                                    <input type="hidden" class="form-control">
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="jcd" class="form-control" id="jobCd" readonly>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center py-15 box-body form-element"><!-- box-body form-element 네모박스 없에는 class안에 넣어주면 border생김 -->
                                <p class="m-0  fw-600 text-fade">직책</p>
                                <div class="col-sm-4">
                                    <input type="hidden" class="form-control">
                                </div>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="Gubun" readonly>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center py-15 box-body form-element">
                                <p class="m-0  fw-600 text-fade">주민번호</p>
                                <div class="col-sm-4">
                                    <input type="hidden" class="form-control">
                                </div>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="reg" readonly>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center py-15 box-body form-element">
                                <p class="m-0  fw-600 text-fade">핸드폰번호</p>
                                <div class="col-sm-4">
                                    <input type="hidden" class="form-control">
                                </div>
                                <div style="width:25%;">
                                    <input type="text" class="form-control rounded-0" id="phon"  oninput="phNumder(this)" maxlength="13" readonly>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center py-15 box-body form-element">
                                <p class="m-0  fw-600 text-fade">주소</p>
                                <div style="width:60%;">
                                    <input type="text" class="form-control rounded-0" id="add" readonly>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center py-15 box-body form-element">
                                <p class="m-0  fw-600 text-fade">이메일</p>
                                <div style="width:35%;">
                                    <input type="text" class="form-control rounded-0" id="mail" readonly>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center py-15 box-body form-element">
                                <p class="m-0  fw-600 text-fade">비밀번호</p>
                                <div class="col-sm-4">
                                    <input type="hidden" class="form-control">
                                </div>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="pass" readonly>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center py-15 box-body form-element">
                                <p class="m-0  fw-600 text-fade">입사일</p>
                                <div class="col-sm-4">
                                    <input type="hidden" class="form-control">
                                </div>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="in" readonly>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center py-15 box-body form-element">
                                <p class="m-0  fw-600 text-fade">퇴사일</p>
                                <div class="col-sm-4">
                                    <input type="hidden" class="form-control">
                                </div>
                                <div class="col-sm-1">
                                    <input type="text" class="form-control" id="out" readonly>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center py-15 box-body form-element">
                                <p class="m-0  fw-600 text-fade">승인여부</p>
                                <div class="col-sm-4">
                                    <input type="hidden" class="form-control">
                                </div>
                                <div class="col-sm-1">
                                    <input type="text" class="form-control" id="enabled" readonly>
                                </div>
                            </div>
                            <!-- 직원상세 끝 ----------------------------------------------------------------------------------------------------->
                            <div id="spn1" style="float: right">
                                <button type="button" id="en" onclick="$('.send').trigger('click');" class="waves-effect waves-light btn btn-success-light mt-20 mb-5" disabled>승인</button>
                            </div>
                        </form>
                    </div><!-- /.box -->
                </div><!-- /.col -->
            </div><!-- section밑에 <div class="row"> -->
        </section>
    </div><!-- title container-full 끝 -->

    <!-- 이메일 보내는 form -->
    <form action="/admin/send.do" method="post" id="formId" > <!-- post방식으로 자료를 컨트롤러로 보냄 -->
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <input type="hidden" name="senderName" placeholder="발신자 이름"  value="메디케어"><br>
        <input type="hidden" name="senderMail" placeholder="발신자 이메일"  value="zndntjswn24@naver.com"><br>
        <input type="hidden" class="sun" name="receiveMail" value="수신자">
        <!-- <input type="hidden" id="sun" name="receiveMail" placeholder="수신자 이메일"><br> -->
        <input type="hidden" name="subject" placeholder="제목" value="메디케어 프로그램 초기 비밀번호"><br>
        <!-- <input type="hidden" name="message" placeholder="내용" value="메디케어 입사를 축하드립니다. 병원내 시스템을 이용하기 위한 회원가입 승인이 되었습니다.  초기 비밀번호는   0000   이며 비밀번호는 변경후 사용 하시기 바랍니다."> -->
        <textarea id="message" name="message" style="display: none; font-size: 20px;">
	메디케어 입사를 축하드립니다. 병원내 시스템을 이용하기 위한 회원가입 승인이 되었습니다.

	귀하의 아이디는

	</textarea>
        <input type="submit" class="send" style='display:none;'>
    </form>
    <!-- <span style="color:red;">${message}</span> -->

    <script type="text/javascript">
        let pass = "";

        const sunjuForm=$("#formId")[0];

        sunjuForm.onsubmit = function(){
            event.preventDefault();

            let email = $("#mail").val();//이메일 정상
            let sss = $(".sun").val(email);//객체로 들어감
            let pass = $("#pass").val();
            let empNo = $("#jobCd").val();

            let text = $("#message").val();
            let a ="";
            a += "아이디(사번)은   " + empNo +"  " + "입니다."
            a += "     귀하의 초기 비밀번호는   " + pass +"  " + "입니다."+"    "
            a += "비밀번호는 변경후 사용 하시기 바랍니다.";

            console.log("이메일 확인" + a);

            var tName = document.getElementsByName("message").item(0);
            var aText = document.createTextNode(a);
            tName.appendChild(aText);


            //let ck = $(".sun").val([sss.get(0).value]);//비정상
            console.log("확인:",email);//정상
            console.log("마지막확인:",sss.get(0).value);//정상
            //console.log("보내기:",ck);//객체
            //alert(ck.get(0).value);//정상

            $('input[name=receiveMail]').attr('value',email);
            let qqq = $(".sun").val();
            console.log(qqq);


            alert("회원가입 승인이 완료 되었습니다.");
            sunjuForm.submit();
        }

        $("#en").on('click',function(){
            update();
        });

        //전화번호 하이픈(-)자동 생성
        const phNumder = (target) => {
            target.value = target.value.replace(/[^0-9]/g, '')//숫자 아닌거는 공백으로 바꿔라
                .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3");
        }
    </script>

    <script type="text/javascript">
        let header = "${_csrf.headerName}";
        let token  = "${_csrf.token}";

        $(".sunju").on("click",function(){
            console.log("check",event.currentTarget.id);
            adminDetail(event.currentTarget.id);
        });

        //날짜 생성 함수
        function fn_getInsertDate(geta){
            let dt = new Date(geta);
            let dtYY = dt.getFullYear();
            let dtMM = dt.getMonth()+1;
            let dtDD = dt.getDate();
            let dtResult = dtYY + "-" + (dtMM < 10 ? "0" + dtMM : dtMM) + "-" + (dtDD < 10 ? "0" + dtDD : dtDD);

            return dtResult;
        }

        function adminDetail(pNo) {
            $.ajax({
                method:"get",
                url:"/admin/detail",
                data: {
                    empNo:pNo
                },
                beforeSend:function(xhr){
                    xhr.setRequestHeader(header,token);
                },
                success:function(data){
                    console.log(data);
                    var empName = data.empName;
                    var jobcd = data.empNo;
                    var job = data.jobGubun;
                    var empReg = data.empReg;
                    var empPh = data.empPh;
                    var add1 = data.empAdd1;
                    var add2 = data.empAdd2;
                    var add3 = data.empExadd;
                    var empMail = data.empMail;
                    var empPw = data.empPw;
                    var empIn = fn_getInsertDate(data.empIn);
                    var empOut = data.empOut;
                    var empEnabled = data.empEnabled;
                    $('#name').val(empName);
                    $('#jobCd').val(jobcd);
                    $('#Gubun').val(job);
                    $('#reg').val(empReg);
                    $('#phon').val(empPh);
                    if(add3 == null){
                        add3 = "";
                    }
                    if(add1 == null){
                        add1 = " ";
                    }
                    if(add2 == null){
                        add2 = " ";
                    }
                    $('#add').val(add1 + " " + add2 + " " + add3);
                    $('#mail').val(empMail);
                    $('#pass').val(empPw);
                    $('#in').val(empIn);
                    $('#enabled').val(empEnabled);
                    if(empOut == null){
                        $('#out').val("N");
                    }else {
                        $('#out').val("Y");
                    }
                    if(empEnabled == "N"){
                        $("#en").removeAttr("disabled");
                    }else {
                        $("#en").attr("disabled",true);
                    }
                }
            });
        }
        //승인여부 N에서 Y로 변경
        function update(){
            let empNo=$("#jobCd").val();
            let data={"empNo":empNo};
            $.ajax({
                type:"post",
                url:"/admin/update",
                data: JSON.stringify(data),
                contentType:"application/json;charset=utf-8",
                dataType:"json",
                beforeSend:function(xhr){
                    xhr.setRequestHeader(header,token);
                },
                success:function(data){
                    console.log(data);
                    alert("회원가입 승인이 완료 되었습니다.");
                }
            });
        }

        //$('#search').on('keyup',function(e){
        //	if(e.keyCode === 13){
        //		$('#btnSearch').trigger('click');
        //	}
        //});

        $("#btnSearch").on("click",function(){
            $('#update').empty();
            let str = $("#search").val();

            let data = {"empName":str, "jobGubun":str}
            //console.log("data값 확인 : " + JSON.stringify(data));

            $.ajax({
                url:"/admin/adminSearch",
                type:"post",
                data:JSON.stringify(data),
                dataType:"json",
                contentType:"application/json;charset=utf-8",
                beforeSend:function(xhr){
                    xhr.setRequestHeader(header,token);
                },
                success:function(result){
                    console.log('ggg');
                    //console.log("success확인 : " + JSON.stringify(result));

                    $.each(result,function(index,item){
                        let content = "";
                        content += '<tr>';
                        content += '<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">'+ item.empNo +'</font></font></td>';
                        content += '<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">'+ item.jobGubun +'</font></font></td>';
                        content += '<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">'+ item.empName +'</font></font></td>';
                        content += '<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">'+ item.empReg +'</font></font></td>';
                        content += '<td><span class="text-muted"><i class="fa fa-clock-o"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">'+ fn_Date(item.empIn) +'</font></font></span></td>';
                        if(item.empEnabled == 'N'){
                            content += '<td><button type="button" name="${emp.empNo}" id="${emp.empNo}" class="sunju waves-effect waves-circle btn btn-circle btn-danger btn-xs mb-5">'+ item.empEnabled +'</button></td>';
                        }else{
                            content += '<td><button type="button" name="${emp.empNo}" id="${emp.empNo}" class="sunju waves-effect waves-circle btn btn-circle btn-info btn-xs mb-5">'+ item.empEnabled +'</button></td>';
                        }

                        content += '</tr>';

                        $("#update").append(content);
                    })
                }
            });
        });
        //날짜 나오는 함수
        function fn_Date(date){
            let dt = new Date(date);
            let dtYY = dt.getFullYear();
            let dtMM = dt.getMonth() + 1;
            if(dtMM < 10 ){dtMM = "0" + dtMM;}
            let dtDD = dt.getDate();
            if(dtDD < 10 ){dtDD = "0" + dtDD;}

            let dtResult = dtYY + "-" + dtMM + "-" + dtDD
            console.log("Date : " + dtResult);
            return dtResult;
        }
    </script>




</section>






<%@include file="/WEB-INF/inc/footer.jsp" %>
<!-- SCRIPTS -->
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