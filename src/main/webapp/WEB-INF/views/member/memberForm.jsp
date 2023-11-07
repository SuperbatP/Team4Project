<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
    <h3>회원가입</h3>
    <form action="memberRegist.wow" method="post">
        <table class="table table-striped table-bordered">
            <tbody>
            <tr>
                <th>아이디</th>
                <td><input type="text" name="memId" class="form-control input-sm"
                           required="required" pattern="\w{4,}" title="알파벳과 숫자로 4글자 이상 입력">
                    <button type="button" id="idCheck">중복확인</button>
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="memPass" class="form-control input-sm"
                           required="required" pattern="\w{4,}" title="알파벳과 숫자로 4글자 이상 입력"></td>
            </tr>
            <tr>
                <th>회원명</th>
                <td><input type="text" name="memName" class="form-control input-sm"
                           required="required" pattern="[가-힣]{2,}" title="한글로 2글자 이상 입력"></td>
            </tr>
            <tr>
                <th>우편번호</th>
                <td><input type="text" name="memZip" class="form-control input-sm"></td>
            </tr>
            <tr>
                <th>주소</th>
                <td><input type="text" name="memAdd1" class="form-control input-sm">
                    <input type="text" name="memAdd2" class="form-control input-sm">
                </td>
            </tr>
            <tr>
                <th>생일</th>
                <td><input type="date" name="memBir" class="form-control input-sm"></td>
            </tr>
            <tr>
                <th>메일</th>
                <td><input type="email" name="memMail" class="form-control input-sm">
                <button id="email" type="button">이메일확인</button> </td>
            </tr>
            <tr>
                <th>핸드폰</th>
                <td><input type="tel" name="memHp" class="form-control input-sm"></td>
            </tr>
            <tr>
                <th>직업</th>
                <td>
                    <select name="memJob" class="form-control input-sm" required="required">
                        <option value="">-- 직업 선택 --</option>
                        <c:forEach items="${jobList}" var="job">
                            <option value="${job.commCd}">${job.commNm}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>취미</th>
                <td>
                    <select name="memHobby" class="form-control input-sm" required="required">
                        <option value="">-- 취미 선택 --</option>
                        <c:forEach items="${hobbyList}" var="hobby">
                            <option value="${hobby.commCd}">${hobby.commNm}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit" class="btn btn-primary">
                        <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                        &nbsp;회원가입
                    </button>
                    <a href="memberList.wow" class="btn btn-info btn-sm">
                        <span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
                        &nbsp;목록
                    </a>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<script>
    //id 중북확인. 이 때 비동기처리(페이지는 그대로인 것)를 통해 DB에만 확인 ->ajax
    //id 글자수나 한글허용은 html의 정규표현식을 이용하는 것.

    //중복확인 버튼 눌렀는데 id가 빈 값일 경우 ; id길이가 3이상이 아니면 중복확인버튼 활성화x
    //중복확인 버튼 누르고 회원가입 하다가 아이디를 바꾸면 다시 중복확인버튼 누르게 해야함.
    //중복확인이 안되어있는데 회원가입버튼 누르면 아이디를 확인하세요. 알람이 뜨도록.

    let isIdChecked = false;

    $("input[name='memId']").on("change", function (e){
        isIdChecked = false;
        //중복확인 버튼 누르고 회원가입 하다가 아이디를 바꾸면 다시 중복확인버튼 누르게 해야함.
    });


    $("#idCheck").on("click", function (e) {
        //들어온 id 중복확인
        let curId = $("input[name='memId']").val(); //input에 들어온 값을 받아야 하니까.
        if(!curId || curId.trim().length <= 3){
            alert("공백을 제거하거나 3글자 이상 입력하세요.")
        }else{
            $.ajax({
                url: "/join/idCheck.wow"
                , type: "get", data: {"id": curId}
                , success: function (data) {
                    alert(data);
                    isIdChecked = true;
                }
                , error: function (err) {
                    alert("에러");
                }
            });
        }

    });

    //이메일 인증
    $("#email").on("click", function (e) {
        let mailAddress = $("input[name='memMail']").val();
        $.ajax({
            url: "/join/emailSend.wow"
            , type: "get", data: {"email": mailAddress }
            , success: function (data) {
                alert("메일을 확인하세요.");
                //시간제한 + 인증번호 랜덤값 6개 입력하는 칸이 새로 생기고
                //사용자가 입력한 값이랑 서버에서 생성한 값이랑 같은지 비교.
                //랜덤값 6개를 DB에 저장해서... qustnfh, session 등등 다양하게.
            }
            , error: function (err) {
                alert("에러");
            }
        });

    });
</script>
</body>
</html>