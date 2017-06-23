<%@ page import="net.proselyte.springsecurityapp.model.Book" %>
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
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
</head>
<body>

<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>


        <header>
            <div class="page-header">
                <h1>Типо шапка</h1>
            </div>
        </header>


        <h3>Пользователь ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Выйти</a></h3>



        <div class="row">
            <div class="col-xs-6">
                <div class="plate">
                    <p>Логин - ${pageContext.request.userPrincipal.name}</p>
                    <p>E-mail - ${pageContext.request.userPrincipal.name}</p>
                </div>
            </div>
            <div class="col-xs-6">
                <div class="plate">
                    <h3>Книги пользователя</h3>
                    <table class="table table-striped">
                        <tr>
                            <th>№</th>
                            <th>Название</th>
                            <th>Описание</th>
                            <th>Дата</th>
                        </tr>
                        <c:forEach var="book" items="${books}" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${book.name}</td>
                                <td>${book.description}</td>
                                <td>здеся будет дата</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>

    </c:if>

</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.4/holder.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>