<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Simbir Library</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">


</head>
<body>

<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>
            Привет ${pageContext.request.userPrincipal.name} |
            <a href="${contextPath}/personal">Личный кабинет</a> |
            <c:if test="${pageContext.request.userPrincipal.name == 'proselyte'}">
                <a href="${contextPath}/admin">Администрирование</a> |
            </c:if>
            <a onclick="document.forms['logoutForm'].submit()">Выйти</a>
        </h2>
    </c:if>

    <c:if test="${pageContext.request.userPrincipal.name == null}">
        <h2>
            Привет Гость |
            <a href="${contextPath}/login">Войти</a>
        </h2>
    </c:if>

    <h2>Книги</h2>

    <div class="container-fluid" style="padding-top: 10px">
        <div class="row">
            <c:forEach var="book" items="${books}" varStatus="loop">
                <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
                    <img src="https://ozon-st.cdn.ngenix.net/multimedia/1007119597.jpg" class="img-responsive"
                         style="padding-bottom: 15px">
                </div>
            </c:forEach>
        </div>
    </div>


    <%--    <table class="table">
            <tr>
                <td>Порядковый номер</td>
                <td>Название</td>
                <td>Описание</td>
                <td>Дата добавления</td>
            </tr>
            <c:forEach var="book" items="${books}" varStatus="loop">
                <tr>
                    <td>${loop.index + 1}</td>
                    <td>${book.name}</td>
                    <td>${book.description}</td>
                    <td>${book.date}</td>
                </tr>
            </c:forEach>
        </table>--%>


</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>