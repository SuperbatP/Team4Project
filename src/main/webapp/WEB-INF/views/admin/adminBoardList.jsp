<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>관리자게시판</title>
</head>
<div id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
    <%@include file="/WEB-INF/inc/navi.jsp" %>
    <style>
        table {
            width: 1200px;
        }

        tr {
            border-top: 1px solid gainsboro;
            border-bottom: 1px solid gainsboro;
            text-align: center;
            height: 70px;
            color: #333333;
            font-weight: 400;
            font-size: 18px;
        }

        th {
            text-align: center;
            height: 70px;
            border-top: 3px solid gainsboro;
            color: #333333;
            font-weight: 500;
            font-size: 18px;
        }

        .btn-green {
            background-color: #a5c422;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 5px;
            width: 100px;
            height: 45px;
            font-weight: 600;
        }
    </style>

    <div class="container">
        <div style="display: flex; justify-content: center; align-items: center; height: 180px;">
            <h2 style="font-weight: 500; font-size: 33px">관리자게시판</h2>
        </div>

        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 10px; margin-bottom: 10px; width: 1200px;">
            <div style="display: flex">
                <p style="color: #333333; font-size: 16px">총</p>
                <p style="color: #a5c422; font-size: 26px">${paging.totalRowCount}</p>
                <p style="color: #333333; font-size: 16px">개의 게시물이 등록되어 있습니다.</p>
            </div>

            <form name="search" action="adminBoardList.wow" method="post" class="form-horizontal">
                <sec:csrfInput/>
                <input type="hidden" name="curPage" value="${paging.curPage}">
                <input type="hidden" name="rowSizePerPage" value="${paging.rowSizePerPage}">

                <div style="display: flex; margin-bottom: 10px;">
                    <div style="border: 1px solid gainsboro; display: flex; justify-content: space-between">
                    <select style="border: none; font-size: 15px; height: 40px; width: 110px;" id="id_searchType" name="searchType" class="form-control input-sm">
                        <option value="T" ${search.searchType=='T' ? "selected = 'selected'" : ""}>제목</option>
                        <option value="W" ${search.searchType=='W' ? "selected = 'selected'" : ""}>작성자</option>
                        <option value="C" ${search.searchType=='C' ? "selected = 'selected'" : ""}>내용</option>
                    </select>
                    </div>
                    <div style="border: 1px solid gainsboro; display: flex; justify-content: space-between">
                        <input style="border: none; font-size: 15px; height: 40px;" type="text" name="searchWord"
                               class="form-control input-sm" value="${search.searchWord}"
                               placeholder="검색어를 입력하세요.">

                        <button style="border: none; width: 40px" type="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>


        <table>
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
                    <td style="padding-left: 40px" class="text-left">
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
                <li><a href="adminBoardList.wow?curPage=1" data-page="1"><span aria-hidden="true">&laquo;</span></a>
                </li>

                <!-- 이전 페이지 -->
                <c:if test="${paging.curPage > 1}">
                    <li><a href="adminBoardList.wow?curPage=${paging.curPage - 1}"
                           data-page="${paging.curPage - 1}"><span
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
                <li><a href="adminBoardList.wow?curPage=${paging.totalPageCount}"
                       data-page="${paging.totalPageCount}"><span
                        aria-hidden="true">&raquo;</span></a></li>
            </ul>
        </nav>
        <!-- 페이지네이션 끝 -->
        <div style="display: flex; justify-content: end; width: 1200px; margin-top: -10px;">
            <a style="color: white" href="adminBoardForm.wow">
                <div class="btn-green">
                    &nbsp;글쓰기
                </div>
            </a>
        </div>
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