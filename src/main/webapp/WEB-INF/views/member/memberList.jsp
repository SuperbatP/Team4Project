<%@page import="com.PhoenixHospital.member.vo.MemberVO" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@ page import="com.PhoenixHospital.member.service.IMemberService" %>
<%@ page import="com.PhoenixHospital.member.service.MemberServiceImpl" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/inc/navi.jsp" %>



<div class="container">
    <!-- START : 검색 폼  -->
    <div class="panel panel-default collapse in" id="id_search_area">
        <div class="panel-body">
            <form name="search" action="memberList.wow" method="post" class="form-horizontal">
                <input type="hidden" name="curPage" value="${paging.curPage}"> <input type="hidden" name="rowSizePerPage" value="${paging.rowSizePerPage}">
                <div class="form-group">
                    <label for="id_searchType" class="col-sm-2 control-label">검색</label>
                    <div class="col-sm-2">
                        <select id="id_searchType" name="searchType" class="form-control input-sm">
                            <option value="NM" ${search.searchType=='NM' ? "selected='selected'" : ""}>이름</option>
                            <option value="ID" ${search.searchType=='ID' ? "selected='selected'" : ""}>아이디</option>
                            <option value="HP" ${search.searchType=='HP' ? "selected='selected'" : ""}>핸드폰번호</option>
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <input type="text" name="searchWord" class="form-control input-sm" value="${search.searchWord}" placeholder="검색어">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2 col-sm-offset-9 text-right">
                        <button type="button" id="id_btn_reset" class="btn btn-sm btn-default">
                            <i class="fa fa-sync"></i> &nbsp;&nbsp;초기화
                        </button>
                    </div>
                    <div class="col-sm-1 text-right">
                        <button type="submit" class="btn btn-sm btn-primary ">
                            <i class="fa fa-search"></i> &nbsp;&nbsp;검 색
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- END : 검색 폼  -->


    <!-- START : 목록건수 및 새글쓰기 버튼  -->
    <div class="row" style="margin-bottom: 10px;">
        <div class="col-sm-3 form-inline">
            전체 1000건 조회
            <select id="id_rowSizePerPage" name="rowSizePerPage" class="form-control input-sm">
                <c:forEach var="i" begin="10" end="50" step="10">
                    <option value="${i}" ${paging.rowSizePerPage eq i ? "selected='selected'" : ""} >${i}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <!-- END : 목록건수 및 새글쓰기 버튼  -->




    <h3>회원목록</h3>
    <div>
        <a href="memberForm.wow" class="btn btn-primary btn-sm pull-right">회원 등록</a>
        <a href="/excel/MemberList.wow"  class="btn btn-primary btn-sm" target="_blank"  id="excelDown">excelDown</a>
    </div>
    <table class="table table-striped table-bordered">
        <caption class="hidden">회원목록 조회</caption>
        <colgroup>
            <col style="width: 15%"/>
            <col/>
            <col style="width: 20%"/>
            <col style="width: 20%"/>
            <col style="width: 15%"/>
            <col style="width: 15%"/>
        </colgroup>
        <thead>
        <tr>
            <th>ID</th>
            <th>회원명</th>
            <th>HP</th>
            <th>생일</th>
            <th>권한</th>
            <th>탈퇴여부</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${memberList}" var="member">
        <tr>
            <td>${member.memId}</td>
            <td><a href="memberView.wow?memId=${member.memId}">
                    ${member.memName}</a></td>
            <td>${member.memHp}</td>
            <td>${member.memBir}</td>
            <td>${member.memRole}</td>
            <td>${member.memDelYn}</td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <!-- START : 페이지네이션  -->
    <nav class="text-center">
        <ul class="pagination">

            <!-- 첫 페이지  -->
            <li><a href="memberList.wow?curPage=1" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>


            <!-- 이전 페이지 -->
            <c:if test="${paging.firstPage>1}">
                <li><a href="memberList.wow?curPage=" data-page="${paging.firstPage-1}"><span aria-hidden="true">&lt;</span></a></li>
            </c:if>


            <!-- 페이지 넘버링  -->
            <c:forEach var="i" begin="${paging.firstPage}" end="${paging.lastPage}">
                <li>
                <c:choose>
                    <c:when test="${paging.curPage == i}">
                        <li class="active"><a href="#">${i}</a></li>
                    </c:when>
                    <c:otherwise>
                        <a href="memberList.wow?curPage=${i}" data-page="${i}">${i}</a>
                    </c:otherwise>
                </c:choose>
                </li>

            </c:forEach>

            <!-- 다음  페이지  -->
            <c:if test="${paging.lastPage < paging.totalPageCount}">
                <li><a href="memberList.wow?curPage=${paging.lastPage+1}" data-page="${paging.lastPage+1}"><span aria-hidden="true">&gt;</span></a></li>
            </c:if>

            <!-- 마지막 페이지 -->
            <li><a href="memberList.wow?curPage=${paging.totalPageCount}" data-page="${paging.totalPageCount}"><span aria-hidden="true">&raquo;</span></a></li>
        </ul>
    </nav>
    <!-- END : 페이지네이션  -->
</div>

</body>
<script>
    let firstHref = $('#excelDown').attr("href");

    $('#excelDown').on("click", function (e){

        //검색어를 적용한 데이터 다운
        $(this).attr("href",firstHref);
        let data = $("form[name='search']").serialize(); //serialize() : serchType=aaa&searchWord=bbb 로 반환
        $(this).attr("href", firstHref + "?" + data);

        //함수가 먼저 실행된 후 event 실행

    });
</script>

<script type="text/javascript">
    // 변수 정의
    $form=$("form[name='search']");
    $curPage=$form.find("input[name='curPage']");

    // 각 이벤트 등록

    // 페이지 링크 클릭, event전파방지, data속성값 읽고 form태그 내의 input name=curPage값 바꾸기
    //submit
    $('ul.pagination li a[data-page]').click(function(e) {
        //a태그들의 값.
        //이렇게 하면 검색어랑 같이 페이징처리가 됨.
        e.preventDefault();
        let curPage = $(this).data('page');
        //alert(curPage);
        $curPage.val(curPage);
        $form.submit();
    }); // ul.pagination li a[data-page]


    //form태그내의 버튼 클릭
    //이벤트전파방지, curPage 값 1로
    //submit
    $form.find("button[type=submit]").click(function(e) {
        //검색을 누르면 1page로 나오게 하는 것.
        e.preventDefault();
        $curPage.val(1);
        $form.submit();
    });


    // 목록 갯수 변경
    // id_rowSizePerPage 변경되었을 때
    // 페이지 1, 목록수 = 현재값 으로 변경 후 서브밋
    $('#id_rowSizePerPage').change(function(e) {
        $curPage.val(1);
        $form.find("input[name='rowSizePerPage']").val($(this).val());
        $form.submit();
    }); // '#id_rowSizePerPage'.change

    // 초기화 버튼 클릭
    $('#id_btn_reset').click(function() {
        //검색에 있는 초기화 버튼 누르면 선택한 분류와 넣어둔 검색어 날림.


        $("#id_searchType option:eq(0)").prop("selected", "selected");
        $form.find("input[name='searchWord']").val("");
        $("#id_searchJob option:eq(0)").prop("selected", "selected");
        $("#id_searchHobby option:eq(0)").prop("selected", "selected");

    }); // #id_btn_reset.click


</script>
</html>