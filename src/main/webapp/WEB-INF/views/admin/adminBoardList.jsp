<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>

<div class="container">
    <!-- START : 검색 폼  -->
    <div class="panel panel-default">
        <div class="panel-body">
            <form name="search" action="adminBoardList.wow" method="post" class="form-horizontal">
                <sec:csrfInput/>
                <input type="hidden" name="curPage" value="${paging.curPage}">
                <input type="hidden" name="rowSizePerPage" value="${paging.rowSizePerPage}">
                <div class="form-group">
                    <label for="id_searchType" class="col-sm-2 control-label">검색</label>
                    <div class="col-sm-2">
                        <select id="id_searchType" name="searchType" class="form-control input-sm">
                            <option value="T" ${search.searchType=='T' ? "selected = 'selected'" : ""}>제목</option>
                            <option value="W" ${search.searchType=='W' ? "selected = 'selected'" : ""}>작성자</option>
                            <option value="C" ${search.searchType=='C' ? "selected = 'selected'" : ""}>내용</option>
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <input type="text" name="searchWord" class="form-control input-sm" value="${search.searchWord}"
                               placeholder="검색어">
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
                    <option value="${i}" ${paging.rowSizePerPage eq i ? "selected = 'selected'" : ""} >${i}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <!-- END : 목록건수 및 새글쓰기 버튼  -->


    <div class="page-header">
        <h3>관리자게시판 - <small>글 목록</small></h3>
    </div>
    <div class="row">
        <div class="col-sm-2 col-sm-offset-10 text-right" style="margin-bottom: 5px;">
            <a href="adminBoardForm.wow" class="btn btn-primary btn-sm">
                <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
                &nbsp;새글쓰기
            </a>
        </div>
    </div>
    <table class="table table-striped table-bordered table-hover">
        <colgroup>
            <col width="10%"/>
            <col width="60"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="10%"/>
        </colgroup>
        <thead>
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>등록일</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="adminBoard" items="${adminBoardList}">
            <tr class="text-center">
                <td>${adminBoard.boNo}</td>
                <td class="text-left">
                    <a href="adminBoardView.wow?boNo=${adminBoard.boNo}">
                            ${adminBoard.boTitle}
                    </a>
                </td>
                <td>${adminBoard.boWriter}</td>
                <td>${adminBoard.boRegDate}</td>
                <td>${adminBoard.boHit}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


    <!-- 페이지네이션 시작 -->
    <nav class="text-center">
        <ul class="pagination">
            <!-- 첫 페이지 -->
            <li><a href="adminBoardList.wow?curPage=1" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>

            <!-- 이전 페이지 -->
            <c:if test="${paging.curPage > 1}">
                <li><a href="adminBoardList.wow?curPage=${paging.curPage - 1}" data-page="${paging.curPage - 1}"><span
                        aria-hidden="true">&lt;</span></a></li>
            </c:if>

            <!-- 페이지 넘버링 -->
            <c:forEach var="i" begin="${paging.firstPage}" end="${paging.lastPage}">
                <c:set var="click" value="${paging.curPage eq i ? 'active' : ''}"/>
                <li class="${click}"><a href="adminBoardList.wow?curPage=${i}" data-page="${i}">${i}</a></li>
            </c:forEach>

            <!-- 다음 페이지 -->
            <c:if test="${paging.curPage < paging.totalPageCount}">
                <li><a href="adminBoardList.wow?curPage=${paging.curPage+1}" data-page="${paging.curPage+1}"><span
                        aria-hidden="true">&gt;</span></a></li>
            </c:if>

            <!-- 마지막 페이지 -->
            <li><a href="adminBoardList.wow?curPage=${paging.totalPageCount}" data-page="${paging.totalPageCount}"><span
                    aria-hidden="true">&raquo;</span></a></li>
        </ul>
    </nav>
    <!-- 페이지네이션 끝 -->

    <a href="/excel/adminBoardList.wow" class="btn btn-default btn-sm" target="_blank" id="excelDown"> excelDown</a>

</div><!-- container -->

<%@include file="/WEB-INF/inc/footer.jsp" %>
<!-- SCRIPTS -->

<script>

    let firstHref = $(this).attr("href");

    $("#excelDown").on("click", function (e) {
        $(this).attr("href", firstHref);
        let data = $("form[name='search']").serialize();  // searchType=aaa & searchWord=aaa
        let href = $(this).attr("href");
        $(this).attr("href", href + "?" + data);
    });

</script>


<script type="text/javascript">
    // 변수 정의
    $form = $("form[name='search']");
    $curPage = $form.find("input[name='curPage']");


    // 각 이벤트 등록
    // 페이지 링크 클릭, event전파방지, data속성값읽고 form태그 내의 input name=curPage값 바꾸기
    //submit
    $('ul.pagination li a[data-page]').click(function (e) {
        e.preventDefault();
        let curPage = $(this).data('page');
        $curPage.val(curPage);
        $form.submit();

    }); // ul.pagination li a[data-page]


    //form태그내의 버튼 클릭
    //이벤트전파방지, curPage 값 1로
    //submit
    $form.find("button[type=submit]").click(function (e) {
        e.preventDefault();
        $curPage.val(1);
        $form.submit();
    });


    // 목록 갯수 변경
    // id_rowSizePerPage 변경되었을 때
    // 페이지 1, 목록수 = 현재값 으로 변경 후 서브밋
    $('#id_rowSizePerPage').change(function (e) {
        $curPage.val(1)
        $form.find("input[name='rowSizePerPage']").val($(this).val())
        $form.submit()

    }); // '#id_rowSizePerPage'.change

    // 초기화 버튼 클릭
    $('#id_btn_reset').click(function () {
        $("#id_searchType option:eq(0)").prop("selected", "selected");
        $form.find("input[name='searchWord']").val("")
        $("#id_searchCategory option:eq(0)").prop("selected", "selected");


    }); // #id_btn_reset.click

</script>

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