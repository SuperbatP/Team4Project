<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>
<div class="container">
    <div class="page-header">
        <h3>자유게시판 - <small>글 등록</small></h3>
    </div>
    <form action="adminBoardRegist.wow" method="post" enctype="multipart/form-data">
        <sec:csrfInput/>
        <table class="table table-striped table-bordered">
            <colgroup>
                <col width="20%"/>
                <col/>
            </colgroup>
            <tr>
                <th>제목</th>
                <td><input type="text" name="boTitle" value="" class="form-control input-sm" required="required"></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><input type="text" name="boWriter" value="" class="form-control input-sm" required="required"></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="boPass" value="" class="form-control input-sm"
                           required="required" pattern="\w{4,}" title="알파벳과 숫자로 4글자 이상 입력">
                    <span class="text-danger">
            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
            수정 또는 삭제시에 필요합니다.
          </span>
                </td>
            </tr>
            <tr>
                <th>분류</th>
                <td>
                    <select name="categoryCode" class="form-control input-sm" required="required">
                        <option value="">-- 선택하세요--</option>
                        <c:forEach items="${categoryList}" var="categoryList">
                            <option value="${categoryList.categoryCode}">${categoryList.category}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <th>내용</th>
                <td><textarea rows="10" name="boContents" class="form-control"></textarea>
                </td>
            </tr>

            <tr>
                <th>첨부파일
                    <button type="button" id="id_btn_new_file">추가</button>
                </th>
                <td class="file_area">
                    <c:forEach var="f" items="${adminBoard.attaches}" varStatus="st">
                        <div>
                            # 파일 ${st.count} <a href="<c:url value='/attach/download/${f.atchNo}' />" target="_blank"> <span class="glyphicon glyphicon-save" aria-hidden="true"></span> ${f.atchOriginalName}
                                <%-- c:url value='/attach/download/${f.atchNo} :다운로드 할 때 필요한 경로	--%>
                        </a> Size : ${f.atchFancySize} Down : ${f.atchDownHit}
                            <button class="btn_file_delete" data-atch-no="${f.atchNo}">
                                    <%-- data-atch-no 특정 첨부파일의 삭제할 때 사용하는 값.	--%>
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                            </button>
                        </div>
                    </c:forEach>
                    <div class="form-inline">
                        <input type="file" name="boFiles" class="form-control">
                        <button type="button" class="btn_delete btn btn-sm">삭제</button>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="pull-left">
                        <a href="adminBoardList.jsp" class="btn btn-default btn-sm">
                            <span class="glyphicon glyphicon-list" aria-hidden="true"></span>
                            &nbsp;&nbsp;목록
                        </a>
                    </div>
                    <div class="pull-right">
                        <button type="submit" class="btn btn-sm btn-primary">
                            <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                            &nbsp;&nbsp;저장
                        </button>
                    </div>
                </td>
            </tr>
        </table>
    </form>

</div><!-- container -->

<%@include file="/WEB-INF/inc/footer.jsp" %>
<!-- SCRIPTS -->

<script>
    $('#id_btn_new_file').click(function () {
        $('.file_area').append('<div class="form-inline">'
            + '<input type="file" name="boFiles" class="form-control">'
            + ' <button type="button" class="btn_delete btn btn-sm">삭제</button>' + '</div>');
    });

    $('.file_area').on('click', '.btn_delete', function () {
        $(this).closest('div').remove();
    });
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