<%@page import="com.PhoenixHospital.free.vo.FreeBoardVO" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="/WEB-INF/inc/header.jsp" %>
    <title>건강정보 - 글 보기</title>
</head>
<body>
<%@ include file="/WEB-INF/inc/navi.jsp" %>

<div class="container">
    <div class="page-header">
        <h3>
            건강정보 - <small>글 보기</small>
        </h3>
    </div>
    <table class="table table-striped table-bordered">
        <tbody>
        <tr>
            <th>글번호</th>
            <td>${freeBoard.boNo }</td>
        </tr>
        <tr>
            <th>글제목</th>
            <td>${freeBoard.boTitle }</td>
        </tr>
        <tr>
            <th>작성자명</th>
            <td>${freeBoard.boWriter }</td>
        </tr>
        <!-- 비밀번호는 보여주지 않음  -->
        <tr>
            <th>내용</th>
            <td><div rows="10" name="boContent" class="form-control input-sm" readonly="readonly">
                ${freeBoard.boContents }
            </div></td>
        </tr>

        <tr>
            <th>조회수</th>
            <td>${freeBoard.boHit }</td>
        </tr>
        <tr>
            <th>최근등록일자</th>
            <td>${freeBoard.boRegDate}</td>
        </tr>

        <tr>
            <th>첨부파일</th>
            <td>
                <c:forEach var="f" items="${freeBoard.attaches}" varStatus="st">
                    <div> 파일 ${st.count} <a href="<c:url value='/attach/download/${f.atchNo}' />" target="_blank">
                            <%-- DB에 originalName, fileName(우리가 찾을 랜덤값), filePath  -> 파일 전송; response    --%>
                            <%-- target="_blank" 새 탭이 생겼다가 사라짐. 꼭 써줘야함. --%>
                        <span class="glyphicon glyphicon-save" aria-hidden="true"></span> ${f.atchOriginalName}
                    </a> Size : ${f.atchFancySize} Down : ${f.atchDownHit}
                    </div>
                </c:forEach>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <div class="pull-left">
                    <a href="healthList.wow" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-list"
                                                                                   aria-hidden="true"></span> &nbsp;&nbsp;목록
                    </a>
                </div>
                <c:if test='<sec:authentication property="principal.username"/> == ${freeBoard.boWriter}'>
                    <div class="pull-right">
                        <a href="freeEdit.wow?boNo=${freeBoard.boNo }" class="btn btn-success btn-sm"> <span
                                class="glyphicon glyphicon-pencil" aria-hidden="true"></span> &nbsp;&nbsp;수정
                        </a>
                    </div>
                </c:if>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<!-- container -->
<div class="container">
    <!-- reply container -->
    <!-- // START : 댓글 등록 영역  -->
    <div class="panel panel-default">
        <div class="panel-body form-horizontal">
            <form name="frm_reply" action="<c:url value='/reply/replyRegist' />"
                  method="post" onclick="return false;">
                <input type="hidden" name="reParentNo" value="${freeBoard.boNo}">
                <input type="hidden" name="reCategory" value="FREE"> <input
                    type="hidden" name="reMemId" value="${USER_INFO.userId }">
                <input type="hidden" name="reIp"
                       value="<%=request.getRemoteAddr()%>">
                <div class="form-group">
                    <label class="col-sm-2  control-label">댓글</label>
                    <div class="col-sm-8">
							<textarea rows="3" name="reContent" class="form-control"
                            ${USER_INFO ==null ? "readonly='readonly'" : ""}  ></textarea>
                    </div>
                    <div class="col-sm-2">
                        <button id="btn_reply_regist" type="button"
                                class="btn btn-sm btn-info">등록
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- // END : 댓글 등록 영역  -->

    <!-- // START : 댓글 목록 영역  -->
    <div id="id_reply_list_area">
        <div class="row">
            <div class="col-sm-2 text-right">홍길동</div>
            <div class="col-sm-6">
                <pre>내용</pre>
            </div>
            <div class="col-sm-2">12/30 23:45</div>
            <div class="col-sm-2">
                <button name="btn_reply_edit" type="button"
                        class=" btn btn-sm btn-info" onclick="fn_modify()">수정
                </button>
                <button name="btn_reply_delete" type="button"
                        class="btn btn-sm btn-danger">삭제
                </button>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2 text-right">reMemId</div>
            <div class="col-sm-6">
                <pre> reContent</pre>
            </div>
            <div class="col-sm-2">11/25 12:45</div>
            <div class="col-sm-2"></div>
        </div>
    </div>

    <div class="row text-center" id="id_reply_list_more">
        <a id="btn_reply_list_more"
           class="btn btn-sm btn-default col-sm-10 col-sm-offset-1"> <span
                class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
            더보기
        </a>
    </div>
    <!-- // END : 댓글 목록 영역  -->


    <!-- START : 댓글 수정용 Modal -->
    <div class="modal fade" id="id_reply_edit_modal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <form name="frm_reply_edit"
                      action="<c:url value='/reply/replyModify.wow'/>" method="post"
                      onclick="return false;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h4 class="modal-title">댓글수정</h4>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="reNo" value="">
                        <textarea rows="3" name="reContent" class="form-control"></textarea>
                        <input type="hidden" name="reMemId" value="${USER_INFO.userId }">
                    </div>
                    <div class="modal-footer">
                        <button id="btn_reply_modify" type="button"
                                class="btn btn-sm btn-info">저장
                        </button>
                        <button type="button" class="btn btn-default btn-sm"
                                data-dismiss="modal">닫기
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- END : 댓글 수정용 Modal -->

