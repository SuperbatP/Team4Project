<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <%@include file="/WEB-INF/inc/header.jsp"%>
  <script src="/resource/bootstrap-3.3.2/js/summernote/summernote-lite.js"></script>
  <script src="/resource/bootstrap-3.3.2/js/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="/resource/bootstrap-3.3.2/css/summernote/summernote-lite.css">
</head>
<body>
<%@ include file="/WEB-INF/inc/navi.jsp"%>
<div class="container">
  <div class="page-header">
    <h3>공지사항 - <small>글 등록</small></h3>
  </div>
  <form action="/notice/noticeInsertForm.wow" method="post" enctype="multipart/form-data">
    <sec:csrfInput/>
    <input type="hidden" type="text" name="boWriter" value="<sec:authentication property="principal.username"/>">
    <table class="table table-striped table-bordered">
      <colgroup>
        <col width="20%" />
        <col/>
      </colgroup>
      <tr>
        <th>제목</th>
        <td><input type="text" name="boTitle" value="" class="form-control input-sm"  required="required" ></td>
        </span><sec:csrfInput/>
      </tr>

      <tr>
        <th>내용</th>
        <td><textarea id="summernote" rows="10" name="boContents" class="form-control"></textarea>
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
            <a href="noticeList.wow" class="btn btn-default btn-sm">
              <span class="glyphicon glyphicon-list" aria-hidden="true"></span>
              &nbsp;&nbsp;목록
            </a>
          </div>
          <div class="pull-right">
            <button type="submit" class="btn btn-sm btn-primary" id="insert_but">
              <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
              &nbsp;&nbsp;저장
            </button>
          </div>
        </td>
      </tr>
    </table>
  </form>

</div><!-- container -->
<script>
  //파일 선택 버튼을 누를때마다 각각의 파일 선택할 수 있는 박스 생성
  $('#id_btn_new_file').click(function(){
    $('.file_area').append('<div class="form-inline">'
            + '<input type="file" name="boFiles" class="form-control">'
            + ' <button type="button" class="btn_delete btn btn-sm">삭제</button>' + '</div>');
  });

  $('.file_area').on('click','.btn_delete', function(){
    $(this).closest('div').remove();
  });

  $('#summernote').summernote({
    lang: "ko-KR",
    height: 350,
    placeholder: '내용을 작성하세요.',
  })


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

