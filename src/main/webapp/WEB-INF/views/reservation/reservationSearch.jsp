<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@include file="/WEB-INF/inc/navi.jsp" %>
<form name="search" action="reservationList.wow" method="post">
    <input type="text" name="searchWord" value="">
    <button type="submit">검색</button>
<%--    <c:forEach var="tc" items="${codeList}">--%>
<%--        <div>--%>
<%--            <button name="searchType" value="${tc.treatmentCode}">--%>
<%--                    ${tc.treatmentName}--%>
<%--            </button>--%>
<%--        </div>--%>
<%--    </c:forEach>--%>
</form>
<c:forEach var="tc" items="${codeList}">
    <div>
        <a href="reservationList.wow?searchType=${tc.treatmentCode}">
            ${tc.treatmentName}
        </a>
    </div>
</c:forEach>

<%@include file="/WEB-INF/inc/footer.jsp" %>
<!-- SCRIPTS -->
<script>
    // $form=$("form[name='search']");
    // $button = $('form div button');
    //
    // $button.click(function (e) {
    //     $form.submit();
    // });
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