</div>
<!-- reply container -->
<script type="text/javascript">
    // 댓글 데이터를 딱 10개만 가지고 오도록 하는 파라미터 모음
    var params = {
        "curPage": 1, "rowSizePerPage": 10
        , "reCategory": "FREE", "reParentNo": ${freeBoard.boNo}
    };

    //ajax 요청해서 댓글리스트를 받아오는 함수.
    function fn_reply_list() {
        //아작스 호출해서 DB에 있는 reply 데이터 가지고 옵니다.
        //가지고오면(success)하면 댓글 div 만들어줍니다.
        //list를 가지고오니까 jquery 반복문 써서 div 여러개 만들어주면됩니다.
        // 다 했으면 param의 curPage=2로 바꿔줍시다

        $.ajax({
            url: "/reply/replyList.wow"
            , type: "GET"
            , data: params
            , success: function (data) {
                // Map<String, Object>가 json 형태로 변환되서 옴 -> data
                // data.data 는 'map.put("data",replyList)'
                // index,item는 List<ReplyVO>의 ReplyVO 타입임.
                $.each(data.data, function (i, reply) {
                    // console.log("index: ", i)
                    // console.log("item.reNo: ", reply.reNo)
                    let str =
                        '<div class="row" data-re-no="' + reply.reNo + '">' +
                        '<div class="col-sm-2 text-right">' + reply.reMemName + '</div>' +
                        '<div class="col-sm-6">' +
                        '<pre>' + reply.reContent + '</pre>' +
                        '</div>' +
                        '<div class="col-sm-2">' + reply.reRegDate + '</div>' +
                        '<div class="col-sm-2">';

                    if (reply.reMemId == "${USER_INFO.userId}") {
                        str = str +
                            '<button name="btn_reply_edit" type="button" class=" btn btn-sm btn-info" onclick="fn_modify()">수정</button>' +
                            '<button name="btn_reply_delete" type="button" class="btn btn-sm btn-danger">삭제</button>'
                    }
                    str = str + '</div>' + '</div>';

                    $("#id_reply_list_area").append(str)

                });
                params.curPage += 1;
                //curPage의 위치 주의
            }
        });
    }//function fn_reply_list

    $(document).ready(function () { //documnet가 준비될 때
        fn_reply_list();

        //더보기 버튼
        $("#id_reply_list_more").on("click", function (e) {
            fn_reply_list();
        });

        //등록버튼
        $("#btn_reply_regist").on("click", function (e) {
            //form태그안에 input hidden으로 필요한거 넣기
            e.preventDefault();
            //html 태그에 있는 것이 먼저 일어나는 것 방지
            $form = $(this).closest("form[name='frm_reply']");
            //가장 가까운 form찾은 후 ajax 호출(data는 form.serialize(), )
            $.ajax({
                url: "<c:url value='/reply/replyRegist.wow' />"
                //form 의 action값
                , type: "POST"
                , dataType: "JSON"
                , data : $form.serialize()
                , success: function (data) {
                    $form.find("textarea[name='reContent']").val('');
                    //댓글 등록이 완료되면 textarea의 내용 비우기
                    $("#id_reply_list_area").html('');
                    //댓글영역초기화( list_area.html('), curPage=1, fn_reply_list)
                    params.curPage = 1
                    //댓글 목록 업데이트를 위해 새로 호출
                    fn_reply_list();
                }, error: function (req, st, err) {
                    //실패 : error : req.status==401이면 login으로 location.href
                    if (req.status == 401) {
                        location.href = "<c:url value='/login/login.wow' />"
                        //로그인 페이지로 이동
                    }
                }

            })

        });//등록버튼


        //수정버튼 : 댓글 영역안에 있는 수정버튼만  이벤트 등록
        //function(){}은 동적으로 생긴 태그에도 적용. -> 수정 버튼의 활성화를 로그인 정보가 맞을때 활성화 되게 해서
        //동적 태그로 인식함.

        $("#id_reply_list_area").on("click", 'button[name="btn_reply_edit"]'
            , function (e) {

                //현재 버튼의 상위 div(한개 댓글) 찾기
                //div에서 현재 댓글 내용을 modal에 있는 textarea에 복사
                //div태그의 data-re-no 값을 modal에 있는 input name="reNo" 태그의 value값에 복사
                //복사 후   .modal('show')
                $btn = $(this);//수정버튼
                $div = $btn.closest('div.row'); //div class="row"
                $modal = $('#id_reply_edit_modal'); //댓글 수정용 모달 찾기
                $pre = $div.find('pre')
                //<pre> 태그는 미리 정의된 형식(preformatted)의 텍스트를 정의할 때 사용.
                var content = $pre.html();
                //pre 태그 안에 이너태그 -> 모달에 내용을 뿌리기
                $textarea = $modal.find('textarea');
                $textarea.val(content);

                var reNo = $div.data('re-no');
                // div class="row" data-re-no= 동적태그 안에도 가능하니까!
                // 모달이 아닌 부모페이지에서 reNo를 받아다가 넣어줌.
                $modal.find('input[name=reNo]').val(reNo);
                //"modal-body" -> input type="hidden" name="reNo"
                $modal.modal('show');
                //2개 복사했으면   $('#id_reply_edit_modal').modal('show')

            });//수정버튼


        //모달창 저장 버튼
        $("#btn_reply_modify").on("click", function (e) {
            e.preventDefault();
            //html 태그에 있는 것이 먼저 일어나는 것 방지
            $form = $(this).closest("form[name='frm_reply_edit']");
            //가장 가까운form 찾기
            $.ajax({
                url: "<c:url value='/reply/replyModify.wow'/>"
                , type: "POST"
                , data: $form.serialize()
                //JQuery Ajax로 호출하기 전에 serialize를 해주면 form안에 값들을
                //한 번에 전송 가능한 data로 만들 수 있어 많은 data를 보낼 때 유용하다.
                , dataType: "JSON"
                , success: function () {
                    // 성공 :  modal찾은 후 modal('hide')
                    $modal = $("#id_reply_edit_modal");
                    $modal.modal('hide') //현재의 모달을 찾고, 모달을 감춤.

                    // 현재 모달에 있는 reNo, reContent 찾기
                    var reNo = $modal.find('input[name="reNo"]').val();
                    var reContent = $modal.find('textarea').val();

                    // 댓글영역에서 re_no에 해당하는 댓글 찾은 후 안의 내용 re_content로 변경
                    $("#id_reply_list_area").find("div[data-re-no='" + reNo + "']").find("pre").html(reContent);
                    //data-re-no=reNo를 먼저 찾고 그 다음에 pre 태그를 찾음 그리고 pre 내의 값을 reContent로 변경.
                }
            });//ajax
        });//모달창 저장버튼


        //삭제버튼
        $("#id_reply_list_area").on("click", 'button[name="btn_reply_delete"]'
            , function (e) {
                e.preventDefault();
                //가장 가까운 div 찾기
                $div = $(this).closest('.row');
                //reNo,  reMemId(현재 로그인 한 사람의 id) 구하기
                reNo = $div.data('re-no');
                reMemId = "${USER_INFO.userId}";
                // ajax 호출(reNo, reMemeId보내기) reMemId는 본인이 쓴 글인지 확인하는데 쓰임 (BizAccessFailException)
                $.ajax({
                    url : "<c:url value='/reply/replyDelete.wow' />"
                    ,type : "POST"
                    ,data : {"reNo": reNo, "reMemId": reMemId}
                    ,dataType : 'JSON'
                    ,success: function (){
                        //성공  후 해당 div.remove
                        $div.remove();
                    }

                });

            }); //삭제버튼
    });
</script>
</body>

</html>






