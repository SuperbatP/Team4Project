
<%@page import="com.PhoenixHospital.free.vo.FreeBoardVO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    <h3>
      공지사항 - <small>글 수정</small>
    </h3>
  </div>
  <form action="noticeModify.wow" method="post" enctype="multipart/form-data">
    <sec:csrfInput/>
    <%-- 첨부파일에 대한 정보도 받아야 하니까.	enctype="multipart/form-data" 추가	--%>
    <table class="table table-striped table-bordered">
      <colgroup>
        <col width="20%" />
        <col />
      </colgroup>
      <tr>
        <th>글번호</th>
        <td>${freeBoard.boNo }<input type="hidden" name="boNo" value="${freeBoard.boNo }">
        </td>

      </tr>
      <tr>
        <th>제목</th>
        <td><input type="text" name="boTitle" value="${freeBoard.boTitle }" class="form-control input-sm" required="required"></td>
      </tr>
      <tr>
        <th>작성자ID</th>
        <td>${freeBoard.boWriter } <input type="hidden" name="boWriter" value="${freeBoard.boWriter }">
        </td>
      </tr>

      <tr>
        <th>내용</th>
        <td><textarea  id="summernote" rows="10" name="boContents" class="form-control input-sm">${freeBoard.boContents } </textarea></td>
      </tr>
      <tr>
        <th>조회수</th>
        <td>${freeBoard.boHit } </td>
      </tr>
      <tr>
        <th>최근등록일자</th>
        <td>${freeBoard.boModDate eq null ? freeBoard.boRegDate : freeBoard.boModDate } </td>
      </tr>

      <tr>
        <th>첨부파일
          <button type="button" id="id_btn_new_file">추가</button>
        </th>
        <td class="file_area">
          <c:forEach var="f" items="${freeBoard.attaches}" varStatus="st">
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
            <a href="noticeList.wow" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-list" aria-hidden="true"></span> &nbsp;&nbsp;목록
            </a>
          </div>
          <div class="pull-right">

            <a href="noticeList.wow" class="btn btn-info btn-sm"> <span class="glyphicon glyphicon-list" aria-hidden="true"></span> &nbsp;목록으로
            </a>
            <button href="noticeList.wow" type="submit"  class="btn btn-sm btn-primary" onclick=" confirm('정말로 수정 할까요??');">
              <span class="glyphicon glyphicon-save" aria-hidden="true"></span> &nbsp;&nbsp;저장
            </button>

            <button type="submit" formaction="noticeDelete.wow" class="btn btn-sm btn-danger" onclick="return confirm('정말로 삭제 할까요??');">
              <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> &nbsp;&nbsp;삭제
            </button>


          </div>
        </td>
      </tr>
    </table>
  </form>

</div>
<!-- container -->
<script>
  // 첨부파일 추가버튼 클릭
  $('#id_btn_new_file').click(function(){
    $('.file_area').append('<div class="form-inline">'
            + '<input type="file" name="boFiles" class="form-control">'
            + ' <button type="button" class="btn_delete btn btn-sm">삭제</button>'
            + '</div>');
  }); // #id_btn_new_file.click


  // 상위객체를 통해 이벤트 위임
  $('.file_area').on('click','.btn_delete', function(){
    $(this).closest('div').remove();
  });

  // 기존 첨부파일 삭제 클릭
  $('.btn_file_delete').click(function(){
    $btn = $(this);
    $btn.closest('div').html(
            '<input type="hidden" name="delAtchNos" value="' + $btn.data("atch-no")  + '" />'
            //freeBoardVO의 delAtchNos 필드가 있음.
    );
  });   //
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


