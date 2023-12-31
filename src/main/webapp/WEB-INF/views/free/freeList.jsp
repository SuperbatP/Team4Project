<%@page import="java.util.ArrayList" %>
<%@page import="com.PhoenixHospital.free.vo.FreeBoardVO" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/inc/navi.jsp" %>


<div class="container">

    <!-- START : 검색 폼  -->
    <div class="panel panel-default">
        <div class="panel-body">
            <form name="search" action="freeList.wow" method="post" class="form-horizontal">
                <sec:csrfInput/>
                <input type="hidden" name="curPage" value="${freeBoardVO.curPage}"> <input type="hidden" name="rowSizePerPage" value="${freeBoardVO.rowSizePerPage}">
                <div class="form-group">
                    <label for="id_searchType" class="col-sm-2 control-label" >검색</label>
                    <div class="col-sm-2">
                        <select id="id_searchType" name="searchType" class="form-control input-sm">
                            <option value="T" ${freeBoardVO.searchType=='T' ? "selected='selected'" : ""} >제목</option>
                            <option value="W" ${freeBoardVO.searchType=='W' ? "selected='selected'" : ""} >작성자</option>
                            <option value="C" ${freeBoardVO.searchType=='C' ? "selected='selected'" : ""} >내용</option>
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <input type="text" name="searchWord" class="form-control input-sm" value="${freeBoardVO.searchWord}" placeholder="검색어"
                               onkeyup="characterCheck(this)" onkeydown="characterCheck(this)">
                    </div>
                    <label for="id_searchCategory" class="col-sm-2 col-sm-offset-2 control-label">분류</label>
                    <div class="col-sm-2">
                        <select id="id_searchCategory" name="searchCategory" class="form-control input-sm">
                            <option value="">-- 전체 --</option>
                            <%--                            <c:forEach items="${cateList}" var="code">--%>
                            <%--                                <option value="${code.commCd}" ${searchCategory eq code.commCd ? "selected='selected'":""} >${code.commNm}</option>--%>
                            <%--                            </c:forEach>--%>
                        </select>
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
            전체 50건 조회
            <select id="id_rowSizePerPage" name="rowSizePerPage" class="form-control input-sm">
                <c:forEach var="i" begin="10" end="50" step="10">
                    <option value="${i}" ${freeBoardVO.rowSizePerPage eq i ? "selected='selected'" : ""} >${i}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <!-- END : 목록건수 및 새글쓰기 버튼  -->

    <div class="page-header">
        <h3>민원게시판 - <small>글 목록</small></h3>
    </div>
    <div class="row">
        <div class="col-sm-2 col-sm-offset-10 text-right" style="margin-bottom: 5px;">
            <a href="freeForm.wow" class="btn btn-primary btn-sm">
                <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
                &nbsp;새글쓰기
            </a>

        </div>
    </div>
    <table class="table table-striped table-bordered table-hover">
        <colgroup>
            <col width="10%"/>
            <col/>
            <col width="10%"/>
            <col width="15%"/>
            <col width="10%"/>
        </colgroup>
        <thead>
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자ID</th>
            <th>등록일</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${freeBoardList }" var="freeBoard">
            <tr class="text-center">
                <td>${freeBoard.boNo }</td>
                <td class="text-left">
                    <a href="freeView.wow?boNo= ${freeBoard.boNo }">
                            ${freeBoard.boTitle }
                    </a>
                </td>
                <td>${freeBoard.boWriter }</td>
                <td>${freeBoard.boRegDate }</td>
                <td>${freeBoard.boHit }</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>



    <!-- START : 페이지네이션  -->
    <nav class="text-center">
        <ul class="pagination">

            <!-- 첫 페이지  -->
            <li><a href="freeList.wow?curPage=1" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>

            <!-- 이전 페이지 -->
            <c:if test="${freeBoardVO.firstPage>1}">
                <li><a href="freeList.wow?curPage=${freeBoardVO.curPage-1}" data-page=""><span aria-hidden="true">&lt;</span></a></li>
            </c:if>

            <!-- 페이지 넘버링  -->
            <%--a태그의 기본동작이 아니라 form태그의 검색 파라미터 + curPage가 같이 넘어가게 ->e.preventDefault()--%>
            <c:forEach var="i" begin="${freeBoardVO.firstPage}" end="${freeBoardVO.lastPage}">
                <li>
                <c:choose>
                    <c:when test="${freeBoardVO.curPage == i}">
                        <li class="active"><a href="#">${i}</a></li>
                    </c:when>
                    <c:otherwise>
                        <a href="freeList.wow?curPage=${i}" data-page="${i}">${i}</a>
                    </c:otherwise>
                </c:choose>
                </li>

            </c:forEach>
            <!-- 다음  페이지  -->
            <c:if test="${freeBoardVO.lastPage < freeBoardVO.totalPageCount}">
                <li><a href="freeList.wow?curPage=${freeBoardVO.lastPage+1}" data-page="${freeBoardVO.lastPage+1}"><span aria-hidden="true">&gt;</span></a></li>
            </c:if>

            <!-- 마지막 페이지 -->
            <li><a href="freeList.wow?curPage=${freeBoardVO.totalPageCount}" data-page="${freeBoardVO.totalPageCount}"><span aria-hidden="true">&raquo;</span></a></li>
        </ul>
    </nav>
    <!-- END : 페이지네이션  -->


</div><!-- container -->
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
        $("#id_searchCategory option:eq(0)").prop("selected", "selected");

    }); // #id_btn_reset.click

    function characterCheck(obj){
        var regExp = /[\{\}\[\];:|\)*~`^\-_+┼<>@\#$%&\'\"\\\(\=]/gi

// 허용할 특수문자는 여기서 삭제하면 됨
// 지금은 띄어쓰기도 특수문자 처리됨 참고하셈
        if( regExp.test(obj.value) ){
            alert("특수문자는 입력하실수 없습니다.");
            obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
        }
    }

    window.onpageshow = function(event){
        if(event.persisted || (window.performance && window.performance.navigation.type == 2)){
            service.onLoadPage();
        }
    }


</script>
<%@include file="/WEB-INF/inc/footer.jsp" %>
</html>






