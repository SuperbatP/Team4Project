<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <script src="/resource/bootstrap/js/summernote/summernote-lite.js"></script>
    <script src="/resource/bootstrap/js/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="/resource/bootstrap/css/summernote/summernote-lite.css">
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>
<div class="container">
    <div class="page-header">
        <h3>자유게시판 - <small>글 등록</small></h3>
    </div>
    <form action="adminBoardRegist.wow" method="post" enctype="multipart/form-data">
        <sec:csrfInput/>
        <input type="hidden" type="text" name="boWriter" value="<sec:authentication property="principal.username"/>">
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
                <th>내용</th>
                <td>
                    <textarea style="min-height: 400px;" id="summernote" name="boContents" class="form-control"></textarea>
                </td>
            </tr>

            <tr>
                <th>첨부파일
                    <button type="button" id="id_btn_new_file">추가</button>
                </th>
                <td class="file_area">
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
            + ' <button type="button" class="btn_delete btn btn-sm">삭제</button>'
            + '</div>');
    });

    $('.file_area').on('click', '.btn_delete', function () {
        $(this).closest('div').remove();
    });

    $('#summernote').summernote({
        lang: "ko-KR",
        height: 350,
        placeholder: '내용을 작성하세요.',
        callbacks: {
            onImageUpload: function (image) {

                var file = image[0];
                var reader = new FileReader();
                reader.onloadend = function () {
                    var image = $('<img>').attr('src', reader.result);
                    image.attr('height', '350px');
                    $('#summernote').summernote("insertNode", image[0]);
                }
                reader.readAsDataURL(file);

            }
        }
    });

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