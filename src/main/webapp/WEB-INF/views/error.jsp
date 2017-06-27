<%--
  Created by IntelliJ IDEA.
  User: Xmas
  Date: 27.06.17
  Time: 23:13
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="/WEB-INF/views/header.jsp"/>
    <title>Error</title>

</head>

<body>
<br>
<div id="main" class="container">
    <div class="page-header">
        <h1>Что-то пошло не так, но мы уже чиним!<small>(нет)</small></h1>
    </div>
</div>
</body>

</html>