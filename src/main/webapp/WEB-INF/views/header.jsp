<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Xmas
  Date: 25.06.17
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>Simbir Library</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation" >
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/welcome"> <img class="img-responsive2" src="${contextPath}/resources/images/logo.png" width="149"></a>         </div>
        <div id="navbar" class="collapse navbar-collapse navbar-ex1-collapse">
            <c:if test="${pageContext.request.userPrincipal.name != null}">
            <form id="logoutForm" method="POST" action="${contextPath}/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
            <ul class="nav navbar-nav navbar-right">

                <c:if test="${pageContext.request.userPrincipal.name == 'proselyte'}">
                    <li><a href="${contextPath}/admin" style="color: white"><h4>Администрирование</h4></a></li>
                </c:if>
                <li><a href="${contextPath}/welcome" style="color: white"><h4>Главная</h4></a></li>
                <li><a href="${contextPath}/personal" style="color: white"><h4>Личный кабинет</h4></a></li>
                <li><a onclick="document.forms['logoutForm'].submit()" style="color: white"><h4>Выйти</h4></a></li>
                </c:if>

                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="${contextPath}/welcome" style="color: white"><h4>Главная</h4></a></li>
                        <li><a href="${contextPath}/login" style="color: white"><h4>Войти</h4></a></li>
                    </ul>
                </c:if>

            </ul>
        </div>
    </div>
</nav>

<div id="main" class="container-fluid">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h3 class="page-header">Вы зашли, как ${pageContext.request.userPrincipal.name}.</h3>
    </c:if>
    <c:if test="${pageContext.request.userPrincipal.name == null}">
        <h3 class="page-header">Привет, гость!</h3>
    </c:if>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>